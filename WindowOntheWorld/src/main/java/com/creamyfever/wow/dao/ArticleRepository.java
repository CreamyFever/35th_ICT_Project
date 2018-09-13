package com.creamyfever.wow.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.creamyfever.wow.vo.Article;

@Repository
public class ArticleRepository {

	@Autowired
	SqlSession session;

	public int insert(Article article) {
		ArticleMapper mapper = session.getMapper(ArticleMapper.class);

		int result = 0;
		try {
			if(selectOne(article.getArticleid()) == null)	// 해당하는 기사 ID가 없을 경우(중복된 기사 넣지 않도록)
				result = mapper.insert(article);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	public int insertFromList(List<Article> list) {
		ArticleMapper mapper = session.getMapper(ArticleMapper.class);

		int result = 0;
		try {
			result = mapper.insertFromList(list);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public List<Article> selectAll() {
		ArticleMapper mapper = session.getMapper(ArticleMapper.class);

		List<Article> list = null;
		try {
			list = mapper.selectAll();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public Article selectOne(String id) {
		ArticleMapper mapper = session.getMapper(ArticleMapper.class);

		Article article = null;
		try {
			article = mapper.selectOne(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return article;
	}
	
	public List<Article> showArticleByContinent(String continent) {
		ArticleMapper mapper = session.getMapper(ArticleMapper.class);

		List<Article> articles = null;
		try {
			articles = mapper.showArticleByContinent(continent);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return articles;
	}
	
	public List<Article> listArticle(String continent, int startRecord, int countPerPage) {
		ArticleMapper mapper = session.getMapper(ArticleMapper.class);
		//전체 검색 결과 중 읽을 시작위치와 개수
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		
		//검색어와 읽을 범위를 전달
		List<Article> list = mapper.listArticle(continent, rb);
		return list;
	}
}
