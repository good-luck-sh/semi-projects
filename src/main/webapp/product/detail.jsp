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
<%@include file="../navbar/nav.jsp" %>
<div class="container">
<h3>상품상세정보</h3>
<%
	int productNo = Integer.parseInt(request.getParameter("productNo"));
	ProductDao productDao = new ProductDao();
	List<Product> productList = productDao.selectProductByProductNo(productNo);
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
			<div class="count col-md-6">
				<h3>어떤걸 넣을지 고민입니다.</h3>
			</div>
			<div class="basket col-md-6">
				<!-- 링크 장바구니 버튼 -->
				<a href="#" class="btn btn-outline-secondary btn-lg" tabindex="-1" role="button" aria-disabled="true">Add to cart</a>
				<a href="#" class="btn btn-outline-dark btn-lg" tabindex="-1" role="button" aria-disabled="true">Buy it now</a>
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>