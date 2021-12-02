<%@page import="vo.Product"%>
<%@page import="dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
	String productName = request.getParameter("product_name");
	int productNo = Integer.parseInt(request.getParameter("productNo"));
	int productPrice = Integer.parseInt(request.getParameter("product_discount_price"));
	int productDiscountPrice = Integer.parseInt(request.getParameter("product_discount_price"));
	int productStock = Integer.parseInt(request.getParameter("product_stock"));
	String productOnSale = request.getParameter("product_on_sale");
	String productPicture = request.getParameter("product_picture");
	
	Product product = new Product();
	product.setProductName(productName);
	product.setProductPrice(productPrice);
	product.setProductDiscountPrice(productDiscountPrice);
	product.setProductStock(productStock);
	product.setProductOnSale(productOnSale);
	product.setProductPicture(productPicture);
	product.setProductNo(productNo);
	ProductDao productDao = new ProductDao();
	productDao.updateProduct(product);
	
	// 상품 수정 완료시 연결링크
	response.sendRedirect("modify_product_form.jsp?productNo="+request.getParameter("productNo")+"&success=commit");
	
	
	
	
	
	

%>



















