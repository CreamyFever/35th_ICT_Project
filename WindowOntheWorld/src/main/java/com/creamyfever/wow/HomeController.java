package com.creamyfever.wow;

import java.util.ArrayList;
import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.creamyfever.wow.dao.BoardMapper;
import com.creamyfever.wow.dao.WorldmapMapper;
import com.creamyfever.wow.vo.Article;
import com.creamyfever.wow.vo.Board;
import com.creamyfever.wow.vo.Discussion;
import com.creamyfever.wow.vo.Topkeyword;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	SqlSession session;
	
	//감정 평균 구하기
	public double getSenAve(ArrayList<Article> articleList, String continent) {
		int i = 0;
		double sum = 0;
		double ave = 0;
		for(Article a : articleList) {
			if(a.getContinent().equals(continent)) {
				i++;
				sum+=a.getSentiment();
			}
			ave = sum/(double)i;
		}
		return ave;
	}
	
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "Logo";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String goLogin() {
		return "Login";
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		ArrayList<Board> bList = mapper.printBoardList();
		ArrayList<Topkeyword> kList = mapper.printKeyword();
		ArrayList<Discussion> dList = mapper.printDiscussionList();
		
		System.out.println(bList + "  " + kList + "  " + dList);
		
		model.addAttribute("boardList", bList);
		model.addAttribute("keywordList", kList);
		model.addAttribute("discussionList", dList);	
		
		
		return "index";
	}
	
	@RequestMapping(value = "world", method = RequestMethod.GET)
	public String goWorld(Locale locale, Model model, String searchWord) {
		/*
		 * session에 로그인한 사용자 정보 받아오기
		 * 이후 변수 처리해서 삽입
		 * */
		System.out.println("goWorld");
		Topkeyword tk = new Topkeyword();
		tk.setKeyword(searchWord);
		WorldmapMapper mapMapper = session.getMapper(WorldmapMapper.class);
		ArrayList<Article> articleList = mapMapper.printArticleList(searchWord);
		System.out.println(articleList.size());
		
		double sentiment_Africa = (double) 100 * getSenAve(articleList, "Africa");
		double sentiment_Asia = (double) 100 * getSenAve(articleList, "Asia");
		double sentiment_SA = (double) 100 * getSenAve(articleList, "South_America");
		double sentiment_NA = (double) 100 * getSenAve(articleList, "North_America");
		double sentiment_Oceania = (double) 100 * getSenAve(articleList, "Oceania");
		double sentiment_Europe = (double) 100 * getSenAve(articleList, "Europe");
		model.addAttribute("sentiment_Asia", sentiment_Asia);
		model.addAttribute("sentiment_SA", sentiment_SA);
		model.addAttribute("sentiment_Africa", sentiment_Africa);
		model.addAttribute("sentiment_NA", sentiment_NA);
		model.addAttribute("sentiment_Europe", sentiment_Europe);
		model.addAttribute("sentiment_Oceania", sentiment_Oceania);
		
		System.out.println(searchWord);
		model.addAttribute("search", searchWord);
		
		return "ArticleView";
	}
}