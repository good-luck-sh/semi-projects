<%@page import="java.util.Date"%>
<%@page import="vo.CsBoard"%>
<%@page import="dao.CsBoardJdbcDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	int cpno = Integer.parseInt(request.getParameter("cpno"));
	
	String title = request.getParameter("title");
	String content = request.getParameter("text");
	
	CsBoardJdbcDao csBoardDao = CsBoardJdbcDao.getInstance();
	CsBoard csBoard = csBoardDao.getBoardByCsBoardNo(no);
	csBoard.setCsBoardTitle(title);
	csBoard.setCsBoardContent(content);
	csBoard.setCsUpdateDate(new Date());
	
	csBoardDao.updateCsBoard(csBoard);
	
	response.sendRedirect("detail.jsp?no="+ no + "&cpno="+cpno + "&error=complete");
%>