<%@page import="java.util.List"%>
<%@page import="vo.UserTable"%>
<%@page import="vo.UserBasket"%>
<%@page import="dao.UserBasketDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.Product"%>
<%@page import="dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	//로그인한 사용자정보가 세션에 존재하지 않으면 상품을 장바구니에 담을 수 없다.
	 UserTable loginUserInfo = (UserTable)session.getAttribute("LOGIN_USER_INFO");
	if (loginUserInfo == null) {
		response.sendRedirect("../main/loginform.jsp?error=login-required");
		return;
	}

	// 상품 디테일 폼 물어보고하기
	int productNo = Integer.parseInt(request.getParameter("productNo"));
	
	// 상품 번호로 상품찾기
	ProductDao productDao = new ProductDao();
	Product product = productDao.getProductByProductNo(productNo);
	
	
	UserBasketDao basketDao = UserBasketDao.getInstance();
	
	// 유저 바구니에 있는 상품 찾기
	UserBasket userBasketItem = basketDao.getUserBasketByuserNoandProductNo(loginUserInfo.getUserNo(), productNo);
	
	// 일단 업데이트는 되는데 새로운 등록이 안되는 상태! 확인해보자
	
	
	// 장바구니에 상품이 있는지 확인하고 있으면 amount를 +1로 수정 없으면 상품 1개 추가
	if(userBasketItem == null){
		UserBasket basket = new UserBasket();
		basket.setBasketAmount(1);
		basket.setUserTable(loginUserInfo);
		basket.setProduct(product);
		// 등록
		basketDao.insertUserBasket(basket);
		response.sendRedirect("../product/detail.jsp?success=complete&&productNo="+productNo);
		return;

		
	} 
	
	if(userBasketItem != null) {
		userBasketItem.setBasketAmount(userBasketItem.getBasketAmount()+1);
		// 업데이트
		basketDao.updateBasket(userBasketItem);
		response.sendRedirect("../product/detail.jsp?success=complete&&productNo="+productNo);
		return;
		
	}
	
	
	

	
	
	
	

%>