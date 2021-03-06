package dao;

import java.sql.SQLException;
import java.util.List;

import dto.OrderDto;
import vo.Review;

public interface OrderReviewDao {
	
	/**
	 * 해당하는 주문번호를 입력받아 해당하는 리뷰를 출력한다. 
	 * @param orderNo 해당하는 주문번호 
	 * @param begin 시작번호 
	 * @param end 끝번호 
	 * @return 해당하는 리뷰 객체 
	 * @throws SQLException DB Access 오류시 예외가 발생한다. 
	 */
	public List<OrderDto> getAllReviewByOrder(int orderNo) throws SQLException; 
	
	/**
	 * 해당하는 주문번호를 입력받아 해당하는 리뷰를 출력한다.
	 * @param orderNo 해당하는 주문번호 
	 * @return 해당하는 리뷰 객체 
	 * @throws SQLException DB Access 오류시 예외가 발생한다. 
	 */
	public OrderDto getAllReviewByOrderNo(int orderNo) throws SQLException; 
	
	/**
	 * 모든 주문에 대한 리뷰를 출력한다. 
	 * @param begin 시작번호 
	 * @param end 끝번호 
	 * @return 리뷰 전체 
	 * @throws SQLException DB Access 오류시 예외가 발생한다. 
	 */
	public List<OrderDto> getAllReview(int begin, int end) throws SQLException;
	
	/**
	 * 해당하는 주문번호를 출력한다. 
	 * @param orderNo 해당하는 주문번호 
	 * @return 해당하는 OrderDto 객체
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	public OrderDto getAllPointByOrderNo(int orderNo) throws SQLException;
}
