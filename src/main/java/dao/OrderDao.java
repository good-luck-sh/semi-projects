package dao;

import static utils.ConnectionUtil.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.OrderItem;
import vo.Orders;
import vo.Product;
import vo.UserBasket;
import vo.UserTable;

public class OrderDao {
	
	
	/**
	 * 주문번호에 해당하는 실제 결제금액을 조회하기
	 * @param orderNo
	 * @return
	 * @throws SQLException
	 */
	public Orders selectOrdersPriceByOrderNo(int userNo) throws SQLException {
		Orders orders = null;
		String sql = "select order_real_total_price "
					+"from orders "
					+"where order_no = (select max(order_no) "
					+"				    from orders "
					+"				    where user_no = ?) ";
		
		Connection connection = getConnection();
        PreparedStatement pstmt = connection.prepareStatement(sql);
        pstmt.setInt(1, userNo);
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
        	orders = new Orders();
        	orders.setOrderRealTotalPrice(rs.getInt("order_real_total_price"));
        }
        
        rs.close();
	    pstmt.close();
	    connection.close();
		
		return orders;
	}
	
	/**
	 * 유저번호에 해당하는 포인트 업데이트
	 * @param userTable
	 * @throws SQLException
	 */
	public void updateUserPoint(UserTable userTable) throws SQLException {
	      String sql = "update user_table "
	    		  	 + "set "
	                 + "	user_order_point = ? "
	                 + "where user_no = ? ";
	      
	      Connection connection = getConnection();
	      PreparedStatement pstmt = connection.prepareStatement(sql);
	      pstmt.setInt(1, userTable.getUserOrderPoint());
	      pstmt.setInt(2, userTable.getUserNo());
	      pstmt.executeUpdate();
	         
	      pstmt.close();
	      connection.close();
	   }
	
	
	
	
	/**
	 * 유저번호로 바스켓 정보 불러오기
	 * @param userNo
	 * @return
	 * @throws SQLException
	 */
	public UserBasket getProductNoByUserNo(int userNo) throws SQLException {
		 UserBasket userBasket = null;
		 String sql = "select product_no, basket_amount "
				 	+ "from user_basket "
				 	+ "where user_no = ? ";
		 
		 Connection connection = getConnection();
		 PreparedStatement pstmt = connection.prepareStatement(sql);
		 pstmt.setInt(1, userNo);
		 ResultSet rs = pstmt.executeQuery();
		 if(rs.next()) {
			userBasket = new UserBasket();
			userBasket.setBasketAmount(rs.getInt("basket_amount"));
			
			Product product = new Product();
			product.setProductNo(rs.getInt("product_no"));
			userBasket.setProduct(product);
		 	}
		      
		  rs.close();
		  pstmt.close();
		  connection.close();
	      
	      return userBasket;
	}
	
	
	/**
	 * 새로운 주문정보 저장(ORDER_ITEM 테이블 데이터)
	 * @param orderItem
	 * @throws SQLException
	 */
	public void insertOrderItem(int amount, int numbers) throws SQLException {
		String sql = "insert into order_item (order_item_no, product_no, product_amount) "
					+"values (order_item_no.nextval, ?, ?) ";
		
		Connection connection = getConnection();
	    PreparedStatement pstmt = connection.prepareStatement(sql);
	    pstmt.setInt(1, numbers);
	    pstmt.setInt(2, amount);
	    
	    int a = pstmt.executeUpdate();
	      
	    pstmt.close();
	    connection.close();
	    
	    //성공이면 1이떨어지고 실패면 0 
	    //System.out.println(a);
	}
	
	
	/**
	 * 새로운 주문정보 저장(ORDERS 테이블 데이터)
	 * @param orders
	 * @throws SQLException
	 */
	public void insertOrders(Orders orders) throws SQLException {
		String sql = "insert into orders (order_no, user_no, order_total_price, order_total_point, order_use_point, order_real_total_price, order_address, order_phone_number, order_name) "
					+"values (order_no.nextval, ?, ?, ?, ?, ?, ?, ?, ?) ";
		
		Connection connection = getConnection();
	    PreparedStatement pstmt = connection.prepareStatement(sql);
	    pstmt.setInt(1, orders.getUserTable().getUserNo());
	    pstmt.setInt(2, orders.getOrderTotalPrice());
	    pstmt.setInt(3, orders.getOrderTotalPoint());
	    pstmt.setInt(4, orders.getOrderUsePoint());
	    pstmt.setInt(5, orders.getOrderRealTotalPrice());
	    pstmt.setString(6, orders.getOrderAddress());
	    pstmt.setString(7, orders.getOrderPhoneNumber());
	    pstmt.setString(8, orders.getOrderName());
	    pstmt.executeUpdate();
        
	    pstmt.close();
	    connection.close();
	}
	
}
