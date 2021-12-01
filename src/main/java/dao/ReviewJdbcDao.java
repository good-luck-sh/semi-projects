package dao;

import java.sql.Connection;


import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.UserDto;

import static utils.ConnectionUtil.*;

import vo.Categorys;
import vo.Orders;
import vo.Product;
import vo.Review;
import vo.UserPointHistory;
import vo.UserTable;


public class ReviewJdbcDao implements ReviewDao {

	private static ReviewJdbcDao self = new ReviewJdbcDao();
	private ReviewJdbcDao() {}
	public static ReviewJdbcDao getInstance() {
		return self;
	}

	@Override
	public List<Review> getAllReview() throws SQLException {
		List<Review> reviews = new ArrayList<>();
		String sql = "select R.review_no, R.review_title, R.user_no, R.review_review_like_count, R.review_content, R.review_created_date, R.review_star_point "
				+ " U.user_no, U.user_id, U.user_password, U.user_name, U.user_age, U.user_gender, U.manager_check "
				+ "	U.user_address, U.user_order_point, U.user_degree, U.user_created_date, U.user_delete_check "
				+ "from review R, user_table U ";
		Connection connection = getConnection();
		PreparedStatement ptmt = connection.prepareStatement(sql);
		ResultSet rs = ptmt.executeQuery();
		while(rs.next()) {
			Review review = new Review();
			review.setReviewNo(rs.getInt("review_no"));
			review.setReviewTitle(rs.getString("review_title"));
			UserTable findUser = new UserTable();
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
			review.setUserTable(findUser);
			review.setReviewReviewLikeCount(rs.getInt("review_review_like_count"));
			review.setReviewContent(rs.getString("review_content"));
			review.setReviewCreatedDate(rs.getDate("review_created_date"));
			review.setReviewStarPoint(rs.getInt("review_star_point"));
			reviews.add(review);
		}
		rs.close();
		ptmt.close();
		connection.close();
		return reviews;
	}

	@Override
	public List<Review> getAllReviewById(int userno, int begin, int end) throws SQLException {
		
		List<Review> reviews = new ArrayList<>();
		String sql = "select review_no, review_title, user_no, review_review_like_count, review_content, review_created_date, review_star_point, "
				+ " user_id, user_password, user_name, user_age, user_gender, manager_check, "
				+ "	user_address, user_order_point, user_degree, user_created_date, user_delete_check "
				+ "from "
				+ "	(select row_number() over(order by R.review_no desc) rn, "
				+ " 	R.review_no, R.review_title, R.user_no, R.review_review_like_count, R.review_content, R.review_created_date, R.review_star_point, "
				+ "	    U.user_id, U.user_password, U.user_name, U.user_age, U.user_gender, U.manager_check, "
				+ "	 	U.user_address, U.user_order_point, U.user_degree, U.user_created_date, U.user_delete_check "
				+ "		from review R, user_table U "
				+ " 	where R.user_no = U.user_no "
				+ "	) "
				+ "where rn >= ? and rn <= ? "
				+ "and user_no = ? ";
		Connection connection = getConnection();
		PreparedStatement ptmt = connection.prepareStatement(sql);
		ptmt.setInt(1, begin);
		ptmt.setInt(2, end);
		ptmt.setInt(3, userno);
		ResultSet rs = ptmt.executeQuery();
		while(rs.next()) {
			Review review = new Review();
			review.setReviewNo(rs.getInt("review_no"));
			review.setReviewTitle(rs.getString("review_title"));
			UserTable findUser = new UserTable();
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
			review.setUserTable(findUser);
			review.setReviewReviewLikeCount(rs.getInt("review_review_like_count"));
			review.setReviewContent(rs.getString("review_content"));
			review.setReviewCreatedDate(rs.getDate("review_created_date"));
			review.setReviewStarPoint(rs.getInt("review_star_point"));
			reviews.add(review);
		}
		rs.close();
		ptmt.close();
		connection.close();
		return reviews;
	}

