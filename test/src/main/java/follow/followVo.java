package follow;

public class followVo {
	
	private String userId;
	private String followedId;
	
	public followVo() {
		
	}
	
	public followVo(String userId, String followedId) {
		super();
		this.userId = userId;
		this.followedId = followedId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getFollowedId() {
		return followedId;
	}

	public void setFollowedId(String followedId) {
		this.followedId = followedId;
	} 
	
	

}
