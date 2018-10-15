package com.creamyfever.wow.vo;

public class Discussion {
	private int dis_no;
	private String dis_title;
	private String dis_topic;
	private String dis_regdate;
	private int dis_grade;
	
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
	public String getDis_topic() {
		return dis_topic;
	}
	public void setDis_topic(String dis_topic) {
		this.dis_topic = dis_topic;
	}
	public String getDis_regdate() {
		return dis_regdate;
	}
	public void setDis_regdate(String dis_regdate) {
		this.dis_regdate = dis_regdate;
	}
	public int getDis_grade() {
		return dis_grade;
	}
	public void setDis_grade(int dis_grade) {
		this.dis_grade = dis_grade;
	}
	public Discussion(int dis_no, String dis_title, String dis_topic, String dis_regdate, int dis_grade) {
		super();
		this.dis_no = dis_no;
		this.dis_title = dis_title;
		this.dis_topic = dis_topic;
		this.dis_regdate = dis_regdate;
		this.dis_grade = dis_grade;
	}
	public Discussion() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Discussion [dis_no=" + dis_no + ", dis_title=" + dis_title + ", dis_topic=" + dis_topic
				+ ", dis_regdate=" + dis_regdate + ", dis_grade=" + dis_grade + "]";
	}
	
	
	
}
