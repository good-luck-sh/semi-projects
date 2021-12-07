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
	 * 주문완료후 장바구니 데이터 삭제
	 * @param userNo
	 * @throws SQLException
	 */
	public void deleteBasket(int userNo) throws SQLException {
		String sql = "delete "
					+"from user_basket "
					+"where user_no = ? ";
		
		Connection connection = getConnection();
	    PreparedStatement pstmt = connection.prepareStatement(sql);
	    pstmt.setInt(1, userNo);
	    pstmt.executeQuery();
	    
	    pstmt.close();
	    connection.close();
	}
	
	
	
	public UserBasket getUserBasketBybasketNo(int basketNo) throws SQLException {
		UserBasket basket = null;
		String sql = "select user_basket_no, user_no, product_no, basket_amount "
					+ "from user_basket "
					+ "where user_basket_no = ? ";
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, basketNo);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			basket = new UserBasket();
			basket.setUserBasketNo(rs.getInt("user_basket_no"));
			basket.setBasketAmount(rs.getInt("basket_amount"));
			
			UserTable user = new UserTable();
			user.setUserNo(rs.getInt("user_no"));
			
			Product product = new Product();
			product.setProductNo(rs.getInt("product_no"));
			
			basket.setUserTable(user);
			basket.setProduct(product);
			
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		
		return basket;
	}
	
	
	
	/**
	 * 장바구니의 수량 변경하기
	 * @param userBasket 장바구니
	 * @throws SQLException
	 */
	public void updateBasket (UserBasket userBasket) throws SQLException {
		String sql = "update user_basket "
					+ "set "
					+ "	basket_amount = ? "
					+ "where user_no = ? "
					+ "and product_no = ? ";
		
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, userBasket.getBasketAmount());
		pstmt.setInt(2, userBasket.getUserTable().getUserNo());
		pstmt.setInt(3, userBasket.getProduct().getProductNo());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
		
	}
	
	/**
	 * 장바구니에 상품 추가하기
	 * @param userBasket 장바구니 상품
	 * @throws SQLException
	 */
	public void insertUserBasket (UserBasket userBasket) throws SQLException {
		String sql = "insert into user_basket(user_basket_no, user_no, product_no, basket_amount ) "
					+ "values "
					+ "(user_basket_no.nextval, ?, ?, ? ) ";
		
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1,userBasket.getUserTable().getUserNo());
		pstmt.setInt(2, userBasket.getProduct().getProductNo());
		pstmt.setInt(3, userBasket.getBasketAmount());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
		
	}
	
	
	/**
	 * 유저 번호와 상품 번호를 통해 장바구니에 들어 있는 상품 정보 찾기
	 * @param userNo 유저번호
	 * @param productNo 상품번호
	 * @return
	 * @throws SQLException
	 */
	public UserBasket getUserBasketByuserNoandProductNo (int userNo, int productNo) throws SQLException {
		String sql = "select user_basket_no, user_no, product_no, basket_amount "
					+ "from user_basket "
					+ "where user_no = ? "
					+ "and product_no = ?";
		UserBasket basket = null;
		
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, userNo);
		pstmt.setInt(2, productNo);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			basket = new UserBasket();
			basket.setUserBasketNo(rs.getInt("user_basket_no"));
			basket.setBasketAmount(rs.getInt("basket_amount"));
			
			UserTable user = new UserTable();
			user.setUserNo(rs.getInt("user_no"));
			
			Product product = new Product();
			product.setProductNo(rs.getInt("product_no"));
			
			basket.setUserTable(user);
			basket.setProduct(product);
			
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		
		return basket;
	}
	
	/**
	 * 장바구니에 있는 제품을 삭제한다.
	 * @param basketNo 장바구니 번호
	 * @throws SQLException
	 */
	public void deleteBasketProduct(int basketNo) throws SQLException {
		String sql = "delete from user_basket "
					+ "where user_basket_no = ? ";
		
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, basketNo);
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
		
	}
	
	/**
	 * 유저 번호로 장바구니 속 상품의 모든 정보 구하기
	 * @param userNo 유저 번호
	 * @return 장바구니 상품 정보
	 * @throws SQLException
	 */
	public List<UserBasket> getAllUserBasketItemByNo(int userNo) throws SQLException {
		String sql = "select B.user_basket_no, B.user_no, B.product_no, B.basket_amount, "
					+ "P.product_name, P.product_picture, P.product_price, P.product_discount_price "
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
			product.setProductPicture(rs.getString("product_picture"));
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
