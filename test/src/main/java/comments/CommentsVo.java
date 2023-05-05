package comments;

import java.sql.Date;

public class CommentsVo {

	private String userId = ""; // fk, references member
	private String userName = "";
	
	private int num;			// pk
	private int movieNum;	// 영화 정보 api 로부터 받아온 아이디값		
	private String comments;	// varString2(4000)
	private Date w_Date;		// DB 타입 : date
	private int rate = 0;	// 좋아요 체크 (insert 시 무조건 0 값으로 삽입)
	private String spoiler = "1";	// 스포일러 댓글인지 아닌지 구분
	
	
	
	public CommentsVo() {
		super();
	}



	public CommentsVo(String userId, String userName, int num, int movieNum, String comments, Date w_Date, int rate,
			String spoiler) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.num = num;
		this.movieNum = movieNum;
		this.comments = comments;
		this.w_Date = w_Date;
		this.rate = rate;
		this.spoiler = spoiler;
	}

	public CommentsVo(int movieNum, String userId, String comments, String spoiler) {
		super();
		this.userId = userId;
		this.movieNum = movieNum;
		this.comments = comments;
		this.spoiler = spoiler;
	}

	public CommentsVo(String comments, String spoiler, String userId,int movieNum) {
		super();
		
		this.comments = comments;
		this.spoiler = spoiler;
		this.userId = userId;
		this.movieNum = movieNum;
	}
	
	public CommentsVo(int movieNum,String userId) {
		super();
		this.movieNum = movieNum;
		this.userId = userId;
		
	}
	
	public CommentsVo(String userId,int movieNum) {
		super();
		this.userId = userId;
		this.movieNum = movieNum;
		}

	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}



	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
	}



	public int getNum() {
		return num;
	}



	public void setNum(int num) {
		this.num = num;
	}



	public int getMovieNum() {
		return movieNum;
	}



	public void setMovieNum(int movieNum) {
		this.movieNum = movieNum;
	}



	public String getComments() {
		return comments;
	}



	public void setComments(String comments) {
		this.comments = comments;
	}



	public Date getW_Date() {
		return w_Date;
	}



	public void setW_Date(Date w_Date) {
		this.w_Date = w_Date;
	}



	public int getRate() {
		return rate;
	}



	public void setRate(int rate) {
		this.rate = rate;
	}



	public String getSpoiler() {
		return spoiler;
	}



	public void setSpoiler(String spoiler) {
		this.spoiler = spoiler;
	}



	@Override
	public String toString() {
		return "CommentsVo [userId=" + userId + ", userName=" + userName + ", num=" + num + ", movieNum=" + movieNum
				+ ", comments=" + comments + ", w_Date=" + w_Date + ", rate=" + rate + ", spoiler=" + spoiler + "]";
	}

	

}