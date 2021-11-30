<%@page import="vo.CsBoard"%>
<%@page import="vo.UserTable"%>
<%@page import="dao.UserDao"%>
<%@page import="dao.CsBoardJdbcDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	UserTable loginUserInfo = (UserTable)session.getAttribute("LOGIN_USER_INFO");
	
	String userCheck = request.getParameter("managercheck");
	int no = Integer.parseInt(request.getParameter("no"));
	int cpno = Integer.parseInt(request.getParameter("cpno"));
	
	if(loginUserInfo == null) {
		response.sendRedirect("loginform.jsp?error=empty");
		return;
	}
	if("매니저".equals(loginUserInfo.getManagerCheck())) {
		response.sendRedirect("form.jsp?error=nomanager");
		return;
	}
	String title = request.getParameter("title");
	String text = request.getParameter("text");
	
	CsBoardJdbcDao csBoardDao = CsBoardJdbcDao.getInstance();
	UserDao userDao = UserDao.getInstance();
	UserTable findUser = userDao.getUserAllInfoByNo(loginUserInfo.getUserNo());
	CsBoard csBoard = new CsBoard();
	
	csBoard.setCsBoardTitle(title);
	csBoard.setCsBoardContent(text);
	csBoard.setUserTable(findUser);
	
	csBoardDao.insertCsBoard(csBoard);
	
	response.sendRedirect("detail.jsp?no=" + no + "&cpno=" + cpno+"&error=complete");
%>