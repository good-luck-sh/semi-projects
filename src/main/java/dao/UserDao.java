package dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import static utils.ConnectionUtil.*;
import vo.UserTable;

public class UserDao {
	
	private static UserDao self = new UserDao();
	private UserDao() {}
	public static UserDao getInstance() {
		return self;
	}
	
	
	/**
	 * 회원탈퇴기능
	 * @param userNo 유저번호
	 * @throws SQLException
	 */
	public void deleteUser (int userNo) throws SQLException {
		String sql = "delete from user_table "
					+ "where user_no = ? ";
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, userNo);
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
		
		
	}
	
	
	/**
	 * 유저 정보 업데이트하기
	 * @param userTable 유저
	 * @throws SQLException
	 */
	public void updateUser(UserTable userTable) throws SQLException {
		
		String sql = "update into user_table "
					+ "set "
					+ "user_password = ? "
					+ "user_address = ? ";
		
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setString(1, userTable.getUserPassword());
		pstmt.setString(2, userTable.getUserAddress());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
		
		
		
	}
	

	/**
	    * 유저 번호를 통해 모든 유저 정보를 불러온다
	    * @param userNo 유저번호
	    * @throws SQLException
	    */
	public UserTable getUserAllInfoByNo(int userNo) throws SQLException {
	    
		 String sql = "select user_no, user_id, user_password, user_name, user_age, user_gender, manager_check, "
		               + " user_address, user_order_point, user_degree, user_created_date, user_delete_check  "
		               + " from user_table "
		               + " where user_no = ? ";
		 
		 UserTable user = null;
		      
		 Connection connection = getConnection();
		 PreparedStatement pstmt = connection.prepareStatement(sql);
		 pstmt.setInt(1, userNo);
		 ResultSet rs = pstmt.executeQuery();
		      
		 if(rs.next()) {
			user = new UserTable();
		    user.setUserNo(rs.getInt("user_no"));
		    user.setUserId(rs.getString("user_id"));
		    user.setUserPassword(rs.getString("user_password"));
		    user.setUserName(rs.getString("user_name"));
		    user.setUserAge(rs.getInt("user_age"));
		    user.setUserGender(rs.getString("user_gender"));
		    user.setUserAddress(rs.getString("user_address"));
		    user.setUserOrderPoint(rs.getInt("user_order_point"));
		    user.setUserDegree(rs.getString("user_degree"));
		    user.setUserCreateDate(rs.getDate("user_created_date"));
		    user.setUserDeleteCheck(rs.getString("user_delete_check"));
		    user.setManagerCheck(rs.getString("manager_check"));
		    
		 	}
		      
		  rs.close();
		  pstmt.close();
		  connection.close();
	      
	      return user;
	}
}
