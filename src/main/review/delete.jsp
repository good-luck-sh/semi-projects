<%@page import="vo.Review"%>
<%@page import="dao.ReviewJdbcDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	int cpno = Integer.parseInt(request.getParameter("cpno"));
	int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));

	ReviewJdbcDao reviewDao = ReviewJdbcDao.getInstance();
	Review review = reviewDao.getReviewById(reviewNo);
	reviewDao.deleteReviewById(review.getReviewNo());
	
	response.sendRedirect("detail.jsp?cpno="+cpno);

%>