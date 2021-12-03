
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
	 * 상품번호로 상품정보 찾기
	 * @param productNo 상품번호
	 * @return 상품정보
	 * @throws SQLException
	 */
	public Product getProductByProductNo(int productNo) throws SQLException {
	      String sql = "select product_no , category_no, product_name, product_price, "
	            + "product_discount_price, product_stock, product_on_sale, product_picture "
	            + "from product "
	            + "where product_no = ? "
	            + "order by product_no asc ";
	      Product product = null;
	      
	      Connection connection = getConnection();
	      PreparedStatement pstmt = connection.prepareStatement(sql);
	      pstmt.setInt(1, productNo);
	      ResultSet rs = pstmt.executeQuery();
	      
	      if(rs.next()) {
	         product = new Product();
	         product.setProductNo(rs.getInt("product_no"));
	         product.setProductName(rs.getString("product_name"));
	         product.setProductPrice(rs.getInt("product_price"));
	         product.setProductDiscountPrice(rs.getInt("product_discount_price"));
	         product.setProductStock(rs.getInt("product_stock"));
	         product.setProductOnSale(rs.getString("product_on_sale"));
	         product.setProductPicture(rs.getString("product_picture"));
	         
	         Categorys category = new Categorys();
	         category.setCategorysNo(rs.getInt("category_no"));
	         product.setCategorys(category);
	         
	      }
	      
	      rs.close();
	      pstmt.close();
	      connection.close();
	      
	      return product;
	   }


   
   /**
    * 
    * @param productNo
    * @throws SQLException
    */
   public void deleteProduct(int productNo) throws SQLException {
      String sql = "delete "
               +"from product "
               +"where product_no = ? ";
      
      Connection connection = getConnection();
       PreparedStatement pstmt = connection.prepareStatement(sql);
       pstmt.setInt(1, productNo);
       pstmt.executeQuery();
       
       pstmt.close();
       connection.close();
   }
   
   
   /**
    * 카테고리 번호에 해당하는 상품정보 리스트
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
       * 해당상품번호에 해당하는 상품정보 리스트
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
       * 카테고리번호에 해당하는 상품정보 반환 
       * @param cateogorys_no
       * @return
       * @throws SQLException
       */
      public Product selectProductByCategorys(int cateogorys_no) throws SQLException {
         Product product = null;
         String sql = "select P.product_no, P.product_name, P.product_price, P.product_discount_price, P.product_stock, P.Product_on_sale, "
                  +"       P.category_no, C.categorys_name "
                  +"from product P, categorys C "
                  +"where P.category_no = C.categorys_no "
                  +"and P.category_no = ? ";
         
         Connection connection = getConnection();
         PreparedStatement pstmt = connection.prepareStatement(sql);
         pstmt.setInt(1, cateogorys_no);
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
    * 모든 상품정보 리스트를 가져온다.
    * @return   상품정보
    * @throws SQLException
    */
   public List<Product> selectAllProduct() throws SQLException {
      List<Product> products = new ArrayList<>();
      String sql = "select P.product_no, P.product_name, P.category_no, C.categorys_name, "
               + "P.product_price, P.product_discount_price, P.product_stock, P.product_on_sale "
               + "from product P, categorys C "
               + "where P.category_no = C.categorys_no "
               + "order by P.product_no asc ";
      Connection connection = getConnection();
      PreparedStatement pstmt = connection.prepareStatement(sql);
      ResultSet rs = pstmt.executeQuery();
      while (rs.next()) {
         Product product = new Product();
         product.setProductNo(rs.getInt("product_no"));
         product.setProductName(rs.getString("product_name"));
         product.setProductPrice(rs.getInt("product_price"));
         product.setProductDiscountPrice(rs.getInt("product_discount_price"));
         product.setProductStock(rs.getInt("product_stock"));
         product.setProductOnSale(rs.getString("product_on_sale"));
         
         Categorys category = new Categorys();
         category.setCategorysNo(rs.getInt("category_no"));
         category.setCategorysName(rs.getNString("categorys_name"));
         product.setCategorys(category);
         
         products.add(product);
      }
      rs.close();
      pstmt.close();
      connection.close();
      
      return products;
   }
   
   /**
    * 상품번호에 해당하는 상품정보를 가져온다.
    * @param productNo
    * @return   상품정보
    * @throws SQLException
    */
   public Product selectProductByNo(int productNo) throws SQLException {
      Product product = null;
      String sql = "select P.product_no, P.product_name, P.product_price, P.product_discount_price, P.product_stock, P.Product_on_sale, "
               +"       P.category_no, C.categorys_name, P.product_picture "
               +"from product P, categorys C "
               +"where P.category_no = C.categorys_no "
               +"and P.product_no = ? ";
      
      Connection connection = getConnection();
      PreparedStatement pstmt = connection.prepareStatement(sql);
      pstmt.setInt(1, productNo);
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
    * 상품 이름에 해당하는 상품정보를 가져온다.
    * @param productName 상품이름
    * @return 상품이름, null이 반환될 수 있다.
    * @throws SQLException
    */
   public Product selectProductByName(String productName) throws SQLException {
      Product product = null;
      String sql = "select P.product_no, P.product_name, P.product_price, P.product_discount_price, P.product_stock, P.Product_on_sale, "
               +"       P.category_no, C.categorys_name "
               +"from product P, categorys C "
               +"where P.category_no = C.categorys_no "
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
    * 새로운 상품을 저장한다.
    * @param product 상품정보
    * @throws SQLException
    */
   public void insertProduct(Product product) throws SQLException{
      String sql = "insert into product (product_no, product_name, category_no, product_price, product_discount_price, product_stock, product_on_sale, product_picture) "
               +"values (product_no.nextval, ?, ?, ?, ?, ?, ?, ?) ";
      
      Connection connection = getConnection();
      PreparedStatement pstmt = connection.prepareStatement(sql);
      pstmt.setString(1, product.getProductName());
      pstmt.setInt(2, product.getCategorys().getCategorysNo());
      pstmt.setInt(3, product.getProductPrice());
      pstmt.setInt(4, product.getProductDiscountPrice());
      pstmt.setInt(5, product.getProductStock());
      pstmt.setString(6, product.getProductOnSale());
      pstmt.setString(7, product.getProductPicture());
      
      pstmt.executeUpdate();
      
      pstmt.close();
      connection.close();
   }
   
   
   /**
    * 상품정보 업데이트 
    * @param product 상품정보
    * @throws SQLException
    */
   public void updateProduct(Product product) throws SQLException {
      String sql = "update product "
               +" set "
               +"    product_name = ?, "
               +"    product_price = ?, "
               +"  product_discount_price = ?, "
               +"  product_stock = ?, "
               +"  product_on_sale = ?, "
               +"  product_picture = ? "
               +" where product_no = ? ";
      
      Connection connection = getConnection();
      PreparedStatement pstmt = connection.prepareStatement(sql);
      pstmt.setString(1, product.getProductName());
      pstmt.setInt(2, product.getProductPrice());
      pstmt.setInt(3, product.getProductDiscountPrice());
      pstmt.setInt(4, product.getProductStock());
      pstmt.setString(5, product.getProductOnSale());
      pstmt.setString(6, product.getProductPicture());
      pstmt.setInt(7, product.getProductNo());
      pstmt.executeUpdate();
         
      pstmt.close();
      connection.close();
   }
               

   
   /**
    * 쓰기 귀찮은거 미리 만들어 두기
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
      category.setCategorysNo(rs.getInt("category_no"));
      category.setCategorysName(rs.getString("categorys_name"));
      product.setCategorys(category);
      
      return product;
   }
   
   
   
   
   
   
   
   
   
   
}
