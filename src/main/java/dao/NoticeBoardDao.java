package dao;

import static utils.ConnectionUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.NoticeBoard;

public class NoticeBoardDao {

	private static NoticeBoardDao self = new NoticeBoardDao();
	private NoticeBoardDao() {}
	public static NoticeBoardDao getInstance() {
		return self;
	}
	
	/**
	 * 공지사항정보를 테이블에 저장한다.
	 * @param noticeBoard
	 * @throws SQLException
	 */
	public void insertNotice(NoticeBoard noticeBoard) throws SQLException {
		String sql = "insert into notice_board (board_no, board_title, board_content) "
				   + "values (board_no.nextval, ?, ?)";
		
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setString(1, noticeBoard.getBoardTitle());
		pstmt.setString(2, noticeBoard.getBoardContent());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	/**
	 * 테이블에 저장된 공지사항글의 갯수를 반환한다.
	 * @return
	 * @throws SQLException
	 */
	public int getTotalRecords() throws SQLException {
		String sql = "select count(*) cnt "
				   + "from notice_board";
		
		int totalRecords = 0;
		
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		totalRecords = rs.getInt("cnt");
		rs.close();
		pstmt.close();
		connection.close();
		
		return totalRecords;
	}
	
	/**
	 * 지정된 범위에 속하는 공지사항 정보를 반환한다.
	 * @param begin 시작번호
	 * @param end 끝번호
	 * @return 게시글 목록
	 * @throws SQLException
	 */
	public List<NoticeBoard> getBoardList(int begin, int end) throws SQLException {
		String sql = "select board_no, board_title, board_content, board_created_date "
				   + "from notice_board "
				   + "where board_no >= ? and board_no <= ? ";
		
		List<NoticeBoard> boardList = new ArrayList<>();
		
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, begin);
		pstmt.setInt(2, end);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			NoticeBoard noticeBoard = new NoticeBoard();
			
			noticeBoard.setBooardNo(rs.getInt("board_no"));
			noticeBoard.setBoardTitle(rs.getString("board_title"));
			noticeBoard.setBoardContent(rs.getString("board_content"));
			noticeBoard.setCreateDate(rs.getDate("board_created_date"));
			
			boardList.add(noticeBoard);
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return boardList;
	}
	
	/**
	 * 지정된 번호의 게시글 정보를 반영한다.
	 * @param no
	 * @return
	 * @throws SQLException
	 */
	public NoticeBoard getBoardDetail(int no) throws SQLException {
		String sql = "select board_no, board_title, board_content, board_created_date "
				   + "from notice_board "
				   + "where board_no = ? ";
		
		NoticeBoard noticeBoard = null;
		
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, no);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			noticeBoard = new NoticeBoard();
			
			noticeBoard.setBooardNo(rs.getInt("board_no"));
			noticeBoard.setBoardTitle(rs.getString("board_title"));
			noticeBoard.setBoardContent(rs.getString("board_content"));
			noticeBoard.setCreateDate(rs.getDate("board_created_date"));
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return noticeBoard;
	}
	
}
