package dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import static utils.ConnectionUtil.*;

import vo.CsBoard;
import vo.UserTable;

public class CsBoardJdbcDao implements CsBoardDao {
	
	private static CsBoardJdbcDao self = new CsBoardJdbcDao();
	private CsBoardJdbcDao() {}
	public static CsBoardJdbcDao getInstance() {
		return self;
	}

	@Override
	public List<CsBoard> getAllcsBoard() throws SQLException {
		
		List<CsBoard> csBoards = new ArrayList<>();
		String sql = "select C.cs_board_no, C.cs_board_title, C.user_no, C.cs_board_view_count, C.cs_board_like_count, C.cs_board_content, C.cs_created_date, "
				+ " C.cs_update_date, C.cs_board_delete_date, C.cs_reply_content, C.cs_reply_create_date, C.cs_reply_check, "
				+ " U.user_no, U.user_id, U.user_password, U.user_name, U.user_age, U.user_gender, U.manager_check "
				+ " U.user_address, U.user_order_point, U.user_degree, U.user_created_date, U.user_delete_check "
				+ " from cs_board C, user_table U ";
		Connection connection = getConnection();
		PreparedStatement ptmt = connection.prepareStatement(sql);
		ResultSet rs = ptmt.executeQuery();
		
		repeatCsBoard(csBoards, rs);
		rs.close();
		ptmt.close();
		connection.close();
		
		return csBoards;
	}

	@Override
	public List<CsBoard> getAllcsBoardById(int userNo) throws SQLException {
		List<CsBoard> csBoards = new ArrayList<>();
		String sql = "select C.cs_board_no, C.cs_board_title, C.user_no, C.cs_board_view_count, C.cs_board_like_count, C.cs_board_content, C.cs_created_date, "
				+ " C.cs_update_date, C.cs_board_delete_date, C.cs_reply_content, C.cs_reply_create_date, C.cs_reply_check, "
				+ " U.user_no, U.user_id, U.user_password, U.user_name, U.user_age, U.user_gender, U.manager_check "
				+ " U.user_address, U.user_order_point, U.user_degree, U.user_created_date, U.user_delete_check "
				+ " from cs_board C, user_table U "
				+ " where U.user_no = ? ";
		Connection connection = getConnection();
		PreparedStatement ptmt = connection.prepareStatement(sql);
		ptmt.setInt(1, userNo);
		ResultSet rs = ptmt.executeQuery();
		
		repeatCsBoard(csBoards, rs);
		rs.close();
		ptmt.close();
		connection.close();
		
		return csBoards;
	}
	private void repeatCsBoard(List<CsBoard> csBoards, ResultSet rs) throws SQLException {
		while (rs.next()) {
			CsBoard csBoard = new CsBoard();
			UserTable findUser = new UserTable();
			csBoard.setCsBoardNo(rs.getInt("cs_board_no"));
			csBoard.setCsBoardTitle(rs.getString("cs_board_title"));
			findUser.setUserNo(rs.getInt("user_no"));
			findUser.setUserId(rs.getString("user_id"));
			findUser.setUserPassword(rs.getString("user_password"));
			findUser.setUserName(rs.getString("user_name"));
			findUser.setUserAge(rs.getInt("user_age"));
			findUser.setUserGender(rs.getString("user_gender"));
			findUser.setManagerCheck(rs.getString("manager_check"));
			findUser.setUserAddress(rs.getString("user_address"));
			findUser.setUserOrderPoint(rs.getInt("user_order_point"));
			findUser.setUserDegree(rs.getString("user_degree"));
			findUser.setUserCreateDate(rs.getDate("user_created_date"));
			findUser.setUserDeleteCheck(rs.getString("user_delete_check"));
			csBoard.setUserTable(findUser);
			csBoard.setCsBoardViewCount(rs.getInt("cs_board_view_count"));
			csBoard.setCsBoardLikeCount(rs.getInt("cs_board_like_count"));
			csBoard.setCsBoardContent(rs.getString("cs_board_content"));
			csBoard.setCsCreateDate(rs.getDate("cs_created_date"));
			csBoard.setCsUpdateDate(rs.getDate("cs_update_date"));
			csBoard.setCsDeletedDate(rs.getDate("cs_board_delete_date"));
			csBoard.setCsReplyContent(rs.getString("cs_reply_content"));
			csBoard.setCsReplyCreateDate(rs.getDate("cs_reply_create_date"));
			csBoard.setCsReplyCheck(rs.getString("cs_reply_check"));
			csBoards.add(csBoard);

		}
	}

