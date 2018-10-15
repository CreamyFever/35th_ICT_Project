package com.creamyfever.wow.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.creamyfever.wow.vo.Article;
import com.creamyfever.wow.vo.ArticleHtml;
import com.creamyfever.wow.vo.ArticleReply;

public interface ArticleMapper {
	public int insert(Article article);
	public int insertHtml(ArticleHtml html);
	public int insertFromList(List<Article> list);
	public List<Article> selectAll();
	public Article selectOne(String id);	
	public Article selectArticleHtml(String id);
	public Article selectOneByNum(int articlenum);

	public List<Article> showArticleByKeyword(Map<String, String> map);
	public List<Article> listArticle(Map<String, String> map, RowBounds rb);
	public List<ArticleReply> listArticleReply(int Ariclenum);
	public int insertArticleReply(ArticleReply reply); //기사 리플 삽입
	public int deleteArticleReply(ArticleReply reply); //기사 리플 삭제
	public int updateArticleReply(ArticleReply reply); //기사 리플 수정
}
