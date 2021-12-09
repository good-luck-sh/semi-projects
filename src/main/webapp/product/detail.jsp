
<%@page import="dto.ProductDto"%>
<%@page import="dao.ProductReviewJdbcDao"%>
<%@page import="vo.Product"%>
<%@page import="dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
	<title>상품 상세보기</title>
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
   Product product = productDao.selectProductByNo(productNo);
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
            <p class="fs-4"><strong><%=products.getProductName() %></strong></p>
            <p class="text-muted"><%=products.getProductName() %></p>
            <hr class="col-md-5">
            <p><b>상품코드</b> : <span class="badge bg-success "><%=products.getProductNo() %></span></p>
<%
		if (products.getProductPrice() == products.getProductDiscountPrice()) {
%>
            <p><b>판매가</b> : <%=products.getProductPrice() %> 원</p>
			<p class="card-text mb-2 text-muted"><b>할인 불가</b></p>
<%
		} else {
%>
            <p><b>판매가</b> : <%=products.getProductPrice() %> 원</p>
            <p><b>할인가</b> : <%=products.getProductDiscountPrice() %> 원</p>
            <p><b>재고</b> : <%=products.getProductStock() %> 개</p>
<%
		}
%>
			<div class="row">
				<div class="col">
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
<%
	// 관리자가 아닐 경우 수정 버튼은 표시되지 않음.
	if (loginUserInfo == null) {
%>
<%
	} else if(loginUserInfo.getManagerCheck() != null) {
%>
   <row>
   	<a href="modify_product_form.jsp?productNo=<%=request.getParameter("productNo")%>" class="btn btn-outline-secondary btn-lg" tabindex="-1" role="button" aria-disabled="true">수정</a>
	</row>
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
<!-- 리뷰 부분 구현 -->
<div class="row mt-3">
			<div class="col">
				<table class="table">
					<colgroup>
						<col width="10%">
						<col width="15%">
						<col width="7.5%">
						<col width="25%">
						<col width="10%">
						<col width="10%">
						<col width="5%">
					</colgroup>
					<tbody>
<%
	ProductReviewJdbcDao productReviewDao = ProductReviewJdbcDao.getInstance();
	List<ProductDto> findReviews = productReviewDao.getAllReviewByProductNo(product.getProductNo());
%>
						
<% 	
		int totalStarPoint = 0;
		for(ProductDto findReview : findReviews) {
		 totalStarPoint = totalStarPoint + findReview.getReviewStarPoint();
		
			
%>						
						<tr>
							<th>리뷰 제목</th>
							<td><a href="../review/reviewUserDetail.jsp?no=<%=findReview.getReviewNo()%>&cpno=1"><%=findReview.getReviewTitle() %></a></td>
							<th>리뷰 내용</th>

							<td><%=findReview.getReviewContent() %></td>
							<th>작성자</th>
							<td><%=findReview.getUserName() %></td>
							<th>별점</th>
<% 	
if(findReview.getReviewReviewLikeCount() >= 10) {
%>
							<td><%=findReview.getReviewStarPoint() %><span class="badge rounded-pill bg-danger">추천리뷰</span></td>
<%
}	else {
%>
							<td><%=findReview.getReviewStarPoint() %></td>
						</tr>
<%
}}
%>		
						<tr>
							<th>전체 리뷰 수</th>
							<td><mark><%=findReviews.size() %></mark></td>
							<th>평균 별점</th>
<%
	int findStarAverage = 0;
	if(findReviews.size() != 0) {
		findStarAverage = (int)(totalStarPoint/findReviews.size());	
	
	}
%>
							<td><mark><%=findStarAverage %></mark></td>
						</tr>					
					</tbody>
				</table>
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