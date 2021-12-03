<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page import="vo.UserTable"%>
<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	UserDao userDao = UserDao.getInstance();
	UserTable userTable = userDao.getUserById(id);
	
	// 아이디에 해당하는 회원정보가 존재하지 않으면 인증실패
	if (userTable == null) {
		response.sendRedirect("loginform.jsp?error=notfound-user");
		return;
	}
	
	// 비밀번호 암호화
	String secretPassword = DigestUtils.sha256Hex(password);
	
	// 비밀번호가 일치하지 않으면 인증실패
	if (!userTable.getUserPassword().equals(secretPassword)) {
		response.sendRedirect("loginform.jsp?error=mismatch-password");
		return;
	}
	// 아이디와 비밀번호가 일치하면 사용자 인증이 완료됨
	session.setAttribute("LOGIN_USER_INFO", userTable);
	
	response.sendRedirect("index.jsp");
	
%>