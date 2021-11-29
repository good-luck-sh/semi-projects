<%@page import="vo.Review"%>
<%@page import="dao.ReviewJdbcDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>리뷰 확인 하기</title>
</head>
<body>
<%@ include file="../navbar/nav.jsp" %>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	int category = Integer.parseInt(request.getParameter("category"));
	
	//if(loginUserInfo == null) {
	//	response.sendRedirect("../loginform.jsp?error=empty")
	//	return;
	//} 나중에 loginform을 입력한다. 
	
	ReviewJdbcDao reviewDao = ReviewJdbcDao.getInstance();
	Review review = reviewDao.getReviewById(no);
	//해당리뷰의 번호의 경우 
	
	int Like = review.getReviewReviewLikeCount() + 1;
	review.setReviewReviewLikeCount(Like);
	
	
%>
<div class ="container mt-3">
		<div class="row p-3">
			<div class="col">
				<table class="table">
					<tbody>
						<tr class="d-flex">
							<th class="col-2">번호</th>
							<td class="col-4">100</td>
							<th class="col-2">작성자</th>
							<td class="col-4">김쭝찌</td>
						</tr>
						<tr class="d-flex">
							<th class="col-2">조회수</th>
							<td class="col-4">0</td>
<!-- 만약 작성자가 확인할 경우 좋아요가 표시되지 않게, 설정한다. 그리고
	int Like = review.getReviewReviewLikeCount() + 1;
	review.setReviewReviewLikeCount(reviewReviewLikeCount);
	이부분추가 후 update진행
  -->
							<th class="col-2">좋아요</th>
							<td class="col-4">0</td>
						</tr>
						<tr class="d-flex">
<!-- 여기에 만약 update date가 존재할 경우인 if문으로 구별한다.  -->
							<th class="col-2">생성일</th>
							<td class="col-4">2021.11.27</td>
							<th class="col-2">수정일</th>
							<td class="col-4">2021.11.27</td>
							<th class="col-2">내용</th>
							<td class="col-4">불라불라</td>
						</tr>
					</tbody>
				</table>
<%
//작성자에게 수정과 삭제와 목록이 보이게 작성하기 
//아닐 경우는 목록만 확인되도록 작성한다. 
%>
				<div class="text-right">
					<a href="update.jsp?no=" class="btn warning">수정</a> <a href="delete.jsp" class="btn danger">삭제</a>
					<a href="detail.jsp?no=" class="btn primary">목록</a>
				</div>
			</div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> 
</body>
</html>