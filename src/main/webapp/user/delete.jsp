<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	int userNo = Integer.parseInt(request.getParameter("no"));

	// 로그인한 사용자정보가 세션에 존재하지 않으면 탈퇴할 수 없다.
	// UserTable loginUserInfo = (UserTable)session.getAttribute("LOGIN_USER_INFO");
	//if (loginUserInfo == null) {
	//	response.sendRedirect("../loginform.jsp?error=login-required");
	//	return;
	//}

	// 객체 생성
	UserDao uDao = UserDao.getInstance();
	
	// 유저정보 조회하나?
	
	
	uDao.deleteUser(userNo);
	
	
		
	//	response.sendRedirect("index.jsp");



%>