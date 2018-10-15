package com.creamyfever.wow.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import com.creamyfever.wow.dao.MembersDAO;
import com.creamyfever.wow.vo.Members;

/**
 * 회원 가입 콘트롤러 모델에 "customer"라는 이름의 값이 저장될 때, 세션에도 저장 가입단계의 시작부터 마지막단계까지 세션의 값 유지
 */
@Controller

public class MembersJoinController {
	@Autowired
	MembersDAO dao; // 회원 관련 데이터 처리 객체

	/**
	 * 회원 가입 폼 보기
	 */
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinForm(Model model) {
		// 빈 VO객체를 만들어 세션에 저장
		Members members = new Members();
		model.addAttribute("members", members);
		return "joinForm";
	}

	/**
	 * 회원 가입 처리
	 * 
	 * @param customer
	 *            joinForm()에서 생성한 VO객체에 사용자가 입력한 가입 정보가 추가된 객체. 세션에 해당 값이 없으면 에러.
	 */
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(@ModelAttribute("members") Members members, Model model) {
		int result = dao.insert(members);
		if (result != 1) {
			// DB저장에 실패한 경우 alert() 출력용 메시지를 모델에 저장
			model.addAttribute("errorMsg", "가입 실패");
			return "joinForm";
		}
		return "loginForm";
	}

	/**
	 * 회원 가입 처리 완료
	 * 
	 * @param customer
	 *            DB에 최종 저장된 정보
	 * @param sessionStatus
	 * 			@SessionAttributes에서 지정한 이름을 세션에서 삭제하기 위해 사용
	 */
	@RequestMapping(value = "/joinComplete", method = RequestMethod.GET)
	public String joinComplete(@ModelAttribute("members") Members members, SessionStatus sessionStatus, Model model) {
		// 가입 처리된 ID를 모델에 저장
		model.addAttribute("id", members.getId());
		sessionStatus.setComplete();
		return "joinComplete";
	}

	/**
	 * ID 중복 확인 폼 보기
	 */
	@RequestMapping(value = "idcheck", method = RequestMethod.GET)
	public String idcheck(Model model) {
		// 검색 전후 확인용
		model.addAttribute("search", false);
		return "idcheck";
	}

	/**
	 * ID 중복 검사
	 */
	@RequestMapping(value = "idcheck", method = RequestMethod.POST)
	public String idcheck(String searchId, Model model) {
		// ID 검색
		Members c = dao.get(searchId);
		// 검색ID와 검색 결과, 검색전후 확인용 값 저장
		model.addAttribute("searchId", searchId);
		model.addAttribute("searchResult", c);
		model.addAttribute("search", true);
		return "idcheck";
	}
}