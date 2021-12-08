<%@page import="vo.NoticeBoard"%>
<%@page import="dao.NoticeBoardDao"%>
<%@page import="vo.UserTable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
int no = Integer.parseInt(request.getParameter("no"));
	String pageNo = request.getParameter("pageNo");

	UserTable loginUserInfo = (UserTable)session.getAttribute("LOGIN_USER_INFO");

	if (loginUserInfo == null) {
		response.sendRedirect("../main/loginform.jsp?error=login-required");
		return;
	}

	NoticeBoardDao noticeBoardDao = NoticeBoardDao.getInstance();

	noticeBoardDao.deleteBoard(no);

	response.sendRedirect("notice.jsp?pageNo="+pageNo);

 
%>