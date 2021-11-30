<%@page import="vo.UserBasket"%>
<%@page import="dao.UserBasketDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	int userNo = Integer.parseInt(request.getParameter("no"));
	int basketNo = Integer.parseInt(request.getParameter("basketNo"));
	
	// 로그인한 사용자정보가 세션에 존재하지 않으면 장바구니 제품을 삭제할 수 없다.
	// UserTable loginUserInfo = (UserTable)session.getAttribute("LOGIN_USER_INFO");
	//if (loginUserInfo == null) {
	//	response.sendRedirect("../loginform.jsp?error=login-required");
	//	return;
	//}
	
	
	UserBasketDao basketDao = UserBasketDao.getInstance();
	
	// 해당 장바구니 제품 조회
	UserBasket basket = basketDao.getUserBasketByNo(basketNo);
	
	// 장바구니 유저와 삭제요청할 유저의 번호가 서로 다른 경우 장바구니를 삭제할 수 없다.
	// 클라이언트에게 자신의 장바구니 basket.jsp를 재요청하는 응답을 보낸다.
	// 재요청 URL에 오류원인을 포함시킨다.
	//if (basket.getUserTable().getUserNo() != loginUserInfo.getNo()) {
	//	response.sendRedirect("basket.jsp?no="+userNo+"&error=deny-delete");
	//	return;
	//}
	
	//basketDao.deleteBasketProduct(basketNo);
	
	//response.sendRedirect("basket.jsp?no="+userNo);
%>