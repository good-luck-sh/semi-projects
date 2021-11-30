<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page import="vo.UserTable"%>
<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int userNo = Integer.parseInt(request.getParameter("no"));
	String password = request.getParameter("pwd");
	String address = request.getParameter("address");
	
	// 패스워드가 비어있는지 확인
	if(password != null && password.isBlank()){
		response.sendRedirect("modifyform.jsp?no="+ userNo +"&&error=empty-password");
		return; 
	}
	
	//주소가 비어있는지 확인
	if(address != null && address.isBlank()){
		response.sendRedirect("modifyform.jsp?no="+ userNo +"&&error=empty-address");
		return;
	}
	
	// 로그인한 사용자정보가 세션에 존재하지 않으면 정보를 수정할 수 없다.
	// UserTable loginUserInfo = (UserTable)session.getAttribute("LOGIN_USER_INFO");
//	if (loginUserInfo == null) {
//		response.sendRedirect("../loginform.jsp?error=login-required");
//		return;
//	}
	
	
	UserDao uDao = UserDao.getInstance();
	UserTable user = uDao.getUserAllInfoByNo(userNo);
	
	// 비밀번호 암호화
	String secretPassword = DigestUtils.sha256Hex(password);
	
	user.setUserPassword(secretPassword);
	user.setUserAddress(address);
	
	uDao.updateUser(user);
	
	
	response.sendRedirect("datail.jsp");
	
	
	
	

%>