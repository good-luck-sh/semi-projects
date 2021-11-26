package vo;

import java.util.Date;

public class Orders {

	private int orderNo;
	private UserTable userTable;
	private int orderTotalPrice;
	private int orderTotalPoint;
	private int orderUsePoint;
	private int orderRealTotalPrice;
	private String orderState;
	private Date orderDate;
	private Date orderCancelDate;
	private String orderAddress;
	private String orderPhoneNumber;
	private String orderName;
	
	public Orders() {}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public UserTable getUserTable() {
		return userTable;
	}

	public void setUserTable(UserTable userTable) {
		this.userTable = userTable;
	}

	public int getOrderTotalPrice() {
		return orderTotalPrice;
	}

	public void setOrderTotalPrice(int orderTotalPrice) {
		this.orderTotalPrice = orderTotalPrice;
	}

	public int getOrderTotalPoint() {
		return orderTotalPoint;
	}

	public void setOrderTotalPoint(int orderTotalPoint) {
		this.orderTotalPoint = orderTotalPoint;
	}

	public int getOrderUsePoint() {
		return orderUsePoint;
	}

	public void setOrderUsePoint(int orderUsePoint) {
		this.orderUsePoint = orderUsePoint;
	}

	public int getOrderRealTotalPrice() {
		return orderRealTotalPrice;
	}

	public void setOrderRealTotalPrice(int orderRealTotalPrice) {
		this.orderRealTotalPrice = orderRealTotalPrice;
	}

	public String getOrderState() {
		return orderState;
	}

	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public Date getOrderCancelDate() {
		return orderCancelDate;
	}

	public void setOrderCancelDate(Date orderCancelDate) {
		this.orderCancelDate = orderCancelDate;
	}

	public String getOrderAddress() {
		return orderAddress;
	}

	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}

	public String getOrderPhoneNumber() {
		return orderPhoneNumber;
	}

	public void setOrderPhoneNumber(String orderPhoneNumber) {
		this.orderPhoneNumber = orderPhoneNumber;
	}

	public String getOrderName() {
		return orderName;
	}

	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	
	
}