	@Override
	public CsBoard getBoardByTitle(int csBoardNo) throws SQLException {
		CsBoard csBoard = null;
		String sql = "select C.cs_board_no, C.cs_board_title, C.user_no, C.cs_board_view_count, C.cs_board_like_count, C.cs_board_content, C.cs_created_date, "
				+ " C.cs_update_date, C.cs_board_delete_date, C.cs_reply_content, C.cs_reply_create_date, C.cs_reply_check, "
				+ " U.user_no, U.user_id, U.user_password, U.user_name, U.user_age, U.user_gender, U.manager_check "
				+ " U.user_address, U.user_order_point, U.user_degree, U.user_created_date, U.user_delete_check "
				+ " from cs_board C, user_table U "
				+ " where C.cs_board_no = ? ";
		Connection connection = getConnection();
		PreparedStatement ptmt = connection.prepareStatement(sql);
		ptmt.setInt(1, csBoardNo);
		ResultSet rs = ptmt.executeQuery();
		if(rs.next()) {
			csBoard = new CsBoard();
			UserTable findUser = new UserTable();
			
			csBoard.setCsBoardNo(rs.getInt("cs_board_no"));
			csBoard.setCsBoardTitle(rs.getString("cs_board_title"));
			findUser.setUserNo(rs.getInt("user_no"));
			findUser.setUserId(rs.getString("user_id"));
			findUser.setUserPassword(rs.getString("user_password"));
			findUser.setUserName(rs.getString("user_name"));
			findUser.setUserAge(rs.getInt("user_age"));
			findUser.setUserGender(rs.getString("user_gender"));
			findUser.setManagerCheck(rs.getString("manager_check"));
			findUser.setUserAddress(rs.getString("user_address"));
			findUser.setUserOrderPoint(rs.getInt("user_order_point"));
			findUser.setUserDegree(rs.getString("user_degree"));
			findUser.setUserCreateDate(rs.getDate("user_created_date"));
			findUser.setUserDeleteCheck(rs.getString("user_delete_check"));
			csBoard.setUserTable(findUser);
			csBoard.setCsBoardViewCount(rs.getInt("cs_board_view_count"));
			csBoard.setCsBoardLikeCount(rs.getInt("cs_board_like_count"));
			csBoard.setCsBoardContent(rs.getString("cs_board_content"));
			csBoard.setCsCreateDate(rs.getDate("cs_created_date"));
			csBoard.setCsUpdateDate(rs.getDate("cs_update_date"));
			csBoard.setCsDeletedDate(rs.getDate("cs_board_delete_date"));
			csBoard.setCsReplyContent(rs.getString("cs_reply_content"));
			csBoard.setCsReplyCreateDate(rs.getDate("cs_reply_create_date"));
			csBoard.setCsReplyCheck(rs.getString("cs_reply_check"));
			
		}
		
		rs.close();
		ptmt.close();
		connection.close();
		
		return csBoard;
	}

	@Override
	public void insertCsBoard(CsBoard csBoard) throws SQLException {
		String sql = "insert into csBoard (cs_board_no, cs_board_title, user_no, cs_board_view_count, cs_board_like_count, cs_board_content, cs_created_date )"
				+ "values(board_no.nextval ,?, ?, 0, 0, ? , sysdate ) ";
		Connection connection = getConnection();
		PreparedStatement ptmt = connection.prepareStatement(sql);
		
		ptmt.setString(1, csBoard.getCsBoardTitle());
		ptmt.setString(2, csBoard.getUserTable().getUserId());
		ptmt.setString(3, csBoard.getCsBoardContent());
		
		ptmt.executeUpdate();
		
		ptmt.close();
		connection.close();
		
	}

