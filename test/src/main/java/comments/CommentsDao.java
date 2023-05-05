package comments;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;
import star.StarVo;
import wish.wishVo;

public class CommentsDao {

	private DBConnect dbconn;

	public CommentsDao() {
		dbconn = DBConnect.getInstance();
	}

	/**
	 * 코멘트 남기기
	 * 
	 * @param vo
	 */
	public void insert(CommentsVo vo) {
		Connection conn = dbconn.conn();
		String sql = "insert into comments(NUM, MOVIENUM, USERID, COMMENTS, W_DATE, RATE, SPOILER) values (seq_comments.nextVal, ?, ?, ?, sysdate, 0,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, vo.getMovieNum());
			pstmt.setString(2, vo.getUserId());
			pstmt.setString(3, vo.getComments());
			pstmt.setString(4, vo.getSpoiler());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 로그인한 계정이 남긴 전체 코멘트 리스트 보여주기
	 * 
	 * @param userId
	 * @return
	 */
	public ArrayList<CommentsVo> showMyComments(String userId) {
		ArrayList<CommentsVo> commentsList = new ArrayList<CommentsVo>();
		Connection conn = dbconn.conn();
		String sql = "SELECT A.USERID, A.NICKNAME, B.NUM, B.MOVIENUM, B.COMMENTS, B.W_DATE, B.RATE, B.SPOILER FROM MEMBER A, COMMENTS B WHERE A.USERID = B.USERID AND B.USERID = ? ORDER BY B.W_DATE DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			ResultSet rs = pstmt.executeQuery();// select 실행
			while (rs.next()) {// 첫 줄로 이동하여 데이터 있는지 확인
				commentsList.add(new CommentsVo(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getInt(4),
						rs.getString(5), rs.getDate(6), rs.getInt(7), rs.getString(8)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return commentsList;
	}

	/**
	 * 특정 영화에 대해 내가 쓴 코멘트 보기 - 스포일러 컬럼에 0이 조회될 경우, 스포일러임 -> 가리기 필요
	 * 
	 * @param movieId
	 * @return
	 */
	public CommentsVo showMyComment(double movieId, String userId) {
		CommentsVo vo = null;
		Connection conn = dbconn.conn();
		String sql = "SELECT A.USERID, A.NICKNAME, B.NUM, B.MOVIENUM, B.COMMENTS, B.W_DATE, B.RATE, B.SPOILER FROM MEMBER A, COMMENTS B WHERE A.USERID = B.USERID AND B.MOVIENUM = ? AND B.USERID = ? ORDER BY B.W_DATE DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setDouble(1, movieId);
			pstmt.setString(2, userId);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				vo = new CommentsVo(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5),
						rs.getDate(6), rs.getInt(7), rs.getString(8));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return vo;
	}

	/**
	 * 특정 영화에 대한 모든 코멘트를 찜목록 저장 수(좋아요 수)를 기준으로 정렬하여 보여주기 (스포일러 제외, 1: 스포일러 아님, 0:
	 * 스포일러)
	 * 
	 * @param userId
	 * @return
	 */
	public ArrayList<CommentsVo> showAllCommentsByRate(int movieId, String userId) {
		ArrayList<CommentsVo> commentsList = new ArrayList<CommentsVo>();
		Connection conn = dbconn.conn();
		String sql = "SELECT A.USERID, A.NICKNAME, B.NUM, B.MOVIENUM, B.COMMENTS, B.W_DATE, B.RATE, B.SPOILER FROM MEMBER A, COMMENTS B WHERE A.USERID = B.USERID AND B.SPOILER = 1 AND B.MOVIENUM = ? AND B.USERID NOT IN (?) ORDER BY B.RATE DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, movieId);
			pstmt.setString(2, userId);
			ResultSet rs = pstmt.executeQuery();// select 실행
			while (rs.next()) {// 첫 줄로 이동하여 데이터 있는지 확인
				commentsList.add(new CommentsVo(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getInt(4),
						rs.getString(5), rs.getDate(6), rs.getInt(7), rs.getString(8)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return commentsList;
	}

	/**
	 * 특정 영화에 대한 모든 코멘트를 날짜를 기준으로 정렬하여 보여주기 (스포일러 제외, 1: 스포일러 아님, 0: 스포일러)
	 * 
	 * @param movieId
	 * @return
	 */
	public ArrayList<CommentsVo> showAllCommentsByDate(int movieId, String userId) {

		ArrayList<CommentsVo> commentsList = new ArrayList<CommentsVo>();
		CommentsVo vo = null;
		Connection conn = dbconn.conn();

		String sql = "SELECT A.USERID, A.NICKNAME, B.NUM, B.MOVIENUM, B.COMMENTS, B.W_DATE, B.RATE, B.SPOILER FROM MEMBER A, COMMENTS B WHERE A.USERID = B.USERID AND B.SPOILER = 1 AND B.MOVIENUM = ? AND B.USERID NOT IN (?) ORDER BY B.W_DATE DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, movieId);
			pstmt.setString(2, userId);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				commentsList.add(new CommentsVo(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getInt(4),
						rs.getString(5), rs.getDate(6), rs.getInt(7), rs.getString(8)));
			}

		} catch (SQLException e) {

			e.printStackTrace();

		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return commentsList;
	}

	/**
	 * 특정 영화에 대한 스포일러가 있는 코멘트들만 날짜를 기준으로 정렬하여 보여주기 (스포일러 제외, 1: 스포일러 아님, 0: 스포일러)
	 * 
	 * @param movieId
	 * @return
	 */
	public ArrayList<CommentsVo> showAllCommentsBySpoiler(int movieId, String userId) {

		ArrayList<CommentsVo> commentsList = new ArrayList<CommentsVo>();
		CommentsVo vo = null;
		Connection conn = dbconn.conn();

		String sql = "SELECT A.USERID, A.NICKNAME, B.NUM, B.MOVIENUM, B.COMMENTS, B.W_DATE, B.RATE, B.SPOILER FROM MEMBER A, COMMENTS B WHERE A.USERID = B.USERID AND B.SPOILER = 0 AND B.MOVIENUM = ? AND B.USERID NOT IN (?) ORDER BY B.W_DATE DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, movieId);
			pstmt.setString(2, userId);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				commentsList.add(new CommentsVo(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getInt(4),
						rs.getString(5), rs.getDate(6), rs.getInt(7), rs.getString(8)));
			}

		} catch (SQLException e) {

			e.printStackTrace();

		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return commentsList;
	}

	/**
	 * 내가 남긴 특정 영화에 대한 코멘트 수정 (spoiler 0: 스포일러 있음, 1: 스포일러 없음)
	 * 
	 * @param vo
	 */
	public CommentsVo update(CommentsVo vo) {
		Connection conn = dbconn.conn();
		CommentsVo vo2 = new CommentsVo();
		String sql = "update comments set comments=?, spoiler = ? where userId=? and movieNum=? and num=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, vo.getComments());
			pstmt.setString(2, vo.getSpoiler());
			pstmt.setString(3, vo.getUserId());
			pstmt.setInt(4, vo.getMovieNum());
			pstmt.setInt(5, vo.getNum());

			pstmt.executeUpdate();

			String selSql = "select A.USERID, A.NICKNAME, B.NUM, B.MOVIENUM, B.COMMENTS, B.W_DATE, B.RATE, B.SPOILER from member A, comments B where B.userId=? and B.movieNum=? and num=?";
			pstmt = conn.prepareStatement(selSql);
			pstmt.setString(1, vo.getUserId());
			pstmt.setInt(2, vo.getMovieNum());
			pstmt.setInt(3, vo.getNum());

			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				vo2.setUserId(rs.getString(1));
				vo2.setUserName(rs.getString(2));
				vo2.setNum(rs.getInt(3));
				vo2.setMovieNum(rs.getInt(4));
				vo2.setComments(rs.getString(5));
				vo2.setW_Date(rs.getDate(6));
				vo2.setRate(rs.getInt(7));
				vo2.setSpoiler(rs.getString(8));
			}
			return vo2;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return vo2;
	}

	/**
	 * 특정 영화에 대해 내가 작성한 코멘트 삭제
	 * 
	 * @param vo
	 */
	public void delete(CommentsVo vo) {
		Connection conn = dbconn.conn();
		String sql = "delete from comments where movieNum=? and userId=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, vo.getMovieNum());
			pstmt.setString(2, vo.getUserId());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 좋아요
	 * 
	 * @param vo
	 * @return
	 */
	public CommentsVo setRate(CommentsVo vo) {
		Connection conn = dbconn.conn();
		String sql = "UPDATE COMMENTS SET rate = (SELECT RATE FROM COMMENTS WHERE USERID = ? AND MOVIENUM = ?) + 1 WHERE USERID = ? AND MOVIENUM = ?";
		CommentsVo result = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, vo.getUserId());
			pstmt.setInt(2, vo.getMovieNum());
			pstmt.setString(3, vo.getUserId());
			pstmt.setInt(4, vo.getMovieNum());
			// pstmt.setInt(5, vo.getNum());

			pstmt.executeUpdate();

			pstmt = conn.prepareStatement(
					"SELECT A.USERID, A.NICKNAME, B.NUM, B.MOVIENUM, B.COMMENTS, B.W_DATE, B.RATE, B.SPOILER FROM MEMBER A, COMMENTS B WHERE A.USERID = B.USERID AND B.MOVIENUM = ? AND B.USERID = ?");
			pstmt.setInt(1, vo.getMovieNum());
			pstmt.setString(2, vo.getUserId());

			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				result = new CommentsVo(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5),
						rs.getDate(6), rs.getInt(7), rs.getString(8));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println("dao > " + result.toString());
		return result;
	}

	public CommentsVo addCommentDetail(CommentsVo vo) {
		Connection conn = dbconn.conn();
		CommentsVo vo2 = new CommentsVo();
		String sql = "insert into comments(NUM, MOVIENUM, USERID, COMMENTS, W_DATE, RATE, SPOILER) values (seq_comments.nextVal, ?, ?, ?, sysdate, ?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, vo.getMovieNum());
			pstmt.setString(2, vo.getUserId());
			pstmt.setString(3, vo.getComments());
			pstmt.setInt(4, vo.getRate());
			pstmt.setString(5, vo.getSpoiler());

			pstmt.executeUpdate();

			String selSql = "select A.USERID, A.NICKNAME, B.NUM, B.MOVIENUM, B.COMMENTS, B.W_DATE, B.RATE, B.SPOILER from member A, comments B where B.userId=? and B.movieNum=?";
			pstmt = conn.prepareStatement(selSql);
			pstmt.setString(1, vo.getUserId());
			pstmt.setInt(2, vo.getMovieNum());
			// pstmt.setInt(3, vo.getNum());

			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				vo2.setUserId(rs.getString(1));
				vo2.setUserName(rs.getString(2));
				vo2.setNum(rs.getInt(3));
				vo2.setMovieNum(rs.getInt(4));
				vo2.setComments(rs.getString(5));
				vo2.setW_Date(rs.getDate(6));
				vo2.setRate(rs.getInt(7));
				vo2.setSpoiler(rs.getString(8));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return vo2;
	}

	public boolean select(CommentsVo vo) {

		Connection conn = dbconn.conn();
		String sql = "select * from comments where userId=? and movieNum=?";

		try {
	         PreparedStatement pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setString(1, vo.getUserId());
	         pstmt.setInt(2, vo.getMovieNum());
	         
	         ResultSet rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	            return true;
	         }

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return false;
	}

	//코멘트 내용 뭐썻나? 
	public String getComments(String userId, int movieNum) {

		Connection conn = dbconn.conn();
		String sql = "select comments from comments where userId=? and movieNum=?";
		try {

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, movieNum);

			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
	
	public void updateStar(CommentsVo vo) {
		Connection conn = dbconn.conn();
		String sql =  "update comments set comments=?, spoiler = ? where userId=? and movieNum=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, vo.getComments());
			pstmt.setString(2, vo.getSpoiler());
			pstmt.setString(3, vo.getUserId());
			pstmt.setInt(4, vo.getMovieNum());

			int check = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	
}
