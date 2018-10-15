package com.creamyfever.wow.dao;

import java.util.ArrayList;

import com.creamyfever.wow.vo.Article;
import com.creamyfever.wow.vo.Topkeyword;

public interface TopKeywordMapper {
	public int updateTopKeyword(String keyword); //키워드 숫자 업데이트 (+1)
	public int insertTopKeyword(Topkeyword tk); //키워드 추가
	public ArrayList<Topkeyword> printAllTopKeyword();
	public Topkeyword selectOneTopKeyword(String keyword);
}