	@Override
	public void insertReviewById(Review review) throws SQLException {
		
		String sql = "insert into review (review_no, review_title, user_no, review_review_like_count, review_content, review_created_date, review_star_point) "
				+ " values(review_no.nextval, ?, ?, 0, ?, sysdate, ? ) ";
		
		Connection connection = getConnection();
		PreparedStatement ptmt = connection.prepareStatement(sql);
		ptmt.setString(1, review.getReviewTitle());
		ptmt.setInt(2, review.getUserTable().getUserNo());
		ptmt.setString(3, review.getReviewContent());
		ptmt.setInt(4, review.getReviewStarPoint());
		
		ptmt.executeUpdate();
		
		ptmt.close();
		connection.close();

	}

	@Override
	public void deleteReviewById(int reviewNo) throws SQLException {
		String sql = "delete from review where review_no = ? ";
		Connection connection = getConnection();
		PreparedStatement ptmt = connection.prepareStatement(sql);
		ptmt.setInt(1, reviewNo);
		
		ptmt.executeUpdate();
		
		ptmt.close();
		connection.close();
	}
	

	@Override
	public Review getReviewById(int userNo) throws SQLException {
		Review review = null;
		String sql = "select R.review_no, R.review_title, R.user_no, R.review_review_like_count, R.review_content, R.review_created_date, R.review_star_point, "
				+ " U.user_no, U.user_id, U.user_password, U.user_name, U.user_age, U.user_gender, U.manager_check, "
				+ "	U.user_address, U.user_order_point, U.user_degree, U.user_created_date, U.user_delete_check "
				+ "from review R, user_table U "
				+ "where R.user_no = ? ";
		Connection connection = getConnection();
		PreparedStatement ptmt = connection.prepareStatement(sql);
		ptmt.setInt(1, userNo);
		ResultSet rs = ptmt.executeQuery();
		review = repeateReview(review, rs);
		rs.close();
		ptmt.close();
		connection.close();
		return review;
	}

	@Override
	public List<Review> getAllReview(int productNo, int begin, int end) throws SQLException {
		List<Review> reviews = new ArrayList<>();
		String sql = "select review_no, review_title, user_no, review_review_like_count, review_content, review_created_date, review_star_point, product_picture, "
				+ "	 user_no, user_id, user_password, user_name, user_age, user_gender, manager_check, "
				+ "	 user_address, user_order_point, user_degree, user_created_date, user_delete_check, "
				+ "	 product_no, category_no, product_name, product_price , product_discount_price, product_stock, product_on_sale, product_review_count "
				+ "	star_point, P.product_date "
				+ " from "
				+ "(select row_number() over(order by R.review_no desc) rn,"
				+ " R.review_no, R.review_title, R.user_no, R.review_review_like_count, R.review_content, R.review_created_date, R.review_star_point, "
				+ " U.user_id, U.user_password, U.user_name, U.user_age, U.user_gender, U.manager_check, "
				+ "	U.user_address, U.user_order_point, U.user_degree, U.user_created_date, U.user_delete_check, "
				+ "	P.product_no, P.category_no, P.product_name, P.product_price , P.product_discount_price, P.product_stock, P.product_on_sale, P.product_review_count, P.product_picture, "
				+ " P.product_star_point, P.product_date "
				+ "	from review R, user_table U, product P , user_basket B "
				+ "	where R.user_no = U.user_no "
				+ "	and U.user_no = B.user_no "
				+ "	and P.product_no = B.product_no "
				+ " and P.product_no = ? "
				+ ")"
				+ "where rn >= ? and rn <= ? ";
		Connection connection = getConnection();
		PreparedStatement ptmt = connection.prepareStatement(sql);
		ptmt.setInt(1, productNo);
		ptmt.setInt(2, begin);
		ptmt.setInt(3, end);
		ResultSet rs = ptmt.executeQuery();
		repeatProductUserReview(reviews, rs);
		
		rs.close();
		ptmt.close();
		connection.close();
		return reviews;
	}

	
	private void repeatProductUserReview(List<Review> reviews, ResultSet rs) throws SQLException {
		while(rs.next()) {
			Review review = new Review();
			review.setReviewNo(rs.getInt("review_no"));
			review.setReviewTitle(rs.getString("review_title"));
			UserTable findUser = new UserTable();
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
			review.setUserTable(findUser);
			review.setReviewReviewLikeCount(rs.getInt("review_review_like_count"));
			review.setReviewContent(rs.getString("review_content"));
			review.setReviewCreatedDate(rs.getDate("review_created_date"));
			review.setReviewStarPoint(rs.getInt("review_star_point"));
			Product product = new Product();
			product.setProductNo(rs.getInt("product_no"));
			Categorys category = new Categorys();
			category.setCategorysNo(rs.getInt("category_no"));
			product.setCategorys(category);
			product.setProductName(rs.getString("product_name"));
			product.setProductPrice(rs.getInt("product_price"));
			product.setProductDiscountPrice(rs.getInt("product_discount_price"));
			product.setProductStock(rs.getInt("product_stock"));
			product.setProductOnSale(rs.getString("product_on_sale"));
			product.setProductReviewCount(rs.getInt("product_review_count"));
			product.setPrdocutStarPoint(rs.getInt("product_star_point"));
			product.setProductDate(rs.getDate("product_date"));
			product.setProductPicture(rs.getString("product_picture"));
			reviews.add(review);
			
		}
	}

