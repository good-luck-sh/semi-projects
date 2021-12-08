<%@page import="service.Service"%>
<%@page import="vo.Product"%>
<%@page import="dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String productName = request.getParameter("product_name");
	int productNo = Integer.parseInt(request.getParameter("productNo"));
	int productPrice = 0;
	int productDiscountPrice = 0;
	int productStock = 0;
	String productOnSale = request.getParameter("product_on_sale");
	String productPicture = request.getParameter("product_picture");
	int productStatus = Integer.parseInt(request.getParameter("productStatus"));

	//int 값 체크
	Service service = Service.getInstance();
	Boolean validation = true;
	
	// 상품가격에 문자가 들어갔을때 오류
	Boolean checked = service.isNum(request.getParameter("product_price"));
	if(!checked){
		response.sendRedirect("modify_product_form.jsp?productNo="+productNo+"&error=numCheck-productPrice");
		return;
	}
	
	// 할인가격에 문자가 들어갔을때 오류
	Boolean checkedDiscountPrice = service.isNum(request.getParameter("product_discount_price"));
	if(!checkedDiscountPrice){
		response.sendRedirect("modify_product_form.jsp?productNo="+productNo+"&error=numCheck-productDiscountPrice");
		return;
	}
	
	// 재고량에 문자가 들어갔을때 오류
	Boolean checkedStock = service.isNum(request.getParameter("product_stock"));
	if(!checkedStock){
		response.sendRedirect("modify_product_form.jsp?productNo="+productNo+"&error=numCheck-stock");
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
	// 상품명 입력안헀을때 오류 출력
	if (productName != null && productName.isBlank()) {
		response.sendRedirect("modify_product_form.jsp?productNo="+productNo+"&error=empty-productName");	
		return;
	}
	
	// 상품 가격 입력 안했을때 오류 출력
	if (productPrice == 0) {
		response.sendRedirect("modify_product_form.jsp?productNo="+productNo+"&error=empty-productPrice");
		return;
	}
	
	// 상품 가격, 할인가격이 0이하일때 오류 출력
	if (productPrice <= 0 && productDiscountPrice <= 0) {
		response.sendRedirect("modify_product_form.jsp?productNo="+productNo+"&error=wrong-price");	
		return;
	}
	
	// 할인 가격 입력 안했을때 오류 출력
	if (productDiscountPrice == 0) {
		response.sendRedirect("modify_product_form.jsp?productNo="+productNo+"&error=empty-productDiscountPrice");	
		return;
	}
	
	// 할인 가격이 상품가격보다 비쌀때 오류 출력
	if (productPrice < productDiscountPrice) {
		response.sendRedirect("modify_product_form.jsp?productNo="+productNo+"&error=wrong2-price");	
		return;
	}
	
	// 입고수량을 입력 안했거나 0이하일때 오류 출력
	if (productStock == 0) {
		response.sendRedirect("modify_product_form.jsp?productNo="+productNo+"&error=wrong-productStock");	
		return;
	}
	
	// 판매여부 입력안헀을때 오류 출력
	if (productOnSale != null && productOnSale.isBlank()) {
		response.sendRedirect("modify_product_form.jsp?productNo="+productNo+"&error=empty-product_on_sale");
		return;
	}

	Product product = new Product();
	product.setProductName(productName);
	product.setProductPrice(productPrice);
	product.setProductDiscountPrice(productDiscountPrice);
	product.setProductStock(productStock);
	product.setProductOnSale(productOnSale);
	product.setProductPicture(productPicture);
	product.setProductNo(productNo);
	product.setProductStatus(productStatus);
	ProductDao productDao = new ProductDao();
	productDao.updateProduct(product); 
	
	// 상품 수정 완료시 연결링크
	response.sendRedirect("modify_product_form.jsp?productNo="+request.getParameter("productNo")+"&success=commit");
	
%>



















