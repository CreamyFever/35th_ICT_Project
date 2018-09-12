package VO;

public class Board {
	private int boardnum;
	private String title;
	private String writer;
	private String content;
	private String regdate;
	private String moddate;
	private int hitCountNumber;
	private int stars;
	
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
	public int getHitCountNumber() {
		return hitCountNumber;
	}
	public void setHitCountNumber(int hitCountNumber) {
		this.hitCountNumber = hitCountNumber;
	}
	public int getStars() {
		return stars;
	}
	public void setStars(int stars) {
		this.stars = stars;
	}
	
	public Board() {}
	
	public Board(int boardnum, String title, String writer, String content, String regdate, String moddate,
			int hitCountNumber, int stars) {
		super();
		this.boardnum = boardnum;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.regdate = regdate;
		this.moddate = moddate;
		this.hitCountNumber = hitCountNumber;
		this.stars = stars;
	}
	@Override
	public String toString() {
		return "Board [boardnum=" + boardnum + ", title=" + title + ", writer=" + writer + ", content=" + content
				+ ", regdate=" + regdate + ", moddate=" + moddate + ", hitCountNumber=" + hitCountNumber + ", stars="
				+ stars + "]";
	}
	
	
	
}
