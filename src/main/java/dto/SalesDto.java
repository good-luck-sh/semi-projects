package dto;

public class SalesDto {
	
	private String orderDate;
	private int totalSales;
	private int usePoint;
	private int realSales;
	
	public SalesDto () {}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public int getTotalSales() {
		return totalSales;
	}

	public void setTotalSales(int totalSales) {
		this.totalSales = totalSales;
	}

	public int getUsePoint() {
		return usePoint;
	}

	public void setUsePoint(int usePoint) {
		this.usePoint = usePoint;
	}

	public int getRealSales() {
		return realSales;
	}

	public void setRealSales(int realSales) {
		this.realSales = realSales;
	}

	@Override
	public String toString() {
		return "OrdersDto [orderDate=" + orderDate + ", totalSales=" + totalSales + ", usePoint=" + usePoint
				+ ", realSales=" + realSales + "]";
	}
	
}
