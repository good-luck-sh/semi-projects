package dao;

import static utils.ConnectionUtil.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.ProductDto;
import vo.Categorys;
import vo.Product;
import vo.Review;
import vo.UserTable;

public class ProductReviewJdbcDao implements ProductReviewDao {
	
	private static ProductReviewJdbcDao self = new ProductReviewJdbcDao();
	private ProductReviewJdbcDao() {}
	public static ProductReviewJdbcDao getInstance() {
		return self;
	}


	@Override
	public ProductDto getAllReviewByReviewNo(int reviewNo) throws SQLException {
		ProductDto product = null;
		String sql = "select "
				+ "R.review_no, R.review_title, R.user_no, R.review_review_like_count, R.review_content, R.review_created_date, R.review_star_point, "
				+ " U.user_id, U.user_password, U.user_name, U.user_age, U.user_gender, U.manager_check, "
				+ "	U.user_address, U.user_order_point, U.user_degree, U.user_created_date, U.user_delete_check, "
				+ "P.product_no, P.category_no, P.product_name, P.product_price , P.product_discount_price, P.product_stock, P.product_on_sale, P.product_review_count, "
				+ "P.product_star_point, P.product_date, P.product_picture "
				+ "	from review R, user_table U, product P, user_basket B "
				+ "	where R.user_no = U.user_no "
				+ "	and U.user_no = B.user_no "
				+ "	and P.product_no = B.product_no "
				+ "	and R.review_no = ? ";
		Connection connection = getConnection();
		PreparedStatement ptmt = connection.prepareStatement(sql);
		ptmt.setInt(1, reviewNo);
		ResultSet rs = ptmt.executeQuery();
		
		if(rs.next()) {
			product = new ProductDto();
			product.setReviewNo(rs.getInt("review_no"));
			product.setReviewTitle(rs.getString("review_title"));
			product.setUserNo(rs.getInt("user_no"));
			product.setUserId(rs.getString("user_id"));
			product.setUserPassword(rs.getString("user_password"));
			product.setUserName(rs.getString("user_name"));
			product.setUserAge(rs.getInt("user_age"));
			product.setUserGender(rs.getString("user_gender"));
			product.setManagerCheck(rs.getString("manager_check"));
			product.setUserAddress(rs.getString("user_address"));
			product.setUserOrderPoint(rs.getInt("user_order_point"));
			product.setUserDegree(rs.getString("user_degree"));
			product.setUserCreateDate(rs.getDate("user_created_date"));
			product.setUserDeleteCheck(rs.getString("user_delete_check"));
			product.setReviewReviewLikeCount(rs.getInt("review_review_like_count"));
			product.setReviewContent(rs.getString("review_content"));
			product.setReviewCreatedDate(rs.getDate("review_created_date"));
			product.setReviewStarPoint(rs.getInt("review_star_point"));
			product.setProductNo(rs.getInt("product_no"));
			product.setProductName(rs.getString("product_name"));
			product.setProductPrice(rs.getInt("product_price"));
			product.setProductDiscountPrice(rs.getInt("product_discount_price"));
			product.setProductStock(rs.getInt("product_stock"));
			product.setProductOnSale(rs.getString("product_on_sale"));
			product.setProductReviewCount(rs.getInt("product_review_count"));
			product.setPrdocutStarPoint(rs.getInt("product_star_point"));
			product.setProductDate(rs.getDate("product_date"));
			product.setProductPicture(rs.getString("product_picture"));
		}
		
		rs.close();
		ptmt.close();
		connection.close();
		
		return product;
	}

	@Override
	public Product getProductByProductNo(int productNo) throws SQLException {
		Product product = null;
		String sql = "select "
				+ " P.product_no, P.category_no, P.product_name, P.product_price , P.product_discount_price, P.product_stock, P.product_on_sale, P.product_review_count, "
				+ " P.star_point, P.product_date, P.product_picture "
				+ "	from product P "
				+ "where P.product_no = ? ";
		Connection connection = getConnection();
		PreparedStatement ptmt = connection.prepareStatement(sql);
		ptmt.setInt(1, productNo);
		ResultSet rs = ptmt.executeQuery();
		
		if(rs.next()) {
			product = new Product();
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
			product.setProductPicture(rs.getString("product_picture"));
		}
		
		rs.close();
		ptmt.close();
		connection.close();
		
		return product;
	}

