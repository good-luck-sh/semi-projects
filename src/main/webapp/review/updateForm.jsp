<%@page import="vo.Review"%>
<%@page import="dao.ReviewJdbcDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>수정하기 폼</title>
</head>
<body>
<%
	pageContext.setAttribute("menu", "login");
	//네비바 활성화를 위하여 pageContext에서 값을 꺼내온다.
%>
<%@ include file="../navbar/nav.jsp" %>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	int cpno = Integer.parseInt(request.getParameter("cpno"));	
	int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
	
	if(loginUserInfo == null) {
		response.sendRedirect("../main/loginform.jsp?error=empty");
		return;
	}
	
	ReviewJdbcDao reviewDao = ReviewJdbcDao.getInstance();
	Review review  = reviewDao.getReviewByReviewNo(reviewNo);
%>
<div class ="container">
	<div class="row form-control mt-3">
		<div class="col mb-3 mt-3">
			<h3 class="mb-3">리뷰 수정 폼</h3>
			<p class=""><strong>안녕하세요 :) <%=review.getUserTable().getUserName() %> 회원님</strong></p>
			<p class="">리뷰를 수정하는 입력 폼 입니다.</p>
		</div>
	</div>
	<div class="row mt-3">
			<div class="col">
<%
	String error = request.getParameter("error");	
%>
<%
	if("reviewTitle".equals(error)) {
%>
				<div class="alert alert-danger">
					<strong>리뷰 수정 실패</strong>리뷰의 제목은 필수 입력값입니다.
				</div>
<%
} else if("reviewText".equals(error)) {
%>
				<div class="alert alert-danger">
					<strong>리뷰 수정 실패</strong>리뷰의 내용은 필수 입력값입니다.
				</div>
<%
} else if("noStar".equals(error)) {
%>
				<div class="alert alert-danger">
					<strong>리뷰 수정 실패</strong>별점입력은 필수 입력값입니다.
				</div>
<% 
}
%>
				<form class="well" method="post" action="update.jsp">
				<input type="hidden" name="no" value="<%=no %>">
				<input type="hidden" name="cpno" value="<%=cpno %>">
				<input type="hidden" name="reviewNo" value="<%=reviewNo %>">
					<div class="mb-3" id="text-review-1">
						<label for="exampleFormControlInput1" class="form-label">리뷰제목</label> 
						<input type="text" class="form-control" name="reviewTitle" value="<%=review.getReviewTitle()%>">
					</div>
					<div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label">작성자</label>
						<input type="text" class="form-control" name="" value="<%=review.getUserTable().getUserName()%>">
					</div>
					<div class="mb-3" id="text-review-2">
						<label class="mb-3">리뷰 내용</label>
						<textarea class="form-control col-sm-5" rows="5" name="reviewText" placeholder="<%=review.getReviewContent()%>"></textarea>
					</div>
					<div>
						<!-- 별점은 한번 입력 후 수정이 되지 않도록 설정하기  -->
					</div>
					<div class="text-end">
						<button class="btn btn-outline-primary" type="submit">수정하기</button>
						<button class="btn btn-outline-danger">
							<a href="detail.jsp?cpno=<%=cpno %>">취소하기</a>
						</button>
						<!-- 취소하면 마이페이지.jsp로 갈 수 있도록 등록하기 -->
					</div>
				</form>
			</div>
		</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> 
</body>
</html>