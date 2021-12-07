<%@page import="dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.UserBasket"%>
<%@page import="dao.UserBasketDao"%>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="../navbar/resource/img.png" type="image/x-icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="resource/test.css" rel="stylesheet">
<title>커먼 유니크::주문하기</title>
<%@ include file="../navbar/nav.jsp" %>
</head>
<body>
<%
	pageContext.setAttribute("menu", "login");
	// 로그인 안하면 로그인 페이지로 연결
	if (loginUserInfo == null) {
		response.sendRedirect("../main/loginform.jsp?error=login-required");
		return;
	}
	
	UserBasketDao userBasketDao = UserBasketDao.getInstance();
	int userNo =  loginUserInfo.getUserNo();
	List<UserBasket> userBasket = userBasketDao.getAllUserBasketItemByNo(loginUserInfo.getUserNo());
	
	// 장바구니가 비어있으면 장바구니 페이지로 연결
	if (userBasket.isEmpty()) {
		response.sendRedirect("../user/basket.jsp?no="+loginUserInfo.getUserNo()+"&error=empty-basket");
		return;
	}
	
	double savePointRate = 0;
	if (loginUserInfo.getUserDegree().equals("브론즈")) {
		savePointRate = 0.01;
	} else if (loginUserInfo.getUserDegree().equals("실버")) {
		savePointRate = 0.02;
	} else if (loginUserInfo.getUserDegree().equals("골드")) {
		savePointRate = 0.03;
	} else {
		savePointRate = 0.04;
	}
	
%>
	<div class="container" >
		<div>
			<form name="frm_order_act" action="order.jsp" method="post" target="_self" >
				<div id="mCafe24Order" sytle="width=100%">
					<div></div>
					<div class="billingNshipping">
					
						<!-- 주문자정보 -->
						<div  class="ec-base-fold eToggle">
							<div  class="title">
								<h2>주문자</h2>
								<span class="txtEm gRight float-right text-black"><Strong class="text-primary"><%= loginUserInfo.getUserName()%></Strong>님 (회원등급: <Strong class="text-primary"><%=loginUserInfo.getUserDegree()%></Strong>) 구매금액의 <Strong class="text-primary"><%=savePointRate*100%>%</Strong> point 적립</span>
								<input type="hidden" name="userNo" value="<%=loginUserInfo.getUserNo()%>">
							</div>

							<!-- 수령자 정보   -->
							<div  class="ec-base-fold eToggle selected">
								<div class="title">
									<h2>배송지</h2>
								</div>
								<div class="contents">
									<div class="tabCont newShipArea ">
										<div class="segment ec-shippingInfo-sameaddr ">
											<div class="ec-base-table typeWrite">
												<table border="1">
													<caption>배송 정보 입력</caption>
													<colgroup>
														<col style="width: 102px">
														<col style="width: auto">
													</colgroup>
													<tbody>
														<tr>
															<th scope="row">받는사람</th>
															<td><input name="orderName" class="inputTypeText" size="15" value="" type="text"></td>
														</tr>
														<tr >
															<th scope="row">주소</th>
															<td><input name="orderAddress" class="inputTypeText" size="15" value="" type="text"></td>
														</tr>
														<tr>
															<th scope="row">휴대전화</th>
															<td><input name="orderPhoneNumber" class="inputTypeText" size="15" value="" type="text"></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
								
								<!-- 주문상품 -->
								<div class="ec-base-fold eToggle selected">
									<div class="title">
										<h2>주문상품</h2>
									</div>
									<div class="contents">
<%
	for (UserBasket basket : userBasket) {
%>
												<div class="ec-base-prdInfo xans-record-">
													<div class="prdBox">
														<div class="thumbnail">
															<a href="#">
																<img src="<%=basket.getProduct().getProductPicture() %>" alt="" width="90" height="90">
															</a>
														</div>
														<div class="description">
															<strong class="prdName" title="상품명">
																<a href="#" class="ec-product-name">
																	<%=basket.getProduct().getProductName() %>
																</a>
															</strong>
															<ul class="info">
																<input type="hidden" name="productNo" value="<%=basket.getProduct().getProductNo()%>">
																<input type="hidden" name="productAmount" value="<%=basket.getBasketAmount()%>">
																<li>수량: <%=basket.getBasketAmount() %></li>
																<li>상품금액: <%= basket.getProduct().getProductPrice()%> * <%=basket.getBasketAmount()%> = <%=(basket.getProduct().getProductPrice() * basket.getBasketAmount())%> 원</li>
																<li class="text-primary" name="">할인금액: <%= basket.getProduct().getProductDiscountPrice() %> * <%=basket.getBasketAmount() %> = <%=(basket.getProduct().getProductDiscountPrice() * basket.getBasketAmount()) %> 원</li>
																<%
																	double temp = ((basket.getProduct().getProductDiscountPrice() * basket.getBasketAmount()) * savePointRate); 
																	int point = (int)temp;
																%>
																<li class="text-warning" id="">적립포인트: <%=point%> point</li>
															</ul>
														</div>
													</div>
												</div>
<%
	}
