<%@page import="vo.UserTable"%>
<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int userNo = Integer.parseInt(request.getParameter("no"));
	
	String password = request.getParameter("pwd");
	String address = request.getParameter("address");

	UserDao uDao = new UserDao();
	UserTable user = uDao.getUserAllInfoByNo(userNo);
	
	user.setUserPassword(password);
	user.setUserAddress(address);
	
//	uDao.updateUser(user);
	
	
//	response.sendRedirect("datail.jsp");
	
	
	
	

%>