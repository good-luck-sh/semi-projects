<%@page import="dto.PointHistoryReviewDto"%>
<%@page import="dao.UserPointHistoryDao"%>
<%@page import="vo.UserPointHistory"%>
<%@page import="vo.UserBasket"%>
<%@page import="dao.UserBasketDao"%>
<%@page import="dao.OrderReviewJdbcDao"%>
<%@page import="vo.Product"%>
<%@page import="vo.Review"%>
<%@page import="dto.UserDto"%>
<%@page import="dao.UserDao"%>
<%@page import="dao.ReviewJdbcDao"%>
<%@page import="dto.OrderDto"%>
<%@page import="dto.ProductDto"%>
<%@page import="dao.ProductReviewJdbcDao"%>
<%@page import="dao.ProductReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="../navbar/resource/img.png" type="image/x-icon">
    <title>주문 내역 확인하기</title>
</head>
<body>
<%
	pageContext.setAttribute("menu", "login");
	//네비바 활성화를 위하여 pageContext에서 값을 꺼내온다.
%>
<%@ include file="../navbar/nav.jsp" %>
<div class ="container mt-3">
	<div class="row">
<%
	if(loginUserInfo == null) {
		response.sendRedirect("../main/loginform.jsp?error=empty");
		return;
	}
	ProductReviewJdbcDao productDao = ProductReviewJdbcDao.getInstance();
 	ReviewJdbcDao reviewDao = ReviewJdbcDao.getInstance();
 	OrderReviewJdbcDao orderDao = OrderReviewJdbcDao.getInstance();
 	int orderNo = Integer.parseInt(request.getParameter("orderNo"));
 	int proudctNo = Integer.parseInt(request.getParameter("proudctNo"));
 	
 	OrderDto orderDto = orderDao.getAllReviewByOrderNo(orderNo);
 	Product product = productDao.getProductByProductNo(proudctNo);
 	
 	UserPointHistoryDao userPointDao = UserPointHistoryDao.getInstance();
 	String reasons =  "주문번호 :"+orderNo + "리뷰 작성";
 	PointHistoryReviewDto reviewDto = userPointDao.getAllreviewByReason(reasons);
 			
 		
 	if(reviewDto == null){
%>		
	<div class="row d-flex">	
		<div class="col" >
				<div class="card text-center">
					<div class="card-header">상품 이름 :<strong><%=product.getProductName() %></strong></div>
					<div class="card-body">
						<h5 class="card-title">총 결제 금액 :<%=orderDto.getOrderRealTotalPrice() %></h5>
						<h6 class="card-subtitle mb-2 text-muted">주문 상태:<%=orderDto.getOrderState() %></h6>
						<a href="../review/form.jsp?productNo=<%=proudctNo %>&orderNo=<%=orderDto.getOrderNo() %>" class="btn btn-danger">리뷰 쓰기</a> 
						<a href="../product/detail.jsp?productNo=<%=proudctNo %>" class="btn btn-secondary">상품확인하기</a>
					</div>
				</div>
				</div>
				</div>
<% 	
	} else {
%>				
		<div class="row d-flex">	
		<div class="col" >
				<div class="card text-center">
					<div class="card-header">상품 이름 :<strong><%=product.getProductName() %></strong></div>
					<div class="card-body">
						<h5 class="card-title">총 결제 금액 :<%=orderDto.getOrderRealTotalPrice() %></h5>
						<h6 class="card-subtitle mb-2 text-muted">주문 상태:<%=orderDto.getOrderState() %></h6> 
						<h6 class="card-subtitle mb-2 text-muted">리뷰 작성 완료</h6> 
						<a href="../product/detail.jsp?productNo=<%=proudctNo %>" class="btn btn-secondary">상품확인하기</a>
						<a href="../user/userpointdetail.jsp?<%=loginUserInfo.getUserNo() %>" class="btn btn-primary">나의 적립금 확인하기</a>
					</div>
				</div>
				</div>
				</div>
<%
	}
%>		
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> 
</body>
</html>