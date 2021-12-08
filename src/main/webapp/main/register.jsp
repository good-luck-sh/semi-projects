<%@page import="vo.UserTable"%>
<%@page import="dao.UserDao"%>
<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	int age = 0;
	String gender = request.getParameter("gender");
	String address = request.getParameter("address");
	
	UserDao userDao = UserDao.getInstance();
	
	// 동일한 아이디가 있으면 회원가입 실패
	UserTable savedUser = userDao.getUserById(id);
	if (savedUser != null) {
		response.sendRedirect("registerform.jsp?error=id-exists");
		return;
	}
	if (id != null && id.isBlank()) {
		response.sendRedirect("registerform.jsp?error=id-empty");
		return;
	}
	if (password != null && password.isBlank()) {
		response.sendRedirect("registerform.jsp?error=password-empty");
		return;
	}
	if (name != null && name.isBlank()) {
		if (age == 0) {
			if (address != null && address.isBlank()) {
		
				response.sendRedirect("registerform.jsp?error=all-empty");
				return;
			}
		}	
	}
	if (name != null && name.isBlank()) {
		response.sendRedirect("registerform.jsp?error=name-empty");
		return;
	}
	if (age == 0) {
		response.sendRedirect("registerform.jsp?error=age-empty");
		return;
	}
	if (address != null && address.isBlank()) {
		response.sendRedirect("registerform.jsp?error=address-empty");
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