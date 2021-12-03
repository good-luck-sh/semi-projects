package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import static utils.ConnectionUtil.*;

import vo.Orders;
import vo.Review;
import vo.UserTable;

public class OrderReviewJdbcDao implements OrderReviewDao {

	@Override
	public List<Review> getAllReviewByOrder(int orderNo, int begin, int end) throws SQLException {
		List<Review> reviews = new ArrayList<>();
		String sql =" select review_no, review_title, user_no, review_review_like_count, review_content, review_created_date, review_star_point, "
				+ "	U.user_id, U.user_password, U.user_name, U.user_age, U.user_gender, U.manager_check, "
				+ "	U.user_address, U.user_order_point, U.user_degree, U.user_created_date, U.user_delete_check, "
				+ "	O.order_no, O.order_total_point, O.order_total_price, O.order_use_point,O.order_state, O.order_real_total_price, "
				+ "	O.order_date,order_cancel_date, O.order_address, O.order_phone_number, O.order_name "
				+ "from "
				+ "( select row_number() over(order by R.review_no desc) rn, "
				+ "R.review_no, R.review_title, R.user_no, R.review_review_like_count, R.review_content, R.review_created_date, R.review_star_point, "
				+ "U.user_id, U.user_password, U.user_name, U.user_age, U.user_gender, U.manager_check, "
				+ "U.user_address, U.user_order_point, U.user_degree, U.user_created_date, U.user_delete_check, "
				+ "O.order_no, O.order_total_point, O.order_total_price, O.order_use_point,O.order_state, O.order_real_total_price, "
				+ "O.order_date,order_cancel_date, O.order_address, O.order_phone_number, O.order_name "
				+ "from review R, user_table U, orders O "
				+ "where R.user_no = U.user_no "
				+ "and U.user_no = O.user_no )"
				+ "where rn >= ? and rn <= ? "
				+ "and O.order_no = ? ";
		Connection connection = getConnection();
		PreparedStatement ptmt = connection.prepareStatement(sql);
		ptmt.setInt(1, begin);
		ptmt.setInt(2, end);
		ptmt.setInt(3, orderNo);
		ResultSet rs = ptmt.executeQuery();
		while (rs.next()) {
			Review review = new Review();
			UserTable user = new UserTable();
			Orders order = new Orders();
			review.setReviewNo(rs.getInt(""));
			review.setReviewTitle(rs.getString(""));
			review.setReviewReviewLikeCount(rs.getInt(""));
			review.setReviewContent(rs.getString(""));
			review.setReviewCreatedDate(rs.getDate(""));
			review.setReviewStarPoint(rs.getInt(""));
			user.setUserNo(rs.getInt(""));
			user.setUserNo(rs.getInt("user_no"));
			user.setUserId(rs.getString("user_id"));
			user.setUserPassword(rs.getString("user_password"));
			user.setUserName(rs.getString("user_name"));
			user.setUserAge(rs.getInt("user_age"));
			user.setUserGender(rs.getString("user_gender"));
			user.setManagerCheck(rs.getString("manager_check"));
			user.setUserAddress(rs.getString("user_address"));
			user.setUserOrderPoint(rs.getInt("user_order_point"));
			user.setUserDegree(rs.getString("user_degree"));
			user.setUserCreateDate(rs.getDate("user_created_date"));
			user.setUserDeleteCheck(rs.getString("user_delete_check"));
			review.setUserTable(user);
			
		}
		
		return reviews;
	}

}
