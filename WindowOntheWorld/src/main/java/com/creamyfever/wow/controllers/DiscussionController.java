package com.creamyfever.wow.controllers;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.creamyfever.wow.dao.DiscussionMapper;
import com.creamyfever.wow.vo.Article;
import com.creamyfever.wow.vo.DiscussionList;
import com.creamyfever.wow.vo.Discussion_member;
import com.creamyfever.wow.vo.Discussion_rooms;
import com.creamyfever.wow.vo.Members;

import com.creamyfever.wow.util.PageNavigator;

@Controller
public class DiscussionController {
	@Autowired
	SqlSession session;
	
	final int countPerPage = 10;
	final int pagePerGroup = 5;

	@RequestMapping(value = "/discussionList", method = RequestMethod.GET)
	public String discussionList(HttpSession hsession, String loginId) {		
		return "redirect:roomList";
	}

	@RequestMapping(value = "/insertroom", method = RequestMethod.POST)
	public String insertroom(String loginId, String roomnum, String room_state, HttpSession hsession, Model model) {
		DiscussionMapper mapper = session.getMapper(DiscussionMapper.class);
		Members user = mapper.loginmember(loginId);

		hsession.setAttribute("idno", user.getIdno());
		hsession.setAttribute("loginId", user.getId());
		hsession.setAttribute("loginName", user.getNickname());

		if (room_state.equals("new")) {
			return "enterDiscussionRoom";
		} else {
			Discussion_member dis_mem = new Discussion_member();
			dis_mem.setDis_no(Integer.parseInt(roomnum));
			dis_mem.setIdno(user.getIdno());
			String userState = mapper.select_dis_room_members_state(dis_mem);
			hsession.setAttribute("userState", userState);
			hsession.setAttribute("roomnum", Integer.parseInt(roomnum));
			
			Discussion_rooms dr = mapper.select_dis_room(Integer.parseInt(roomnum));
			model.addAttribute("discussion_room", dr);
			Article article = mapper.selectArticle(Integer.parseInt(roomnum));
			model.addAttribute("article", article);
			
			return "websocket-echo";
		}
	}
	
	@RequestMapping(value = "/insertroom", method = RequestMethod.GET)
	public String insertroom(String roomnum, HttpSession hsession, Model model) {
		DiscussionMapper mapper = session.getMapper(DiscussionMapper.class);
		hsession.setAttribute("roomnum", Integer.parseInt(roomnum));
		Discussion_rooms dr = mapper.select_dis_room(Integer.parseInt(roomnum));
		model.addAttribute("discussion_room", dr);
		hsession.setAttribute("userState", "관전");
		Article article = mapper.selectArticle(Integer.parseInt(roomnum));
		model.addAttribute("article", article);
		return "websocket-echo";
	}

	@RequestMapping(value = "/enterroom", method = RequestMethod.POST)
	public String enterroom(String dis_title, String articlenum) {
		DiscussionMapper mapper = session.getMapper(DiscussionMapper.class);
		Discussion_rooms disroom = new Discussion_rooms();
		disroom.setDis_title(dis_title);
		disroom.setArticlenum(Integer.parseInt(articlenum));
		mapper.insert_dis_room(disroom);
		return "redirect:roomList";
	}

	@RequestMapping(value = "/discussionRoomGrade", method = RequestMethod.GET)
	public String discussionRoomGrade() {
		return "discussionRoomGrade";
	}

	@RequestMapping(value = "/discussionMemberState", method = RequestMethod.GET)
	public String discussionMemberState() {
		return "discussionMemberState";
	}

	@RequestMapping(value = "/selectState", method = RequestMethod.POST)
	public @ResponseBody String selectState(HttpSession hsession, String roomnum, String state) {
		DiscussionMapper mapper = session.getMapper(DiscussionMapper.class);
		Discussion_member dis_mem = new Discussion_member(Integer.parseInt(roomnum),
				(Integer) hsession.getAttribute("loginIdno"), state);
		mapper.insert_dis_room_members(dis_mem);
		return state;
	}

