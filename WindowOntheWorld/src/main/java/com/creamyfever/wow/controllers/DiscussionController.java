package com.creamyfever.wow.controllers;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.creamyfever.wow.dao.DiscussionMapper;
import com.creamyfever.wow.vo.Discussion_member;
import com.creamyfever.wow.vo.Discussion_rooms;
import com.creamyfever.wow.vo.Members;

@Controller
public class DiscussionController {
	@Autowired
	SqlSession session;

	@RequestMapping(value = "/discussionList", method = RequestMethod.GET)
	public String discussionList(Model model, HttpSession hsession, String loginId) {
		model.addAttribute("loginId", loginId);
		return "discussionList";
	}

	@RequestMapping(value = "/insertroom", method = RequestMethod.POST)
	public String insertroom(String status, String loginId, String roomnum, String room_state, String userState,
			HttpSession hsession, Model model) {
		DiscussionMapper mapper = session.getMapper(DiscussionMapper.class);
		Members user = mapper.loginmember(loginId);
		
		hsession.setAttribute("idno", user.getIdno());
		hsession.setAttribute("loginId", user.getId());
		hsession.setAttribute("loginName", user.getNickname());
		
		if (room_state.equals("new")) {
			return "enterDiscussionRoom";
		} else {
			hsession.setAttribute("userState", userState);
			hsession.setAttribute("roomnum", Integer.parseInt(roomnum));
			return "websocket-echo";
		}
	}

	@RequestMapping(value = "/enterroom", method = RequestMethod.POST)
	public String enterroom(String dis_title, String articlenum, String room_state, HttpSession hsession, Model model) {
		DiscussionMapper mapper = session.getMapper(DiscussionMapper.class);
		Discussion_rooms disroom = new Discussion_rooms();
		disroom.setDis_title(dis_title);
		disroom.setArticlenum(Integer.parseInt(articlenum));
		mapper.insert_dis_room(disroom);
		System.out.println(hsession.getAttribute("loginIdno"));
		System.out.println(hsession.getAttribute("loginName"));
		//model.addAttribute("loginIdno", );
		return "discussionList";
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

	@RequestMapping(value = "/roomList", method = RequestMethod.POST)
	public @ResponseBody ArrayList<Discussion_rooms> roomList() {
		DiscussionMapper mapper = session.getMapper(DiscussionMapper.class);
		ArrayList<Discussion_rooms> roomList = mapper.printAll_dis_room();
		return roomList;
	}

	@RequestMapping(value = "/member_state", method = RequestMethod.POST)
	public @ResponseBody String member_state(int idno) {
		DiscussionMapper mapper = session.getMapper(DiscussionMapper.class);
		String state = mapper.select_dis_room_members_state(idno);
		return state;
	}
}