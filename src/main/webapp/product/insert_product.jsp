<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="service.Service"%>
<%@page import="vo.Categorys"%>
<%@page import="vo.Product"%>

<%
	Service service = Service.getInstance();
	Boolean validation = true;
	
	String productName = request.getParameter("product_name");
	int productPrice = 0;
	int productDiscountPrice = 0;
	int productStock = 0;
	String productOnSale = request.getParameter("product_on_sale");
	String temp_categorysNo = request.getParameter("categorys_no");
	int categorysNo = 0;
	
	String productPicture = request.getParameter("img");
	
	//int 값 체크
	// 상품가격에 문자가 들어갔을때 오류
	Boolean checkedprice = service.isNum(request.getParameter("product_price"));
	if(!checkedprice){
		response.sendRedirect("insert_product_form.jsp?error=numCheck-productPrice");
		return;
	}
	
	// 할인가격에 문자가 들어갔을때 오류
	Boolean checkedDiscountPrice = service.isNum(request.getParameter("product_discount_price"));
	if(!checkedDiscountPrice){
		response.sendRedirect("insert_product_form.jsp?error=numCheck-productDiscountPrice");
		return;
	}
	
	// 재고량에 문자가 들어갔을때 오류
	Boolean checkedStock = service.isNum(request.getParameter("product_stock"));
	if(!checkedStock){
		response.sendRedirect("insert_product_form.jsp?error=numCheck-stock");
		return;
	}
	

	if(!request.getParameter("product_price").isBlank()){
		productPrice = Integer.parseInt(request.getParameter("product_price"));
	}
	
	if(!request.getParameter("product_discount_price").isBlank()){
		productDiscountPrice = Integer.parseInt(request.getParameter("product_discount_price"));
	}
	
	if(!request.getParameter("product_stock").isBlank()){
		productStock = Integer.parseInt(request.getParameter("product_stock"));
	}
			
	// 오류 검사 시작
	// 카테고리 입력안했을때 오류 출력
	if (temp_categorysNo.isBlank()) {
		response.sendRedirect("insert_product_form.jsp?error=empty-categorysNo");
		return;
	} else {
		categorysNo = Integer.parseInt(temp_categorysNo);
	}

	// 상품명 입력안헀을때 오류 출력
	if (productName != null && productName.isBlank()) {
		response.sendRedirect("insert_product_form.jsp?error=empty-productName");	
		return;
	}
	
	// 상품 가격 입력 안했을때 오류 출력
	if (productPrice == 0) {
		response.sendRedirect("insert_product_form.jsp?error=empty-productPrice");
		return;
	}
	
	// 상품 가격, 할인가격이 0이하일때 오류 출력
	if (productPrice <= 0 && productDiscountPrice <= 0) {
		response.sendRedirect("insert_product_form.jsp?error=wrong-price");	
		return;
	}
	
	// 할인 가격 입력 안했을때 오류 출력
	if (productDiscountPrice == 0) {
		response.sendRedirect("insert_product_form.jsp?error=empty-productDiscountPrice");	
		return;
	}
	
	// 할인 가격이 상품가격보다 비쌀때 오류 출력
	if (productPrice < productDiscountPrice) {
		response.sendRedirect("insert_product_form.jsp?error=wrong2-price");	
		return;
	}
	
	// 입고수량을 입력 안했거나 0이하일때 오류 출력
	if (productStock == 0) {
		response.sendRedirect("insert_product_form.jsp?error=wrong-productStock");	
		return;
	}

	// 판매여부 입력안헀을때 오류 출력
	if (productOnSale != null && productOnSale.isBlank()) {
		response.sendRedirect("insert_product_form.jsp?error=empty-product_on_sale");
		return;
	}
	
	//insert
	Categorys categorys = service.getCategoryByNo(categorysNo);
	
	Product product = new Product();
	product.setCategorys(categorys);
	product.setProductName(productName);
	product.setProductPrice(productPrice);
	product.setProductDiscountPrice(productDiscountPrice);
	product.setProductStock(productStock);
	product.setProductOnSale(productOnSale);
	product.setProductPicture(productPicture);
	
	service.addNewProduct(product);
	 
	response.sendRedirect("insert_product_form.jsp?success=commit");
%>