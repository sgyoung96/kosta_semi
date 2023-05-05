package wish;

import java.util.ArrayList;

public class wishService {

	private wishDao dao;
	
	public wishService() {
		dao = new wishDao(); 
	}

	//찜 추가
	public void addwish(wishVo vo) {
		dao.insert(vo);
	}
	
	//찜 삭제
	public void delwish(String userId, int movieNum) {
		dao.delwish(userId, movieNum);
	}
	
	//찜 리스트 뽑기 
	public ArrayList<wishVo> getWishList(String userId) {
		return dao.WishList(userId);
	}

	//찜 했니 안했
	  public boolean checkwish(wishVo vo) {
	      return dao.select(vo);
	   }

}

