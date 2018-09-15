package com.creamyfever.wow.controllers;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.creamyfever.wow.dao.KeywordMapper;
import com.creamyfever.wow.vo.Keyword;

@Controller
public class KeywordController {

	@Autowired
	SqlSession session;
	
	@RequestMapping(value = "/insertKeyword", method = RequestMethod.POST)
	public @ResponseBody void insertKeyword(int id, String keyword) {
		KeywordMapper mapper = session.getMapper(KeywordMapper.class);
		Keyword key = new Keyword(id, keyword);
		mapper.insertKeyword(key);
	}
	@RequestMapping(value = "/searchKeyword", method = RequestMethod.POST)
	public @ResponseBody ArrayList<Keyword> searchKeyword(String keyword) {
		KeywordMapper mapper = session.getMapper(KeywordMapper.class);
		ArrayList<Keyword> result = mapper.searchKeywordNum("%"+keyword+"%");
		return result;
	}
	@RequestMapping(value = "/searchKeywordNum", method = RequestMethod.POST)
	public @ResponseBody ArrayList<Integer> searchKeywordNum(String keyword) {
		KeywordMapper mapper = session.getMapper(KeywordMapper.class);
		ArrayList<Integer> result = mapper.searchKeyword("%"+keyword+"%");
		return result;
	}
	@RequestMapping(value = "/selectKeyword", method = RequestMethod.POST)
	public @ResponseBody ArrayList<String> selectKeyword(int articlenum) {
		KeywordMapper mapper = session.getMapper(KeywordMapper.class);
		ArrayList<String> result = mapper.selectKeyword(articlenum);
		return result;
	}
}
