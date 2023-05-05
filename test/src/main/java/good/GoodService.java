package good;

public class GoodService {
	private GoodDao dao;
	
	public GoodService() {
		dao = new GoodDao();
	}
	
	//좋아요 추가
	public void addGood(GoodVo vo) {
		dao.insert(vo);
	}
	
	//삭제(id 기준)
	public void delNum(String userId) {
		dao.delete(userId);
	}
	
	//삭제(글 번호 기준)
	public void delUserId(int num) {
		dao.delete2(num);
	}

}
