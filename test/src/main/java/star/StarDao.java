package star;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;

public class StarDao {
	private DBConnect DBConn;

	public StarDao() {
		DBConn = DBConnect.getInstance();
	}

	// 1. 추가
	public void insert(StarVo vo) {
		Connection conn = DBConn.conn();
		String sql = "insert into star values(seq_star.nextVal, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUserId());
			pstmt.setInt(2, vo.getMovieNum());
			pstmt.setInt(3, vo.getStar());

			int check = pstmt.executeUpdate();
			System.out.println(check + "줄 star insert");
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

	// 2. select
	// 2-1. 특정 아이디의 StarVo 불러오기
	public ArrayList<StarVo> starList(String userId) {
		Connection conn = DBConn.conn();
		ArrayList<StarVo> list = new ArrayList<>();
		String sql = "select * from star where userId=? order by num desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				list.add(new StarVo(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4)));
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
		return list;
	}


	// 2-3. 특정 영화의 평균 별점 불러오기
	public double avgStar(int movieNum) {
		double avg = 0;
		Connection conn = DBConn.conn();
		String sql = "select avg(star) from star where movieNum=? group by movieNum";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, movieNum);

			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				avg=rs.getDouble(1);
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
		return avg;
	}


	// 3-2. 특정 영화의 별점 수정하기
	public void updateStar(StarVo vo) {
		Connection conn = DBConn.conn();
		String sql = "update star set star=? where userId=? and movieNum=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getStar());
			pstmt.setString(2, vo.getUserId());
			pstmt.setInt(3, vo.getMovieNum());

			int check = pstmt.executeUpdate();
			System.out.println(check + "줄 star 수정 update");
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
	
	//별 몇점 주었나? 사용자가 영화에 별을 몇점을 주었나? 
	public int getStarNum (String userId, int movieNum) {
		
		Connection conn = DBConn.conn();
		String sql = "select star from star where userId=? and movieNum=?";
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userId);
			pstmt.setInt(2,movieNum);
			
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				return rs.getInt(1); 
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
		return 0;
	}
	
	//수정을 위해서 별을 찍었니 안찍었니 확인하기 위한 것 
	public boolean select (StarVo vo) {
		
		Connection conn = DBConn.conn();
		String sql = "select * from star where userId=? and movieNum=?";
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,vo.getUserId());
			pstmt.setInt(2,vo.getMovieNum());
			
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
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
		
}
