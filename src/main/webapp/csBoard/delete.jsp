<%@page import="dao.CsBoardJdbcDao"%>
<%@page import="vo.CsBoard"%>
<%@page import="vo.UserTable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	UserTable loginUserInfo = (UserTable)session.getAttribute("LOGIN_USER_INFO");
	int no = Integer.parseInt(request.getParameter("no"));
	int cpno = Integer.parseInt(request.getParameter("cpno"));
		
	if(loginUserInfo == null) {
		response.sendRedirect("../main/loginform.jsp?error=empty");
		return;
	}
	
	CsBoardJdbcDao csBoardDao = CsBoardJdbcDao.getInstance();
	csBoardDao.deleteCsBoard(no);
	
	response.sendRedirect("list.jsp?cpno="+cpno);
	
%>