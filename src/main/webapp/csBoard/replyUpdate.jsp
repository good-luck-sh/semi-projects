<%@page import="java.util.Date"%>
<%@page import="vo.CsBoard"%>
<%@page import="dao.CsBoardJdbcDao"%>
<%@page import="vo.UserTable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	int cpno = Integer.parseInt(request.getParameter("cpno"));
	String managerCheck = request.getParameter("managercheck");
	String Managercontent = request.getParameter("manager_content");
	String check = "답변완료";

	UserTable loginUserInfo = (UserTable)session.getAttribute("LOGIN_USER_INFO");
	if(loginUserInfo == null) {
		response.sendRedirect("../main/loginform.jsp?error=empty");
		return;
	}
	if(loginUserInfo.getManagerCheck() == null) {
		response.sendRedirect("detail.jsp?no="+no+"&cpno"+cpno+"&error=nomanager");
		return;
	}
	

	CsBoardJdbcDao csBoardDao = CsBoardJdbcDao.getInstance();
	CsBoard csBoard = csBoardDao.getBoardByCsBoardNo(no);
	csBoard.setCsReplyCheck(check);
	csBoard.setCsReplyContent(Managercontent);
	csBoard.setCsReplyCreateDate(new Date());
	
	csBoardDao.updateCsBoardByReply(csBoard);
	response.sendRedirect("detail.jsp?no=" + no + "&cpno=" + cpno+"&error=complete&userNo="+loginUserInfo.getUserNo());
%>