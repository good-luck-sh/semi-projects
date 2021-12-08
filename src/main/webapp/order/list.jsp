<%@page import="dao.OrderReviewJdbcDao"%>
<%@page import="vo.Product"%>
<%@page import="dto.OrderDto"%>
<%@page import="dao.ProductReviewJdbcDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>주문내역 확인하기</title>
</head>
<body>
<%
	pageContext.setAttribute("menu", "login");
	//네비바 활성화를 위하여 pageContext에서 값을 꺼내온다.
%>
<%@ include file="../navbar/nav.jsp" %>
<% 	if(loginUserInfo == null) {
		response.sendRedirect("../main/loginform.jsp?error=empty");
		return;
	}
	ProductReviewJdbcDao productDao = ProductReviewJdbcDao.getInstance();
	OrderReviewJdbcDao orderDao = OrderReviewJdbcDao.getInstance();
	List<OrderDto> orderDtos = productDao.getAllReviewByUserNo(loginUserInfo.getUserNo());
	
%>
<div class ="container mt-3">
	<div class="row p-3 mb-3">
		<div class="col">
			<p><strong><%=loginUserInfo.getUserName() %>님</strong>의 주문내역입니다.</p>
			<table class="table" style="border-top: 1px solid #a10000; padding: 10px;">
				<thead>
					<tr class="black">
						<th>주문 번호</th>
						<th>주문 상품</th>
						<th>사용 총 금액</th>
					</tr>
				</thead>
				<tbody>
<%
	for(OrderDto orderDto : orderDtos) {
	if(orderDto.getOrderNo() != 0) {
		
		Product product = productDao.getProductByProductNo(orderDto.getProductNo());
		OrderDto findReviewOrder = orderDao.getAllPointByOrderNo(orderDto.getOrderNo());
%>
					<tr>
						<td><a href="../review/orderlist.jsp?orderNo=<%=orderDto.getOrderNo() %>&proudctNo=<%=product.getProductNo()%>"><%=orderDto.getOrderNo() %></a></td>
						<td><%=product.getProductName() %></td>
						<td><%=orderDto.getOrderRealTotalPrice() %></td>
					</tr>
<%
	} }
%>			
				</tbody>
			</table>
		</div>
	</div>
</div>
<div class="row text-center" style="justify-content: center;">
	<div class="col-6">
		<a href="../user/detail.jsp" class="btn text-white mr-3" style="background-color: #a45339;">돌아가기</a>	
	</div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> 
</body>
</html>