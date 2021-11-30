<%@page import="java.util.Date"%>
<%@page import="vo.CsBoard"%>
<%@page import="dao.CsBoardJdbcDao"%>
<%@page import="vo.UserTable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	UserTable loginUserInfo = (UserTable)session.getAttribute("LOGIN_USER_INFO");
	if(loginUserInfo == null) {
		response.sendRedirect("loginform.jsp?error=empty");
		return;
	}
	
	int no = Integer.parseInt(request.getParameter("no"));
	int cpno = Integer.parseInt(request.getParameter("cpno"));
	
	CsBoardJdbcDao csBoardDao = CsBoardJdbcDao.getInstance();
	CsBoard csBoard = csBoardDao.getBoardByCsBoardNo(no);
	csBoard.setCsReplyContent(null);
	
	String check = "답변미완료";
	csBoard.setCsReplyCheck(check);
	csBoard.setCsReplyCreateDate(null);
	
	csBoardDao.updateCsBoard(csBoard);
	
	response.sendRedirect("detail.jsp?no=" + no + "&cpno=" + cpno+"&error=complete");
%>