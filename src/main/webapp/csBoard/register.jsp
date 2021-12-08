<%@page import="vo.CsBoard"%>
<%@page import="vo.UserTable"%>
<%@page import="dao.UserDao"%>
<%@page import="dao.CsBoardJdbcDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	UserTable loginUserInfo = (UserTable)session.getAttribute("LOGIN_USER_INFO");
	
	String userCheck = request.getParameter("managercheck");
	String title = request.getParameter("title");
	String text = request.getParameter("text");
	
	if(loginUserInfo == null) {
		response.sendRedirect("../main/loginform.jsp?error=empty");
		return;
	}
	if(loginUserInfo.getManagerCheck() != null) {
		response.sendRedirect("form.jsp?error=nomanager");
		return;
	}
	if(title == null) {
		response.sendRedirect("form.jsp?error=empty");
	}
	if(text == null) {
		response.sendRedirect("form.jsp?error=empty");
	}
	
	CsBoardJdbcDao csBoardDao = CsBoardJdbcDao.getInstance();
	UserDao userDao = UserDao.getInstance();
	UserTable findUser = userDao.getUserAllInfoByNo(loginUserInfo.getUserNo());
	CsBoard csBoard = new CsBoard();
	
	csBoard.setCsBoardTitle(title);
	csBoard.setCsBoardContent(text);
	csBoard.setUserTable(findUser);
	
	csBoardDao.insertCsBoard(csBoard);
	
	response.sendRedirect("list.jsp?cpno=1&error=complete");
%>