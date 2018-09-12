package VO;

public class ChangeG {
	private int score;
	private int id;
	
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public ChangeG(int score, int id) {
		super();
		this.score = score;
		this.id = id;
	}
	@Override
	public String toString() {
		return "ChangeG [score=" + score + ", id=" + id + "]";
	}
	
	public ChangeG() {
		
	}
	
}