	@RequestMapping(value = "/sendGrade", method = RequestMethod.POST)
	public @ResponseBody String sendGrade(String grade) {
		return grade;
	}

	/*@RequestMapping(value = "/roomList", method = RequestMethod.POST)
	public ArrayList<HashMap<String, Discussion_rooms>> roomList(@RequestParam(value = "page", defaultValue = "1") int page, String searchText, Model model) {
		DiscussionMapper mapper = session.getMapper(DiscussionMapper.class);
		
		
		int total = mapper.getTotal(searchText);
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
		
		RowBounds rb = new RowBounds(navi.getStartRecord(), navi.getCountPerPage());
		
		ArrayList<Discussion_rooms> room = mapper.printAll_dis_room(searchText, rb);
		ArrayList<HashMap<String, Discussion_rooms>> roomList = new ArrayList<>();
		
		for(int i=0 ; i<room.size() ; i++) {
			String articlename = mapper.selectTitle(room.get(i).getArticlenum());
			HashMap<String, Discussion_rooms> r = new HashMap<>();
			r.put(articlename, room.get(i));
			roomList.add(r);
		}
		
		model.addAttribute("search", searchText);
		model.addAttribute("navi", navi);
		
		return roomList;
	}*/
	
	@RequestMapping(value = "/roomList", method = RequestMethod.GET)
	public String roomList(@RequestParam(value = "page", defaultValue = "1") int page, String searchText, Model model) {
		DiscussionMapper mapper = session.getMapper(DiscussionMapper.class);
		
		int total = mapper.getTotal(searchText);
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
		
		RowBounds rb = new RowBounds(navi.getStartRecord(), navi.getCountPerPage());
		
		ArrayList<Discussion_rooms> room = mapper.printAll_dis_room(searchText, rb);
		ArrayList<DiscussionList> roomList = new ArrayList<DiscussionList>();
		
		for(int i=0 ; i<room.size() ; i++) {
			Article article = mapper.selectArticle(room.get(i).getArticlenum());
			String articlename = article.getArticlename();
			DiscussionList dl = new DiscussionList(room.get(i).getDis_no(), room.get(i).getDis_title(), articlename, room.get(i).getDis_regdate(), room.get(i).getDis_grade());
			roomList.add(dl);
		}
		model.addAttribute("roomList", roomList);
		model.addAttribute("search", searchText);
		model.addAttribute("navi", navi);
		
		return "discussionList";
	}

	@RequestMapping(value = "/member_state", method = RequestMethod.POST)
	public @ResponseBody String member_state(int idno, int roomnum) {
		DiscussionMapper mapper = session.getMapper(DiscussionMapper.class);
		Discussion_member dis_mem = new Discussion_member();
		dis_mem.setDis_no(roomnum);
		dis_mem.setIdno(idno);
		String state = mapper.select_dis_room_members_state(dis_mem);
		return state;
	}
	
	@RequestMapping(value = "/discussionList", method = RequestMethod.POST)
	public @ResponseBody ArrayList<Discussion_rooms> discussionList() {
		DiscussionMapper mapper = session.getMapper(DiscussionMapper.class);
		ArrayList<Discussion_rooms> best_rooms = mapper.select_best_dis_rooms();
		return best_rooms;
	}
	
	@RequestMapping(value = "/room_grade", method = RequestMethod.POST)
	public @ResponseBody double room_grade(int roomnum) {
		DiscussionMapper mapper = session.getMapper(DiscussionMapper.class);
		double grade = mapper.select_dis_room_grade(roomnum);
		return grade;
	}
	
	@RequestMapping(value = "/articleListselect", method = RequestMethod.POST)
	public @ResponseBody ArrayList<Article> articleListselect() {
		DiscussionMapper mapper = session.getMapper(DiscussionMapper.class);
		ArrayList<Article> articleList = mapper.printAllArticles();
		return articleList;
	}
}