<%@page import="dao.UserDao"%>
<%@page import="dao.ProductReviewJdbcDao"%>
<%@page import="vo.Product"%>
<%@page import="vo.Pagination"%>
<%@page import="vo.Review"%>
<%@page import="java.util.List"%>
<%@page import="dao.ReviewJdbcDao"%>
<%@page import="dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>나의 리뷰 확인</title>
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

	String text = request.getParameter("succes");
	String error = request.getParameter("error");
	int cpno = Integer.parseInt(request.getParameter("cpno"));
	
	ReviewJdbcDao reviewDao = ReviewJdbcDao.getInstance();
	UserDao userDao = UserDao.getInstance();
	
	UserTable user = userDao.getUserAllInfoByNo(loginUserInfo.getUserNo());
	int countTotalReview = reviewDao.getCountReviewByUserNo(loginUserInfo.getUserNo());
	Pagination paging = new Pagination(request.getParameter("cpno"), countTotalReview);
	
	List<Review> reviews = reviewDao.getAllReviewById(user.getUserNo(), paging.getBegin(), paging.getEnd());
	
	
	if("complete".equals(text)) {
%>
	<div class="alert alert-primary">
		<strong>리뷰 등록 성공</strong>구매금액의 1%을 적립했습니다.
	</div>
<%
	}

	if("complete".equals(error)) {
%>
	<div class="alert alert-primary">
		<strong>리뷰 삭제 성공</strong>리뷰를 삭제했습니다.
	</div>
<%
	}
%>
<div class ="container mt-3">
	<div class="row p-3">
		<div class="col">
			<p><strong><%=loginUserInfo.getUserName() %>님</strong>의 게시글입니다.</p>
			<table class="table">
				<thead>
					<tr class="black">
						<th>리뷰 번호</th>
						<th>리뷰 제목</th>
						<th>상품 이름</th>
						<th>좋아요</th>
						<th>별점</th>
						<th>리뷰 내용</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
<%
	ProductReviewJdbcDao productDao = ProductReviewJdbcDao.getInstance();
					
	for(Review review : reviews) {
	Product product = productDao.getAllReviewByReviewByreviewNo(review.getReviewNo());
%>
					<tr>
						<td><%=review.getReviewNo() %></td>
						<td><a href="reviewUserDetail.jsp?no=<%=review.getReviewNo() %>&cpno=<%=paging.getPageNo() %>"><%=review.getReviewTitle() %></a></td>
						<td><a href="../product/list_product.jsp"><%=product.getProductName() %></a></td>
						<td><%=review.getReviewReviewLikeCount() %></td>
						<td><%=review.getReviewStarPoint() %></td>
						<td><%=review.getReviewContent() %></td>
						<td><%=review.getReviewCreatedDate() %></td>
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
				<a href="detail.jsp?cpno=<%=paging.getPrevPage() %>" class="<%=paging.getPrevPage() == 0 ? "disable" : ""%>">이전</a>
<%
	}
%>
<%
	for(int pno = paging.getBeginPage(); pno<=paging.getEndPage(); pno++ ) {
		if(pno > 0) {
%>
				<a href="detail.jsp?cpno=<%=pno %>" class="<%=pno == paging.getPageNo() ? "disable" : ""%>"><%=pno%></a>
<%
	}}
%>
<%
	if(paging.getEndPage() != 0 ){
%>
				<!-- 다음페이지가 동일할 경우 disable이 실행된다. -->
				<a href="detail.jsp?cpno=<%=paging.getNextPage() %>" class="<%=paging.getNextPage() == paging.getPageNo() ? "disable" : ""%>">다음</a>
<%
	}
%>
			</div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> 
</body>
</html>