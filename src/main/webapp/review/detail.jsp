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
//	int no = Integer.parseInt(request.getParameter("no"));
//	String pageNo = request.getParameter("pageNo");
	
	ReviewJdbcDao reviewDao = ReviewJdbcDao.getInstance();
//	List<Review> reviews = reviewDao.getAllReviewById(loginUserInfo.getUserNo());
	if("complete".equals(text)) {
%>
	<div class="alert alert-primary">
		<strong>리뷰 등록 성공</strong>리뷰 감사합니다.
	</div>
<%
	}
%>
<div class ="container mt-3">
	<div class="row p-3">
		<div class="col">
			<p><strong>작성자님</strong>의 게시글입니다.</p>
			<table class="table">
				<thead>
					<tr class="black">
						<th>리뷰 번호</th>
						<th>리뷰 제목</th>
						<th>조회수</th>
						<th>좋아요</th>
						<th>리뷰 내용</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
<%
//	for(Review review : reviews) {
%>
					<tr>
						<td>100</td>
						<td><a href="reviewUserDetail.jsp">제목</a></td><!-- 클릭시 제목으로 들어가도록 쿼리짜기 -->
						<td>0</td>
						<td>0</td>
						<td>나는 그렇지 않아!</td>
						<td>2021.11.29</td>
					</tr>
<%
//	}
%>
					<tr>
						<td>100</td>
						<td>제목</td><!-- 클릭시 제목으로 들어가도록 쿼리짜기 -->
						<td>0</td>
						<td>0</td>
						<td>나는 그렇지 않아!</td>
						<td>2021.11.29</td>
					</tr>
					<tr>
						<td>100</td>
						<td>제목</td><!-- 클릭시 제목으로 들어가도록 쿼리짜기 -->
						<td>0</td>
						<td>0</td>
						<td>나는 그렇지 않아!</td>
						<td>2021.11.29</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> 
</body>
</html>