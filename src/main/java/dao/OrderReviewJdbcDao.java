package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.OrderDto;

import static utils.ConnectionUtil.*;

import vo.Orders;
import vo.Review;
import vo.UserTable;

public class OrderReviewJdbcDao implements OrderReviewDao {


	private static OrderReviewJdbcDao self = new OrderReviewJdbcDao();
	private OrderReviewJdbcDao() {}
	public static OrderReviewJdbcDao getInstance() {
		return self;
	}
	@Override
	public List<OrderDto> getAllReviewByOrder(int orderNo) throws SQLException {
		List<OrderDto> orderDtos = new ArrayList<>();
		String sql =" select R.review_no, R.review_title, R.user_no, R.review_review_like_count, R.review_content, R.review_created_date, R.review_star_point, "
				+ "U.user_id, U.user_password, U.user_name, U.user_age, U.user_gender, U.manager_check, "
				+ "U.user_address, U.user_order_point, U.user_degree, U.user_created_date, U.user_delete_check, "
				+ "O.order_no, O.order_total_point, O.order_total_price, O.order_use_point,O.order_state, O.order_real_total_price, "
				+ "O.order_date,O.order_cancel_date, O.order_address, O.order_phone_number, O.order_name "
				+ "from review R, user_table U, orders O "
				+ "where R.user_no = U.user_no "
				+ "and U.user_no = O.user_no  "
				+ "where O.order_no = ? ";
		Connection connection = getConnection();
		PreparedStatement ptmt = connection.prepareStatement(sql);
		ptmt.setInt(1, orderNo);
		ResultSet rs = ptmt.executeQuery();
		while (rs.next()) {
			OrderDto orderDto = new OrderDto();
			orderDto.setReviewNo(rs.getInt("review_no"));
			orderDto.setReviewTitle(rs.getString("review_title"));
			orderDto.setReviewReviewLikeCount(rs.getInt("review_review_like_count"));
			orderDto.setReviewContent(rs.getString("review_content"));
			orderDto.setReviewCreatedDate(rs.getDate("review_created_date"));
			orderDto.setReviewStarPoint(rs.getInt("review_star_point"));
			orderDto.setUserNo(rs.getInt("user_no"));
			orderDto.setUserId(rs.getString("user_id"));
			orderDto.setUserPassword(rs.getString("user_password"));
			orderDto.setUserName(rs.getString("user_name"));
			orderDto.setUserAge(rs.getInt("user_age"));
			orderDto.setUserGender(rs.getString("user_gender"));
			orderDto.setManagerCheck(rs.getString("manager_check"));
			orderDto.setUserAddress(rs.getString("user_address"));
			orderDto.setUserOrderPoint(rs.getInt("user_order_point"));
			orderDto.setUserDegree(rs.getString("user_degree"));
			orderDto.setUserCreateDate(rs.getDate("user_created_date"));
			orderDto.setUserDeleteCheck(rs.getString("user_delete_check"));
			orderDto.setOrderNo(rs.getInt("order_no"));
			orderDto.setOrderTotalPoint(rs.getInt("order_total_point"));
			orderDto.setOrderTotalPrice(rs.getInt("order_total_price"));
			orderDto.setOrderUsePoint(rs.getInt("order_use_point"));
			orderDto.setOrderState(rs.getString("order_state"));
			orderDto.setOrderRealTotalPrice(rs.getInt("order_real_total_price"));
			orderDto.setOrderDate(rs.getDate("order_date"));
			orderDto.setOrderCancelDate(rs.getDate("order_cancel_date"));
			orderDto.setOrderAddress(rs.getString("order_address"));
			orderDto.setOrderPhoneNumber(rs.getString("order_phone_number"));
			orderDto.setOrderName(rs.getString("order_name"));
			orderDtos.add(orderDto);
		}
		rs.close();
		ptmt.close();
		connection.close();
		return orderDtos;
	}
	@Override
	public List<OrderDto> getAllReview(int begin, int end) throws SQLException {
		List<OrderDto> orderDtos = new ArrayList<>();
		String sql =" select review_no, review_title, user_no, review_review_like_count, review_content, review_created_date, review_star_point, "
				+ "	user_id, user_password, user_name, user_age, user_gender, manager_check, "
				+ "	user_address, user_order_point, user_degree, user_created_date, user_delete_check, "
				+ "	order_no, order_total_point, order_total_price, order_use_point,order_state, order_real_total_price, "
				+ "	order_date,order_cancel_date, order_address, order_phone_number, order_name "
				+ "from "
				+ "( select row_number() over(order by R.review_no desc) rn, "
				+ "R.review_no, R.review_title, R.user_no, R.review_review_like_count, R.review_content, R.review_created_date, R.review_star_point, "
				+ "U.user_id, U.user_password, U.user_name, U.user_age, U.user_gender, U.manager_check, "
				+ "U.user_address, U.user_order_point, U.user_degree, U.user_created_date, U.user_delete_check, "
				+ "O.order_no, O.order_total_point, O.order_total_price, O.order_use_point,O.order_state, O.order_real_total_price, "
				+ "O.order_date,O.order_cancel_date, O.order_address, O.order_phone_number, O.order_name "
				+ "from review R, user_table U, orders O "
				+ "where R.user_no = U.user_no "
				+ "and U.user_no = O.user_no ) "
				+ "where rn >= ? and rn <= ? ";
		Connection connection = getConnection();
		PreparedStatement ptmt = connection.prepareStatement(sql);
		ptmt.setInt(1, begin);
		ptmt.setInt(2, end);
		ResultSet rs = ptmt.executeQuery();
		while (rs.next()) {
			OrderDto orderDto = new OrderDto();
			orderDto.setReviewNo(rs.getInt("review_no"));
			orderDto.setReviewTitle(rs.getString("review_title"));
			orderDto.setReviewReviewLikeCount(rs.getInt("review_review_like_count"));
			orderDto.setReviewContent(rs.getString("review_content"));
			orderDto.setReviewCreatedDate(rs.getDate("review_created_date"));
			orderDto.setReviewStarPoint(rs.getInt("review_star_point"));
			orderDto.setUserNo(rs.getInt("user_no"));
			orderDto.setUserId(rs.getString("user_id"));
			orderDto.setUserPassword(rs.getString("user_password"));
			orderDto.setUserName(rs.getString("user_name"));
			orderDto.setUserAge(rs.getInt("user_age"));
			orderDto.setUserGender(rs.getString("user_gender"));
			orderDto.setManagerCheck(rs.getString("manager_check"));
			orderDto.setUserAddress(rs.getString("user_address"));
			orderDto.setUserOrderPoint(rs.getInt("user_order_point"));
			orderDto.setUserDegree(rs.getString("user_degree"));
			orderDto.setUserCreateDate(rs.getDate("user_created_date"));
			orderDto.setUserDeleteCheck(rs.getString("user_delete_check"));
			orderDto.setOrderNo(rs.getInt("order_no"));
			orderDto.setOrderTotalPoint(rs.getInt("order_total_point"));
			orderDto.setOrderTotalPrice(rs.getInt("order_total_price"));
			orderDto.setOrderUsePoint(rs.getInt("order_use_point"));
			orderDto.setOrderState(rs.getString("order_state"));
			orderDto.setOrderRealTotalPrice(rs.getInt("order_real_total_price"));
			orderDto.setOrderDate(rs.getDate("order_date"));
			orderDto.setOrderCancelDate(rs.getDate("order_cancel_date"));
			orderDto.setOrderAddress(rs.getString("order_address"));
			orderDto.setOrderPhoneNumber(rs.getString("order_phone_number"));
			orderDto.setOrderName(rs.getString("order_name"));
			orderDtos.add(orderDto);
		}
		rs.close();
		ptmt.close();
		connection.close();
		return orderDtos;
	}

}
