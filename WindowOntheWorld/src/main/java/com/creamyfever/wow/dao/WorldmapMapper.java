package com.creamyfever.wow.dao;

import java.util.ArrayList;

import com.creamyfever.wow.vo.Article;

public interface WorldmapMapper {
	public ArrayList<Article> printArticleList(String keyword); //키워드에 대한 기사 출력
	public ArrayList<Article> printAll(); //전체 기사 출력
	public int updateSentiment(Article article); //감정 업데이트

}
