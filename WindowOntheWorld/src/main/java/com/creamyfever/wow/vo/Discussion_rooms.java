package com.creamyfever.wow.vo;

public class Discussion_rooms {
	private int dis_no;
	private String dis_title;
	private int articlenum;
	private String dis_regdate;
	private double dis_grade;

	public Discussion_rooms(int dis_no, String dis_title, int articlenum, String dis_regdate, double dis_grade) {
		super();
		this.dis_no = dis_no;
		this.dis_title = dis_title;
		this.articlenum = articlenum;
		this.dis_regdate = dis_regdate;
		this.dis_grade = dis_grade;
	}

	public Discussion_rooms() {
		super();
	}

	public int getDis_no() {
		return dis_no;
	}

	public void setDis_no(int dis_no) {
		this.dis_no = dis_no;
	}

	public String getDis_title() {
		return dis_title;
	}

	public void setDis_title(String dis_title) {
		this.dis_title = dis_title;
	}

	public int getArticlenum() {
		return articlenum;
	}

	public void setArticlenum(int articlenum) {
		this.articlenum = articlenum;
	}

	public String getDis_regdate() {
		return dis_regdate;
	}

	public void setDis_regdate(String dis_regdate) {
		this.dis_regdate = dis_regdate;
	}

	public double getDis_grade() {
		return dis_grade;
	}

	public void setDis_grade(double dis_grade) {
		this.dis_grade = dis_grade;
	}

	@Override
	public String toString() {
		return "Discussion_rooms [dis_no=" + dis_no + ", dis_title=" + dis_title + ", articlenum=" + articlenum
				+ ", dis_regdate=" + dis_regdate + ", dis_grade=" + dis_grade + "]";
	}
}