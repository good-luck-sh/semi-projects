<%@page import="vo.Review"%>
<%@page import="dao.ReviewJdbcDao"%>
<%@page import="dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	int cpno = Integer.parseInt(request.getParameter("cpno"));
	int ReviewNo = Integer.parseInt(request.getParameter("reviewNo"));
	
	
	ReviewJdbcDao reviewDao = ReviewJdbcDao.getInstance();
	Review review = reviewDao.getReviewById(ReviewNo);
	int like = review.getReviewReviewLikeCount() + 1;
	review.setReviewReviewLikeCount(like);
	reviewDao.updateReviewById(review);

	response.sendRedirect("detail.jsp?&cpno="+cpno);

%>