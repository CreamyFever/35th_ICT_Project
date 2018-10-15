package com.creamyfever.wow.vo;

public class ArticleReply {
	private int replynum;				//댓글번호
	private int articlenum;				//원문 기사글번호
	private String content;				//내용
	private String idno;				//작성자 고유번호
	private String regdate;				//댓글 등록날짜
	private String moddate;				//댓글 수정날짜
	private int stars;						//별점수
	public int getReplynum() {
		return replynum;
	}
	public void setReplynum(int replynum) {
		this.replynum = replynum;
	}
	public int getArticlenum() {
		return articlenum;
	}
	public void setArticlenum(int articlenum) {
		this.articlenum = articlenum;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getIdno() {
		return idno;
	}
	public void setIdno(String idno) {
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
	public ArticleReply(int replynum, int articlenum, String content, String idno, String regdate, String moddate,
			int stars) {
		super();
		this.replynum = replynum;
		this.articlenum = articlenum;
		this.content = content;
		this.idno = idno;
		this.regdate = regdate;
		this.moddate = moddate;
		this.stars = stars;
	}
	public ArticleReply() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "ArticleReply [replynum=" + replynum + ", articlenum=" + articlenum + ", content=" + content + ", idno="
				+ idno + ", regdate=" + regdate + ", moddate=" + moddate + ", stars=" + stars + "]";
	}

}
