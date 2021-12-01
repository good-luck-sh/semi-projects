<%@page import="vo.UserTable"%>
<%@page import="vo.Review"%>
<%@page import="dao.ReviewJdbcDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	UserTable loginUserInfo = (UserTable)session.getAttribute("LOGIN_USER_INFO");

	if(loginUserInfo == null) {
		response.sendRedirect("loginform.jsp?error=empty");
		return;
	}
	
	int no = Integer.parseInt(request.getParameter("no"));
	int cpno = Integer.parseInt(request.getParameter("cpno"));
	int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
	String title = request.getParameter("reviewTitle");
	String text = request.getParameter("reviewText");

	ReviewJdbcDao reviewDao = ReviewJdbcDao.getInstance();
	if (title != null && title.isBlank()) {//title이 null이 아니고,title의 값이 비어있으면
	response.sendRedirect("form.jsp?error=reviewTitle");
	return;
	}
	if (text != null && text.isBlank()) {//내용이 null이 아니고, 내용의 값이 비어있으면
	response.sendRedirect("form.jsp?error=reviewText");
	return;
	}
	
	Review review = reviewDao.getReviewByReviewNo(reviewNo);
	review.setReviewTitle(title);
	review.setReviewContent(text);
	reviewDao.updateReviewById(review);
	
	response.sendRedirect("reviewUserDetail.jsp?no="+ no + "&cpno=" + cpno);
	
%>