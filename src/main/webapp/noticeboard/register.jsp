<%@page import="dao.NoticeBoardDao"%>
<%@page import="vo.NoticeBoard"%>
<%@page import="vo.UserTable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	// noticeboard/form.jsp에서 noticeboard/register.jsp로 제출한 폼 입력값 조회하기
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	// title 제목이 없으면 공지사항을 등록할 수 없다.
	if (title != null && title.isBlank()) {
		response.sendRedirect("form.jsp?error=empty-title");
		return;
	}
	
	// content 내용이 없으면 공지사항을 등록할 수 없다.
	if (content != null && content.isBlank()) {
		response.sendRedirect("form.jsp?error=empty-content");
		return;
	}
	
	UserTable loginUserInfo = (UserTable)session.getAttribute("LOGIN_USER_INFO");
	
	if (loginUserInfo == null) {
		response.sendRedirect("../main/loginform.jsp?error=login-required");
		return;
	}
	
	// NoticeBoard객체생성. 생성한 NoticeBoard객체에 제목, 내용을 저장한다.
	NoticeBoard noticeBoard = new NoticeBoard();
	noticeBoard.setBoardTitle(title);
	noticeBoard.setBoardContent(content);
	
	// 공지사항 관련기능을 제공하는 NoticeBoardDao 객체를 획득한다.
	NoticeBoardDao noticeBoardDao = NoticeBoardDao.getInstance();
	// 공지사항 정보를 테이블에 저장한다.
	noticeBoardDao.insertNotice(noticeBoard);
	// 클라이언트에게 공지사항 목록을 요청하게 하는 응답을 보낸다.
	response.sendRedirect("notice.jsp");
	
%>