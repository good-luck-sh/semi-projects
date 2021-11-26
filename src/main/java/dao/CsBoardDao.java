package dao;

import java.sql.SQLException;

import java.util.List;

import vo.CsBoard;
import vo.Review;

public interface CsBoardDao {
	
	/**
	 * cs게시판의 정보를 모두 출력한다.
	 * @return cs게시판의 정보
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	public List<CsBoard> getAllcsBoard() throws SQLException;
	
	/**
	 * 해당하는 이용자의 아이디의 cs게시판의 정보를 모두 출력한다.
	 * @param userId 출력하고자 하는 user 아이디
	 * @return cs게시판의 전체 정보
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	public List<CsBoard> getAllcsBoardById(String userId) throws SQLException;
	
	/**
	 * 해당하는 게시글을 클릭하면 cs게시판의 정보를 모두 출력한다.
	 * @param csBoardTitle 출력하고자 하는 게시판의 글 제목
	 * @return 해당하는 게시글의 cs게시판의 전체 정보
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	public CsBoard getBoardByTitle(String csBoardTitle) throws SQLException;
	
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
	
}
