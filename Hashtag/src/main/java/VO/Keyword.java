package VO;

public class Keyword {
	private int articlenum;
	private String keyword;

	public Keyword(int articlenum, String keyword) {
		super();
		this.articlenum = articlenum;
		this.keyword = keyword;
	}

	public Keyword() {
		super();
	}

	public int getArticlenum() {
		return articlenum;
	}

	public void setArticlenum(int articlenum) {
		this.articlenum = articlenum;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "Keyword [articlenum=" + articlenum + ", keyword=" + keyword + "]";
	}
}