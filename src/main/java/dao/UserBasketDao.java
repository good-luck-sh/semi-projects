package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static utils.ConnectionUtil.*;

import vo.Product;
import vo.UserBasket;
import vo.UserTable;

public class UserBasketDao {
	
	private static UserBasketDao self = new UserBasketDao();
	private UserBasketDao() {};
	public static UserBasketDao getInstance() {
		return self;
	}
	
	/**
	 * 유저 번호로 장바구니 속 상품의 모든 정보 구하기
	 * @param userNo 유저 번호
	 * @return 장바구니 상품 정보
	 * @throws SQLException
	 */
	public List<UserBasket> getAllUserBasketItemByNo(int userNo) throws SQLException {
		String sql = "select B.user_basket_no, B.user_no, B.product_no, B.basket_amount, "
					+ "P.product_name, P.product_price, P.product_discount_price "
					+ "from user_basket B, product P "
					+ "where B.product_no = P.product_no "
					+ "and B.user_no = ? ";
		
		List<UserBasket> baskets = new ArrayList<>();
		
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, userNo);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			UserBasket basket = new UserBasket();
			basket.setUserBasketNo(rs.getInt("user_basket_no"));
			basket.setBasketAmount(rs.getInt("basket_amount"));
			
			UserTable user = new UserTable();
			user.setUserNo(rs.getInt("user_no"));
			
			Product product = new Product();
			product.setProductNo(rs.getInt("product_no"));
			product.setProductName(rs.getString("product_name"));
			product.setProductPrice(rs.getInt("product_price"));
			product.setProductDiscountPrice(rs.getInt("product_discount_price"));
			
			basket.setUserTable(user);
			basket.setProduct(product);
			
			baskets.add(basket);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return baskets;
	}

}
