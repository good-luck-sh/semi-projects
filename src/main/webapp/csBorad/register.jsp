<%@page import="vo.CsBoard"%>
<%@page import="vo.UserTable"%>
<%@page import="dao.UserDao"%>
<%@page import="dao.CsBoardJdbcDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	String title = request.getParameter("title");
	String text = request.getParameter("text");
	String user = request.getParameter("userName");
	
	CsBoardJdbcDao csBoardDao = CsBoardJdbcDao.getInstance();
	UserDao userDao = new UserDao();
	UserTable findUser = userDao.getUserAllInfoByNo(1);
	CsBoard csBoard = new CsBoard();
	
	csBoard.setCsBoardTitle(title);
	csBoard.setCsBoardContent(text);
	csBoard.setUserTable(findUser);
	
	csBoardDao.insertCsBoard(csBoard);
%>