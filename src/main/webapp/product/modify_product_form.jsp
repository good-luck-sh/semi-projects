<%@page import="service.Service"%>
<%@page import="java.net.http.HttpRequest"%>
<%@page import="dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="vo.Product"%>
<%@page import="vo.Categorys"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../navbar/nav.css">
    <link rel="shortcut icon" href="../navbar/resource/img.png" type="image/x-icon">
    <title>커먼 유니크</title>
</head>

<body>
<div class="container">
	<%@ include file="../navbar/nav.jsp" %>
<%
	Service service = Service.getInstance();
	ProductDao productDao = new ProductDao();
	List<Categorys> categorys = service.getAllCategorys();

	String success = request.getParameter("success");
	if ("commit".equals(success)) {
%>
			<div class="alert alert-primary">
				<strong>상품 수정 완료</strong>
			</div>
<%		
	}
%>
<%
	int productNo = Integer.parseInt(request.getParameter("productNo"));
	Product product = productDao.selectProductByNo(productNo);
%>
	<div class="row" style="display: inline-block">
		<div class="col">
			<div class="card">
				<div class="card-header">상품 수정</div>
				<div class="card-body">
					<form class="row g-3" method="post" action="modify_product.jsp">
  						<div class="col-md-4">
  							<input type="hidden" value=<%= request.getParameter("productNo") %> class="form-control" id="productNo" name="productNo">
							<label for="categorys_no" class="form-label">상품 카테고리</label>
							<select class="form-control" id="categorys_no" name="categorys_no" disabled>
								<option value="">전체</option>
<%
	for (Categorys category : categorys) { //01 02 03 04
		if(category.getCategorysNo() == product.getCategorys().getCategorysNo()){ //72번의 카테고리값
%>
			<option value="<%=category.getCategorysNo() %>" selected> <%=category.getCategorysName() %></option>
<%
		} else {
%>
			<option value="<%=category.getCategorysNo() %>"> <%=category.getCategorysName() %></option>					
<%			
		}//if end
	}//for end
%>
							</select>
						</div>
						<div class="col-md-4">
							<label for="product_name" class="form-label">상품명</label>
							<input value=<%= product.getProductName()%> class="form-control" id="product_name" name="product_name">
						</div>
  						<div class="col-md-4">
    						<label for="product_price" class="form-label">가격</label>
    						<input value=<%= product.getProductPrice()%> class="form-control" id="product_price" name="product_price" >
  						</div>
  						<div class="col-md-4">
    						<label for="product_discount_price" class="form-label">할인가격</label>
    						<input value=<%= product.getProductDiscountPrice()%> type="text" class="form-control" id="product_discount_price" name="product_discount_price">
  						</div>
  						<div class="col-md-4">
    						<label for="product_stock" class="form-label">재고수량</label>
    						<input value=<%= product.getProductStock()%> type="text" class="form-control" id="product_stock" name="product_stock">
  						</div>
  						<div class="col-md-4">
    						<label for="product_on_sale" class="form-label">판매여부</label>
    						<select class="form-control" id="product_on_sale" name="product_on_sale">
<%
							if(product.getProductOnSale().equals("판매중")){
%>
								<option value="" >판매여부 확인</option>
    							<option value="판매중" selected>판매중</option>
    							<option value="품절">품절</option>
<%								
							} else {
%>
    							<option value="" >판매여부 확인</option>
    							<option value="판매중">판매중</option>
    							<option value="품절" selected>품절</option>
    						
<%
							}
%>	
							</select>
  						</div>
  						
  						<div class="mb-3">
  							<label for="formFile" class="form-label">등록할 사진을 선택하세요</label>
  							<input class="form-control" type="file" id="formFile" name="formFile" onchange="ImgName()">
  							<input value=<%= product.getProductPicture()%> type="text" class="form-control" id="product_picture" name="product_picture">
						</div>
  						
						
  						<div class="col-12 text-end">
  							<input type="hidden" id="productNo" value="<%= request.getParameter("productNo")%>">
  							<button type="button" class="btn btn-danger" id="deleteBtn" onClick="deleteBtnClick();">삭제</button>
    						<button type="submit" class="btn btn-primary">수정</button>
  						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
	function ImgName(e){
		var name = document.getElementById("product_picture");
		var formFile = document.getElementById("formFile");
		name.value = "../product/resource/"+formFile.value.slice(12);
	}
	
	function deleteBtnClick(){
		var productNo = document.getElementById("productNo");
		var bool = confirm("해당상품을 삭제하시겠습니까?");
		
		if(bool == true){
			location.href = 'delete_product.jsp?productNo='+productNo.value;
		} else {
			return false;
		}
		
	}
</script>
</body>
</html>