package dao;

import java.sql.SQLException;
import java.util.List;

import dto.OrderDto;
import dto.ProductDto;
import vo.Product;
import vo.Review;

public interface ProductReviewDao {
	/**
	 * 해당하는 유저의 번호를 입력받아 product의 리뷰를 1증가시킨다. 
	 * @param reviewNo 해당하는 리뷰번호
	 * @return 해당하는 물품
	 * @throws SQLException DB Access 오류시 예외가 발생한다. 
	 */
	public ProductDto getAllReviewByReviewNo(int reviewNo) throws SQLException;
	/**
	 * 해당하는 리뷰의 번호를 입력하여 해당하는 product를 출력한다. 
	 * @param reviewNo 찾고자하는 리뷰번호 
	 * @return 해당하는 상품
	 * @throws SQLException DB Access 오류시 예외가 발생한다. 
	 */
	public Product getAllReviewByReviewByreviewNo(int reviewNo) throws SQLException;
	
	/**
	 * 해당하는 유저의 번호를 입력받아서 해당하는 OrderDto를 출력한다. 
	 * @param userNo 찾고자하는 유저의 번호 
	 * @return 해당하는 상품
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	public List<OrderDto> getAllReviewByUserNo(int userNo) throws SQLException;
	
	/**
	 * 상품의 번호를 입력받아서 해당하는 상품을 출력한다. 
	 * @param productNo 출력하고자 하는 상품의 번호
	 * @return 해당하는 상품
	 * @throws SQLException DB Access 오류시 예외가 발생한다. 
	 */
	public Product getProductByProductNo(int productNo) throws SQLException;
	
	/**
	 * 상품의 번호를 입력받아서 해당하는 상품을 업데이트한다. 
	 * @param productNo 수정원하는 상품의 번호
	 * @throws SQLException DB Access 오류시 예외가 발생한다. 
	 */
	public void updateProductByProductNo(Product product) throws SQLException;
	
	/**
	 * 해당하는 상품의 번호를 입력받아서 해당하는 상품의 리뷰를 출력한다. 상품디테일부분에 입력할 것이다. 
	 * @param productNo 해당하는 상품의 번호 
	 * @return 해당하는 상품의 리뷰 
	 * @throws SQLException DB Access 오류시 예외가 발생한다. 
	 */
	public List<ProductDto> getAllReviewByProductNo(int productNo) throws SQLException;
	
	/**
	 * 상품의 모든 내용을 출력한다. 
	 * @return 상품의 모든내용
	 * @throws SQLException DB Access 오류시 예외가 발생한다. 
	 */
	public List<Product> getAllProduct() throws SQLException;
}
