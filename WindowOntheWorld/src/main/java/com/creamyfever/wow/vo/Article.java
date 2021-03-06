package com.creamyfever.wow.vo;

public class Article {
	private int articlenum; // 기사 번호
	private String articleid; // 기사 ID
	private String articlename; // 기사 제목
	private String articlecontent; // 기사 내용
	private String articledate; // 기사 날짜
	private String presscompany; // 언론사
	private String url; // URL
	private String continent; // 대륙(아시아, 유럽, 아메리카, 아프리카...(null일 경우 DB에는 아시아로 등록)
	private double sentiment; // 긍정적 반응 비율(0~100)

	public Article() {
		super();
	}

	public Article(int articlenum, String articleid, String articlename, String articlecontent, String articledate,
			String presscompany, String url, String continent, double sentiment) {
		super();
		this.articlenum = articlenum;
		this.articleid = articleid;
		this.articlename = articlename;
		this.articlecontent = articlecontent;
		this.articledate = articledate;
		this.presscompany = presscompany;
		this.url = url;
		this.continent = continent;
		this.sentiment = sentiment;
	}

	public int getArticlenum() {
		return articlenum;
	}

	public void setArticlenum(int articlenum) {
		this.articlenum = articlenum;
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

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getContinent() {
		return continent;
	}

	public void setContinent(String continent) {
		this.continent = continent;
	}

	public double getSentiment() {
		return sentiment;
	}

	public void setSentiment(double sentiment) {
		this.sentiment = sentiment;
	}

	@Override
	public String toString() {
		return "Article [articlenum=" + articlenum + ", articleid=" + articleid + ", articlename=" + articlename
				+ ", articlecontent=" + articlecontent + ", articledate=" + articledate + ", presscompany="
				+ presscompany + ", url=" + url + ", continent=" + continent + ", sentiment=" + sentiment + "]";
	}
}
