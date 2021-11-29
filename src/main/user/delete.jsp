<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	int userNo = Integer.parseInt(request.getParameter("no"));

	UserDao uDao = new UserDao();
	uDao.deleteUser(userNo);
	
	
		
//	response.sendRedirect("index.jsp");



%>