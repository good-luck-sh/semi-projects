package service;

import java.sql.SQLException;
import java.util.List;

import dao.CategoryDao;
import dao.ProductDao;
import vo.Categorys;
import vo.Product;

public class Service {
	
	private final ProductDao productDao = new ProductDao();
	private final CategoryDao categoryDao = new CategoryDao();
	
	private Service() {}
	private static Service service = new Service();
	public static Service getInstance() {
		return service;
	}
	
	/**
	 * 모든 상품카테고리정보를 반환
	 * @return 상품 카테고리 목록
	 * @throws SQLException
	 */
	public List<Categorys> getAllCategorys() throws SQLException {
		return categoryDao.selectAllCategorys();
	}
	
	
	/**
	 * 지정된 카테고리 번호의 카테고리정보를 반환
	 * @param categoryNo 카테고리번호
	 * @return 카테고리정보
	 * @throws SQLException
	 */
	public Categorys getCategoryByNo(int categoryNo) throws SQLException {
		return categoryDao.selectCategoryByNo(categoryNo);
	}
	
	/**
	 * 상품정보를 전달받아서 저장한다
	 * @param product 상품정보
	 * @throws SQLException
	 */
	public void addNewProduct(Product product) throws SQLException {
		Product savedProduct = productDao.selectProductByName(product.getProductName());
		if (savedProduct != null) {
			savedProduct.setProductStock(savedProduct.getProductStock() + product.getProductStock());
			productDao.updateProduct(savedProduct);
			return;
		}
		productDao.insertProduct(product);
	}
	
	public Boolean isNum(String value) {
		String isNumber = value;
		int length = value.length();
		Boolean checked = true;
		for(int i = 0; i < length; i++){
			checked = Character.isDigit(isNumber.charAt(i));
			if(!checked){
				return false;
			}
		}
		return true;
	}

}
