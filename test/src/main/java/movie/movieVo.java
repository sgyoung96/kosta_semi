package movie;

public class movieVo {
	private String id; //영화id
	private String poster_path; //포스터주소
	private String title; //제목
	private String video_path; //예고편주소
	private String overview; //개요
	private String release_date;
	

	public movieVo() {
		
	}
	
	   public movieVo(String video_path) {
		   super();
		      this.video_path = video_path;
	   }
	   

	public movieVo(String id, String poster_path, String title, String video_path) {
		super();
		this.id = id;
		this.poster_path = poster_path;
		this.title = title;
		this.video_path = video_path;
	}


	public movieVo(String id, String poster_path, String title) {
		super();
		this.id = id;
		this.poster_path = poster_path;
		this.title = title;
	}
	
	public movieVo(String id, String video_path) {
		super();
		this.id = id;
		this.video_path = video_path;
	}
	
	public movieVo(String id, String poster_path, String title, String overview, String release_date) {
		super();
		this.id = id;
		this.poster_path = poster_path;
		this.title = title;
		this.overview = overview;
		this.release_date = release_date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPoster_path() {
		return poster_path;
	}

	public void setPoster_path(String poster_path) {
		this.poster_path = poster_path;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getVideo_path() {
		return video_path;
	}

	public void setVideo_path(String video_path) {
		this.video_path = video_path;
	}

	public String getOverview() {
		return overview;
	}

	public void setOverview(String overview) {
		this.overview = overview;
	}

	public String getRelease_date() {
		return release_date;
	}

	public void setRelease_date(String release_date) {
		this.release_date = release_date;
	}

	@Override
	public String toString() {
		return "movieVo [id=" + id + ", poster_path=" + poster_path + ", title=" + title + ", video_path=" + video_path
				+ ", overview=" + overview + ", release_date=" + release_date + "]";
	}

	
}
