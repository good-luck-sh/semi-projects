package dao;

import java.sql.SQLException;

import java.util.List;

import vo.Product;
import vo.Review;
import vo.UserTable;

public interface ReviewDao {
	
	
	/**
	 * 리뷰의 전체 정보를 출력한다. 
	 * @return 리뷰의 전체 정보
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	public List<Review> getAllReview() throws SQLException;
	
	/**
	 * 아이디에 해당하는 리뷰의 전체 정보를 출력한다. 
	 * @param userNo 출력하고자 하는 아이디 
	 * @return 해당하는 아이디에 대한 리뷰정보
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	public List<Review> getAllReviewById(int userNo) throws SQLException;
	
	/**
	 * 입력받은 리뷰를 등록한다.
	 * @param review 입력받은 리뷰
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	public void insertReviewById(Review review) throws SQLException;
	
	/**
	 * 리뷰번호에 해당하는 리뷰를 삭제한다. 
	 * @param reviewNo 지우고자하는 리뷰의 번호
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	public void deleteReviewById(int reviewNo) throws SQLException;
	
	/**
	 * 리뷰번호에 해당하는 리뷰를 출력한다. 
	 * @param reviewTitle 출력하고자 하는 리뷰 제목
	 * @return 리뷰번호에 해당하는 리뷰정보
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	public Review getReviewById(int reviewNo) throws SQLException;
	
	/**
	 * 물건 번호를 클릭하면 해당하는 리뷰의 게시물이 모두 출력된다.
	 * @param productNo 출력하고자 하는 물건 번호 
	 * @return 리뷰 전체 정보
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	public List<Review> getAllReview(int productNo) throws SQLException;
	
	/**
	 * 해당하는 리뷰의 정보를 수정한다. 
	 * @param reviewNo 입력하고자 하는 리뷰 번호
	 * @throws SQLException DB Access 오류시 예외가 발생한다. 
	 */
	public void updateReviewById(Review review) throws SQLException;
	
}
