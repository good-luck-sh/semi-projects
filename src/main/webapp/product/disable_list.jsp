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
<%
	pageContext.setAttribute("menu", "login");
	if (loginUserInfo == null) {
		response.sendRedirect("../main/loginform.jsp?error=login-required");
		return;
	}
	// 매니저 권한이 없을 경우 메인화면으로 보낸다.
	if(loginUserInfo.getManagerCheck() == null) {
		response.sendRedirect("../main/index.jsp");
		return;
	}
%>
<div class="container">
<h1></h1>
<strong>관리자 전용 페이지</strong> (현재 비활성화 되어있는 상품 목록)
<h1></h1>
<% 
	ProductDao productDao = new ProductDao();
	int productStatus = 1;
	int sale = 0;
	List<Product> productList = productDao.getDisableProduct(productStatus);
%>
	
	<div class="row mb-3">
<%
	for (Product products : productList) {
		sale = (products.getProductPrice() - products.getProductDiscountPrice());
%>
		<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
			<div class="card mb-3 border border-light($black)">
				<a href="detail.jsp?productNo=<%=products.getProductNo() %>"><img class="card-img-top" src="<%=products.getProductPicture() %>"></a>
				<div class="card-body">
					<h5 class="fw-bold card-title border-bottom "><small><%=products.getProductName() %></small></h5>
					<p class="card-text mb-2"><strong><%=products.getProductDiscountPrice() %> 원</strong></p>
					<p class="detail card-text text-muted mb-2 "><%=products.getProductName() %></p>
					<div>
						<span class="badge p-1 bg-primary text-white"><strong><%=products.getProductOnSale() %> </strong></span>
<%
		if (sale == 0) {
%>
						<span class="badge p-1 bg-secondary text-white"><strong>정상가 </strong></span>
<%		
		} else {
%>	
						<span class="badge p-1 bg-success text-white"><strong>세일중 </strong></span>
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