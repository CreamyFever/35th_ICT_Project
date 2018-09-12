package com.creamyfever.wow.controllers;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.creamyfever.wow.dao.MembersDAO;
import com.creamyfever.wow.dao.MembersMapper;
import com.creamyfever.wow.vo.Members;

/**
 * 회원 로그인, 로그아웃 처리 콘트롤러
 */
@RequestMapping("members")
@Controller
public class MembersLoginController {
	private static final Logger logger = LoggerFactory.getLogger(MembersLoginController.class);

	@Autowired
	SqlSession sqlSession;
	@Autowired
	MembersDAO dao;

	/**
	 * 로그인 폼 보기
	 */
	@RequestMapping (value="login", method=RequestMethod.GET)
	public String loginForm() {
		return "members/loginForm";
	}

	/**
	 * 로그인 처리
	 * @param id 사용자가 입력한 아이디
	 * @param password 사용자가 입력한 비밀번호
	 * @param model Model객체
	 * @param session HttpSession객체
	 */
	@RequestMapping (value="login", method=RequestMethod.POST)
	public String login(
			String id, String password, 
			Model model, HttpSession session) {
		System.out.println(id);
		MembersMapper dao = sqlSession.getMapper(MembersMapper.class);
		Members members= dao.selectMembers(id);
		
		System.out.println(password);

		System.out.println(members);
		if (members != null && members.getPassword().equals(password)) {
			session.setAttribute("loginId", members.getId());
			session.setAttribute("loginIdno", members.getIdno());
			session.setAttribute("loginName", members.getNickname());
			System.out.println("로그인 검색 성공");
			return "redirect:/main";
		} 	
		else {
			model.addAttribute("errorMsg", "ID 또는 비밀번호가 틀립니다.");
			System.out.println("로그인 검색 실패");
			return "members/loginForm";
		}
	}
	
	/**
	 * 로그아웃 처리
	 * @param session HttpSession객체
	 */
	@RequestMapping (value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
