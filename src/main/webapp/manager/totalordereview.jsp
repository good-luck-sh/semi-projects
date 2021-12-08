<%@page import="dto.OrderDto"%>
<%@page import="vo.Product"%>
<%@page import="dao.ProductReviewJdbcDao"%>
<%@page import="vo.Pagination"%>
<%@page import="vo.Review"%>
<%@page import="dao.ReviewJdbcDao"%>
<%@page import="dao.OrderReviewJdbcDao"%>
<%@page import="dao.OrderReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="../navbar/resource/img.png" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>주문 리뷰 확인하기</title>
</head>
<body>
<%
	pageContext.setAttribute("menu", "login");
	//네비바 활성화를 위하여 pageContext에서 값을 꺼내온다.
%>
<%@ include file="../navbar/nav.jsp" %>
<%
	if(loginUserInfo == null) {
		response.sendRedirect("../main/loginform.jsp?error=empty");
		return;
	}
	if(loginUserInfo.getManagerCheck() == null) {
		response.sendRedirect("../main/loginform.jsp?error=login-required");
	}
	int cpno = Integer.parseInt(request.getParameter("cpno"));

%>
	

<div class ="container mt-3">
	<div class="row p-3">
		<div class="col">
			<p><strong>주문</strong>후 작성한 리뷰 게시글입니다.</p>
			<table class="table">
				<thead>
					<tr class="black">
						<th>리뷰 제목</th>
						<th>작성자</th>
						<th>상품 이름</th>
						<th>좋아요</th>
						<th>별점</th>
						<th>리뷰 내용</th>
						<th>주문 날짜</th>
					</tr>
				</thead>
				<tbody>
<%
	OrderReviewJdbcDao orderDto = OrderReviewJdbcDao.getInstance();
	ReviewJdbcDao reviewDao = ReviewJdbcDao.getInstance();
	int totalReview = reviewDao.getAllOrderReview();
	Pagination paging = new Pagination(request.getParameter("cpno"),totalReview);
	List<OrderDto> reviews = orderDto.getAllReview(paging.getBegin(), paging.getEnd());
	
	ProductReviewJdbcDao productDao = ProductReviewJdbcDao.getInstance();		
	for(OrderDto review : reviews) {
		Product product = productDao.getAllReviewByReviewByreviewNo(review.getReviewNo());
%>
					<tr>
						<td><%=review.getReviewTitle() %></td>
						<td><a href="userReview.jsp?no=<%=review.getOrderNo()%>&cpno=<%=paging.getPageNo() %>"><%=review.getUserName() %></a></td>
						<td><a href="../product/detail.jsp?productNo=<%=product.getProductNo() %>"><%=product.getProductName() %></a></td>
						<td><%=review.getReviewReviewLikeCount() %></td>
						<td><%=review.getReviewStarPoint() %></td>
						<td><%=review.getReviewContent() %></td>
						<td><%=review.getOrderDate() %></td>
					</tr>
<%
	}
%>
				</tbody>
			</table>
		</div>
	</div>
</div>
<div class="row text-center" style="justify-content: center;">
		<div class="col ">
			<div class="">
<%
	if(paging.getPrevPage() != 0) {
%>
				<!-- 이전페이지가 0일 경우 disable이 실행된다.  -->
				<a href="totalordereview.jsp?cpno=<%=paging.getPrevPage() %>" class="<%=paging.getPrevPage() == 0 ? "disable" : ""%>">이전</a>
<%
	}
%>
<%
	for(int pno = paging.getBeginPage(); pno<=paging.getEndPage(); pno++ ) {
		if(pno > 0) {
%>
				<a href="totalordereview.jsp?cpno=<%=pno %>" class="<%=pno == paging.getPageNo() ? "disable" : ""%>"><%=pno%></a>
<%
	}}
%>
<%
	if(paging.getEndPage() != 0 ){
%>
				<!-- 다음페이지가 동일할 경우 disable이 실행된다. -->
				<a href="totalordereview.jsp?cpno=<%=paging.getNextPage() %>" class="<%=paging.getNextPage() == paging.getPageNo() ? "disable" : ""%>">다음</a>
<%
	}
%>
			</div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> 
</body>
</html>