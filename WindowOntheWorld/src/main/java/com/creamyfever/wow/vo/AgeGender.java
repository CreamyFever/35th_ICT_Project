package com.creamyfever.wow.vo;

public class AgeGender {
	private String id;
	private String keyword;
	private int age;
	private String gender;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "ValueForAgeGender [id=" + id + ", age=" + age + ", gender=" + gender + ", keyword=" + keyword + "]";
	}
	public AgeGender(String id, int age, String gender, String keyword) {
		super();
		this.id = id;
		this.age = age;
		this.gender = gender;
		this.keyword = keyword;
	}
	public AgeGender() {
		super();
	}
}
