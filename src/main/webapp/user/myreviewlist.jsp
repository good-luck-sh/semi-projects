<%@page import="dao.ReviewJdbcDao"%>
<%@page import="vo.Review"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
    <title>마이 페이지:: 내 리뷰 보기</title>
</head>
<body>
<%
		pageContext.setAttribute("menu", "login");
%>
<%@ include file="../navbar/nav.jsp" %>
<%
	//로그인한 사용자정보가 세션에 존재하지 않으면 마이페이지를 요청할 수 없다.
	// 클라이언트에게 로그인 정보를 입력하는 loginform.jsp를 재요청하는 응답을 보낸다.
	// 재요청 URL에 오류원인을 포함시킨다.
	if (loginUserInfo == null) {
		response.sendRedirect("../main/loginform.jsp?error=login-required");
		return;
	}

%>
<!-- 
	페이지네이션 들어가야함
 -->
<div class="container">
<hr>
	<div class="row mb-3">
		<div class="col">
			<h4>my review</h4>
		</div>
	</div>
<hr>
<%
	int userNo = Integer.parseInt(request.getParameter("no"));
	ReviewJdbcDao rvDao = ReviewJdbcDao.getInstance();
	List<Review> reviewList = rvDao.getUserAllReviewByNo(userNo);
%>
	<div>
		<table class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>별점</th>
					<th>리뷰</th>
					<th>좋아요</th>
					<th>등록날짜</th>
				</tr>
			</thead>
			<tbody>
<%
	for (Review rv : reviewList){
%>
				<tr>
					<td><%=rv.getReviewNo() %></td>
					<td><%=rv.getReviewStarPoint() %> 점</td>
					<td><Strong><%=rv.getReviewTitle() %></Strong>     <%=rv.getReviewContent() %></td>
					<td><%=rv.getReviewReviewLikeCount() %> 개</td>
					<td><%=rv.getReviewCreatedDate() %></td>
				</tr>
<%
	}
%>
			</tbody>
		</table>
	</div>
	<div class="row mb-3">
		<div class="col">
			<a href="detail.jsp" class="btn btn-primary">되돌아가기</a>
		</div>
	</div>


</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>