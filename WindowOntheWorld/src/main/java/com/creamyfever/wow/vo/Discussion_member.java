package com.creamyfever.wow.vo;

public class Discussion_member {
	private int dis_no;
	private int idno;
	private String id_status;

	public Discussion_member(int dis_no, int idno, String id_status) {
		super();
		this.dis_no = dis_no;
		this.idno = idno;
		this.id_status = id_status;
	}

	public Discussion_member() {
		super();
	}

	public int getDis_no() {
		return dis_no;
	}

	public void setDis_no(int dis_no) {
		this.dis_no = dis_no;
	}

	public int getIdno() {
		return idno;
	}

	public void setIdno(int idno) {
		this.idno = idno;
	}

	public String getId_status() {
		return id_status;
	}

	public void setId_status(String id_status) {
		this.id_status = id_status;
	}

	@Override
	public String toString() {
		return "Discussion_members [dis_no=" + dis_no + ", idno=" + idno + ", id_status=" + id_status + "]";
	}
}