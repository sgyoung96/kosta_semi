package star;

public class StarVo {
	private int num; 
	private String userId;
	private int movieNum;
	private int star;
	
	public StarVo() {
		
	}

	public StarVo(int num, String userId, int movieNum, int star) {
		super();
		this.num = num;
		this.userId = userId;
		this.movieNum = movieNum;
		this.star = star;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getMovieNum() {
		return movieNum;
	}

	public void setMovieNum(int movieNum) {
		this.movieNum = movieNum;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	@Override
	public String toString() {
		return "StarVo [num=" + num + ", userId=" + userId + ", movieNum=" + movieNum + ", star=" + star + "]";
	}

	
	
}
