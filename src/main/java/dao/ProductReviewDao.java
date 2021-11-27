package dao;

import java.sql.SQLException;
import java.util.List;

import vo.Product;
import vo.Review;

public interface ProductReviewDao {
	/**
	 * 해당하는 리뷰번호에 해당하는 물품을 출력한다.
	 * @param reviewNo 해당하는 리뷰번호
	 * @return 해당하는 물품
	 * @throws SQLException DB Access 오류시 예외가 발생한다. 
	 */
	public Product getAllReviewByReviewNo(int reviewNo) throws SQLException;
	
	
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
}
