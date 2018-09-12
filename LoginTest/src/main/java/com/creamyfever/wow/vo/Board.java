package com.creamyfever.wow.vo;

/**
 * 게시글 정보 VO
 */
public class Board {
	int boardnum;					//글번호
	String title;					//글제목
	String idno;					//작성자 ID
	String content;					//글내용
	String regdate;					//작성날짜,시간
	String moddate;					//수정날짜,시간
	int hitcount;					//조회
	String subject;					//항목분류
	
	public Board() {
		super();
	}
	
	public Board(int boardnum, String title, String idno, String content, String regdate, String moddate, int hitcount,
			int stars, String subject) {
		super();
		this.boardnum = boardnum;
		this.title = title;
		this.idno = idno;
		this.content = content;
		this.regdate = regdate;
		this.moddate = moddate;
		this.hitcount = hitcount;

		this.subject = subject;
	}
	public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getIdno() {
		return idno;
	}
	public void setIdno(String idno) {
		this.idno = idno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getModdate() {
		return moddate;
	}
	public void setModdate(String moddate) {
		this.moddate = moddate;
	}
	public int getHitcount() {
		return hitcount;
	}
	public void setHitcount(int hitcount) {
		this.hitcount = hitcount;
	}


	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	@Override
	public String toString() {
		return "Board [boardnum=" + boardnum + ", title=" + title + ", idno=" + idno + ", content=" + content
				+ ", regdate=" + regdate + ", moddate=" + moddate + ", hitcount=" + hitcount + 
				 ", subject=" + subject + "]";
	}
	
	
}
