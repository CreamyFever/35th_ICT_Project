package com.creamyfever.wow.controllers;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.creamyfever.wow.dao.ArticleRepository;
import com.creamyfever.wow.vo.Article;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class ArticleController {

	@Autowired
	ArticleRepository repository;

	ArrayList<Article> articleList = new ArrayList<>();

	@RequestMapping(value = "pythonTest", method = RequestMethod.GET)
	public String pythonTest() {
		parseJson("C:/Users/Creamy/Documents/GitKrakenRep/35th_ICT_Project/35th_ICT_Project/WindowOntheWorld/src/main/resources/naverListS.json");
		parseJson("C:/Users/Creamy/Documents/GitKrakenRep/35th_ICT_Project/35th_ICT_Project/WindowOntheWorld/src/main/resources/yahooJpListS.json");
		return "home";
	}
	
	@RequestMapping(value = "insertArticle", method = RequestMethod.GET)
	public String insertArticleIntoDB() {
		
		for(Article article : articleList) {			
			repository.insert(article);
		}
		
		articleList.clear();
		
		return "home";
	}
	
	public void parseJson(String jsonPath) {

		File jsonFile = new File(jsonPath);
		System.out.println(jsonFile.exists());

		try {
			ObjectMapper objectMapper = new ObjectMapper();

			JsonNode root = objectMapper.readTree(jsonFile);
			Iterator<JsonNode> articles = root.get("articles").elements();

			Article article;
			JsonNode node;
			while (articles.hasNext()) {
				article = new Article();

				node = articles.next();

				article.setArticleid(node.get("id").asText());
				article.setArticlename(node.get("title").asText());
				article.setArticlecontent(node.get("content").asText());
				article.setArticledate(node.get("publishedAt").asText());
				article.setPresscompany(node.get("author").asText());
				article.setField(node.get("area").asText());
				article.setUrl(node.get("url").asText());
				
				if(node.get("continent") != null)
					article.setContinent(node.get("continent").asText());

				articleList.add(article);
			}
			System.out.println(articleList.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "selectAllArticle", method = RequestMethod.GET)
	public String selectAll(){
		List<Article> articleList = repository.selectAll();
		for(Article article : articleList) {
			System.out.println(article.getArticlecontent());			
		}
		System.out.println(articleList.size());
		
		return "home";
	}
}
