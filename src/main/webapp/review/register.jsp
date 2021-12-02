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
	
	int order = Integer.parseInt(request.getParameter("order"));
	
	String title = request.getParameter("reviewTitle");
	String text = request.getParameter("reviewText");
	int star = Integer.parseInt(request.getParameter("star"));
	
	order += 1;	//주문한번씩 진행시 order이 1씩 증가가 된다.
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

	
	UserDao user = UserDao.getInstance();
	UserTable findUser = user.getUserAllInfoByNo(loginUserInfo.getUserNo());
	
	review.setUserTable(findUser);
	reviewDao.insertReviewById(review);
	Connection connection = getConnection();
	int reviewNo = reviewDao.getReviewSequence(connection);
	ProductReviewJdbcDao productDao = ProductReviewJdbcDao.getInstance();
	Product product = productDao.getAllReviewByReviewByreviewNo(reviewNo);
	
	int productReview = product.getProductReviewCount() + 1;
	int productStar = (int)( product.getPrdocutStarPoint() + star / order );
	//평균을 구하는 계산방법 
	product.setProductReviewCount(productReview);
	product.setPrdocutStarPoint(productStar);
	productDao.updateProductByProductNo(product);
	
	UserDto users = reviewDao.getOrderUserByUserNo(findUser.getUserNo());
	UserPointHistory point = new UserPointHistory();
	point.setUserTable(findUser);
	String check = "적립";
	String reason = "리뷰 작성";
	point.setHistoryPointCheck(check);
	point.setHistoryReason(reason);
	int getPoint = (int)(users.getOrderRealTotalPrice()*0.01);
	point.setHistoryTotalPoint(getPoint);
	
	reviewDao.insertReviewByUserPointHistory(point);
	
	
	Orders orders = new Orders();
	findUser.setUserOrderPoint(findUser.getUserOrderPoint() + getPoint);
	orders.setUserTable(findUser);
	orders.setOrderNo(users.getOrderNo());
	orders.setOrderTotalPoint(users.getOrderTotalPoint() + getPoint);
	
	reviewDao.updateOrderByUserOrderTotalPoint(orders);
	
	response.sendRedirect("detail.jsp?succes=complete&cpno=1");
	
%>