package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.UserDto;

import static utils.ConnectionUtil.*;

public class UserPointHistoryDao {
	
	
	private static UserPointHistoryDao self = new UserPointHistoryDao();
	private UserPointHistoryDao() {}
	public static UserPointHistoryDao getInstance() {
		return self;
	}
	
	

	/**
	 * 유저 번호를 통해 포인트 적립/차감 히스토리 가져오기
	 * @param userNo 유저 번호
	 * @return 포인트 히스토리
	 * @throws SQLException
	 */
	public List<UserDto> getAllPointHistoryByNo(int userNo) throws SQLException {
		String sql = "select H.hisotry_no, H.user_no, H.history_point_check, H.history_reason, H.history_create_date, "
	               + "H.history_total_point, O.order_total_point, O.order_use_point, O.order_date "
	               + "from UserPointHistory H, UserTable U, Orders O "
	               + "where H.user_no = U.user_no "
	               + "and U.user_no = O.user_no(+) "
	               + "and H.user_no = ? "
	               + "order by O.order_date ";
	      
	      List<UserDto> historys = new ArrayList<>();
	      Connection connection = getConnection();
	      PreparedStatement pstmt = connection.prepareStatement(sql);
	      pstmt.setInt(1, userNo);
	      ResultSet rs = pstmt.executeQuery();
	      
	      while(rs.next()) {
	    	 UserDto user = new UserDto();
	    	 user.setHistoryNo(rs.getInt("hisotry_no"));
	    	 user.setUserNo(rs.getInt("user_no"));
	    	 user.setHistoryPointCheck(rs.getString("history_point_check"));
	    	 user.setHistoryReason(rs.getString("history_reason"));
	    	 user.setHistoryCreateDate(rs.getDate("history_create_date"));
	         user.setHistoryTotalPoint(rs.getInt("history_total_point"));
	         user.setOrderTotalPoint(rs.getInt("order_total_point"));
	         user.setOrderUsePoint(rs.getInt("order_use_point"));
	         user.setOrderDate(rs.getDate("order_date"));
	         
	         historys.add(user);
	         
	      }
	      
	      rs.close();
	      pstmt.close();
	      connection.close();
	      
	      return historys;
	}

}
