package vo;

import java.util.Date;

public class Product {
	
	private int productNo;
	private Categorys categorys;
	private String productName;
	private int productPrice;
	private int productDiscountPrice;
	private int productStock;
	private String productOnSale;
	private int productReviewCount;
	private int prdocutStarPoint;
	private Date productDate;
	private String productPicture;
	
	public String getProductPicture() {
		return productPicture;
	}

	public void setProductPicture(String productPicture) {
		this.productPicture = productPicture;
	}

	public Product() {}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public Categorys getCategorys() {
		return categorys;
	}

	public void setCategorys(Categorys categorys) {
		this.categorys = categorys;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getProductDiscountPrice() {
		return productDiscountPrice;
	}

	public void setProductDiscountPrice(int productDiscountPrice) {
		this.productDiscountPrice = productDiscountPrice;
	}

	public int getProductStock() {
		return productStock;
	}

	public void setProductStock(int productStock) {
		this.productStock = productStock;
	}

	public String getProductOnSale() {
		return productOnSale;
	}

	public void setProductOnSale(String productOnSale) {
		this.productOnSale = productOnSale;
	}

	public int getProductReviewCount() {
		return productReviewCount;
	}

	public void setProductReviewCount(int productReviewCount) {
		this.productReviewCount = productReviewCount;
	}

	public int getPrdocutStarPoint() {
		return prdocutStarPoint;
	}

	public void setPrdocutStarPoint(int prdocutStarPoint) {
		this.prdocutStarPoint = prdocutStarPoint;
	}

	public Date getProductDate() {
		return productDate;
	}

	public void setProductDate(Date productDate) {
		this.productDate = productDate;
	}
	
	
}
