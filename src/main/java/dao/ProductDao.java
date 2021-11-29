package dao;

import static utils.ConnectionUtil.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.Categorys;
import vo.Product;

public class ProductDao {

	/**
	* 카테고리 번호에 해당하는 상품정보 가져오기
	* @param categorysNo 카테고리번호
	* @return 상품정보
	* @throws SQLException
	*/
	public List<Product> getAllProductByCategorysNo(int categorysNo) throws SQLException {
		String sql = "select product_no , product_name, product_price, "
				+ "product_discount_price, product_stock, product_on_sale, category_no "
				+ "from product "
				+ "where category_no = ? "
				+ "order by product_no asc ";
		List<Product> productList = new ArrayList<>();

	Connection connection = getConnection();
	PreparedStatement pstmt = connection.prepareStatement(sql);
	pstmt.setInt(1, categorysNo);
	ResultSet rs = pstmt.executeQuery();

	while (rs.next()) {
		Product product = new Product();
		Categorys category = new Categorys();
		
		product.setProductNo(rs.getInt("product_no"));
		product.setProductName(rs.getString("product_name"));
		product.setProductPrice(rs.getInt("product_price"));
		product.setProductDiscountPrice(rs.getInt("product_discount_price"));
		product.setProductStock(rs.getInt("product_stock"));
		product.setProductOnSale(rs.getString("product_on_sale"));
		
		category.setCategorysNo(rs.getInt("category_no"));
		product.setCategorys(category);
		
		productList.add(product);
	}
	
	rs.close();
	pstmt.close();
	connection.close();

	return productList;

	}
}
