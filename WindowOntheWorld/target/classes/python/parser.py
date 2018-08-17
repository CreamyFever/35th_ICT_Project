# parser.py
from urllib.request import urlopen
from bs4 import BeautifulSoup
import json
import os

# python 파일의 위치
BASE_DIR = os.path.dirname(os.path.abspath(__file__))

html = urlopen("https://news.naver.com/main/hotissue/sectionList.nhn?sid1=102&mid=hot&viewType=pc&cid=1081137&nh=20180815231441")
soup = BeautifulSoup(html, 'html.parser')
my_titles = soup.select(
    '#lnb.mainnews li > a'
    )

data = {}

for title in my_titles:
    print(title.text)
    print(title.get('href'))
    data[title.text] = title.get('href')

with open(os.path.join(BASE_DIR, 'result.json'), 'w+') as json_file:
    json.dump(data, json_file)