	@Override
	public void updateCsBoard(CsBoard csBoard) throws SQLException {
		String sql = "update csBoard "
				+ "set "
				+ " cs_board_title  = ? "
				+ " user_no  = ? "
				+ " cs_board_view_count  = ? "
				+ " cs_board_like_count  = ? "
				+ " cs_board_content  = ? "
				+ "	cs_update_date  = ? "
				+ " cs_board_delete_date  = ? "
				+ " cs_reply_content  = ? "
				+ " cs_reply_create_date  = ? "
				+ " cs_reply_check  = ? "
				+ "where cs_board_no = ? ";
		Connection connection = getConnection();
		PreparedStatement ptmt = connection.prepareStatement(sql);
		ptmt.setString(1, csBoard.getCsBoardTitle());
		ptmt.setInt(2, csBoard.getUserTable().getUserNo());
		ptmt.setInt(3, csBoard.getCsBoardViewCount());
		ptmt.setInt(4, csBoard.getCsBoardLikeCount());
		ptmt.setString(5, csBoard.getCsBoardContent());
		ptmt.setDate(6,  new java.sql.Date(System.currentTimeMillis()));
		ptmt.setDate(7,  new java.sql.Date(System.currentTimeMillis()));
		ptmt.setString(8, csBoard.getCsReplyContent());
		ptmt.setDate(9,  new java.sql.Date(System.currentTimeMillis()));
		ptmt.setString(10, csBoard.getCsReplyCheck());
		ptmt.setInt(11, csBoard.getCsBoardNo());
		
		ptmt.executeUpdate();
		
		ptmt.close();
		connection.close();
		
	}

	@Override
	public List<CsBoard> getAllcsBoardByReplyCheck(String csReplyCheck) throws SQLException {
		
		List<CsBoard> csBoards = new ArrayList<>();
		String sql = "select C.cs_board_no, C.cs_board_title, C.user_no, C.cs_board_view_count, C.cs_board_like_count, C.cs_board_content, C.cs_created_date, "
				+ " C.cs_update_date, C.cs_board_delete_date, C.cs_reply_content, C.cs_reply_create_date, C.cs_reply_check, "
				+ " U.user_no, U.user_id, U.user_password, U.user_name, U.user_age, U.user_gender, U.manager_check "
				+ " U.user_address, U.user_order_point, U.user_degree, U.user_created_date, U.user_delete_check "
				+ " from cs_board C, user_table U "
				+ " where C.cs_reply_check like '%' ? '%' ";
		Connection connection = getConnection();
		PreparedStatement ptmt = connection.prepareStatement(sql);
		ptmt.setString(1, csReplyCheck);
		ResultSet rs = ptmt.executeQuery();
		
		repeatCsBoard(csBoards, rs);
		rs.close();
		ptmt.close();
		connection.close();
		
		return csBoards;
	}

	@Override
	public void deleteCsBoard(int csBoardNo) throws SQLException {
		String sql = " delete from csBoard where cs_board_no = ? ";
		Connection connection = getConnection();
		PreparedStatement ptmt = connection.prepareStatement(sql);
		ptmt.setInt(1, csBoardNo);
		
		ptmt.executeUpdate();
		
		ptmt.close();
		connection.close();
		
	}
	@Override
	public int getCountCsBoard(String csReplyCheck) throws SQLException {
		int countReply = 0;
		String sql = "select count(*) as count from cs_board "
				+ "where cs_reply_check like '%' ? '%' ";
		Connection connection = getConnection();
		PreparedStatement ptmt = connection.prepareStatement(sql);
		ptmt.setString(1, csReplyCheck);
		ResultSet rs = ptmt.executeQuery();
		rs.next();
		
		countReply = rs.getInt("count");
		
		rs.close();
		ptmt.close();
		connection.close();
		return countReply;
	}
	@Override
	public int getAllCountCsBoard(int userNo) throws SQLException {
		int countReply = 0;
		String sql = "select count(*) as count from cs_board where cs_board_no = ? ";
		Connection connection = getConnection();
		PreparedStatement ptmt = connection.prepareStatement(sql);
		ptmt.setInt(1, userNo);
		ResultSet rs = ptmt.executeQuery();
		rs.next();
		countReply = rs.getInt("count");
		
		rs.close();
		ptmt.close();
		connection.close();
		return countReply;
	}

}
