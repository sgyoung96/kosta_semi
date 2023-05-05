package member;

public class MemberVo {
	private String userId;
	private String password;
	private String nickname;
	private String introLine;
	
	public MemberVo() {}
	
	public MemberVo(String userId, String password, String nickname, String introLine) {
		super();
		this.userId = userId;
		this.password = password;
		this.nickname = nickname;
		this.introLine = introLine;
	}

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	public String getIntroLine() {
		return introLine;
	}

	public void setIntroLine(String introLine) {
		this.introLine = introLine;
	}

	@Override
	public String toString() {
		return "MemberVo [userId=" + userId + ", password=" + password + ", nickname=" + nickname + ", introLine="
				+ introLine + "]";
	}
}
