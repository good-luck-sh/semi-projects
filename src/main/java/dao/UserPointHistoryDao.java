
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.UserDto;
import vo.UserPointHistory;
import vo.UserTable;

import static utils.ConnectionUtil.*;

public class UserPointHistoryDao {
	
	
	private static UserPointHistoryDao self = new UserPointHistoryDao();
	private UserPointHistoryDao() {}
	public static UserPointHistoryDao getInstance() {
		return self;
	}
	
	/**
	 * 포인트히스토리의 총 개수를 구한다.
	 * @return 포인트히스토리 개수
	 * @throws SQLException
	 */
	public int getTotalRecord() throws SQLException {
		int countHistory = 0;
		String sql = "select count(*) cnt "
					+ "from user_point_history ";
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		countHistory = rs.getInt("cnt");
		
		rs.close();
		pstmt.close();
		connection.close();
				
		return countHistory;
	}
	
	
	
	public List<UserPointHistory> getAllPointHistoryByNo(int userNo, int begin, int end) throws SQLException {
		String sql = "select history_no, user_no, history_point_check, history_reason, history_create_date, "
					+ "history_total_point "
					+ "from (select row_number() over (order by history_create_date desc) rn, "
					+ "				history_no, user_no, history_point_check, history_reason, history_create_date, "
					+ "				history_total_point "
					+ "		from user_point_history "
					+ "where user_no = ?) "
					+ "where rn >= ? and rn <= ? ";
		List<UserPointHistory> historys = new ArrayList<>();
		 Connection connection = getConnection();
	     PreparedStatement pstmt = connection.prepareStatement(sql);
	     pstmt.setInt(1, userNo);
	     pstmt.setInt(2, begin);
	     pstmt.setInt(3, end);
	     ResultSet rs = pstmt.executeQuery();
	      
	     while(rs.next()) {
	    	 UserPointHistory history = new UserPointHistory();
	    	 history.setHistoryNo(rs.getInt("history_no"));
	    	 history.setHistoryPointCheck(rs.getString("history_point_check"));
	    	 history.setHistoryReason(rs.getString("history_reason"));
	    	 history.setHistoryCreateDate(rs.getDate("history_create_date"));
	    	 history.setHistoryTotalPoint(rs.getInt("history_total_point"));
	    	 
	    	 UserTable user = new UserTable();
	    	 user.setUserNo(rs.getInt("user_no"));
	    	 
	    	 history.setUserTable(user);
	    	 
	    	 historys.add(history);
	     }
		
	     rs.close();
		 pstmt.close();
		 connection.close();
		    
		 return historys;
	}
	
	

}
