<%@page import="dao.CategoryDao"%>
<%@page import="vo.Categorys"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String categorysName = request.getParameter("categorys_name");

	CategoryDao categoryDao = new CategoryDao();
	Categorys categorys = new Categorys();
	categorys.setCategorysName(categorysName);
	
	// 상품명 입력안헀을때 오류 출력
	if (categorysName != null && categorysName.isBlank()) {
		response.sendRedirect("insert_categorys_form.jsp?error=empty-categorysName");	
		return;
	}
	
	// 카테고리에 중복된 값을 입력했을때 에러출력
	int result = categoryDao.overlappingCategorysName(categorys);
	if(result == 0){
		categoryDao.insertCategorys(categorys);
	} else {
		response.sendRedirect("insert_categorys_form.jsp?error=overlapping");
		return;
	}
	
	
	response.sendRedirect("insert_categorys_form.jsp?success=commit");

%>