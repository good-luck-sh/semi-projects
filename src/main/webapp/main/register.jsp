<%@page import="vo.UserTable"%>
<%@page import="dao.UserDao"%>
<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String gender = request.getParameter("gender");
	String address = request.getParameter("address");
	
	UserDao userDao = UserDao.getInstance();
	
	UserTable savedUser = userDao.getUserById(id);
	if (savedUser != null) {
		response.sendRedirect("registerform.jsp?error=id-exists");
		return;
	}
	
	// 비밀번호 암호화
	String secretPassword = DigestUtils.sha256Hex(password);
	
	UserTable user = new UserTable();
	user.setUserId(id);
	user.setUserPassword(secretPassword);
	user.setUserName(name);
	user.setUserAge(age);
	user.setUserGender(gender);
	user.setUserAddress(address);
	
	userDao.insertUser(user);
	
	response.sendRedirect("index.jsp?register=completed");
%>