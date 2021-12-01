<%@page import="java.util.List"%>
<%@page import="dto.UserDto"%>
<%@page import="dao.UserPointHistoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
    <title>마이페이지::적립포인트</title>
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
<div class="container">
<%
	// dao를 order by history_no(혹은 order_no)로 하면 될듯? +
	 int userNo = Integer.parseInt(request.getParameter("no"));
	 UserPointHistoryDao historyDao = UserPointHistoryDao.getInstance();
	 List<UserDto> pointList = historyDao.getAllPointHistoryByNo(userNo);

%>

<hr>
	<div class="row mb-3">
		<div class="col">
			<h4>mileage</h4>
		</div>
	</div>
<hr>
	<div>
		<table class="table">
			<thead>
				<tr>
					<th>날짜</th>
					<th>차감/적립</th>
					<th>이유</th>
					<th>최종포인트</th>
				</tr>
			</thead>
			<tbody>
<%
	for(UserDto point : pointList){
%>
				<tr>
					<td><%=point.getHistoryCreateDate() %></td>
					<td><%=point.getHistoryPointCheck() %>
<%
//		int minusPoint = point.getOrderUsePoint();
//		int plusPoint = point.getOrderTotalPoint();
//		for(minusPoint == null) {
//			
//		} else {
//			
//		}
%>
					
					<%=point.getOrderTotalPoint() %></td>
					<td>상품 구매</td>
					<td>10000</td>
				</tr>
<%
	}
%>
			</tbody>
		</table>
	</div>
<hr>
	<div class="row mb-3">
		<div class="col">
			<h2>총 포인트: 10000 원</h2>
		</div>
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