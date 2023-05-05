package wish;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;

public class wishDao {

		private DBConnect dbconn;
		public wishDao() {		
			dbconn = DBConnect.getInstance();
		}
		
		
		public void insert (wishVo vo) {
			Connection conn = dbconn.conn();
			String sql = "insert into wish values(seq_wish_num.nextVal,?, ?)";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getUserId());
				pstmt.setInt(2, vo.getMovieNum());
				
				pstmt.executeUpdate();
		}catch (SQLException e) {
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
		
		
		//찜 취소 하면 
		public void delwish (String userId, int movieNum) {
			
			Connection conn = dbconn.conn();
			
			String sql = "delete from wish where userid=? and movieNum=?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userId);
				pstmt.setInt(2,movieNum);

				int check=pstmt.executeUpdate();

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
		
		//아이디로 찜 목록 뿌리기 
		public ArrayList<wishVo> WishList(String userId){
			Connection conn = dbconn.conn();
			ArrayList<wishVo> list = new ArrayList<>();
			String sql = "select * from wish where userid=? order by num desc";
			
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,userId);
				
				ResultSet rs =pstmt.executeQuery();
				
				while(rs.next()) {
					
					list.add(new wishVo(rs.getInt(1),rs.getString(2), rs.getInt(3)));
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
		
		//찜 했나 안했나?
		public boolean select (wishVo vo) {
		      
		      Connection conn = dbconn.conn();
		      String sql ="select * from wish where userId=? and movieNum=?";
		      
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
		

}
