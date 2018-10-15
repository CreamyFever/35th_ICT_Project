package com.creamyfever.wow.vo;

public class ArticleHtml {
	private String articleid; // 기사 ID
	private String articlehtml;

	public ArticleHtml() {
		super();
	}

	public ArticleHtml(String articleid, String articlehtml) {
		super();
		this.articleid = articleid;
		this.articlehtml = articlehtml;
	}

	public String getArticleid() {
		return articleid;
	}

	public void setArticleid(String articleid) {
		this.articleid = articleid;
	}

	public String getArticlehtml() {
		return articlehtml;
	}

	public void setArticlehtml(String articlehtml) {
		this.articlehtml = articlehtml;
	}

	@Override
	public String toString() {
		return "ArticleHtml [articleid=" + articleid + ", articlehtml=" + articlehtml + "]";
	}
}
