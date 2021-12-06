<%@page import="dao.ProductDao"%>
<%@page import="vo.UserBasket"%>
<%@page import="java.util.List"%>
<%@page import="vo.Product"%>
<%@page import="dao.UserBasketDao"%>
<%@page import="vo.OrderItem"%>
<%@page import="dao.UserDao"%>
<%@page import="vo.Orders"%>
<%@page import="vo.UserTable"%>
<%@page import="dao.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	UserTable loginUserInfo = (UserTable)session.getAttribute("LOGIN_USER_INFO");
	
	int orderTotalPrice = Integer.parseInt(request.getParameter("orderTotalPrice"));
	int orderTotalPoint = Integer.parseInt(request.getParameter("orderTotalPoint"));
	int orderUsePoint = Integer.parseInt(request.getParameter("orderUsePoint"));
	int orderRealTotalPrice = Integer.parseInt(request.getParameter("orderRealTotalPrice"));
	String orderAddress = request.getParameter("orderAddress");
	String orderPhoneNumber = request.getParameter("orderPhoneNumber");
	String orderName = request.getParameter("orderName");
	int productNo = Integer.parseInt(request.getParameter("productNo"));
	int productAmount = Integer.parseInt(request.getParameter("productAmount"));
	
	OrderDao orderDao = new OrderDao();
	UserBasketDao userBasketDao = UserBasketDao.getInstance();

	// insert1
	Orders orders = new Orders();
	orders.setOrderTotalPrice(orderTotalPrice);
	orders.setOrderTotalPoint(orderTotalPoint);
	orders.setOrderUsePoint(orderUsePoint);
	orders.setOrderRealTotalPrice(orderRealTotalPrice);
	orders.setOrderAddress(orderAddress);
	orders.setOrderPhoneNumber(orderPhoneNumber);
	orders.setOrderName(orderName);
	UserDao user = UserDao.getInstance();
	UserTable findUser = user.getUserAllInfoByNo(loginUserInfo.getUserNo());
	orders.setUserTable(findUser);

	orderDao.insertOrders(orders);
	
	
	// insert2
	OrderItem orderItem = new OrderItem();
	ProductDao productDao = new ProductDao();
	Product product = productDao.getProductNoByUserNo(loginUserInfo.getUserNo());
	orderItem.setProduct(product);
	orderItem.setProductAmount(productAmount);
	
	orderDao.insertOrderItem(orderItem);








%>