package com.creamyfever.wow.controllers;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.creamyfever.wow.dao.ArticleRepository;
import com.creamyfever.wow.util.PageNavigator;
import com.creamyfever.wow.vo.Article;
import com.creamyfever.wow.vo.ArticleHtml;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class ArticleController {

	@Autowired
	ArticleRepository repository;

	ArrayList<Article> articleList = new ArrayList<>();
	ArrayList<ArticleHtml> articleHtmlList = new ArrayList<>();	

	//게시판 관련 상수값들
	final int countPerPage = 10;			//페이지 당 글 수
	final int pagePerGroup = 5;				//페이지 이동 그룹 당 표시할 페이지 수

	@RequestMapping(value = "pythonTest", method = RequestMethod.GET)
	public String pythonTest() {
		parseJson("C:/Users/scit/Documents/35th_ICT_Project-Taehee/WindowOntheWorld/src/main/resources/bbcList.json");
		parseJson("C:/Users/scit/Documents/35th_ICT_Project-Taehee/WindowOntheWorld/src/main/resources/naverListS.json");
		parseJson("C:/Users/scit/Documents/35th_ICT_Project-Taehee/WindowOntheWorld/src/main/resources/yahooJpListS.json");
		return "home";
	}
	
	@RequestMapping(value = "insertHtmlTest", method = RequestMethod.GET)
	public String insertHtmlTest() {
		parseHtmlJson("C:\\Users\\Creamy\\Documents\\GitKrakenRep\\35th_ICT_Project\\35th_ICT_Project\\WindowOntheWorld\\src\\main\\resources/bbcListHtml.json");
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
	
	@RequestMapping(value = "insertArticle", method = RequestMethod.POST)
	public String insertArticle() {
		
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
	
	@RequestMapping(value = "insertArticleHtml", method = RequestMethod.GET)
	public String insertArticleHtml() {
		
		for(ArticleHtml html : articleHtmlList) {			
			repository.insertHtml(html);
		}
		
		articleHtmlList.clear();
		
		return "home";
	}
	
	public void parseHtmlJson(String jsonPath) {

		File jsonFile = new File(jsonPath);
		System.out.println(jsonFile.exists());

		try {
			ObjectMapper objectMapper = new ObjectMapper();

			JsonNode root = objectMapper.readTree(jsonFile);
			Iterator<JsonNode> articles = root.get("articles").elements();

			ArticleHtml html;
			JsonNode node;
			while (articles.hasNext()) {
				html = new ArticleHtml();

				node = articles.next();

				html.setArticleid(node.get("id").asText());
				html.setArticlehtml(node.get("html").asText());

				articleHtmlList.add(html);
			}
			
			System.out.println(articleHtmlList.size());
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
	
	@RequestMapping(value = "showArticleByKeyword", method = RequestMethod.POST)
	public @ResponseBody List<Article> showArticleByKeyword(String keyword, String continent){
		List<Article> articleList = repository.showArticleByKeyword(keyword, continent);
		
		return articleList;
	}
	
	
	@RequestMapping (value="listArticle", method=RequestMethod.GET)
	public String list(
			
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="keyword", defaultValue="") String keyword,
			@RequestParam(value="continent", defaultValue="Asia") String continent,
			Model model) {
		
		List<Article> articleList = repository.showArticleByKeyword(keyword, continent);

		int total = articleList.size();			//전체 글 개수
		
		//페이지 계산을 위한 객체 생성
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total); 
		
		List<Article> articles = repository.listArticle(keyword, continent, navi.getStartRecord(), navi.getCountPerPage());
		
		//페이지 정보 객체와 글 목록, 검색어를 모델에 저장
		model.addAttribute("articles", articles);
		model.addAttribute("navi", navi);
		model.addAttribute("keyword", keyword);
		model.addAttribute("continent", continent);
		
		return "detail";
	}
	
	/**
	 * 글 읽기
	 * @param boardnum 읽을 글번호
	 * @return 해당 글 정보
	 */
	@RequestMapping (value="read", method=RequestMethod.GET)
	public String read(String articleid, Model model) {
		//전달된 글 번호로 해당 글정보 읽기
		Article article = repository.selectArticleHtml(articleid);
		if (article == null) {
			return "redirect:/main";
		}
		
		//해당 글에 달린 리플목록 읽기
		//ArrayList<Reply> replylist = repository.listReply(articleid);
		
		//본문글정보와 리플목록을 모델에 저장
		model.addAttribute("article", article);
		//model.addAttribute("replylist", replylist);
		
		return "About";
	}
}
