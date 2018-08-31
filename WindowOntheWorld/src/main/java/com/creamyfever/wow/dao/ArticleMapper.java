package com.creamyfever.wow.dao;

import java.util.List;

import com.creamyfever.wow.vo.Article;

public interface ArticleMapper {
	public int insert(Article article);
	public int insertFromList(List<Article> list);
	public List<Article> selectAll();
	public Article selectOne(String id);
}