%>

									<div class="ec-base-fold eToggle selected">
										<div class="title">
											<h2>포인트할인</h2>
										</div>
										<div class="contents">
											<div class="discountDetail ">
												<strong class="heading">적립포인트</strong>
												<span class="summary">(사용가능 <span id="test2" class="txtEm"> <%=loginUserInfo.getUserOrderPoint()%> point</span>)</span>
												<input type="hidden" name="nowPoint" value="<%=loginUserInfo.getUserOrderPoint()%>">
												<div class="control  mb-3">
													<input type="hidden" id="UseAblePoint" value="<%=loginUserInfo.getUserOrderPoint()%>">
													<input id="UseAll" type="text" name="" class="inputTypeText" size="10" value="0" >
													<button type="button" class="btnNormal" onclick="allPoint()">전액 사용</button>
												</div>
													<button type="button" class="btnNormal" onclick="CommitPoint()">적용</button>
											</div>
											<div class="totalPay">
												<h3 class="heading">적용 포인트</h3>
												<strong class="txtEm">
													<span class="CommitPoint2">0</span> point
												</strong>
												<span class="displaynone"> 100</span>
											</div>
										</div>
									</div>
								</div>
								
								<div class="ec-base-fold eToggle selected">
									<div class="title">
										<h2>결제정보</h2>
									</div>
									<div class="contents">
										<div class="segment">
											<div class="ec-base-table gCellNarrow">
												<table border="1">
													<caption>결제정보 상세</caption>
													<tbody>
														<tr>
															<th scope="row">주문상품</th>
															<td class="right">
<%
	int totalPrice = 0;
	for (UserBasket basket : userBasket) {
		totalPrice += (basket.getProduct().getProductDiscountPrice() * basket.getBasketAmount());
	}
%>
																<span id="orderTotalPrice"><%=totalPrice%></span>won
																<input type="hidden" name="orderTotalPrice" value="<%=totalPrice%>">
															</td>
														</tr>
														<tr>
															<th scope="row">사용포인트</th>
															<td class="right">
																<span class="CommitPoint2">0</span> point
																<input id="SendCommitPoint" type="hidden" name="orderUsePoint" value="0">
															</td>
														</tr>
													</tbody>
												</table>
											</div>
											<div class="totalPay gBlank10">
												<h3 class="heading">결제금액</h3>
												<strong class="txtStrong">
													<span id="totalPrice"><%=totalPrice%></span> won
												</strong>
											</div>
										</div>
									</div>
								</div>
								
								<!-- point 적립 -->
<%
	int totalPoint = 0;
	for (UserBasket basket : userBasket) {
		totalPoint += (basket.getProduct().getProductDiscountPrice() * basket.getBasketAmount() * savePointRate);
	}
%>
								<div class="ec-base-fold eToggle">
									<div class="title">
										<h2>적립 혜택</h2>
										<span class="txtStrong gRight"><%=totalPoint%>point 적립예정</span>
										<input name="orderTotalPoint" type="hidden" value="<%=totalPoint%>">
									</div>
								</div>
								
								<div class="ec-base-button gFull">
									<button type="submit" class="btnSubmit">
										<span id="buttonPrice"><%=totalPrice%></span> won
										<input id="orderRealTotalPrice" name="orderRealTotalPrice" type="hidden" value="<%=totalPrice%>">
										<span>결제하기</span>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
	function allPoint() {
		var UseAblePoint = document.getElementById("UseAblePoint");
		var UseAll = document.getElementById("UseAll");
		UseAll.value = UseAblePoint.value;
	}
	
	function CommitPoint() {
		var UseAll = document.getElementById("UseAll");
		
		
		var classLength = document.getElementsByClassName("CommitPoint2").length
		for(var i = 0; i < classLength; i++){
			document.getElementsByClassName("CommitPoint2")[i].innerHTML = UseAll.value;
		}
		document.getElementById("SendCommitPoint").value = UseAll.value;
		
		var a = UseAll.value //사용포인트
		var b = document.getElementById("orderTotalPrice").innerHTML;//주문총가격
		
		document.getElementById("totalPrice").innerHTML = b-a;
		document.getElementById("buttonPrice").innerHTML = b-a;
		document.getElementById("orderRealTotalPrice").value = b-a;
		
	}
</script>
</body>
</html>


















