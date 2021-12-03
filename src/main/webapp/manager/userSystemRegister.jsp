<%@page import="dao.UserDao"%>
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
	int userNo = Integer.parseInt(request.getParameter("userNo"));
	
	UserDao userDao = UserDao.getInstance();
	UserTable user = userDao.getUserAllInfoByNo(userNo);
	user.setManagerCheck(manager);
	
	userDao.updateUser(user);
	
	response.sendRedirect("managerlist.jsp?error=complete");
	
%>