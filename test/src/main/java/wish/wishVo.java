package wish;

public class wishVo {

	private int num;
	private String userId;
	private int movieNum;

	public wishVo() {

	}

	public wishVo(int num, String userId, int movieNum) {
		super();
		this.num = num;
		this.userId = userId;
		this.movieNum = movieNum;
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

	@Override
	public String toString() {
		return "wishVo [num=" + num + ", userId=" + userId + ", movieNum=" + movieNum + "]";
	}

}
