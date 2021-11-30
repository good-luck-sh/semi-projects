<%@page import="vo.Product"%>
<%@page import="dao.UserDao"%>
<%@page import="dao.ProductReviewJdbcDao"%>
<%@page import="vo.Review"%>
<%@page import="vo.UserTable"%>
<%@page import="dao.ReviewJdbcDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	UserTable loginUserInfo = (UserTable)session.getAttribute("LOGIN_USER_INFO");
	
	int order = Integer.parseInt(request.getParameter("order"));
	
	String title = request.getParameter("reviewTitle");
	String text = request.getParameter("reviewText");
	int star = Integer.parseInt(request.getParameter("star"));
	
	order += 1;
	ReviewJdbcDao reviewDao = ReviewJdbcDao.getInstance();
	if(loginUserInfo == null) {
		response.sendRedirect("../loginform.jsp?error=empty");
		return;
	}
	if(title != null && title.isBlank()) {//title이 null이 아니고,title의 값이 비어있으면
		response.sendRedirect("form.jsp?error=reviewTitle");
		return;
	}
	if(text != null && text.isBlank()) {//내용이 null이 아니고, 내용의 값이 비어있으면
		response.sendRedirect("form.jsp?error=reviewText");
		return;
	}
	if(star == 0) {//내용이 null이 아니고, 내용의 값이 비어있으면
		response.sendRedirect("form.jsp?error=noStar");
		return;
	}
		
	Review review = new Review();
	review.setReviewTitle(title);
	review.setReviewContent(text);
	review.setReviewStarPoint(star);

	UserDao user = UserDao.getInstance();
	
	UserTable findUser = user.getUserAllInfoByNo(loginUserInfo.getUserNo());  
	
	UserTable users = new UserTable();
	users.setUserNo(loginUserInfo.getUserNo());
	review.setUserTable(users);
	reviewDao.insertReviewById(review);
	
	//나중에 여기서 user의 no로 찾는 DAO를 작성한다. 나중에 user의 order의 실제 구매 point를 구해온다.
	int getPoint = (int)(users.getUserOrderPoint() * 0.01);
	users.setUserOrderPoint(getPoint);
	
	review.setUserTable(users);
	
	response.sendRedirect("detail.jsp?succes=complete&cpno=1");
	
%>