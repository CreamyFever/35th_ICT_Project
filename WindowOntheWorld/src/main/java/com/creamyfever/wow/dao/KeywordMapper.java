package com.creamyfever.wow.dao;

import java.util.ArrayList;

import com.creamyfever.wow.vo.Keyword;

public interface KeywordMapper {
	public int insertKeyword(Keyword keyword);

	public ArrayList<Integer> searchKeyword(String keyword);

	public ArrayList<Keyword> searchKeywordNum(String keyword);

	public ArrayList<String> selectKeyword(int articlenum);
}