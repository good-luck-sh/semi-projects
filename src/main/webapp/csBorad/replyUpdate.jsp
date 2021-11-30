<%@page import="java.util.Date"%>
<%@page import="vo.CsBoard"%>
<%@page import="dao.CsBoardJdbcDao"%>
<%@page import="vo.UserTable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	int cpno = Integer.parseInt(request.getParameter("cpno"));
	String managerCheck = request.getParameter("managercheck");
	String content = request.getParameter("content");
	String check = "답변완료";

	UserTable loginUserInfo = (UserTable)session.getAttribute("LOGIN_USER_INFO");
	if(loginUserInfo == null) {
		response.sendRedirect("loginform.jsp?error=empty");
		return;
	}
	if("일반사용자".equals(managerCheck)) {
		response.sendRedirect("detail.jsp?no="+no+"&cpno"+cpno+"&error=nomanager");
		return;
	}
	if(managerCheck == null) {
		response.sendRedirect("detail.jsp?no="+no+"&cpno"+cpno+"&error=nomanager");
		return;
	}
	

	CsBoardJdbcDao csBoardDao = CsBoardJdbcDao.getInstance();
	CsBoard csBoard = csBoardDao.getBoardByCsBoardNo(no);
	csBoard.setCsReplyCheck(check);
	csBoard.setCsReplyContent(content);
	csBoard.setCsReplyCreateDate(new Date());
	
	csBoardDao.updateCsBoard(csBoard);
	
	response.sendRedirect("detail.jsp?no=" + no + "&cpno=" + cpno+"&error=complete");
%>