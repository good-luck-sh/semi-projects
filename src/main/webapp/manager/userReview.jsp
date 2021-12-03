<%@page import="dao.OrderReviewJdbcDao"%>
<%@page import="dto.OrderDto"%>
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
	String error = request.getParameter("error");
	
	if(loginUserInfo == null) {
		response.sendRedirect("../main/loginform.jsp?error=empty");
		return;
	} 
	OrderReviewJdbcDao orderDto = OrderReviewJdbcDao.getInstance();
	List<OrderDto> orders = orderDto.getAllReviewByOrder(no);
	
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
<%
	for(OrderDto order : orders) {
		if(order.getReviewReviewLikeCount() > 10) { //좋아요가 11개 이상이면
%>
						<tr>
							<th><mark>번호</mark></th>
							<td><strong><%=order.getOrderNo()%></strong></td>
							<th>작성자</th>
							<td><strong><%=order.getUserName() %></strong><</td>
						</tr>
						<tr>
							<th>별점</th>
							<td><%=order.getReviewStarPoint() %></td>
							<th>좋아요</th>
							<td><%=order.getReviewReviewLikeCount() %><span class="badge rounded-pill bg-danger">hit</span></td>
						</tr>
						<tr>
							<th>주문일</th>
							<td><%=order.getOrderDate() %></td>
							<th>작성일</th>
							<td><%=order.getReviewCreatedDate() %></td>

						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3"><%=order.getReviewContent() %></td>
						</tr>
<%
		} else {
%>
							<tr>
							<th>번호</th>
							<td><%=order.getOrderNo()%></td>
							<th>작성자</th>
							<td><%=order.getUserName() %></td>
						</tr>
						<tr>
							<th>별점</th>
							<td><%=order.getReviewStarPoint() %></td>
							<th>좋아요</th>
							<td><%=order.getReviewReviewLikeCount() %></td>
						</tr>
						<tr>
							<th>주문일</th>
							<td><%=order.getOrderDate() %></td>
							<th>작성일</th>
							<td><%=order.getReviewCreatedDate() %></td>

						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3"><%=order.getReviewContent() %></td>
						</tr>
<%
	} }
%>
					</tbody>
				</table>
				<div class="text-right">
					<a href="totalordereview.jsp?cpno=<%=cpno %>" class="btn btn-primary">목록</a>
				</div>
			</div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> 
</body>
</html>