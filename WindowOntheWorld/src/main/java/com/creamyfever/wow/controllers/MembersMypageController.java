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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.creamyfever.wow.dao.MembersDAO;
import com.creamyfever.wow.vo.Members;

/**
 * 개인정보 수정 콘트롤러
 * 모델에 "members"라는 이름의 값이 저장될 때, 세션에도 저장
 * 수정단계의 시작부터 마지막단계까지 세션의 값 유지
 */

