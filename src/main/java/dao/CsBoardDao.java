package dao;

import java.sql.SQLException;

import java.util.List;

import vo.CsBoard;
import vo.Review;

public interface CsBoardDao {
	
	
	/**
	 * 유저 번호를 이용해 유저의 간략한 cs게시판 정보 출력하기
	 * @param userNo 유저 번호
	 * @return 유저의 cs게시판 리스트
	 * @throws SQLException
	 */
	public List<CsBoard> getBoardInfoByNo(int userNo) throws SQLException;
	
	/**
	 * cs게시판의 정보를 모두 출력한다.
	 * @return cs게시판의 정보
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	public List<CsBoard> getAllcsBoard(int begin, int end) throws SQLException;
	
	/**
	 * 해당하는 이용자의 아이디의 cs게시판의 정보를 모두 출력한다.
	 * @param userId 출력하고자 하는 user 아이디
	 * @return cs게시판의 전체 정보
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	public List<CsBoard> getAllcsBoardById(int userNo) throws SQLException;
	
	/**
	 * 해당하는 이용자의 아이디의 cs게시판의 정보를 시작값부터 end값까지를 출력한다.
	 * @param userNo 출력하고자 하는 user의 아이디 
	 * @param begin cs게시판의 시작값
	 * @param end cs게시판의 마지막 값
	 * @return 해당하는 시작값부터 마지막 값까지의 값을 출력한다.
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	public List<CsBoard> getAllcsBoardById(int userNo, int begin, int end) throws SQLException;
	/**
	 * 해당하는 게시글을 클릭하면 cs게시판의 정보를 모두 출력한다.
	 * @param csBoardTitle 출력하고자 하는 게시판의 글 제목
	 * @return 해당하는 게시글의 cs게시판의 전체 정보
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	public CsBoard getBoardByCsBoardNo(int csBoardNo) throws SQLException;
	
	/**
	 * 새로 입력한 csBoard를 등록한다. 
	 * @param csBoard 등록할 문의사항게시판 
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	public void insertCsBoard(CsBoard csBoard) throws SQLException;
	
	/**
	 * csBoard를 수정한다.
	 * @param csBoard 수정할 문의사항게시판
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	public void updateCsBoard(CsBoard csBoard) throws SQLException;
	
	/**
	 * 문의사항게시판에서 댓글관리가 답변미완료인 경우인 cs게시판을 출력한다.
	 * @param csReplyCheck 출력하고자 하는 댓글관리내용
	 * @return 댓글미완료의 경우 출력하는 게시판
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	public List<CsBoard> getAllcsBoardByReplyCheck(String csReplyCheck) throws SQLException;
	
	/**
	 * 문의사항 게시판에서 해당하는 게시판은 삭제한다. 
	 * @param csBoardNo 지우고자 하는 게시판의 번호
	 * @throws SQLException  DB Access 오류시 예외가 발생한다.
	 */
	public void deleteCsBoard(int csBoardNo) throws SQLException;
	
	/**
	 * 문의사항 게시판에서 해결되지 않은 게시판의 갯수를 출력한다.
	 * @param csReplyCheck 해결되지 않은 게시판 
	 * @return 게시판의 갯수
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	public int getCountCsBoard(String csReplyCheck) throws SQLException;
	/**
	 * 해당하는 사용자의 번호를 입력받아 해당하는 사용자의 문의사항 게시판의 갯수를 출력한다. 
	 * @param userNo 출력받길 윈하는 사용자의 번호
	 * @return 문의사항의 갯수
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	public int getAllCountCsBoard(int userNo) throws SQLException;
	/**
	 * 해당하는 게시물을 수정할 때 날짜까지 수정되게 한다. 
	 * @param csBoard 수정하고자 하는 게시판 내용
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	public void updateCsBoardByRevise(CsBoard csBoard) throws SQLException;
	/**
	 * 해당하는 게시물에 댓글을 달면 날짜와 게시물댓글이 수정되게 한다. 
	 * @param csBoard 수정하고자 하는 게시판 내용
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	public void updateCsBoardByReply(CsBoard csBoard) throws SQLException;
	
	/**
	 * 전체적인 Cs게시판의 갯수를 나타내는 값을 나타낸다.
	 * @return 전체적인 cs게시판의 갯수
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	public int getAllCountCsBoard() throws SQLException;
}
