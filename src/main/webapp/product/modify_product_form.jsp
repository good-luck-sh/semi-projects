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
    <script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
    <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
    <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
    <title>커먼 유니크</title>
	<%@ include file="../navbar/nav.jsp" %>
</head>

<body>
<div class="container">
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
<%
	Service service = Service.getInstance();
	ProductDao productDao = new ProductDao();
	List<Categorys> categorys = service.getAllCategorys();

	String error = request.getParameter("error");
	String success = request.getParameter("success");
	if ("commit".equals(success)) {
%>
			<div class="alert alert-primary">
				<strong>상품 수정 완료</strong>
			</div>
<%		
	} else if ("empty-productName".equals(error)) {
%>
			<div class="alert alert-danger">
				<strong>상품 등록 실패</strong> 상품이름을 입력하세요.
			</div>
<%
	} else if ("empty-productPrice".equals(error)) {
%>
			<div class="alert alert-danger">
				<strong>상품 등록 실패</strong> 가격을 입력하세요.
			</div>
<%
	} else if ("wrong-price".equals(error)) {
%>
			<div class="alert alert-danger">
				<strong>상품 등록 실패</strong> 상품가격은 0원보다 작을수 없습니다.
			</div>
<%
	} else if ("empty-productDiscountPrice".equals(error)) {
%>
			<div class="alert alert-danger">
				<strong>상품 등록 실패</strong> 할인가격을 입력하세요.
			</div>
<%
	} else if ("wrong2-price".equals(error)) {
%>
			<div class="alert alert-danger">
				<strong>상품 등록 실패</strong> 할인가격은 정상가격보다 비쌀수없습니다.
			</div>
<%
	} else if ("wrong-productStock".equals(error)) {
%>
			<div class="alert alert-danger">
				<strong>상품 등록 실패</strong> 입고수량을 입력 안했거나, 0이하로 입력할수 없습니다.
			</div>
<%
	} else if ("empty-product_on_sale".equals(error)) {
%>
			<div class="alert alert-danger">
				<strong>상품 등록 실패</strong> 판매여부를 확인하세요.
			</div>
<%
	} else if ("numCheck-productPrice".equals(error)) {
%>
			<div class="alert alert-danger">
				<strong>상품 등록 실패</strong> 할인가격에는 숫자만 입력할 수 있습니다.
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
  						
  						<div class="image col-md-3">
         					<p class="text-muted" >제품 상세 사진</p>
         					<img class="card-img-top" src="<%=product.getProductPicture()%>">
        				 </div>
  						
  						<div class="col-md-9">
  							<label for="formFile" class="form-label">등록할 사진을 선택하세요</label>
  							<input class="form-control" type="file" id="formFile" name="formFile" onchange="ImgName()">
  							<input value=<%= product.getProductPicture()%> type="text" class="form-control" id="product_picture" name="product_picture">
						</div>
  						
						
  						<div class="col-12 text-end">
  							<input type="hidden" id="productNo" value="<%= request.getParameter("productNo")%>">
							<input type="hidden" id="productStatus" name="productStatus" value="<%=product.getProductStatus()%>">
<%
// 0 or 1     0일때 checked, 1일때 else
	if (product.getProductStatus() == 0) {
%>
							<input type="checkbox" id="status" checked data-toggle="toggle" data-on="활성화" data-off="비활성화" onChange="Status()">
<% 
	} else {
%>
							<input type="checkbox" id="status" data-toggle="toggle" data-on="활성화" data-off="비활성화" onChange="Status()">
<%
	}
%>
    						
    						<button type="submit" class="btn btn-warning">수정</button>
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

	function Status(){
		var status = document.getElementById('status').checked;
		var input = document.getElementById('productStatus');
		if(status === false){ //비활성의경우
			input.value = 1;
		} else { //활성의경우
			input.value = 0;
		}
	}
	
</script>
</body>
</html>