	@Override
	public void updateReviewById(Review review) throws SQLException {
		String sql = "update review "
				+ "set "
				+ "review_title = ?, "
				+ "user_no = ?, "
				+ "review_review_like_count = ?, "
				+ "review_content = ?, "
				+ "review_star_point = ? "
				+ "where review_no = ? ";
		Connection connection = getConnection();
		PreparedStatement ptmt = connection.prepareStatement(sql);
		ptmt.setString(1, review.getReviewTitle());
		ptmt.setInt(2, review.getUserTable().getUserNo());
		ptmt.setInt(3, review.getReviewReviewLikeCount());
		ptmt.setString(4, review.getReviewContent());
		ptmt.setInt(5, review.getReviewStarPoint());
		ptmt.setInt(6, review.getReviewNo());
		
		ptmt.executeUpdate();
		
		ptmt.close();
		connection.close();
	}
	@Override
	public int getCountReviewByUserNo(int userNo) throws SQLException {
		int findCount = 0;
		String sql = "select count(*)as cnt from review where user_no = ? ";
		Connection connection = getConnection();
		PreparedStatement ptmt = connection.prepareStatement(sql);
		ptmt.setInt(1, userNo);
		ResultSet rs = ptmt.executeQuery();
		rs.next();
		findCount = rs.getInt("cnt");
		rs.close();
		ptmt.close();
		connection.close();
		return findCount;
	}
	@Override
	public int getCountReviewByProductNo(int productNo) throws SQLException {
		int findCount = 0;
		String sql = "select review_no count(*)as cnt "
				+ "from review R, user_table U, product P, user_basket B "
				+ "	where R.user_no = U.user_no "
				+ "	and U.user_no = B.user_no "
				+ "	and P.product_no = B.product_no " 
				+ "	and P.product_no = ? "
				+ " group by review_no ";
		Connection connection = getConnection();
		PreparedStatement ptmt = connection.prepareStatement(sql);
		ptmt.setInt(1, productNo);
		ResultSet rs = ptmt.executeQuery();
		rs.next();
		findCount = rs.getInt("cnt");
		
		rs.close();
		ptmt.close();
		connection.close();
		return findCount;
	}
	@Override
	public int getAllCountReview() throws SQLException {
		int findCount = 0;
		String sql = "select count(*)as cnt from review ";
		Connection connection = getConnection();
		PreparedStatement ptmt = connection.prepareStatement(sql);
		ResultSet rs = ptmt.executeQuery();
		rs.next();
		findCount = rs.getInt("cnt");
		
		rs.close();
		ptmt.close();
		connection.close();
		return findCount;
	}
	
	
	/**
	 * 유저 번호로 유저가 쓴 리뷰를 모두 가져오기
	 * @param userNo 유저 번호
	 * @return 유저의 모든 리뷰 내용
	 * @throws SQLException
	 */
	public List<Review> getUserAllReviewByNo(int userNo) throws SQLException {
		String sql = "select review_no, review_title, review_review_like_count, review_content, "
					+ "review_created_date, review_star_point "
					+ "from review "
					+ "where user_no = ? ";
		
		List<Review> reviews = new ArrayList<>();
		
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, userNo);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Review review = new Review();
			review.setReviewNo(rs.getInt("review_no"));
			review.setReviewTitle(rs.getString("review_title"));
			review.setReviewReviewLikeCount(rs.getInt("review_review_like_count"));
			review.setReviewContent(rs.getString("review_content"));
			review.setReviewCreatedDate(rs.getDate("review_created_date"));
			review.setReviewStarPoint(rs.getInt("review_star_point"));
			
