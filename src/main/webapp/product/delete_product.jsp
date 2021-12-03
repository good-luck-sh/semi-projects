<%@page import="dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int productNo = Integer.parseInt(request.getParameter("productNo"));

	ProductDao productDao = new ProductDao();
	productDao.deleteProduct(productNo);
	







%>