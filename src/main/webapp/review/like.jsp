<%@page import="vo.UserTable"%>
<%@page import="vo.Review"%>
<%@page import="dao.ReviewJdbcDao"%>
<%@page import="dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	UserTable loginUserInfo = (UserTable)session.getAttribute("LOGIN_USER_INFO");

	int no = Integer.parseInt(request.getParameter("no"));
	int cpno = Integer.parseInt(request.getParameter("cpno"));
	int ReviewNo = Integer.parseInt(request.getParameter("reviewNo"));
	
	if(loginUserInfo == null) {
		response.sendRedirect("../main/loginform.jsp?error=empty");
		return;
	}
	
	ReviewJdbcDao reviewDao = ReviewJdbcDao.getInstance();
	Review review = reviewDao.getReviewById(loginUserInfo.getUserNo());
	int like = review.getReviewReviewLikeCount() + 1;
	review.setReviewReviewLikeCount(like);
	reviewDao.updateReviewById(review);

	response.sendRedirect("detail.jsp?&cpno="+cpno);

%>