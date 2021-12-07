package dao;

import static utils.ConnectionUtil.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.UserDto;
import vo.Orders;
import vo.Product;
import vo.Review;
import vo.UserPointHistory;
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
	public List<Review> getAllReviewById(int userNo, int begin, int end) throws SQLException;
	
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
	 * @param reviewNo 찾고자 하는 리뷰 번호
	 * @return 리뷰 객체
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	public Review getReviewByReviewNo(int reviewNo) throws SQLException;
	/**
	 * 사용자 아이디에 해당하는 리뷰를 출력한다. 
	 * @param reviewTitle 출력하고자 하는 리뷰 제목
	 * @return 리뷰번호에 해당하는 리뷰정보
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	public Review getReviewById(int userNo) throws SQLException;
	
	/**
	 * 물건 번호를 입력하면 해당하는 리뷰의 게시물이 모두 출력된다.
	 * @param productNo 출력하고자 하는 물건 번호 
	 * @return 리뷰 전체 정보
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	public List<Review> getAllReview(int productNo, int begin, int end) throws SQLException;
	
	
	/**
	 * 유저 정보를 입력하면 해당하는 리뷰의 게시물이 모두 출력된다. 
	 * @param userNo 출력하고자 하는 사용자 번호 
	 * @return 리뷰의 전체 정보
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	public List<Review> getAllReview(int userNo) throws SQLException;
	
	/**
	 * 해당하는 리뷰의 정보를 수정한다. 
	 * @param reviewNo 입력하고자 하는 리뷰 번호
	 * @throws SQLException DB Access 오류시 예외가 발생한다. 
	 */
	public void updateReviewById(Review review) throws SQLException;
	
	/**
	 * 해당하는 사용자의 리뷰의 갯수를 출력한다.
	 * @param userNo 리뷰 작성자의 번호
	 * @return 작성한 리뷰의 갯수
	 * @throws SQLException DB Access 오류시 예외가 발생한다. 
	 */
	public int getCountReviewByUserNo(int userNo) throws SQLException;
	
	/**
	 * 해당하는 상품의 리뷰의 갯수를 출력한다.
	 * @param productNo 물건의 번호
	 * @return 작성한 리뷰의 갯수
	 * @throws SQLException DB Access 오류시 예외가 발생한다. 
	 */
	public int getCountReviewByProductNo(int productNo) throws SQLException;
	
	/**
	 * 총 리뷰의 갯수를 출력한다.
	 * @return 작성한 리뷰의 갯수
	 * @throws SQLException DB Access 오류시 예외가 발생한다. 
	 */
	public int getAllCountReview() throws SQLException;
	
	/**
	 * 리뷰를 작성하면 해당하는 user의 포인트가 update가 된다. 
	 * @param userNo 작성한 사용자의 객체
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	public void updateReviewByUserNo(UserTable userTable) throws SQLException;
	
	/**
	 * 리뷰를 작성하면 해당하는 order의 총 포인트가 update가 된다. 
	 * @param orders 해당하는 user의 주문 total point
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	public void updateOrderByUserOrderTotalPoint(Orders orders) throws SQLException;
	/**
	 * 리뷰를 작성하면 해당하는 userPoint가 insert가 된다. 
	 * @param point 작성한 userpoint 객체
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	public void insertReviewByUserPointHistory(UserPointHistory point) throws SQLException;
	
	/**
	 * 해당하는 사용자의 주문정보를 출력한다. 
	 * @param userNo 해당하는 사용자의 정보 
	 * @return userDto의 대한 정보 
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	public List<UserDto> getOrderUserByUserNo(int userNo) throws SQLException;
	/**
	 * 리뷰번호로 사용될 시퀀스 값을 반환한다.
	 * @param connection 커넥션 객체
	 * @return 리뷰번호 
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	public int getReviewSequence(Connection connection) throws SQLException;
	
	/**
	 * 지정된 리뷰번호에 해당하는 리뷰정보를 반환한다.
	 * @param reviewNo 리뷰번호
	 * @param connection 데이터베이스와 연결된 커넥션 객체
	 * @return 리뷰정보
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */ 
	public Review getReview(int reviewNo, Connection connection) throws SQLException;
	
	/**
	 * 총 주문 횟수를 출력한다.
	 * @return 총 주문 횟수 
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	public int getAllOrderReview() throws SQLException;

	
	
}
