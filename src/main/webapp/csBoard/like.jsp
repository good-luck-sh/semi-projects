<%@page import="vo.UserTable"%>
<%@page import="dao.CsBoardJdbcDao"%>
<%@page import="dao.CsBoardDao"%>
<%@page import="vo.CsBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	UserTable loginUserInfo = (UserTable)session.getAttribute("LOGIN_USER_INFO");
	int no = Integer.parseInt(request.getParameter("no"));
	int cpno = Integer.parseInt(request.getParameter("cpno"));
	
	CsBoardJdbcDao csBoardDao = CsBoardJdbcDao.getInstance();
	CsBoard csBoard = csBoardDao.getBoardByCsBoardNo(no);
	
	int likeCount = csBoard.getCsBoardLikeCount() + 1;
	csBoard.setCsBoardLikeCount(likeCount);
	
	csBoardDao.updateCsBoard(csBoard);
	
	response.sendRedirect("detail.jsp?no="+no+"&cpno="+cpno+"&userNo="+loginUserInfo.getUserNo());
%>
