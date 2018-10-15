package com.creamyfever.wow.vo;

public class Board {
	private int boardnum; // 글번호
	private int idno;
	private String title; // 글제목
	private String writer; // 작성자 ID
	private String content; // 글내용
	private String regdate; // 작성날짜,시간
	private String moddate; // 수정날짜,시간
	private int hitcount; // 조회
	private String subject; // 항목분류
	private int stars; // 별점
	public Board() {
		super();
	}
	public Board(int boardnum, int idno, String title, String writer, String content, String regdate, String moddate,
			int hitcount, String subject, int stars) {
		super();
		this.boardnum = boardnum;
		this.idno = idno;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.regdate = regdate;
		this.moddate = moddate;
		this.hitcount = hitcount;
		this.subject = subject;
		this.stars = stars;
	}
	public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
	public int getIdno() {
		return idno;
	}
	public void setIdno(int idno) {
		this.idno = idno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	public int getStars() {
		return stars;
	}
	public void setStars(int stars) {
		this.stars = stars;
	}
	@Override
	public String toString() {
		return "Board [boardnum=" + boardnum + ", idno=" + idno + ", title=" + title + ", writer=" + writer
				+ ", content=" + content + ", regdate=" + regdate + ", moddate=" + moddate + ", hitcount=" + hitcount
				+ ", subject=" + subject + ", stars=" + stars + "]";
	}

	
}
