package com.creamyfever.wow.controllers;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.creamyfever.wow.dao.MembersDAO;
import com.creamyfever.wow.util.FileService;
import com.creamyfever.wow.vo.Members;

/**
 * 개인정보 수정 콘트롤러
 * 모델에 "members"라는 이름의 값이 저장될 때, 세션에도 저장
 * 수정단계의 시작부터 마지막단계까지 세션의 값 유지
 */
@Controller

public class MembersUpdateController {
	private static final Logger logger = LoggerFactory.getLogger(MembersUpdateController.class);
	private static final String UPLOADPATH = "./resources/images";
	
	@Autowired
	MembersDAO dao;		//회원 관련 데이터 처리 객체
	
	/**2
	 * 회원 정보 수정 폼 보기
	 */
	@RequestMapping (value="members/update", method=RequestMethod.GET)
	public String updateForm(HttpSession session, Model model,Members mebers) {
		//세션의 로그인ID로 개인정보를 검색하여 모델에 저장
		System.out.println("수정시작 페이지로 들어 갑니다.");
		
		
		
		String id = (String) session.getAttribute("loginId");
		Members members = dao.get(id);
		
		model.addAttribute("members", members);
		model.addAttribute("filename", members.getFilename());
		return "members/updateForm";
	} 

	/**
	 * 회원 정보 수정 처리
	 * 
	 * 
	 * @param customer updateForm()에서 생성한 VO객체에 사용자가 입력한 수정 정보가 추가된 객체.
	 * 					세션에 해당 값이 없으면 에러.
	 */
	@RequestMapping (value="members/update", method=RequestMethod.POST)
	public String update(
			@ModelAttribute("members") Members members,
			MultipartFile cma_file,
			HttpSession session,
			Model model) {
		
		System.out.println(members+"들어온값은??");
		System.out.println("업데이트 컨트롤러 작동");	
		System.out.println(members.toString()+"===========");
		
		
		
		
			//수정 시 새로 첨부한 파일이 있으면 기존 파일을 삭제하고 새로 업로드
		if (!cma_file.isEmpty()) {
			//기존 글에 첨부된 파일의 실제 저장된 이름
			String savedfile = members.getFilename();
			//기존 파일이 있으면 삭제
			if (savedfile != null) {
				FileService.deleteFile(UPLOADPATH + "/" + savedfile);
			}
			
			//새로 업로드한 파일 저장
			savedfile = FileService.saveFile(cma_file, UPLOADPATH);
			
			//수정 정보에 새로 저장된 파일명과 원래의 파일명 저장
			members.setFilename(savedfile);
		}
		
		
		//Mapper에 where 조건인 idno를 불러오는 구문
		int idno=(int)session.getAttribute("loginIdno");
		System.out.println(idno+"idno값");
		members.setIdno(idno);
        
		
		int result = dao.update(members);
		System.out.println("업데이트 컨트롤러 dao 실행");
	
		
		if (result != 1) {
			//DB update에 실패한 경우 alert() 출력용 메시지를 모델에 저장
			model.addAttribute("errorMsg", "수정 실패");
			return "members/updateForm";
		}
		System.out.println(result);
		System.out.println(members+"마지막 멤버스");
		
		
		
		model.addAttribute("result", members);
		return "members/updateComplete";
	}

	
	
	
	
	/**
	 * 회원 정보 수정 처리 완료
	 * @param customer DB에 최종 저장된 정보
	 * @param sessionStatus @SessionAttributes에서 지정한 이름을 세션에서 삭제하기 위해 사용
	 */
	@RequestMapping(value="members/updateComplete", method=RequestMethod.GET)
	public String updateComplete(
			@ModelAttribute("members") Members members, 
			MultipartFile cma_file,
			SessionStatus sessionStatus,
			HttpSession session,
			Model model) {
		
		//수정된 정보를 세션에도 반영 (로그인한 사용자 이름)
		session.setAttribute("loginName", members.getNickname());
		session.setAttribute("filename",members.getFilename() );
		
	
		session.setAttribute("members", members);
		
		
		
		//수정 처리된 정보를 모델에 저장
		
		sessionStatus.setComplete();
		
		return "members/updateComplete";
	}
}
