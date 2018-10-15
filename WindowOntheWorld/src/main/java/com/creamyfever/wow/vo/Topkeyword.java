package com.creamyfever.wow.vo;

public class Topkeyword {
	private String keyword;
	private int count;
	private int age;
	private String gender;

	public Topkeyword() {
		super();
	}

	public Topkeyword(String keyword, int count, int age, String gender) {
		super();
		this.keyword = keyword;
		this.count = count;
		this.age = age;
		this.gender = gender;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
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

	@Override
	public String toString() {
		return "Topkeyword [keyword=" + keyword + ", count=" + count + ", age=" + age + ", gender=" + gender + "]";
	}
}
