package com.creamyfever.wow.vo;

public class ValueForBubble {
	private double ave; //평균
	private int countByCont; //대륙별 기사 수
	
	public double getAve() {
		return ave;
	}
	public void setAve(double ave) {
		this.ave = ave;
	}
	public int getCountByCont() {
		return countByCont;
	}
	public void setCountByCont(int countByCont) {
		this.countByCont = countByCont;
	}
	public ValueForBubble(double ave, int countByCont) {
		super();
		this.ave = ave;
		this.countByCont = countByCont;
	}
	public ValueForBubble() {
		super();
	}
	@Override
	public String toString() {
		return "ValueForBubble [ave=" + ave + ", countByCont=" + countByCont + "]";
	}
}
