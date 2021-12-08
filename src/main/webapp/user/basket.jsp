<%@page import="vo.UserBasket"%>
<%@page import="java.util.List"%>
<%@page import="dao.UserBasketDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="../navbar/resource/img.png" type="image/x-icon"> 
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
    <title>마이페이지::장바구니</title>
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
	UserBasketDao basketDao = UserBasketDao.getInstance();
	List<UserBasket> basketList = basketDao.getAllUserBasketItemByNo(loginUserInfo.getUserNo());
%>
<hr>
	<div class="row mb-3">
		<div class="col">
			<h4>my basket</h4>
		</div>
	</div>
<%
	String error = request.getParameter("error");
	if("deny-delete".equals(error)){
%>
		<div class="alert alert-danger">
			<strong>상품 삭제 실패!!</strong> 본인의 장바구니가 아닙니다.
		</div>
<%
   } else if ("empty-basket".equals(error)) {
%>
      <div class="alert alert-danger">
         <strong>선택된 상품이 없습니다.</strong>
      </div>
<%      
   }
%>


 	<div class="mb-3" style="border-top: 1px solid #a10000; padding: 10px;">
 		<form method="get" action="../order/order_form.jsp">
 			<table class="table" id="table-basket">
	 			<thead>
	 				<tr>
	 					<th><input type="checkbox" id="ck-all" onchange="toggleCheckbox()"></th>
	 					<th>상품 번호</th>
	 					<th>이미지</th>
	 					<th>상품 이름</th>
	 					<th>수량</th>
	 					<th>정상 가격</th>
	 					<th>할인 가격</th>
	 					<th></th>
	 				</tr>
	 			</thead>
	 			<tbody>
<%
	if(basketList.isEmpty()){
%>
						<tr>
							<td class="text-center" colspan="6">장바구니에 상품이 존재하지 않습니다.</td>
						</tr>
						
<%
	} else {
		for(UserBasket basket : basketList ){

%>
	 				<tr>
	 					<td><input type="checkbox" id="ch-<%=basket.getUserBasketNo() %>" name="basketNo" value="<%=basket.getUserBasketNo() %>"></td>
	 					<td><%=basket.getProduct().getProductNo() %></td>
	 					<td><img alt="item-img" src="<%=basket.getProduct().getProductPicture() %>" width="100" height="150"></td>
	 					<td><%=basket.getProduct().getProductName() %></td>
	 					<td><%=basket.getBasketAmount() %> 개</td>
	 					<td><%=basket.getProduct().getProductPrice() %> 원</td>
	 					<td><%=basket.getProduct().getProductDiscountPrice() %> 원</td>
	 					<td><a href="deletebasket.jsp?basketNo=<%=basket.getUserBasketNo() %>" class="btn btn-outline-danger btn-sm">삭제</a></td>
	 				</tr>
<%
		}
	}
%>
	 			</tbody>
	 		</table>
 			<div class="mb-3" style="border-top: 1px solid #a10000; padding: 10px;">
	 			<div class="d-flex justify-content-md-end">
	 				<h4>총 상품 금액</h4>
	 			</div>
<%
	int totalPrice = 0;
	for(UserBasket basket : basketList ){
		totalPrice += basket.getProduct().getProductDiscountPrice() * basket.getBasketAmount();
	}
%>
	 			<div class="d-flex justify-content-md-end">
	 				<h3>= <Strong><%=totalPrice %>원</Strong></h3>
	 			</div>
 			</div>
 			<div class="row mb-3">
	 			<div class="col">
	 				<div class="d-flex justify-content-between">
	 					<button type="submit" class="btn text-white" style="background-color: #a45339;">상품주문</button>
	 					<a href="detail.jsp" class="btn btn-outline-secondary">돌아가기</a>
	 				</div>
				</div>
 			</div>
 		</form>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	// 사용자와 상호작용하는 전체 선택/해제 체크박스의 체크여부가 바뀔때마다 실행되는 이벤트핸들러 함수다.
	function toggleCheckbox(){
		// 1. 사용자와 상호작용하는 전체선택/해제 체크박스의 체크여부를 먼저 알아낸다.
		// 		1-1. 아이디가 ch-all인 엘리먼트를 선택한다.(이 엘리먼트는 체크박스다.)
		var checkboxAll = document.querySelector("#ck-all");
		// 		1-2. 체크박스 엘리먼트의 체크상태를 조회한다.(체크되어 있으면 true, 해제되어 있으면 false가 조회된다.)
		var currentCheckedStatus = checkboxAll.checked;
		
		// 2. 모든 항목의 체크박스를 전체선택/해체 체크박스의 상태와 동일하게 한다.
		// 		2-1. 아이디가 table-basket인 엘리먼트를 선택한다.
		// 		 	 선택된 엘리먼트의 자손 tbody를 선택한다.
		// 		 	 tbody의 자손 input을 선택한다.
		// 			 input중에서 name이 no인 엘리먼트를 선택한다.
		var checkboxes = document.querySelectorAll("#table-basket tbody input[name=basketNo]");
		// 		2-2. 선택된 모든 체크박스를 순서대로 하나씩 꺼낸다.
		for (var i=0; i<checkboxes.length; i++){
			var checkbox = checkboxes[i];
			// 	2-3. 순서대로 하나씩 꺼낸 체크박스의 체크여부를 사용자와 상호작용하는 전체선택 체크박스의 체크여부와 동일하게 한다.
			checkbox.checked = currentCheckedStatus;
			
			
		}
	}
</script>
</body>
</html>