			reviews.add(review);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return reviews;
	}
	@Override
	public void updateReviewByUserNo(UserTable userTable) throws SQLException {
		String sql = "update user_table "
				+ "set "
				+ " user_order_point = ? "
				+ "where user_no = ? ";
		Connection connection = getConnection();
		PreparedStatement ptmt = connection.prepareStatement(sql);
		ptmt.setInt(1, userTable.getUserOrderPoint());
		ptmt.setInt(2, userTable.getUserNo());
		
		ptmt.executeUpdate();
		
		ptmt.close();
		connection.close();
		
	}
	@Override
	public UserDto getOrderUserByUserNo(int userNo) throws SQLException {
		UserDto userDto = null;
		String sql = "select U.user_no, U.user_id, U.user_password, U.user_name, U.user_age ,U.user_gender, U.user_address, U.user_order_point, U.user_degree, U.user_created_date, U.manager_check, "
				+ "U.user_delete_check, O.order_no, O.order_total_price, O.order_total_point, O.order_use_Point, O.order_real_total_price, O.order_state, O.order_date, O.order_cancel_date, O.order_address, "
				+ "O.order_phone_number, O.order_name, "
				+ "H.history_no, H.history_point_check, H.history_reason, H.history_create_date ,H.history_total_point "
				+ "from User_point_history H, user_table U, orders O "
				+ "where H.user_no(+) = U.user_no "
				+ "and U.user_no = O.user_no(+) "
				+ "and U.user_no = ? ";
	      Connection connection = getConnection();
	      PreparedStatement ptmt = connection.prepareStatement(sql);
	      ptmt.setInt(1, userNo);
	      ResultSet rs = ptmt.executeQuery();
	      if(rs.next()){
	    	  userDto = new UserDto();
	    	  userDto.setUserNo(rs.getInt("user_no"));
	    	  userDto.setUserId(rs.getString("user_id"));
	    	  userDto.setUserPassword(rs.getString("user_password"));
	    	  userDto.setUserName(rs.getString("user_name"));
	    	  userDto.setUserAge(rs.getInt("user_age"));
	    	  userDto.setUserGender(rs.getString("user_gender"));
	    	  userDto.setUserAddress(rs.getString("user_address"));
	    	  userDto.setUserOrderPoint(rs.getInt("user_order_point"));
	    	  userDto.setUserDegree(rs.getString("user_degree"));
	    	  userDto.setUserCreateDate(rs.getDate("user_created_date"));
	    	  userDto.setManagerCheck(rs.getString("manager_check"));
	    	  userDto.setUserDeleteCheck(rs.getString("user_delete_check"));
	    	  userDto.setOrderNo(rs.getInt("order_no"));
	    	  userDto.setOrderTotalPoint(rs.getInt("order_total_point"));
	    	  userDto.setOrderTotalPrice(rs.getInt("order_total_price"));
	    	  userDto.setOrderUsePoint(rs.getInt("order_use_Point"));
	    	  userDto.setOrderRealTotalPrice(rs.getInt("order_real_total_price"));
	    	  userDto.setOrderState(rs.getString("order_state"));
	    	  userDto.setOrderDate(rs.getDate("order_date"));
	    	  userDto.setOrderCancelDate(rs.getDate("order_cancel_date"));
	    	  userDto.setOrderAddress(rs.getString("order_address"));
	    	  userDto.setOrderPhoneNumber(rs.getString("order_phone_number"));
	    	  userDto.setOrderName(rs.getString("order_name"));
	    	  userDto.setHistoryNo(rs.getInt("history_no"));
	    	  userDto.setHistoryPointCheck(rs.getString("history_point_check"));
	    	  userDto.setHistoryReason(rs.getString("history_reason"));
	    	  userDto.setHistoryCreateDate(rs.getDate("history_create_date"));
	    	  userDto.setHistoryTotalPoint(rs.getInt("history_total_point"));
	    	  
	      }
	      
		rs.close();
		ptmt.close();
		connection.close();
		
		return userDto;
	}
	@Override
	public void updateOrderByUserOrderTotalPoint(Orders orders) throws SQLException {
		String sql = "update orders "
				+ "set "
				+ " order_total_point = ? "
				+ "where user_no = ? ";
		Connection connection = getConnection();
		PreparedStatement ptmt = connection.prepareStatement(sql);
		ptmt.setInt(1, orders.getOrderTotalPoint());
		ptmt.setInt(2, orders.getUserTable().getUserNo());
		
		ptmt.executeUpdate();
		
		ptmt.close();
		connection.close();
		
	}
	@Override
	public void insertReviewByUserPointHistory(UserPointHistory point) throws SQLException {
		String sql = "insert into user_point_history (history_no, user_no, history_point_check, history_reason , history_create_date, history_total_point ) "
				+ " values(history_no.nextval, ?, ?, ?, sysdate, ? ) ";
		Connection connection = getConnection();
		PreparedStatement ptmt = connection.prepareStatement(sql);
		ptmt.setInt(1, point.getUserTable().getUserNo());
		ptmt.setString(2,point.getHistoryPointCheck());
		ptmt.setString(3, point.getHistoryReason());
		ptmt.setInt(4, point.getHistoryTotalPoint());
		ptmt.executeUpdate();
		
		ptmt.close();
		connection.close();

	}
	@Override
	public Review getReviewByReviewNo(int reviewNo) throws SQLException {
		Review review = null;
		String sql ="select R.review_no, R.review_title, R.user_no, R.review_review_like_count, R.review_content, R.review_created_date, R.review_star_point,"
				+ " U.user_id, U.user_password, U.user_name, U.user_age, U.user_gender, U.manager_check, "
				+ "	U.user_address, U.user_order_point, U.user_degree, U.user_created_date, U.user_delete_check "
				+ "	from review R, user_table U"
				+ "	where R.review_no = ? "
				+ "	and R.user_no = U.user_no";
		Connection connection = getConnection();
		PreparedStatement ptmt = connection.prepareStatement(sql);
		ptmt.setInt(1, reviewNo);
		ResultSet rs = ptmt.executeQuery();
		review = repeateReview(review, rs);
		rs.close();
		ptmt.close();
		connection.close();
		return review;
	}
	private Review repeateReview(Review review, ResultSet rs) throws SQLException {
		if(rs.next()) {
			review = new Review();
			review.setReviewNo(rs.getInt("review_no"));
			review.setReviewTitle(rs.getString("review_title"));
			UserTable findUser = new UserTable();
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
			review.setUserTable(findUser);
			review.setReviewReviewLikeCount(rs.getInt("review_review_like_count"));
			review.setReviewContent(rs.getString("review_content"));
			review.setReviewCreatedDate(rs.getDate("review_created_date"));
			review.setReviewStarPoint(rs.getInt("review_star_point"));
		}
		return review;
	}
	@Override
	public int getReviewSequence(Connection connection) throws SQLException {
		int ReviewSequence = 0;
		String sql = "select review_no.nextval as review_no from dual";
		
		PreparedStatement ptmt = connection.prepareStatement(sql);
		ResultSet rs = ptmt.executeQuery();
		
		rs.next();
		ReviewSequence = rs.getInt("review_no");
		
		rs.close();
		ptmt.close();
		
		return ReviewSequence;
	}
	@Override
	public Review getReview(int reviewNo, Connection connection) throws SQLException {
		Review review = null;
		String sql = "select review_no, review_title, user_no, review_review_like_count, review_content, review_created_date, review_star_point "
				+ "from review "
				+ "where review_no = ? ";
		PreparedStatement ptmt = connection.prepareStatement(sql);
		ptmt.setInt(1, reviewNo);
		ResultSet rs = ptmt.executeQuery();
		if(rs.next()) {
			review = new Review();
			review.setReviewNo(rs.getInt("review_no"));
			review.setReviewTitle(rs.getString("review_title"));
			UserTable user = new UserTable();
			user.setUserNo(rs.getInt("user_no"));
			review.setUserTable(user);
			review.setReviewReviewLikeCount(rs.getInt("review_review_like_count"));
			review.setReviewContent(rs.getString("review_content"));
			review.setReviewCreatedDate(rs.getDate("review_created_date"));
			review.setReviewStarPoint(rs.getInt("review_star_point"));
		}
		rs.close();
		ptmt.close();
		return review;
	}
	
	
	

}
