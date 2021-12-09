package vo;

public class UserBasket {

	private int userBasketNo;
	private UserTable userTable;
	private Product product;
	private int basketAmount;
	private String userOrder;
	
	public String getUserOrder() {
		return userOrder;
	}

	public void setUserOrder(String userOrder) {
		this.userOrder = userOrder;
	}

	public UserBasket() {}

	public int getUserBasketNo() {
		return userBasketNo;
	}

	public void setUserBasketNo(int userBasketNo) {
		this.userBasketNo = userBasketNo;
	}

	public UserTable getUserTable() {
		return userTable;
	}

	public void setUserTable(UserTable userTable) {
		this.userTable = userTable;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getBasketAmount() {
		return basketAmount;
	}

	public void setBasketAmount(int basketAmount) {
		this.basketAmount = basketAmount;
	}
	
	
}
