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
//	pageContext.setAttribute("menu", "login");
	//네비바 활성화를 위하여 pageContext에서 값을 꺼내온다.
%>
<%@ include file="../navbar/nav.jsp" %>
<%
	//if(loginUserInfo == null) {
	//	response.sendRedirect("../loginform.jsp?error=empty");	나중에 로그인유저 form확인 후 수정하기
	//	return;
	//}
	String text = request.getParameter("succes");
	int cpno = Integer.parseInt(request.getParameter("cpno"));
	
	ReviewJdbcDao reviewDao = ReviewJdbcDao.getInstance();
	

	int countTotalReview = reviewDao.getCountReviewByUserNo(1);
	Pagination paging = new Pagination(request.getParameter("cpno"), countTotalReview);
	List<Review> reviews = reviewDao.getAllReviewById(1, paging.getBegin(), paging.getEnd());
	if("complete".equals(text)) {
%>
	<div class="alert alert-primary">
		<strong>리뷰 등록 성공</strong>구매금액의 1%을 적립했습니다.
	</div>
<%
	}
%>
<div class ="container mt-3">
	<div class="row p-3">
		<div class="col">
			<p><strong>작성자님</strong>의 게시글입니다.</p><!-- 나중에 작성자님에는 loginInfo.name으로 입력하기 -->
			<table class="table">
				<thead>
					<tr class="black">
						<th>리뷰 번호</th>
						<th>리뷰 제목</th>
						<th>상품 이름</th><!-- 나중에 상품list연결되게 입력하기 -->
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
		Product product = productDao.getAllReviewByReviewNo(review.getReviewNo());
%>
					<tr>
						<td><%=review.getReviewNo() %></td>
						<td><a href="reviewUserDetail.jsp?no=<%=review.getReviewNo() %>&cpno=<%=paging.getPageNo() %>"><%=review.getReviewTitle() %></a></td><!-- 클릭시 제목으로 들어가도록 쿼리짜기 -->
						<td><a href=""><%=product.getProductName() %></a></td><!-- 클릭시 제목으로 들어가도록 쿼리짜기 -->
						<td><%=review.getReviewReviewLikeCount() %></td><!-- 클릭시 상품list으로 들어가도록 쿼리짜기 -->
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
				<!-- 이전페이지가 0일 경우 disable이 실행된다.  -->
				<a href="detail.jsp?cpno=<%=paging.getPrevPage() %>" class="<%=paging.getPrevPage() == 0 ? "disable" : ""%>">이전</a>
<%
	for(int pno = paging.getBeginPage(); pno<=paging.getEndPage(); pno++ ) {
%>
				<a href="detail.jsp?cpno=<%=pno %> %>" class="<%=pno == paging.getPageNo() ? "disable" : ""%>"><%=pno%></a>
<%
	}
%>
				<!-- 다음페이지가 동일할 경우 disable이 실행된다. -->
				<a href="detail.jsp?cpno=<%=paging.getNextPage() %>" class="<%=paging.getNextPage() == paging.getPageNo() ? "disable" : ""%>">다음</a>
			</div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> 
</body>
</html>