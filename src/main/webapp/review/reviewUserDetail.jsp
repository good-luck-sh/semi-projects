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
	int cpno = Integer.parseInt(request.getParameter("cpno"));
	
	if(loginUserInfo == null) {
		response.sendRedirect("../loginform.jsp?error=empty");
		return;
	} //나중에 loginform을 입력한다. 
	
	ReviewJdbcDao reviewDao = ReviewJdbcDao.getInstance();
	Review review = reviewDao.getReviewById(loginUserInfo.getUserNo());
	//loginUser를 받으면 int부분에 no를 넣기 지금은 test용
	
%>
<div class ="container mt-3">
		<div class="row p-3">
			<div class="col">
				<table class="table">
					<colgroup>
						<col width="10%">
						<col width="40%">
						<col width="10%">
						<col width="40%">
					</colgroup>
					<tbody>
						<tr>
							<th>번호</th>
							<td><%=review.getReviewNo()%></td>
							<th>작성자</th>
							<td><%=review.getUserTable().getUserName() %></td>
						</tr>
						<tr>
							<th>별점</th>
							<td><%=review.getReviewStarPoint() %></td>
 							<th><a href="like.jsp?reviewNo=<%=review.getReviewNo()%>&no=<%=no%>&cpno=<%=cpno%>">좋아요</a></th>
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
	//if(loginUserInfo.getUserNo() == review.getUserTable().getUserNo()) { 나중에 login정보받으면 해제하기
		
%>
					<a href="update.jsp?no=<%=no %>&reviewNo=<%=review.getReviewNo() %>&cpno=<%=cpno %>" class="btn warning">수정</a> 
					<a href="delete.jsp?no=<%=no %>&reviewNo=<%=review.getReviewNo() %>&cpno=<%=cpno %>" class="btn danger">삭제</a>
<%
//	}
%>
					<a href="detail.jsp?no=<%=no %>" class="btn primary">목록</a>
				</div>
			</div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> 
</body>
</html>