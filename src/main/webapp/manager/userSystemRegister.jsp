<%@page import="vo.UserTable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	UserTable loginUserInfo = (UserTable)session.getAttribute("LOGIN_USER_INFO");	

	if(loginUserInfo == null) {
		response.sendRedirect("../loginform.jsp?error=empty");
		return;
	}
	
	String manager = request.getParameter("manager");
	if(manager == null) {
		response.sendRedirect("../loginform.jsp?error=empty");
		return;
	}
	
%>