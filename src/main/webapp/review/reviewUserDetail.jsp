<%@page import="vo.Review"%>
<%@page import="dao.ReviewJdbcDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="../navbar/resource/img.png" type="image/x-icon">
    <title>리뷰 확인 하기</title>
</head>
<body>
<%@ include file="../navbar/nav.jsp" %>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	int cpno = Integer.parseInt(request.getParameter("cpno"));
	String error = request.getParameter("error");
	
	if(loginUserInfo == null) {
		response.sendRedirect("../main/loginform.jsp?error=empty");
		return;
	} 
	if("complete".equals(error)) {
		response.sendRedirect("../main/loginform.jsp?error=empty");
		return;
	} 
	
	ReviewJdbcDao reviewDao = ReviewJdbcDao.getInstance();
	Review review = reviewDao.getReviewById(no);
	
%>
<div class ="container mt-3">
		<div class="row p-3">
			<div class="col">
				<table class="table">
					<colgroup>
						<col width="10%">
						<col width="10%">
						<col width="5%">
						<col width="20%">
						<col width="10%">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th>번호</th>
							<td><%=review.getReviewNo()%></td>
							<th>제목</th>
							<td><%=review.getReviewTitle()%></td>
							
						</tr>
						<tr>
							<th>작성자</th>
							<td><%=review.getUserTable().getUserName() %></td>
							<th>별점</th>
							<td><%=review.getReviewStarPoint() %></td>
<%
	if(loginUserInfo.getUserNo() != (review.getUserTable().getUserNo())) {
%>							
 							<th><a href="like.jsp?reviewNo=<%=review.getReviewNo()%>&no=<%=no%>&cpno=<%=cpno%>">좋아요</a></th>
 <%
	} else {
%>
							<th>좋아요</th>
<% 
	}
 %>						
 							<td><%=review.getReviewReviewLikeCount() %></td>
						</tr>
						<tr>
							<th>생성일</th>
							<td><%=review.getReviewCreatedDate() %></td>
							<th></th>
							<td></td>

						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3"><%=review.getReviewContent() %></td>
						</tr>
					</tbody>
				</table>
				<div class="text-right">
<%
	if(loginUserInfo.getUserNo() == review.getUserTable().getUserNo()) {
		
%>
					<a href="updateForm.jsp?no=<%=no %>&reviewNo=<%=review.getReviewNo() %>&cpno=<%=cpno %>" class="btn btn-warning">수정</a> 
					<a href="delete.jsp?no=<%=no %>&reviewNo=<%=review.getReviewNo() %>&cpno=<%=cpno %>" class="btn btn-danger">삭제</a>
<%
	}
%>
					<a href="detail.jsp?cpno=<%=cpno %>" class="btn btn-primary">내 리뷰보기</a>
				</div>
			</div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> 
</body>
</html>