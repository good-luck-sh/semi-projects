<%@page import="vo.Product"%>
<%@page import="dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
	
    <title></title>
</head>
<body>
<%
	pageContext.setAttribute("menu", "login");
%>
<%@include file="../navbar/nav.jsp" %>
<div class="container">
<h3>상품상세정보</h3>
<%
	int productNo = Integer.parseInt(request.getParameter("productNo"));
	ProductDao productDao = new ProductDao();
	List<Product> productList = productDao.selectProductByProductNo(productNo);
	Product product = productDao.getProductByProductNo(productNo);
	
%>
<%
	String success = request.getParameter("success");
	
	if("complete".equals(success)){
%>
	<div class="alert alert-primary">
		<strong>장바구니 등록 성공!!</strong> 정상 완료 되었습니다.
	</div>
<%
}
%>

	<div class="container">
		<div class="row">
<%
	for (Product products : productList) {

%>		
			<div class="image col-md-3">
			<p class="text-muted" >제품 상세 사진</p>
			<img class="card-img-top" src="<%=products.getProductPicture()%>">
			</div>
			<div class="inf col-md-9">
				<h2><strong><%=products.getProductName() %></strong></h2>
				<p class="text-muted"><%=products.getProductName() %></p>
				<hr class="col-md-5">
				<p><b>상품코드</b> : <span class="badge bg-danger "><%=products.getProductNo() %></span></p>
				<p><b>상품가격</b> : <%=products.getProductPrice() %> 원</p>
				<p><b>할인된 가격</b> : <%=products.getProductDiscountPrice() %> 원</p>
				<p><b>재고</b> : <%=products.getProductStock() %> 개</p>
				<span class="badge p-1 bg-success"><strong> 세일중 </strong></span>
				<span class="badge p-1 bg-primary text-white"><strong><%=products.getProductOnSale() %> </strong></span>
				<span class="badge p-1 bg-secondary" >-<%=products.getProductPrice() - products.getProductDiscountPrice() %> 원</span>
			</div>
<%
	}
%>	
		</div>
	</div>
</div>
<div class="container">
	<hr>
	<div class="container">
		<div class="row">
<%
		// 로그인이 되어 있을때만 장바구니 버튼이 보이게 하기
		// 원래는 경고 넣으려고 했는데 500 오류가 뜸
		if(loginUserInfo != null) {
%>
			<form name="addForm" action="../user/registerbasket.jsp?productNo=<%=product.getProductNo() %>&userNo=<%=loginUserInfo.getUserNo() %>" method="post">
				<a href="#" class="btn btn-outline-secondary btn-lg" tabindex="-1" role="button" onclick="addToBasket()" aria-disabled="true">
					Add to cart</a>
			</form>
<%
		}
%>
			<!--  
			<a href="#" class="btn btn-outline-dark btn-lg" tabindex="-1" role="button" aria-disabled="true">Buy it now</a>
			바로 구매는 못한다고 하셨어요. 보고 빼시라고 적어 놓아요.
			-->
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	function addToBasket(){

		if(confirm("상품을 장바구니에 추가하시겠습니까")){
			document.addForm.submit();
		} else {
			document.addForm.reset();
		}

	}
</script>
</body>
</html>