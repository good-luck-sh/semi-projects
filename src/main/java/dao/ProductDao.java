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
	
	public List<Product> getBestProducts() throws SQLException {
		List<Product> productList = new ArrayList<>();
		
		return productList;
	}
	
	
	/**
	 * 해당상품번호에 해당하는 상품정보 가져오기
	 * @param productNo
	 * @return
	 * @throws SQLException
	 */
	public List<Product> selectProductByProductNo(int productNo) throws SQLException {
		String sql = "select product_no , category_no, product_name, product_price, "
				+ "product_discount_price, product_stock, product_on_sale, product_picture "
				+ "from product "
				+ "where product_no = ? "
				+ "order by product_no asc ";
		
		List<Product> productList = new ArrayList<>();
		
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, productNo);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Product product = new Product();
			Categorys category = new Categorys();
			
			product.setProductNo(rs.getInt("product_no"));
			product.setProductName(rs.getString("product_name"));
			product.setProductPrice(rs.getInt("product_price"));
			product.setProductDiscountPrice(rs.getInt("product_discount_price"));
			product.setProductStock(rs.getInt("product_stock"));
			product.setProductOnSale(rs.getString("product_on_sale"));
			product.setProductPicture(rs.getString("product_picture"));
			
			category.setCategorysNo(rs.getInt("category_no"));
			product.setCategorys(category);
			
			productList.add(product);
		}
			rs.close();
			pstmt.close();
			connection.close();
		
		return productList;
	}
	
	
	/**
	 * 모든 상품정보 가져오기
	 * @return
	 * @throws SQLException
	 */
	public List<Product> getAllProducts() throws SQLException {
		String sql = "select product_no , category_no, product_name, product_price, "
				+ "product_discount_price, product_stock, product_on_sale, product_picture "
				+ "from product "
				+ "where category_no = ? "
				+ "order by product_no asc ";
	
	List<Product> productList = new ArrayList<>();
	
	Connection connection = getConnection();
	PreparedStatement pstmt = connection.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()) {
		Product product = new Product();
		Categorys category = new Categorys();
		
		product.setProductNo(rs.getInt("product_no"));
		product.setProductName(rs.getString("product_name"));
		product.setProductPrice(rs.getInt("product_price"));
		product.setProductDiscountPrice(rs.getInt("product_discount_price"));
		product.setProductStock(rs.getInt("product_stock"));
		product.setProductOnSale(rs.getString("product_on_sale"));
		product.setProductPicture(rs.getString("product_picture"));
		
		category.setCategorysNo(rs.getInt("category_no"));
		product.setCategorys(category);
		
		productList.add(product);
	}
		rs.close();
		pstmt.close();
		connection.close();
	
	return productList;
	
	}
	
	/**
	* 카테고리 번호에 해당하는 상품정보 가져오기
	* @param categorysNo 카테고리번호
	* @return 상품정보
	* @throws SQLException
	*/
	public List<Product> getAllProductByCategorysNo(int categorysNo) throws SQLException {
		String sql = "select product_no, category_no, product_name, product_price, "
				+ "product_discount_price, product_stock, product_on_sale, product_picture "
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
		product.setProductPicture(rs.getString("product_picture"));
		
		category.setCategorysNo(rs.getInt("category_no"));
		product.setCategorys(category);

		productList.add(product);
	}

	rs.close();
	pstmt.close();
	connection.close();

	return productList;

	}
	
	/**
	 * 상품 이름에 해당하는 상품정보를 가져온다
	 * @param productName 상품이름
	 * @return 상품이름, null이 반환될 수 있다.
	 * @throws SQLException
	 */
	public Product selectProductByName(String productName) throws SQLException {
		Product product = null;
		String sql = "select p.product_no, p.product_name, p.product_price, p.product_discount_price, p.product_stock, p.Product_on_sale, "
					+"		 p.category_no, c.categorys_name "
					+"from product p, categorys c "
					+"where p.category_no = c.categorys_no "
					+"and P.product_name = ? ";
		
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setString(1, productName);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			product = rowToProduct(rs);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return product;
	}
	
	/**
	 * 귀찮은거 미리만들기
	 * @param rs
	 * @return
	 * @throws SQLException
	 */
	private Product rowToProduct(ResultSet rs) throws SQLException {
		Product product = new Product();
		product.setProductNo(rs.getInt("product_no"));
		product.setProductName(rs.getString("product_name"));
		product.setProductPrice(rs.getInt("product_price"));
		product.setProductDiscountPrice(rs.getInt("product_discount_price"));
		product.setProductStock(rs.getInt("product_stock"));
		product.setProductOnSale(rs.getString("product_on_sale"));
		product.setProductPicture(rs.getString("product_picture"));
		
		Categorys category = new Categorys();
		category.setCategorysNo(rs.getInt("categorys_no"));
		category.setCategorysName(rs.getNString("categorys_name"));
		
		product.setCategorys(category);
		
		return product;
	}

}
