<%@page import="vo.UserTable"%>
<%@page import="vo.Review"%>
<%@page import="dao.ReviewJdbcDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	UserTable loginUserInfo = (UserTable)session.getAttribute("LOGIN_USER_INFO");

	int no = Integer.parseInt(request.getParameter("no"));
	int cpno = Integer.parseInt(request.getParameter("cpno"));
	int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));

	if(loginUserInfo == null) {
		response.sendRedirect("../main/loginform.jsp?error=empty");
		return;
	}
	if(reviewNo == 0) {//title이 null이 아니고,title의 값이 비어있으면
		response.sendRedirect("reviewUserDetail.jsp?no="+no+"&cpno="+cpno+"&error=empty");
		return;
	}
	ReviewJdbcDao reviewDao = ReviewJdbcDao.getInstance();
	Review review = reviewDao.getReviewByReviewNo(reviewNo);
	reviewDao.deleteReviewById(review.getReviewNo());
	
	response.sendRedirect("detail.jsp?cpno="+cpno+"&error=ok");

%>