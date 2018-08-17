package com.creamyfever.wow.vo;

public class Board {
	private int boardnum;		// 게시판 고유번호
	private String title; 			// 제목
	private int idno; 				// 작성자 고유번호
	private String content; 		// 내용
	private String regdate; 		// 작성일자
	private String moddate; 	// 수정일자
	private int hitcount; 			// 조회수
	private int stars; 				// 평점

	public Board() {
		super();
	}

	public Board(int boardnum, String title, int idno, String content, String regdate, String moddate, int hitcount,
			int stars) {
		super();
		this.boardnum = boardnum;
		this.title = title;
		this.idno = idno;
		this.content = content;
		this.regdate = regdate;
		this.moddate = moddate;
		this.hitcount = hitcount;
		this.stars = stars;
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

	public int getIdno() {
		return idno;
	}

	public void setIdno(int idno) {
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

	public int getStars() {
		return stars;
	}

	public void setStars(int stars) {
		this.stars = stars;
	}

	@Override
	public String toString() {
		return "Board [boardnum=" + boardnum + ", title=" + title + ", idno=" + idno + ", content=" + content
				+ ", regdate=" + regdate + ", moddate=" + moddate + ", hitcount=" + hitcount + ", stars=" + stars + "]";
	}
}