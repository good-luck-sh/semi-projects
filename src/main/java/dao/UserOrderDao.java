package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.BestItemDto;
import vo.OrderItem;

import static utils.ConnectionUtil.*;

public class UserOrderDao {
	
	/**
	 * 상품별 주문량이 가장높은 5개 의 상품번호, 주문량, 랭킹 정보 반환하기
	 * @return 랭킹 5위까지의 상품정보
	 * @throws SQLException
	 */
	public List<BestItemDto> getProductRankingByAmount() throws SQLException {
		String sql = "select R.ranking, R.amount, P.product_no, P.product_name, P.product_price, "
				   + "       P.product_discount_price, P.product_stock, P.product_on_sale, P.product_picture "
			 	   + "from (select product_no, amount, ranking "
				   + "     from (select product_no, amount, row_number() over (order by amount desc) as ranking "
				   + "           from (select product_no, sum(product_amount) as amount "
				   + "                 from order_item "
				   + "                 group by product_no)) "
				   + "     where ranking <= 5) R, product P "
				   + "where R.product_no = P.product_no "
				   + "order by R.ranking asc ";

		List<BestItemDto> bestOrderItemList = new ArrayList<>();
		
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			BestItemDto bestDto = new BestItemDto();
			
			bestDto.setRanking(rs.getInt("ranking"));
			bestDto.setAmount(rs.getInt("amount"));
			bestDto.setProductNo(rs.getInt("product_no"));
			bestDto.setProductName(rs.getString("product_name"));
			bestDto.setPrice(rs.getInt("product_price"));
			bestDto.setDiscountPrice(rs.getInt("product_discount_price"));
			bestDto.setStock(rs.getInt("product_stock"));
			bestDto.setOnSale(rs.getString("product_on_sale"));
			bestDto.setPicture(rs.getString("product_picture"));
			
			bestOrderItemList.add(bestDto);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return bestOrderItemList;
	}
	
}
