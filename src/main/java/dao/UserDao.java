package dao;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static utils.ConnectionUtil.*;
import vo.UserTable;

public class UserDao {
	
	private static UserDao self = new UserDao();
	private UserDao() {}
	public static UserDao getInstance() {
		return self;
	}	
	
	/**
	 * 회원탈퇴 기능
	 * @param userNo 유저 번호
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
		String sql = "update user_table "
					+ "set "
					+ "	user_password = ?, "
					+ " user_address = ? "
					+ "where user_no = ? ";
		
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setString(1, userTable.getUserPassword());
		pstmt.setString(2, userTable.getUserAddress());
		pstmt.setInt(3, userTable.getUserNo());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
		
		
		
	}
	
	/**
	 * 해당하는 사용자의 번호를 입력받아 사용자의 매니저를 설정하는 부분이다. 
	 * @param userTable 해당하는 사용자 객체
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	public void updateUserByManagerCheck(UserTable userTable) throws SQLException {
		String sql = "update user_table "
				+ "set "
				+ "	manager_check = ? "
				+ "where user_no = ? ";
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setString(1, userTable.getManagerCheck());
		pstmt.setInt(2, userTable.getUserNo());
		
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
	
	/**
	 * 사용자 아이디에 해당하는 사용자 정보를 반환
	 * @param id 사용자 아이디
	 * @return 
	 * @throws SQLException
	 */
	public UserTable getUserById(String id) throws SQLException {
		String sql = "select * from user_table where user_id = ? ";
		UserTable user = null;
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
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
			user.setManagerCheck(rs.getString("manager_check"));
			user.setUserDeleteCheck(rs.getString("user_delete_check"));
		}
		rs.close();
		pstmt.close();
		connection.close();
			
		return user;
	}
	
	/**
	 * 사용자정보 테이블에 저장
	 * @param usertable
	 * @throws SQLException
	 */
	public void insertUser(UserTable usertable) throws SQLException {
		String sql = "insert into user_table(user_no, user_id, user_password, user_name, user_age, user_gender, user_address) "
				   + "values(user_no.nextval, ?, ?, ?, ?, ?, ?)";
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setString(1, usertable.getUserId());
		pstmt.setString(2, usertable.getUserPassword());
		pstmt.setString(3, usertable.getUserName());
		pstmt.setInt(4, usertable.getUserAge());
		pstmt.setString(5, usertable.getUserGender());
		pstmt.setString(6, usertable.getUserAddress());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
 	}
	
	/**
	 * 등록되어 있는 모든 사용자의 객체를 출력한다. 
	 * @return 등록되어 있는 사용자의 객체 
	 * @throws SQLException 
	 */
	public List<UserTable> getAllUser() throws SQLException {
		List<UserTable> users = new ArrayList<>();
		String sql ="select user_no, user_id, user_password, user_name, user_age, user_gender, user_address, "
				+ " user_order_point, user_degree, user_created_date, manager_check, user_delete_check "
				+ " from user_table ";
		 Connection connection = getConnection();
		 PreparedStatement pstmt = connection.prepareStatement(sql);

		 ResultSet rs = pstmt.executeQuery();
		      
		 while(rs.next()) {
			UserTable user = new UserTable();
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
		    users.add(user);
		 	}
		      
		  rs.close();
		  pstmt.close();
		  connection.close();
	      
	      return users;

	}
	
	
}
