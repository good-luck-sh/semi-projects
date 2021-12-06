<%@page import="dto.OrderDto"%>
<%@page import="dao.OrderReviewJdbcDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="dto.ProductDto"%>
<%@page import="vo.Orders"%>
<%@page import="vo.UserPointHistory"%>
<%@page import="dao.UserPointHistoryDao"%>
<%@page import="java.util.List"%>
<%@page import="dto.UserDto"%>
<%@page import="vo.Product"%>
<%@page import="dao.UserDao"%>
<%@page import="dao.ProductReviewJdbcDao"%>
<%@page import="vo.Review"%>
<%@page import="vo.UserTable"%>
<%@page import="dao.ReviewJdbcDao"%>
<%@page import="static utils.ConnectionUtil.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	UserTable loginUserInfo = (UserTable)session.getAttribute("LOGIN_USER_INFO");
	
	int orderNo = Integer.parseInt(request.getParameter("orderNo"));
	int productNo = Integer.parseInt(request.getParameter("productNo"));
	int ordercheck = Integer.parseInt(request.getParameter("ordercheck"));
	
	String title = request.getParameter("reviewTitle");
	String text = request.getParameter("reviewText");
	int star = Integer.parseInt(request.getParameter("star"));
	
	int totalorder =+ ordercheck;
	//주문한번씩 진행시 order이 1씩 증가가 된다.
	ReviewJdbcDao reviewDao = ReviewJdbcDao.getInstance();
	if(loginUserInfo == null) {
		response.sendRedirect("../main/loginform.jsp?error=empty");
		return;
	}
	if(title != null && title.isBlank()) {//title이 null이 아니고,title의 값이 비어있으면
		response.sendRedirect("form.jsp?error=reviewTitle");
		return;
	}
	if(text != null && text.isBlank()) {//내용이 null이 아니고, 내용의 값이 비어있으면
		response.sendRedirect("form.jsp?error=reviewText");
		return;
	}
	if(star == 0) {//내용이 null이 아니고, 내용의 값이 비어있으면
		response.sendRedirect("form.jsp?error=noStar");
		return;
	}
		
	Review review = new Review();
	review.setReviewTitle(title);
	review.setReviewContent(text);
	review.setReviewStarPoint(star);
	
	review.setUserTable(loginUserInfo);
	reviewDao.insertReviewById(review);
	//리뷰입력up

	OrderReviewJdbcDao orderDao = OrderReviewJdbcDao.getInstance();
	OrderDto orderDto = orderDao.getAllReviewByOrderNo(orderNo);
	UserPointHistory point = new UserPointHistory();
	point.setUserTable(loginUserInfo);
	String check = "적립";
	String reason = "리뷰 작성";
	point.setHistoryPointCheck(check);
	point.setHistoryReason(reason);
	int getPoint = (int)(orderDto.getOrderRealTotalPrice()*0.01);
	point.setHistoryTotalPoint(getPoint);
	reviewDao.insertReviewByUserPointHistory(point);
	//리뷰 작성포인트 up
	
	Orders orders = new Orders();
	loginUserInfo.setUserOrderPoint(loginUserInfo.getUserOrderPoint() + getPoint);
	orders.setUserTable(loginUserInfo);
	orders.setOrderNo(orderDto.getOrderNo());
	orders.setOrderTotalPoint(orderDto.getOrderTotalPoint() + getPoint);
	//리뷰 totalpoint up
	reviewDao.updateOrderByUserOrderTotalPoint(orders);
	ProductReviewJdbcDao productDao = ProductReviewJdbcDao.getInstance();
	Product product = productDao.getProductByProductNo(productNo);
	
	int productTotalReview = product.getProductReviewCount() + 1;
	product.setProductReviewCount(productTotalReview);
	
	int productTotalStar = (int)(product.getPrdocutStarPoint() + star)/(int)(productTotalReview);
	product.setPrdocutStarPoint(productTotalStar);
	productDao.updateProductByProductNo(product);
	//product 리뷰수와 별점 수 up
	
	response.sendRedirect("detail.jsp?succes=complete&cpno=1");
	
%>