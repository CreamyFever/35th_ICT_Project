package com.creamyfever.wow.vo;

public class Reply {
	private int replynum;		// 댓글 번호
	private int boardnum;	// 해당 게시판 번호
	private String content;	// 댓글 내용
	private int idno;				// 작성자 고유번호
	private String regdate;	// 작성일자
	private String moddate;	// 수정일자

	public Reply() {
		super();
	}

	public Reply(int replynum, int boardnum, String content, int idno, String regdate, String moddate) {
		super();
		this.replynum = replynum;
		this.boardnum = boardnum;
		this.content = content;
		this.idno = idno;
		this.regdate = regdate;
		this.moddate = moddate;
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

	@Override
	public String toString() {
		return "Reply [replynum=" + replynum + ", boardnum=" + boardnum + ", content=" + content + ", idno=" + idno
				+ ", regdate=" + regdate + ", moddate=" + moddate + "]";
	}
}
