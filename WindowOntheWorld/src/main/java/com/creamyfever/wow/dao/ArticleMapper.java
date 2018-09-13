package com.creamyfever.wow.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.creamyfever.wow.vo.Article;

public interface ArticleMapper {
	public int insert(Article article);
	public int insertFromList(List<Article> list);
	public List<Article> selectAll();
	public Article selectOne(String id);
	public List<Article> showArticleByContinent(String continent);
	
	public List<Article> listArticle(String continent, RowBounds rb);
}
