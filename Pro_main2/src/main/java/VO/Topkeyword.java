package VO;

public class Topkeyword {
	private String keyword;
	private int count;
	private int age;
	private int gender;
	
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
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public Topkeyword() {
		
	}
	public Topkeyword(String keyword, int count, int age, int gender) {
		super();
		this.keyword = keyword;
		this.count = count;
		this.age = age;
		this.gender = gender;
	}
	
}