	@Override
	public void updateProductByProductNo(Product product) throws SQLException {
		String sql = "update product "
				+ "set "
				+ "product_review_count = ?, "
				+ "product_star_point = ? "
				+ "where product_no = ? ";
		Connection connection = getConnection();
		PreparedStatement ptmt = connection.prepareStatement(sql);
		ptmt.setInt(1, product.getProductReviewCount());
		ptmt.setInt(2, product.getPrdocutStarPoint());
		ptmt.setInt(3, product.getProductNo());
		
		ptmt.close();
		connection.close();
	}
	@Override
	public Product getAllReviewByReviewByreviewNo(int reviewNo) throws SQLException {
		Product product = null;
		String sql = "select "
				+ "R.review_no, R.review_title, R.user_no, R.review_review_like_count, R.review_content, R.review_created_date, R.review_star_point, "
				+ " U.user_id, U.user_password, U.user_name, U.user_age, U.user_gender, U.manager_check, "
				+ "	U.user_address, U.user_order_point, U.user_degree, U.user_created_date, U.user_delete_check, "
				+ "P.product_no, P.category_no, P.product_name, P.product_price , P.product_discount_price, P.product_stock, P.product_on_sale, P.product_review_count, "
				+ "P.product_star_point, P.product_date, P.product_picture "
				+ "	from review R, user_table U, product P, user_basket B "
				+ "	where R.user_no = U.user_no "
				+ "	and U.user_no = B.user_no "
				+ "	and P.product_no = B.product_no "
				+ "	and R.review_no = ? ";
		Connection connection = getConnection();
		PreparedStatement ptmt = connection.prepareStatement(sql);
		ptmt.setInt(1, reviewNo);
		ResultSet rs = ptmt.executeQuery();
		
		if(rs.next()) {
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
			product = new Product();
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
		}
		
		rs.close();
		ptmt.close();
		connection.close();
		
		return product;
	}
	@Override
	public List<ProductDto> getAllReviewByProductNo(int productNo) throws SQLException {
		 List<ProductDto> productDtos = new ArrayList<>();
		 String sql = "select R.review_no, R.review_title, R.user_no, R.review_review_like_count, R.review_content, R.review_created_date, R.review_star_point, "
		 		+ "U.user_id, U.user_password, U.user_name, U.user_age, U.user_gender, U.manager_check,"
		 		+ "U.user_address, U.user_order_point, U.user_degree, U.user_created_date, U.user_delete_check, "
		 		+ "P.product_no, P.category_no, P.product_name, P.product_price , P.product_discount_price, P.product_stock, P.product_on_sale, P.product_review_count, "
		 		+ "P.product_star_point, P.product_date, P.product_picture "
		 		+ "from review R, user_table U, product P, user_basket B "
		 		+ "where R.user_no = U.user_no(+) "
		 		+ "and U.user_no = B.user_no(+) "
		 		+ "and P.product_no(+) = B.product_no "
		 		+ "and P.product_no =  ? ";
		 Connection connection = getConnection();
			PreparedStatement ptmt = connection.prepareStatement(sql);
			ptmt.setInt(1, productNo);
			ResultSet rs = ptmt.executeQuery();
			
			while(rs.next()) {
				ProductDto productDto = new ProductDto();
				productDto.setReviewNo(rs.getInt("review_no"));
				productDto.setReviewTitle(rs.getString("review_title"));
				productDto.setUserNo(rs.getInt("user_no"));
				productDto.setUserId(rs.getString("user_id"));
				productDto.setUserPassword(rs.getString("user_password"));
				productDto.setUserName(rs.getString("user_name"));
				productDto.setUserAge(rs.getInt("user_age"));
				productDto.setUserGender(rs.getString("user_gender"));
				productDto.setManagerCheck(rs.getString("manager_check"));
				productDto.setUserAddress(rs.getString("user_address"));
				productDto.setUserOrderPoint(rs.getInt("user_order_point"));
				productDto.setUserDegree(rs.getString("user_degree"));
				productDto.setUserCreateDate(rs.getDate("user_created_date"));
				productDto.setUserDeleteCheck(rs.getString("user_delete_check"));
				productDto.setReviewReviewLikeCount(rs.getInt("review_review_like_count"));
				productDto.setReviewContent(rs.getString("review_content"));
				productDto.setReviewCreatedDate(rs.getDate("review_created_date"));
				productDto.setReviewStarPoint(rs.getInt("review_star_point"));
				productDto.setProductNo(rs.getInt("product_no"));
				productDto.setProductName(rs.getString("product_name"));
				productDto.setProductPrice(rs.getInt("product_price"));
				productDto.setProductDiscountPrice(rs.getInt("product_discount_price"));
				productDto.setProductStock(rs.getInt("product_stock"));
				productDto.setProductOnSale(rs.getString("product_on_sale"));
				productDto.setProductReviewCount(rs.getInt("product_review_count"));
				productDto.setPrdocutStarPoint(rs.getInt("product_star_point"));
				productDto.setProductDate(rs.getDate("product_date"));
				productDto.setProductPicture(rs.getString("product_picture"));
				productDtos.add(productDto);
			}
			
			rs.close();
			ptmt.close();
			connection.close();
			
		return productDtos;
	}

}
