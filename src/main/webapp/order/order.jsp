<%@page import="dao.UserPointHistoryDao"%>
<%@page import="vo.UserPointHistory"%>
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
	String orderName = request.getParameter("orderName");
	String orderAddress = request.getParameter("orderAddress");
	String orderPhoneNumber = request.getParameter("orderPhoneNumber");
	int productNo = Integer.parseInt(request.getParameter("productNo"));
	
	OrderDao orderDao = new OrderDao();
	UserBasketDao userBasketDao = UserBasketDao.getInstance();
	UserPointHistoryDao userPointHistoryDao = UserPointHistoryDao.getInstance();
	
	// 오류 검사 시작
	int orderPoint = Integer.parseInt(request.getParameter("UseAll"));
	int nowUserPoint = Integer.parseInt(request.getParameter("nowPoint"));
	
	if (orderName.isBlank()) {
		response.sendRedirect("order_form.jsp?error=empty-name");
		return;
	} else if (orderAddress.isBlank()) {
		response.sendRedirect("order_form.jsp?error=empty-address");
		return;
	} else if (orderPhoneNumber.isBlank()) {
		response.sendRedirect("order_form.jsp?error=empty-phoneNumber");
		return;
	} else if (nowUserPoint < orderPoint) {
		response.sendRedirect("order_form.jsp?error=point-error");
		return;
	} else if (orderPoint < 0) {
		response.sendRedirect("order_form.jsp?error=point-error2");
		return;
	}
	

	// Orders에 정보 입력
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
	
	int userNo = Integer.parseInt(request.getParameter("userNo"));
	
	// 유저포인트 업데이트
	int nowPoint = Integer.parseInt(request.getParameter("nowPoint"));
	int usePoint = Integer.parseInt(request.getParameter("orderUsePoint"));
	int addPoint = Integer.parseInt(request.getParameter("orderTotalPoint"));
	
	// 포인트 히스토리 생성
	UserPointHistory userPointHistory = new UserPointHistory();
	UserTable userTable = new UserTable();
	userTable.setUserNo(userNo);
	userPointHistory.setUserTable(userTable);
	
	if (usePoint > 1) {
		userPointHistory.setHistoryPointCheck("포인트차감");
		userPointHistory.setHistoryReason("상품 구매시 " +usePoint+ "포인트 사용");
		userPointHistory.setHistoryTotalPoint(nowPoint - usePoint + addPoint);
		userPointHistoryDao.insertPointHistory(userPointHistory);
		System.out.println("포인트차감");
	}
	
	if (addPoint > 1) {
		userPointHistory.setHistoryPointCheck("포인트적립");
		userPointHistory.setHistoryReason("상품 구매후 " +addPoint+ "포인트 적립");
		userPointHistory.setHistoryTotalPoint(nowPoint - usePoint + addPoint);
		userPointHistoryDao.insertPointHistory(userPointHistory);
		System.out.println("포인트적립");
	}
	
	
	
	// 포인트 증감
	userTable.setUserOrderPoint(nowPoint - usePoint + addPoint);
	orderDao.updateUserPoint(userTable);
	
	// 포인트 증가
	//userTable.setUserOrderPoint(nowPoint - usePoint + addPoint);
	//orderDao.updateUserPoint(userTable);
	
	// OrderItem에 정보입력
	OrderItem orderItem = new OrderItem();
	Product product = new Product();
	ProductDao productDao = new ProductDao();
	
	String[] productNos = request.getParameterValues("productNo");
	String[] productAmount = request.getParameterValues("productAmount");
	for(int i = 0; i < productAmount.length; i++){
		int amount = Integer.parseInt(productAmount[i]);
		int numbers = Integer.parseInt(productNos[i]);

		orderDao.insertOrderItem(amount, numbers);
	}
	
	
	// 주문한 상품 재고 감소
	String[] productNo2 = request.getParameterValues("productNo");
	String[] productAmount2 = request.getParameterValues("productAmount");
	for(int i = 0; i < productNo2.length; i++){
		int numbers = Integer.parseInt(productNo2[i]);
		int amount = Integer.parseInt(productAmount2[i]);
		
		orderDao.updateProductStock(amount, numbers);
	}
	
	// 상품 재고 0이하되면 품절로 변경
	String[] productNo3 = request.getParameterValues("productNo");
	for(int i = 0; i < productNo3.length; i++){
		int numbers = Integer.parseInt(productNo3[i]);
		
		orderDao.updateProductOnSale(numbers);
	}
	
	int userNo2 = userTable.getUserNo();
	
	// 주문후 고객등급 변경
	orderDao.updateUserDegreeBronze(userNo, userNo2);
	orderDao.updateUserDegreeSilver(userNo, userNo2);
	orderDao.updateUserDegreeGold(userNo, userNo2);
	orderDao.updateUserDegreeDia(userNo, userNo2);
	
	// 주문 완료후 장바구니 데이터 삭제
	userBasketDao.deleteBasket(userTable.getUserNo());
	
	// 주문 완료후 주문 완료 페이지로 이동
	response.sendRedirect("order_complete.jsp");
	
	
	
	
	
	
	
%>