import requests
from bs4 import BeautifulSoup
import json
import os

# python 파일의 위치
BASE_DIR = os.path.dirname(os.path.abspath(__file__))


def parse_articles_jp(driver, url):
    res = requests.get(url)
    soup = BeautifulSoup(res.content, 'html.parser')

    data = {}
    articles = []

    saved_id_list = []
    read_file = open(os.path.join(BASE_DIR, 'yahooJpList.json'), 'r', encoding='utf-8_sig')
    read_data = json.loads(read_file.read())
    for read_one in read_data['articles']:
        saved_id_list.append(read_one['id'])

    # 최근 뉴스 20개
    for index in range(0, 20):
        try:
            news_list = driver.find_elements_by_css_selector('.listArea > ul > li > a')
            link_list = soup.select('.listArea > ul > li > a')
            link_url = link_list[index].get('href')
            news_id = "JP" + link_url[-7:]      # 뉴스 ID

            is_saved = False

            for saved_id in saved_id_list:
                if saved_id == news_id:
                    is_saved = True
                    break

            if is_saved is True:
                continue

            news_list[index].click()

            driver.implicitly_wait(3)

            # 뉴스 개략
            print(link_url)
            list_res = requests.get(link_url)
            list_soup = BeautifulSoup(list_res.content, 'html.parser')

            detail_link = list_soup.select('#main h2 > a')[0]
            detail_url = detail_link.get('href')

            area = list_soup.select_one('#gnSec > li.current').text     # 분야
            print(area)

            title_link = driver.find_element_by_css_selector('.headlineTxt > h2 > a')
            title_link.click()

            driver.implicitly_wait(3)

            # 뉴스 상세
            print(detail_url)
            start = str(detail_url).find('a=')  # url 안에 있는 날짜 위치 추출

            published_date = detail_url[start+2:start+10]   # 기사 작성 날짜

            detail_res = requests.get(detail_url)
            detail_soup = BeautifulSoup(detail_res.content, 'html.parser')

            title = detail_soup.select_one('#ym_newsarticle > div.hd > h1')
            if title is None:
                # 다시 뉴스 리스트로
                driver.get(url)
                print("Back to the news list.")
                continue

            title = title.text.strip('\n')                  # 제목
            print(title)

            author = detail_soup.select_one('#ym_newsarticle .hdLogoWrap a > img')   # 언론사(신문사)
            if author is not None:
                author = detail_soup.select_one('#ym_newsarticle .hdLogoWrap a > img').get('alt')
            else:
                author = None

            content_str = ""

            if not detail_soup.select('.articleMain > div.paragraph') == []:    # 일반 HTML 양식
                content = detail_soup.select('.articleMain > div.paragraph')[0]
                for p in content.find_all('p'):
                    content_str = content_str + p.get_text()
                    print(p.get_text())
            else:                                                               # 다른 양식
                content_str = "blank"

            if not detail_soup.select('#ym_newsarticle div.thumb > a') == []:   # 이미지가 존재하면
                img_link = driver.find_element_by_css_selector('#ym_newsarticle div.thumb > a')
                img_link.click()
                driver.implicitly_wait(3)

                img_url = detail_soup.select('#ym_newsarticle div.thumb > a')[0].get('href')
                img_res = requests.get(img_url)
                img_soup = BeautifulSoup(img_res.content, 'html.parser')
                image_src = img_soup.select_one('#mainImg img').get('src')      # 이미지 URL
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
                "content": content_str,
                "area": area,
                "url": detail_url,
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

    json_file = open(os.path.join(BASE_DIR, 'yahooJpList.json'), 'w+', encoding='utf-8_sig')
    json.dump(data, json_file, ensure_ascii=False, indent=4)
