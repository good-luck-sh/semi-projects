<%@page import="java.util.Date"%>
<%@page import="vo.CsBoard"%>
<%@page import="dao.CsBoardJdbcDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	int cpno = Integer.parseInt(request.getParameter("cpno"));
	
	String replyContent = request.getParameter("");
	String check = "답변완료";

	CsBoardJdbcDao csBoardDao = CsBoardJdbcDao.getInstance();
	CsBoard csBoard = csBoardDao.getBoardByCsBoardNo(no);
	csBoard.setCsReplyContent(replyContent);
	csBoard.setCsReplyCheck(check);
	csBoard.setCsReplyCreateDate(new Date());
	
	csBoardDao.updateCsBoard(csBoard);
	response.sendRedirect("detail.jsp?cpno="+cpno);
	
%>