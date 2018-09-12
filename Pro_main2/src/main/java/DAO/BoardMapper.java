package DAO;

import java.util.ArrayList;

import VO.Article;
import VO.Board;
import VO.Discussion;
import VO.Topkeyword;

public interface BoardMapper {
	public ArrayList<Board> printBoardList(); //게시판 리스트 출력
	public int updateKeyword(Topkeyword tk); //키워드 숫자 업데이트 (+1)
	public int insertKeyword(Topkeyword tk); //키워드 추가
	public ArrayList<Topkeyword> printKeyword(); //인기 키워드 추출
	public ArrayList<Discussion> printDiscussionList(); //토론방 리스트 출력
}
