package comments;

import java.util.ArrayList;

public class CommentsService {
	
	CommentsDao dao;
	
	public CommentsService() {
		dao = new CommentsDao();
	}
	
	/**
	 * 코멘트 달기
	 * @param vo
	 */
	public void insert(CommentsVo vo) {
		dao.insert(vo);
	}
	
	/**
	 * 내가 쓴 모든 코멘트 보여주기
	 * @param userId
	 * @return
	 */
	public ArrayList<CommentsVo> showMyComments(String userId) {
		return dao.showMyComments(userId);
	}
	
	/**
	 * 특정 영화에 대해 내가 쓴 코멘트 보기
	 * @param movieId
	 * @return
	 */
	public CommentsVo showMyComment(double movieId, String userId) {
		return dao.showMyComment(movieId, userId);
	}
	
	/**
	 * 한 영화에 대한 모든 코멘트를 좋아요 기준으로 보여주기
	 * @param movieId
	 * @return
	 */
	public ArrayList<CommentsVo> showAllCommentsByRate(int movieId, String userId) {
		return dao.showAllCommentsByRate(movieId, userId);
	}
	
	/**
	 * 한 영화에 대한 모든 코멘트를 날짜 기준으로 보여주기
	 * @param movieId
	 * @return
	 */
	public ArrayList<CommentsVo> showAllCommentsByDate(int movieId, String userId) {
		return dao.showAllCommentsByDate(movieId, userId);
	}
	
	/**
	 * 한 영화에 대한 모든 코멘트를 스포일러를 기준으로 보여주기
	 * @param movieId
	 * @return
	 */
	public ArrayList<CommentsVo> showAllCommentsBySpoiler(int movieId, String userId) {
		return dao.showAllCommentsBySpoiler(movieId, userId);
	}
	
	/**
	 * 코멘트 수정하기
	 * @param vo
	 */
	public CommentsVo update(CommentsVo vo) {
		return dao.update(vo);
	}
	
	/**
	 * 코멘트 삭제하기
	 * @param vo
	 */
	public void delete(CommentsVo vo) {
		dao.delete(vo);
	}
	
	/**
	 * 좋아요 추가
	 * @param vo
	 */
	public CommentsVo setRate(CommentsVo vo) {
		return dao.setRate(vo);
	}
	
	public CommentsVo addCommentDetail(CommentsVo vo) {
		return dao.addCommentDetail(vo);
	}
	
	  public boolean checkcomment(CommentsVo vo) {
	      return dao.select(vo);
	   }
	  
	  public  String getComments(String userId, int movieNum) {
		  return dao.getComments(userId, movieNum);
	  }
	  
	  public void updateComments(CommentsVo vo) {
		  dao.updateStar(vo);
	  }
}