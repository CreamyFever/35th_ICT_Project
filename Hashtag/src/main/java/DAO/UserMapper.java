package DAO;

import java.util.ArrayList;

import VO.Articles;
import VO.Keyword;

public interface UserMapper {
	public ArrayList<Articles> printAll();

	public int insertKeyword(Keyword keyword);

	public ArrayList<Integer> searchKeyword(String keyword);

	public ArrayList<Keyword> searchKeywordNum(String keyword);

	public ArrayList<String> selectKeyword(int articlenum);
}