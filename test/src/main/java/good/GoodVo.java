package good;

public class GoodVo {
	private int num;
	private String userId;

	
	public GoodVo() {}

	public GoodVo(int num, String userId) {
		super();
		this.num = num;
		this.userId = userId;

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


	@Override
	public String toString() {
		return "GoodVo [num=" + num + ", userId=" + userId + "]";
	}
	
	

}
