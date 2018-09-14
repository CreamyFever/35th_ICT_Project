package com.creamyfever.wow.vo;

public class Discussion_log {
	private int dis_no;
	private int dis_log_seq;
	private int idno;
	private String dis_log;

	public Discussion_log(int dis_no, int dis_log_seq, int idno, String dis_log) {
		super();
		this.dis_no = dis_no;
		this.dis_log_seq = dis_log_seq;
		this.idno = idno;
		this.dis_log = dis_log;
	}

	public Discussion_log() {
		super();
	}

	public int getDis_no() {
		return dis_no;
	}

	public void setDis_no(int dis_no) {
		this.dis_no = dis_no;
	}

	public int getDis_log_seq() {
		return dis_log_seq;
	}

	public void setDis_log_seq(int dis_log_seq) {
		this.dis_log_seq = dis_log_seq;
	}

	public int getIdno() {
		return idno;
	}

	public void setIdno(int idno) {
		this.idno = idno;
	}

	public String getDis_log() {
		return dis_log;
	}

	public void setDis_log(String dis_log) {
		this.dis_log = dis_log;
	}

	@Override
	public String toString() {
		return "Discussion_log [dis_no=" + dis_no + ", dis_log_seq=" + dis_log_seq + ", idno=" + idno + ", dis_log="
				+ dis_log + "]";
	}
}