package com.creamyfever.wow.vo;

public class DiscussionList {
	private int dis_no;
	private String dis_title;
	private String articlename;
	private String dis_regdate;
	private double dis_grade;

	public DiscussionList(int dis_no, String dis_title, String articlename, String dis_regdate, double dis_grade) {
		super();
		this.dis_no = dis_no;
		this.dis_title = dis_title;
		this.articlename = articlename;
		this.dis_regdate = dis_regdate;
		this.dis_grade = dis_grade;
	}

	public DiscussionList() {
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

	public String getArticlename() {
		return articlename;
	}

	public void setArticlename(String articlename) {
		this.articlename = articlename;
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
		return "DiscussionList [dis_no=" + dis_no + ", dis_title=" + dis_title + ", articlename=" + articlename
				+ ", dis_regdate=" + dis_regdate + ", dis_grade=" + dis_grade + "]";
	}
}