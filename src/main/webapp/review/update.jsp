<%@page import="vo.Review"%>
<%@page import="dao.ReviewJdbcDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	int cpno = Integer.parseInt(request.getParameter("cpno"));
	int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));

	String title = request.getParameter("reviewTitle");
	String text = request.getParameter("reviewText");

	ReviewJdbcDao reviewDao = ReviewJdbcDao.getInstance();
//if(loginUserInfo == null) {
//	response.sendRedirect("form.jsp?error=empty");
//	return;
//}	--입력되는지 확인 후 주석 풀기, 그리고 form에는 loginfrom.jsp의 값을 입력하기
	if (title != null && title.isBlank()) {//title이 null이 아니고,title의 값이 비어있으면
	response.sendRedirect("form.jsp?error=reviewTitle");
	return;
	}
	if (text != null && text.isBlank()) {//내용이 null이 아니고, 내용의 값이 비어있으면
	response.sendRedirect("form.jsp?error=reviewText");
	return;
	}
	
	Review review = reviewDao.getReviewById(reviewNo);
	review.setReviewTitle(title);
	review.setReviewContent(text);
	reviewDao.updateReviewById(review);
	
	response.sendRedirect("reviewUserDetail.jsp?no="+ no + "&cpno=" + cpno);
	
%>