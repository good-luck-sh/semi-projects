<%@page import="service.Service"%>
<%@page import="vo.Categorys"%>
<%@page import="java.util.List"%>
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
	List<Categorys> categorys = service.getAllCategorys();
	
	String error = request.getParameter("error");
	String success = request.getParameter("success");
	
	if ("empty-categorysNo".equals(error)) {
%>
			<div class="alert alert-danger">
				<strong>상품 등록 실패</strong> 카테고리를 선택하세요.
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
	if ("commit".equals(success)) {
%>
			<div class="alert alert-primary">
				<strong>상품 등록 완료</strong>
			</div>
<%		
	}
%>

	<div class="row">
		<div class="col">
			<div class="card">
				<div class="card-header">신규 상품 등록</div>
				<div class="card-body">
					<form class="row g-3" method="post" action="insert_product.jsp">
						<div class="col-md-4">
							<label for="categorys_no" class="form-label">카테고리</label>
							<select class="form-control" id="categorys_no" name="categorys_no">
								<option value="">상품 카테고리 선택</option>
<%
	for (Categorys cat : categorys) {
%>
								<option value="<%=cat.getCategorysNo() %>"> <%=cat.getCategorysName() %></option>
<%
	}
%>
							</select>
						</div>
  						<div class="col-md-4">
    						<label for="product_name" class="form-label">제품명</label>
    						<input value="" type="text" class="form-control" id="product_name" name="product_name">
  						</div>
  						<div class="col-md-4">
    						<label for="product_price" class="form-label">가격</label>
    						<input value="" type="text" class="form-control" id="product_price" name="product_price">
  						</div>
  						<div class="col-md-4">
    						<label for="product_discount_price" class="form-label">할인가격</label>
    						<input value="" type="text" class="form-control" id="product_discount_price" name="product_discount_price">
  						</div>
  						<div class="col-md-4">
    						<label for="product_stock" class="form-label">입고수량</label>
    						<input value="" type="text" class="form-control" id="product_stock" name="product_stock">
  						</div>
  						<div class="col-md-4">
    						<label for="product_on_sale" class="form-label">판매여부</label>
    						<select class="form-control" id="product_on_sale" name="product_on_sale">
    							<option value="" >판매여부 확인</option>
    							<option value="판매중">판매중</option>
    							<option value="품절">품절</option>
    						</select>
  						</div>
  						
  						<div class="mb-3">
  							<label for="formFile" class="form-label">등록할 사진을 선택하세요</label>
  							<input class="form-control" type="file" id="formFile">
						</div>
						
  						<div class="col-12 text-end">
    						<button type="submit" class="btn btn-primary">등록</button>
  						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>