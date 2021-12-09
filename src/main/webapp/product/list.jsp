<%@page import="vo.Categorys"%>
<%@page import="java.util.List"%>
<%@page import="dao.CategorysDao"%>
<%@page import="vo.Product"%>
<%@page import="dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="../navbar/nav.css">
   <link rel="shortcut icon" href="../navbar/resource/img.png" type="image/x-icon">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
   <style>
.txt_discount_price {
font-size: 13px;
float: right;
}
.detail {
font-size: 14px;	   
}
   </style>
   
   <title>상품 목록</title>
</head>
<body>
<%@include file="../navbar/nav.jsp" %>
<div class="container">
<% 
	int categorysNo = Integer.parseInt(request.getParameter("categorysNo"));
	ProductDao productDao = new ProductDao();
	CategorysDao cateDao = new CategorysDao();
	List<Categorys> categorysList = cateDao.selectCategoryByCateNoList(categorysNo);
	List<Product> productList = productDao.getAllProductByCategorysNo(categorysNo);
%>
	<div class="row mb-3 ">
		<div class="col text-center">
<%
	for (Categorys categorys : categorysList) {
%>
			<div>
				<strong class="display-5"><%=categorys.getCategorysName() %></strong> 
			</div>
<%
	}
%>
		</div>
	</div>
	<div class="row mb-3">
<%
	for (Product products : productList) {
%>
		<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 h-100">
			<div class="card mb-3 border border-white">
				<a href="detail.jsp?productNo=<%=products.getProductNo() %>"><img class="card-img-top" src="<%=products.getProductPicture() %> " height="365"></a>
				<div class="card-body">
					<h5 class="fw-bold card-title"><small><%=products.getProductName() %></small></h5>
					<hr>
<%
		if (products.getProductPrice() == products.getProductDiscountPrice()) {
%>
					<p class="card-text mb-2"><strong>판매가: <%=products.getProductPrice() %> 원</strong></p>
					<p class="card-text mb-2 text-muted"><strong>할인 불가</strong></p>
					<p class="detail card-text text-muted mb-2"><%=products.getProductName() %></p>
<%
		} else {
%>
					<p class="card-text mb-2"><strong>판매가: <span class="text-muted text-decoration-line-through"><%=products.getProductPrice() %> 원</span></strong></p>
					<p class="card-text mb-2"><strong>세일가: <%=products.getProductDiscountPrice() %> 원</strong></p>
					<p class="detail card-text text-muted mb-2"><%=products.getProductName() %></p>
<%
		}
%>
					<div>
						<span class="badge p-1 bg-primary text-white"><strong><%=products.getProductOnSale() %></strong></span>
<%
		if (products.getProductPrice() == products.getProductDiscountPrice()) {
%>
						<span class="badge p-1 bg-secondary text-white"><strong>정상가</strong></span>
						<span class="badge p-1 bg-danger text-white"><strong>세일 불가 품목</strong></span>
<%		
		} else {
%>	
						<span class="badge p-1 bg-danger text-white"><strong>세일중</strong></span>
						<span class="badge p-1 bg-dark" >-<%=products.getProductPrice() - products.getProductDiscountPrice() %> 원</span>
<%
			}
%>
					</div>
				</div>
			</div>
		</div>		
<%
	}
%>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>