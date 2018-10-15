package com.creamyfever.wow.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import com.creamyfever.wow.vo.Board;
import com.creamyfever.wow.vo.Discussion;
import com.creamyfever.wow.vo.Reply;
import com.creamyfever.wow.vo.Topkeyword;

/**
 * 게시판 관련 Mybatis 사용 메서드
 */
public interface BoardMapper {
	//게시글 저장
	public int insertBoard(Board board);
	//글번호로 해당 게시글 검색
	public Board getBoard(int boardnum);
	//조회수 1 증가
	public int addHits(int boardnum);
	//검색 후의 총 글 개수
	public int getTotal(String searchText);
	//검색 후의 현재 페이지 목록
	public ArrayList<Board> listBoard(String searchText, RowBounds rb);
	//카테고리 별 게시판 글 불러오기
	public ArrayList<Board> subjectListBoard(String subject, RowBounds rb);
	//글번호와 아이디로 해당 게시글 삭제
	public int deleteBoard(Board board);
	//글 수정
	public int updateBoard(Board board);
	//리플 저장
	public int insertReply(Reply reply);
	//한 게시물의 리플 목록
	public ArrayList<Reply> listReply(int boardnum);
	//리플번호와 아이디로 해당 리플 삭제
	public int deleteReply(Reply reply);
	//리플 수정
	public int updateReply(Reply reply);

	
	public ArrayList<Board> printBoardList(); //게시판 리스트 출력
	public int updateKeyword(Topkeyword tk); //키워드 숫자 업데이트 (+1)
	public int insertKeyword(Topkeyword tk); //키워드 추가
	public ArrayList<Topkeyword> printKeyword(); //인기 키워드 추출
	public ArrayList<Discussion> printDiscussionList(); //토론방 리스트 출력
	
}
