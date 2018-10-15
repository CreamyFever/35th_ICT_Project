package com.creamyfever.wow;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.creamyfever.wow.dao.BoardMapper;
import com.creamyfever.wow.dao.DiscussionMapper;
import com.creamyfever.wow.vo.Article;
import com.creamyfever.wow.vo.Board;
import com.creamyfever.wow.vo.Discussion;
import com.creamyfever.wow.vo.Discussion_rooms;
import com.creamyfever.wow.vo.Topkeyword;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	SqlSession session;

	// 감정 평균 구하기
	public double getSenAve(ArrayList<Article> articleList, String continent) {
		int i = 0;
		double sum = 0;
		double ave = 0;
		for (Article a : articleList) {
			if (a.getContinent().equals(continent)) {
				i++;
				sum += a.getSentiment();
			}
			ave = sum / (double) i;
		}
		return ave;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "Logo";
	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String goLogin() {
		return "loginForm";
	}

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		ArrayList<Board> bList = mapper.printBoardList();
		ArrayList<Discussion> dList = mapper.printDiscussionList();

		System.out.println(bList);
		
		model.addAttribute("boardList", bList);
		model.addAttribute("discussionList", dList);

		DiscussionMapper dis_mapper = session.getMapper(DiscussionMapper.class);
		ArrayList<Discussion_rooms> best_rooms = dis_mapper.select_best_dis_rooms();

		model.addAttribute("discussionList", best_rooms);

		return "homepage";
	}
	
	@RequestMapping(value = "getTopKeywords", method = RequestMethod.POST)
	public @ResponseBody List<Topkeyword> getTopKeywords() {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		ArrayList<Topkeyword> kList = mapper.printKeyword();

		return kList;
	}
}