<%@page import="vo.Review"%>
<%@page import="vo.UserTable"%>
<%@page import="dao.ReviewJdbcDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	UserTable loginUserInfo = (UserTable)session.getAttribute("LOGIN_USER_INFO");
	//저장되어 있는 user의 객체를 저장하는 session객체이다.
	
	String title = request.getParameter("reviewTitle");
	String text = request.getParameter("reviewText");
	
	ReviewJdbcDao reviewDao = ReviewJdbcDao.getInstance();
//	if(loginUserInfo == null) {
//		response.sendRedirect("form.jsp?error=empty");
//		return;
//	}	--입력되는지 확인 후 주석 풀기, 그리고 form에는 loginfrom.jsp의 값을 입력하기
	if(title != null && title.isBlank()) {//title이 null이 아니고,title의 값이 비어있으면
		response.sendRedirect("form.jsp?error=reviewTitle");
		return;
	}
	if(text != null && text.isBlank()) {//내용이 null이 아니고, 내용의 값이 비어있으면
		response.sendRedirect("form.jsp?error=reviewText");
		return;
	}
	
	Review review = new Review();
	review.setReviewTitle(title);
	review.setReviewContent(text);
	reviewDao.insertReviewById(review);
	
	response.sendRedirect("detail.jsp?no=1&succes=complete");
	
%>