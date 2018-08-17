package com.creamyfever.wow.vo;

public class Article {
	private int articlenum; // 기사 고유번호
	private String articlename; // 기사 제목
	private String articledate; // 기사 날짜
	private String presscompany; // 언론사
	private String area; // 분야(정치, 경제, 스포츠, IT 등...)
	private int senti_pos; // 긍정적 반응 비율(0~100)
	private int senti_neg; // 부정적 반응 비율(0~100)

	public Article() {
		super();
	}

	public Article(int articlenum, String articlename, String articledate, String presscompany, String area,
			int senti_pos, int senti_neg) {
		super();
		this.articlenum = articlenum;
		this.articlename = articlename;
		this.articledate = articledate;
		this.presscompany = presscompany;
		this.area = area;
		this.senti_pos = senti_pos;
		this.senti_neg = senti_neg;
	}

	public int getArticlenum() {
		return articlenum;
	}

	public void setArticlenum(int articlenum) {
		this.articlenum = articlenum;
	}

	public String getArticlename() {
		return articlename;
	}

	public void setArticlename(String articlename) {
		this.articlename = articlename;
	}

	public String getArticledate() {
		return articledate;
	}

	public void setArticledate(String articledate) {
		this.articledate = articledate;
	}

	public String getPresscompany() {
		return presscompany;
	}

	public void setPresscompany(String presscompany) {
		this.presscompany = presscompany;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public int getSenti_pos() {
		return senti_pos;
	}

	public void setSenti_pos(int senti_pos) {
		this.senti_pos = senti_pos;
	}

	public int getsenti_neg() {
		return senti_neg;
	}

	public void setsenti_neg(int senti_neg) {
		this.senti_neg = senti_neg;
	}

	@Override
	public String toString() {
		return "Article [articlenum=" + articlenum + ", articlename=" + articlename + ", articledate=" + articledate
				+ ", presscompany=" + presscompany + ", area=" + area + ", senti_pos=" + senti_pos + ", senti_neg="
				+ senti_neg + "]";
	}
}
