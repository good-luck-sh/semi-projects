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
<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
	int userNo =  loginUserInfo.getUserNo();
	
	// 장바구니에서 상품을 체크하지 않고 주문을 요청한 경우
	String[] basketNoArray = request.getParameterValues("basketNo");// ["23", "24"]
	List<UserBasket> userBasketList = new ArrayList<>();
	UserBasketDao userBasketDao = UserBasketDao.getInstance();
	
	if (basketNoArray == null) {
		response.sendRedirect("../user/basket.jsp?no="+loginUserInfo.getUserNo()+"&error=empty-basket");
		return;
	}else {
		for (String str : basketNoArray) {
			int basketNo = Integer.parseInt(str);
			UserBasket userBasket = userBasketDao.getUserBasketBybasketNo(basketNo);
			userBasketList.add(userBasket);
		}
	}
	
	
	
	
	// 고객등급별 포인트 적립
	double savePointRate = 0;
	String degree = loginUserInfo.getUserDegree();
	if (degree == null) {
		savePointRate = 0;
	} else if (degree.equals("브론즈")) {
		savePointRate = 0.01;
	} else if (degree.equals("실버")) {
		savePointRate = 0.02;
	} else if (degree.equals("골드")) {
		savePointRate = 0.03;
	} else {
		savePointRate = 0.04;
	}
	
	String error = request.getParameter("error");
	if ("empty-name".equals(error)) {
%>
			<div class="alert alert-danger">
				<strong>주문 실패</strong> 받는분 성함을 입력해주세요.
			</div>
<%
	} else if ("empty-address".equals(error)) {
%>
			<div class="alert alert-danger">
				<strong>주문 실패</strong> 받는분 주소를 입력해주세요.
			</div>
<%
	} else if ("empty-phoneNumber".equals(error)) {
%>
			<div class="alert alert-danger">
				<strong>주문 실패</strong> 받는분 전화번호를 입력해주세요.
			</div>
<%
	} else if ("point-error".equals(error)) {
%>
			<div class="alert alert-danger">
				<strong>주문 실패</strong> 할인 포인트는 보유포인트 보다 클 수 없습니다.
			</div>
<%
	} else if ("point-error2".equals(error)) {
%>
			<div class="alert alert-danger">
				<strong>주문 실패</strong> 할인 포인트는 0보다 작은 값으로 사용할 수 없습니다.
			</div>
<%
	} else if ("point-error3".equals(error)) {
%>
		<div class="alert alert-danger">
			<strong>주문 실패</strong> 할인 포인트를 주문금액보다 많이 사용할 수 없습니다.
		</div>
<%
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
															<td><input name="orderName" class="inputTypeText" size="15" value="" type="text" ></td>
														</tr>
														<tr >
															<th scope="row">주소</th>
															<td><input name="orderAddress" id="orderAddress" class="inputTypeText" size="15" value="" type="text" onclick="execDaumPostcode()"></td>
														</tr>
														<tr >
															<th scope="row">상세 주소</th>
															<td><input name="orderDetailAddress" class="inputTypeText" size="15" value="" type="text"></td>
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
	for (UserBasket basket : userBasketList) {
%>
												<div class="ec-base-prdInfo xans-record-">
													<div class="prdBox">
														<div class="thumbnail">
															<a href="../product/detail.jsp?productNo=<%=basket.getProduct().getProductNo()%>">
																<img src="<%=basket.getProduct().getProductPicture() %>" alt="" width="90" height="90">
															</a>
															<input type="hidden" name="basketNo" value="<%=basket.getUserBasketNo()%>">
														</div>
														<div class="description">
															<strong class="prdName" title="상품명">
																<a href="../product/detail.jsp?productNo=<%=basket.getProduct().getProductNo()%>" class="ec-product-name">
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
												<span class="summary">(사용가능 <span id="test2" name="test2" class="txtEm"> <%=loginUserInfo.getUserOrderPoint()%> point</span>)</span>
												<input type="hidden" name="nowPoint" value="<%=loginUserInfo.getUserOrderPoint()%>">
												<div class="control  mb-3">
													<input type="hidden" id="UseAblePoint" value="<%=loginUserInfo.getUserOrderPoint()%>">
													<input id="UseAll" type="text" name="UseAll" class="inputTypeText" size="10" value="0" >
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
	for (UserBasket basket : userBasketList) {
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
	for (UserBasket basket : userBasketList) {
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
	
	function execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function (data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            let fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	            let extraRoadAddr = ""; // 참고 항목 변수

	            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	            if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
	                extraRoadAddr += data.bname;
	            }
	            // 건물명이 있고, 공동주택일 경우 추가한다.
	            if (data.buildingName !== "" && data.apartment === "Y") {
	                extraRoadAddr +=
	                    extraRoadAddr !== "" ? ", " + data.buildingName : data.buildingName;
	            }
	            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	            if (extraRoadAddr !== "") {
	                extraRoadAddr = " (" + extraRoadAddr + ")";
	            }

	            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	            if (fullRoadAddr !== "") {
	                fullRoadAddr += extraRoadAddr;
	            }

	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            var address = document.getElementById('orderAddress');
	            address.value = fullRoadAddr;
	        },
	    }).open();
	}
</script>
</body>
</html>


















