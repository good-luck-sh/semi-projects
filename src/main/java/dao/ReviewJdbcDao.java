package dao;

import java.sql.Connection;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import static utils.ConnectionUtil.*;

import vo.Categorys;
import vo.Product;
import vo.Review;
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
		String sql = "select review_no, review_title, user_no, review_review_like_count, review_content, review_created_date, review_star_point "
				+ " user_no, user_id, user_password, user_name, user_age, user_gender, manager_check "
				+ "	user_address, user_order_point, user_degree, user_created_date, user_delete_check "
				+ "from "
				+ "	(select row_number() over(order by R.review_no desc) rn "
				+ " 	R.review_no, R.review_title, R.user_no, R.review_review_like_count, R.review_content, R.review_created_date, R.review_star_point "
				+ "	 	U.user_no, U.user_id, U.user_password, U.user_name, U.user_age, U.user_gender, U.manager_check "
				+ "	 	U.user_address, U.user_order_point, U.user_degree, U.user_created_date, U.user_delete_check "
				+ "		from review R, user_table U "
				+ " 	where R.user_no = U.user_no "
				+ " 	and R.user_no = ? "
				+ "	) "
				+ "where rn >= ? and rs <= ? ";
		Connection connection = getConnection();
		PreparedStatement ptmt = connection.prepareStatement(sql);
		ptmt.setInt(1, userno);
		ptmt.setInt(2, begin);
		ptmt.setInt(3, end);
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
		String sql = "delete from review where reviewNo = ? ";
		Connection connection = getConnection();
		PreparedStatement ptmt = connection.prepareStatement(sql);
		ptmt.setInt(1, reviewNo);
		
		ptmt.executeUpdate();
		
		ptmt.close();
		connection.close();
	}

	@Override
	public Review getReviewById(int reviewNo) throws SQLException {
		Review review = null;
		String sql = "select R.review_no, R.review_title, R.user_no, R.review_review_like_count, R.review_content, R.review_created_date, R.review_star_point "
				+ " U.user_no, U.user_id, U.user_password, U.user_name, U.user_age, U.user_gender, U.manager_check "
				+ "	U.user_address, U.user_order_point, U.user_degree, U.user_created_date, U.user_delete_check "
				+ "from review R, user_table U "
				+ "where R.review_no = ? ";
		Connection connection = getConnection();
		PreparedStatement ptmt = connection.prepareStatement(sql);
		ptmt.setInt(1, reviewNo);
		ResultSet rs = ptmt.executeQuery();
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
		rs.close();
		ptmt.close();
		connection.close();
		return review;
	}

	@Override
	public List<Review> getAllReview(int productNo, int begin, int end) throws SQLException {
		List<Review> reviews = new ArrayList<>();
		String sql = " review_no, review_title, user_no, review_review_like_count, review_content, review_created_date, review_star_point, "
				+ "	 U.user_no, U.user_id, U.user_password, U.user_name, U.user_age, U.user_gender, U.manager_check, "
				+ "	 U.user_address, U.user_order_point, U.user_degree, U.user_created_date, U.user_delete_check, "
				+ "				+ \"	P.product_no, P.category_no, P.product_name, P.product_price , P.product_discount_price, P.product_stock, P.product_on_sale, P.product_review_count, \"\r\n"
				+ "				+ \" P.star_point, P.product_date \""
				+ "from "
				+ "(select row_number() over(order by R.review_no desc) rn,"
				+ " R.review_no, R.review_title, R.user_no, R.review_review_like_count, R.review_content, R.review_created_date, R.review_star_point, "
				+ " U.user_no, U.user_id, U.user_password, U.user_name, U.user_age, U.user_gender, U.manager_check, "
				+ "	U.user_address, U.user_order_point, U.user_degree, U.user_created_date, U.user_delete_check, "
				+ "	P.product_no, P.category_no, P.product_name, P.product_price , P.product_discount_price, P.product_stock, P.product_on_sale, P.product_review_count, "
				+ " P.star_point, P.product_date "
				+ "	from review R, user_table U, product P , user_basket B "
				+ "	where R.user_no = U.user_no "
				+ "	and U.user_no = B.user_no "
				+ "	and P.product_no = B.product_no "
				+ " and P.product_no = ? "
				+ ")"
				+ "where rn >= ? and rn <= ?";
		Connection connection = getConnection();
		PreparedStatement ptmt = connection.prepareStatement(sql);
		ptmt.setInt(1, productNo);
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
			product.setPrdocutStarPoint(rs.getInt("star_point"));
			product.setProductDate(rs.getDate("product_date"));
			reviews.add(review);
			
		}
		
		rs.close();
		ptmt.close();
		connection.close();
		return reviews;
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
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int getCountReviewByProductNo(int productNo) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int getAllCountReview() throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

}
