package com.creamyfever.wow.vo;

/**
 * 리플 정보 VO
 */
public class Reply {
	int replynum;				//댓글번호
	int boardnum;				//원문 게시판글번호
	String content;				//내용
	int idno;				//작성자 고유번호
	String regdate;				//댓글 등록날짜
	String moddate;				//댓글 수정날짜
	int stars;						//별점수
	public Reply() {
		super();
	}
	public Reply(int replynum, int boardnum, String content, int idno, String regdate, String moddate, int stars) {
		super();
		this.replynum = replynum;
		this.boardnum = boardnum;
		this.content = content;
		this.idno = idno;
		this.regdate = regdate;
		this.moddate = moddate;
		this.stars = stars;
	}
	public int getReplynum() {
		return replynum;
	}
	public void setReplynum(int replynum) {
		this.replynum = replynum;
	}
	public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getIdno() {
		return idno;
	}
	public void setIdno(int idno) {
		this.idno = idno;
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
	public int getStars() {
		return stars;
	}
	public void setStars(int stars) {
		this.stars = stars;
	}
	@Override
	public String toString() {
		return "Reply [replynum=" + replynum + ", boardnum=" + boardnum + ", content=" + content + ", idno=" + idno
				+ ", regdate=" + regdate + ", moddate=" + moddate + ", stars=" + stars + "]";
	}

	
	
}