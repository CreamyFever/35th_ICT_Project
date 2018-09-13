from selenium import webdriver

import time

from naverArticleParser import parse_articles_kr
from yahooJpArticleParser import parse_articles_jp
from bbcArticleParser import parse_articles_world


def scrape_articles(url, parse_articles):
    chrome = webdriver.Chrome('C:\dev_python\Webdriver\chromedriver.exe')
    chrome.implicitly_wait(3)
    # url에 접근한다.
    chrome.get(url)

    parse_articles(chrome, url)
    chrome.close()


if __name__ == "__main__":
    start_time = time.time()

    scrape_articles('https://www.bbc.com/news/world', parse_articles_world)
    scrape_articles('https://news.naver.com/main/home.nhn', parse_articles_kr)
    scrape_articles('https://news.yahoo.co.jp/list/', parse_articles_jp)

    print("--- %s seconds ---" % (time.time() - start_time))
