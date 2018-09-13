package VO;

public class Articles {
	private int articlenum;
	private String articleid;
	private String articlename;
	private String articlecontent;
	private String articledate;
	private String presscompany;
	private String url;
	private String continent;
	private double sentiment;

	public Articles(int articlenum, String articleid, String articlename, String articlecontent, String articledate,
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

	public Articles() {
		super();
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
		return "Articles [articlenum=" + articlenum + ", articleid=" + articleid + ", articlename=" + articlename
				+ ", articlecontent=" + articlecontent + ", articledate=" + articledate + ", presscompany="
				+ presscompany + ", url=" + url + ", continent=" + continent + ", sentiment=" + sentiment + "]";
	}
}