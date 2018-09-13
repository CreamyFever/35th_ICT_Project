package com.test.testttt;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import DAO.UserMapper;
import VO.Articles;
import VO.Keyword;

@Controller
public class HomeController {

	@Autowired
	SqlSession session;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	@RequestMapping(value = "/articleList", method = RequestMethod.POST)
	public @ResponseBody ArrayList<Articles> articleList() {
		UserMapper mapper = session.getMapper(UserMapper.class);
		ArrayList<Articles> articleList = mapper.printAll();
		return articleList;
	}
	@RequestMapping(value = "/insertKeyword", method = RequestMethod.POST)
	public @ResponseBody void insertKeyword(int id, String keyword) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		Keyword key = new Keyword(id, keyword);
		mapper.insertKeyword(key);
	}
	@RequestMapping(value = "/searchKeyword", method = RequestMethod.POST)
	public @ResponseBody ArrayList<Keyword> searchKeyword(String keyword) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		ArrayList<Keyword> result = mapper.searchKeywordNum("%"+keyword+"%");
		return result;
	}
	@RequestMapping(value = "/searchKeywordNum", method = RequestMethod.POST)
	public @ResponseBody ArrayList<Integer> searchKeywordNum(String keyword) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		ArrayList<Integer> result = mapper.searchKeyword("%"+keyword+"%");
		return result;
	}
	@RequestMapping(value = "/selectKeyword", method = RequestMethod.POST)
	public @ResponseBody ArrayList<String> selectKeyword(int articlenum) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		ArrayList<String> result = mapper.selectKeyword(articlenum);
		return result;
	}
}