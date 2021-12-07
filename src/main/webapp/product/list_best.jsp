<%@page import="dao.UserOrderDao"%>
<%@page import="dto.BestItemDto"%>
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
   <title>Best 상품</title>
</head>
<body>
<%@include file="../navbar/nav.jsp" %>
<div class="container">
<% 
	UserOrderDao userOrderDao = new UserOrderDao();
	List<BestItemDto> bestList = userOrderDao.getProductRankingByAmount();
	int sale = 0;
%>
	<div class="row mb-3">
		<div class="col text-center">
			<div>
				<strong class="display-5">best</strong> 
			</div>
		</div>
	</div>

	<div class="row mb-3">
<%
	for (BestItemDto best : bestList) {
		sale = (best.getPrice() - best.getDiscountPrice());
%>	
		<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" >
			<div class="card mb-3 border ">
				<a href="detail.jsp?productNo=<%=best.getProductNo() %>"><img class="card-img-top " src="<%=best.getPicture() %>" height="308"></a>
				<div class="card-body h-100">
					<h5 class="fw-bold card-title border-bottom "><small><%=best.getProductName() %></small></h5>
					<p class="card-text mb-2"><strong><%=best.getDiscountPrice() %> 원</strong></p>
					<p class="detail card-text text-muted mb-2 "><%=best.getProductName() %></p>
					<div>
						<span class="badge p-1 bg-primary text-white"><strong><%=best.getOnSale() %> </strong></span>
<%
		if (sale == 0) {
%>
						<span class="badge p-1 bg-secondary text-white"><strong>정상가 </strong></span>
<%		
		} else {
%>					
						<span class="badge p-1 bg-success text-white"><strong>세일중 </strong></span>
						<span class="badge p-1 bg-dark" >-<%=best.getPrice() - best.getDiscountPrice() %> 원</span>
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