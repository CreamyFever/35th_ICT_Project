package com.creamyfever.wow.vo;

public class Nation {
	private String nationality; 		// 국적 코드
	private String nationname; 	// 국가명

	public Nation() {
		super();
	}

	public Nation(String nationality, String nationname) {
		super();
		this.nationality = nationality;
		this.nationname = nationname;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public String getNationname() {
		return nationname;
	}

	public void setNationname(String nationname) {
		this.nationname = nationname;
	}

	@Override
	public String toString() {
		return "Nation [nationality=" + nationality + ", nationname=" + nationname + "]";
	}
}