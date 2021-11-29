<%@page import="vo.Product"%>
<%@page import="dao.UserDao"%>
<%@page import="dao.ProductReviewJdbcDao"%>
<%@page import="vo.Review"%>
<%@page import="vo.UserTable"%>
<%@page import="dao.ReviewJdbcDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	UserTable loginUserInfo = (UserTable)session.getAttribute("LOGIN_USER_INFO");
	//저장되어 있는 user의 객체를 저장하는 session객체이다.
	int no = Integer.parseInt(request.getParameter("no"));
	int cpno = Integer.parseInt(request.getParameter("cpno"));
	
	String title = request.getParameter("reviewTitle");
	String text = request.getParameter("reviewText");
	int star = Integer.parseInt(request.getParameter("star"));
	int orderProduct = 0;
	int totalProduct = orderProduct + 1;
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
	if(star == 0) {//내용이 null이 아니고, 내용의 값이 비어있으면
		response.sendRedirect("form.jsp?error=noStar");
		return;
	}
		
	Review review = new Review();
	review.setReviewTitle(title);
	review.setReviewContent(text);
	review.setReviewStarPoint(star);

	UserDao user = new UserDao();
	int userNo = 1;
	UserTable findUser = user.getUserAllInfoByNo(userNo); //값이 입력되는지 확인되기 위한 값, 나중에 session에서 추출해야한다. 
	UserTable users = new UserTable();
	users.setUserNo(userNo);
	review.setUserTable(users);
	
	reviewDao.insertReviewById(review);

	ProductReviewJdbcDao productDao = ProductReviewJdbcDao.getInstance();

	Product product = productDao.getAllReviewByReviewNo(review.getReviewNo());
	
	int productReview = product.getProductReviewCount() + 1;
	int productStar = (product.getPrdocutStarPoint() + star) / (totalProduct);
	
	product.setProductReviewCount(productReview);
	product.setPrdocutStarPoint(productStar);
	productDao.updateProductByProductNo(product);
	
	//UserTable users = new UserTable();//유저의 적립포인트 
	//나중에 여기서 user의 no로 찾는 DAO를 작성한다. 나중에 user의 order의 실제 구매 point를 구해온다.
	//int getPoint = (int)(user.getUserOrderPoint() * 0.01);
	//user.setUserOrderPoint(getPoint);
	
	//review.setUserTable(user);
	
	response.sendRedirect("detail.jsp?no=1&succes=complete&cpno=1");
	
%>