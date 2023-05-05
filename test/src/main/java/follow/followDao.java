package follow;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;

public class followDao {

	private DBConnect dbconn;
	
	public followDao() {
		dbconn = DBConnect.getInstance();
	}
	
	// 팔로우 했을 때 데이터베이스에 넣기 
	public void insert (followVo vo) {
		Connection conn = dbconn.conn();
		String sql = "insert into follow values(?, ?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getUserId());
			pstmt.setString(2, vo.getFollowedId());
			
			pstmt.executeUpdate();
			
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
	
	public boolean select (followVo vo) {
		
		Connection conn = dbconn.conn();
		String sql ="select * from follow where userId=? and followedId=?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getUserId());
			pstmt.setString(2, vo.getFollowedId());
			
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
	
	//팔로우 취소 할 때 데이터베이스에서 삭제하기 
	public void delete (followVo vo) {
		
		Connection conn = dbconn.conn();
		String sql ="delete from follow where userId=? and followedId=?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getUserId());
			pstmt.setString(2, vo.getFollowedId());
			
			pstmt.executeUpdate();
			
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
	
	// 특정 아이디가 팔로워한 아이디를 보여줘
	public ArrayList<followVo> selFid (String userId) {
		
		ArrayList<followVo> list = new ArrayList<>(); 
		Connection conn = dbconn.conn();
		String sql = "select * from follow where userId=? and followedid is not null"; 
		
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			ResultSet rs =  pstmt.executeQuery();; 
			
			while (rs.next()) {
				list.add(new followVo (rs.getString(1), rs.getString(2))); 
			}
			
			pstmt.executeUpdate();
			
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
		
	//특정 아이디의 팔로잉 수를 보여줘 
	public int countU (String userId) {
		Connection conn = dbconn.conn();
		String sql = "select count(followedId) from follow where userId=?";
		int folnum=0;
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			ResultSet rs =  pstmt.executeQuery();
			
			if (rs.next()) {
				 folnum = rs.getInt(1);
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
		return folnum;
	}
	
	// 특정아이디의 팔로워수
	public int countF (String userId) {
		Connection conn = dbconn.conn();
		String sql = "select count(userId) from follow where followedId=?";
		int folnum=0;
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			ResultSet rs =  pstmt.executeQuery();
			
			if (rs.next()) {
				 folnum = rs.getInt(1);
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
		return folnum;
	}
	
	

}
