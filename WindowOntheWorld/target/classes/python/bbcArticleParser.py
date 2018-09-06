import requests
from bs4 import BeautifulSoup
import json
import os

import re

# python 파일의 위치
BASE_DIR = os.path.dirname(os.path.abspath(__file__))


def parse_articles_world(driver, url):
    data = {}
    articles = []

    continents = ['asia', 'africa', 'australia', 'europe', 'latin_america', 'middle_east', 'us_and_canada']
    article_urls = []

    try:
        # 대륙별 카테고리 접근
        for continent in continents:
            try:
                home_url = 'https://www.bbc.com'
                link_url = 'https://www.bbc.com/news/world/' + continent

                driver.get(link_url)
                driver.implicitly_wait(3)

                # 뉴스 개략
                print(link_url)
                link_res = requests.get(link_url)
                link_soup = BeautifulSoup(link_res.content, 'html.parser')

                link_list = link_soup.select('div a')
                link_list_unique = list(set(link_list))  # 리스트 중복 제거

                pattern = "/news/world-"

                for link in link_list_unique:
                    text = str(link.get('href'))
                    match_res = re.match(pattern, text)   # 정규 표현식을 사용하여 세계 관련 기사 주소만 뽑아옴
                    if match_res:
                        article_urls.append(home_url + text)

            except Exception as e:
                print('Type=', type(e))
                print('Content=', e)
                driver.get(url)
                print("Back to the news list.")

        print(article_urls)
        article_set = set(article_urls)       # 리스트 중복 제거
        article_list = list(article_set)
        print(len(article_list))

        articles = web_page_traversal(driver, article_list)

    except Exception as e:
        print('Type=', type(e))
        print('Content=', e)
        driver.get(url)
        print("Back to the news list.")

    data['amount'] = len(articles)
    data['articles'] = articles
    print(data['amount'])

    json_file = open(os.path.join(BASE_DIR, 'bbcList.json'), 'w+', encoding='utf-8_sig')
    json.dump(data, json_file, ensure_ascii=False, indent=4)


def web_page_traversal(driver, article_urls):
    articles = []

    saved_id_list = []
    read_file = open(os.path.join(BASE_DIR, 'bbcList.json'), 'r', encoding='utf-8_sig')
    read_data = json.loads(read_file.read())
    for read_one in read_data['articles']:
        saved_id_list.append(read_one['id'])

    for article_url in article_urls:
        chunk = get_article_chunk(article_url)
        continent_name = chunk[11:]
        article_id = chunk[:10]
        print(continent_name + ", " + article_id)

        is_saved = False

        for saved_id in saved_id_list:
            if saved_id == article_id:
                is_saved = True
                break

        if is_saved is True:
            continue

        driver.get(article_url)
        driver.implicitly_wait(3)

        # 뉴스 개략
        article_res = requests.get(article_url)
        article_soup = BeautifulSoup(article_res.content, 'html.parser')

        title = article_soup.select_one('head > title').text[:-11]
        print(title)

        content_str = ""

        if not article_soup.select('div.story-body > div.story-body__inner') == []:  # 일반 HTML 양식
            content = article_soup.select('div.story-body > div.story-body__inner')[0]
            for p in content.find_all('p'):
                content_str = content_str + p.get_text()
                print(p.get_text())
        else:  # 다른 양식
            content_str = "blank"

        published_date = article_soup.select('div.mini-info-list-wrap > ul > li')[0]
        div = published_date.find_all('div')[0]
        date = div.get_text()
        print(date)
        split_date = str(date).split(' ')

        date_result = get_date_string(split_date[2], split_date[1], split_date[0])

        article = {
            "id": article_id,
            "author": "BBC",
            "title": title,
            "content": content_str,
            "area": "News",
            "url": article_url,
            "continent" : continent_name,
            "urlToImage": None,
            "publishedAt": date_result
        }
        articles.append(article)

    articles.extend(read_data['articles'])

    return articles


# ex) 1 January 2002 => 20020101
def get_date_string(year, month, day):
    month_switch = {
        "January": "01",
        "February": "02",
        "March": "03",
        "April": "04",
        "May": "05",
        "June": "06",
        "July": "07",
        "August": "08",
        "September": "09",
        "October": "10",
        "November": "11",
        "December": "12"
    }
    mon = month_switch.get(month, "Error")

    day_int = int(day)
    if day_int < 10:
        day = '0' + str(day_int)

    return str(year + mon + day)


def get_article_chunk(link_url):
    # 뉴스 상세
    number_part = link_url[-8:]
    start = str(link_url).find('world-')  # url 안에 있는 날짜 위치 추출

    continent_part = link_url[start + 6:-9]
    continent_id = get_continent_id(continent_part)
    continent_name = get_continent_name(continent_part)

    return str(continent_id + number_part + " " + continent_name)


def get_continent_id(continent_part):
    switcher = {
        "asia": "AS",
        "asia-india": "IN",
        "asia-china": "CN",
        "asia-pacific": "AS",
        "middle-east": "ME",
        "africa": "AF",
        "australia": "OC",
        "europe": "EU",
        "latin-america": "SA",
        "us-canada": "NA"
    }
    return switcher.get(continent_part, "WO")


def get_continent_name(continent_part):
    switcher = {
        "asia": "Asia",
        "asia-india": "Asia",
        "asia-china": "Asia",
        "asia-pacific": "Asia",
        "middle-east": "Asia",
        "africa": "Africa",
        "australia": "Oceania",
        "europe": "Europe",
        "latin-america": "South_America",
        "us-canada": "North_America"
    }
    return switcher.get(continent_part, "World")
