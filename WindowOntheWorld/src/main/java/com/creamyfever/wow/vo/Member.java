package com.creamyfever.wow.vo;

public class Member {
	private int idno;					// 회원 고유번호
	private String id;					// ID
	private String password;	// 비밀번호
	private String email;			// 이메일
	private String nickname;	// 닉네임
	private String gender;		// 성별
	private int age;					// 연령
	private String filename;		// 이미지 파일이름
	private String nationality;	// 국적 코드

	public Member() {
		super();
	}

	public Member(int idno, String id, String password, String email, String nickname, String gender, int age,
			String filename, String nationality) {
		super();
		this.idno = idno;
		this.id = id;
		this.password = password;
		this.email = email;
		this.nickname = nickname;
		this.gender = gender;
		this.age = age;
		this.filename = filename;
		this.nationality = nationality;
	}

	public int getIdno() {
		return idno;
	}

	public void setIdno(int idno) {
		this.idno = idno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	@Override
	public String toString() {
		return "Member [idno=" + idno + ", id=" + id + ", password=" + password + ", email=" + email + ", nickname="
				+ nickname + ", gender=" + gender + ", age=" + age + ", filename=" + filename + ", nationality="
				+ nationality + "]";
	}
}
