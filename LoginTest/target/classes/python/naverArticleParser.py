import requests
from bs4 import BeautifulSoup
import json
import os

# python 파일의 위치
BASE_DIR = os.path.dirname(os.path.abspath(__file__))


def extract_factor(link_url, identifier_str, id_len):
    identifier_start = str(link_url).find(identifier_str)       # url 안에 있는 날짜 위치 추출
    identifier_end = identifier_start + len(identifier_str)     # identifier_str의 길이가 추출할 부분의 시작점

    return link_url[identifier_end:identifier_end + id_len]


def parse_articles_kr(driver, url):
    res = requests.get(url)
    soup = BeautifulSoup(res.content, 'html.parser')

    data = {}
    articles = []

    saved_id_list = []
    read_file = open(os.path.join(BASE_DIR, 'naverList.json'), 'r', encoding='utf-8_sig')
    read_data = json.loads(read_file.read())
    for read_one in read_data['articles']:
        saved_id_list.append(read_one['id'])

    # 뉴스 60개
    for index in range(0, 60):
        try:
            link_list = soup.select('#ranking_10' + str(int(index / 10)) + ' > ul > li > a')
            area = soup.select('#ranking_10' + str(int(index / 10)) + ' > h5.blind')[0].text
            link_url = 'https://news.naver.com' + link_list[int(index % 10)].get('href')

            news_id = "KR" + extract_factor(link_url, 'aid=', 10)      # 뉴스 ID 10자리
            published_date = extract_factor(link_url, 'date=', 8)      # 작성일자 8자리

            is_saved = False

            for saved_id in saved_id_list:
                if saved_id == news_id:
                    is_saved = True
                    break

            if is_saved is True:
                continue

            print(area)
            print(news_id)
            print("Date = " + published_date)

            driver.get(link_url)
            driver.implicitly_wait(3)

            # 뉴스 개략
            print(link_url)
            link_res = requests.get(link_url)
            link_soup = BeautifulSoup(link_res.content, 'html.parser')

            title = link_soup.select_one('#articleTitle').text
            print(title)

            author = link_soup.select_one('#main_content > div.article_header > div.press_logo > a > img').get('alt')  # 언론사(신문사)
            print(author)

            external_content = link_soup.find_all('div', id='articleBodyContents')
            content = ""

            # 필요없는 태그 제거
            for ext in external_content:
                ext.script.extract()
                if ext.span:
                    ext.span.extract()
                if ext.iframe:
                    ext.iframe.extract()
                while ext.a:
                    ext.a.extract()
                content += ext.text.strip("\n")

            print(content)

            if not link_soup.select('#articleBodyContents > span.end_photo_org > img') == []:   # 이미지가 존재하면
                image_src = link_soup.select_one('#articleBodyContents > span.end_photo_org > img').get('src')      # 이미지 URL
                print(image_src)
            else:
                image_src = None

            # 다시 뉴스 리스트로
            driver.get(url)
            print("Back to the news list.")

            article = {
                "id": news_id,
                "author": author,
                "title": title,
                "content": content,
                "area": area,
                "url": link_url,
                "urlToImage": image_src,
                "publishedAt": published_date
            }

            articles.append(article)
        except Exception as e:
            print('Type=', type(e))
            print('Content=', e)
            driver.get(url)
            print("Back to the news list.")

    articles.extend(read_data['articles'])
    data['amount'] = len(articles)
    data['articles'] = articles
    print(data['amount'])

    json_file = open(os.path.join(BASE_DIR, 'naverList.json'), 'w+', encoding='utf-8_sig')
    json.dump(data, json_file, ensure_ascii=False, indent=4)
