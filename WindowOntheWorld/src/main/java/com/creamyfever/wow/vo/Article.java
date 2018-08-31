package com.creamyfever.wow.vo;

public class Article {
	private String articleid; // 기사 고유번호
	private String articlename; // 기사 제목
	private String articlecontent; // 기사 내용
	private String articledate; // 기사 날짜
	private String presscompany; // 언론사
	private String area; // 분야(정치, 경제, 스포츠, IT 등...)
	private String url; // URL
	private String continent;	// 대륙(아시아, 유럽, 아메리카, 아프리카...(null일 경우 DB에는 아시아로 등록)
	private double senti_pos; // 긍정적 반응 비율(0~100)
	private double senti_neg; // 부정적 반응 비율(0~100)

	public Article() {
		super();
	}	

	public Article(String articleid, String articlename, String articlecontent, String articledate, String presscompany,
			String area, String url, String continent, double senti_pos, double senti_neg) {
		super();
		this.articleid = articleid;
		this.articlename = articlename;
		this.articlecontent = articlecontent;
		this.articledate = articledate;
		this.presscompany = presscompany;
		this.area = area;
		this.url = url;
		this.continent = continent;
		this.senti_pos = senti_pos;
		this.senti_neg = senti_neg;
	}

	public String getArticleid() {
		return articleid;
	}

	public void setArticleid(String articleid) {
		this.articleid = articleid;
	}

	public String getArticlename() {
		return articlename;
	}

	public void setArticlename(String articlename) {
		this.articlename = articlename;
	}

	public String getArticlecontent() {
		return articlecontent;
	}

	public void setArticlecontent(String articlecontent) {
		this.articlecontent = articlecontent;
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

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public double getSenti_pos() {
		return senti_pos;
	}

	public void setSenti_pos(double senti_pos) {
		this.senti_pos = senti_pos;
	}

	public double getSenti_neg() {
		return senti_neg;
	}

	public void setSenti_neg(double senti_neg) {
		this.senti_neg = senti_neg;
	}

	@Override
	public String toString() {
		return "Article [articleid=" + articleid + ", articlename=" + articlename + ", articlecontent=" + articlecontent
				+ ", articledate=" + articledate + ", presscompany=" + presscompany + ", area=" + area + ", url=" + url
				+ ", continent=" + continent + ", senti_pos=" + senti_pos + ", senti_neg=" + senti_neg + "]";
	}
}
