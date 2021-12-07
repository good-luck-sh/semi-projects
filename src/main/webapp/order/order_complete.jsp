<%@page import="vo.Orders"%>
<%@page import="dao.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="../navbar/resource/img.png" type="image/x-icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<title>커먼 유니크</title>
<link href="resource/test.css" rel="stylesheet">
	<%@ include file="../navbar/nav.jsp" %>
</head>
<body>
<%
	//네비바 활성화를 위하여 pageContext에서 값을 꺼내온다.
	pageContext.setAttribute("menu", "login");

	// 로그인 안하면 로그인 페이지로 연결
	if (loginUserInfo == null) {
		response.sendRedirect("../main/loginform.jsp?error=login-required");
		return;
	}
	
	int userNo =  loginUserInfo.getUserNo();
	OrderDao orderDao = new OrderDao();
	Orders orders = orderDao.selectOrdersPriceByOrderNo(loginUserInfo.getUserNo());
%>
<div class="container">
	<form id="frm_order_result" name="frm_order_result" action="" method="post" target="_self" enctype="multipart/form-data">
	<input id="bank_url_hidden" name="bank_url_hidden" value="" type="hidden">
		<div id="mCafe24Order" class="xans-element- xans-order xans-order-result typeHeader xans-record-">
			<div class="resultArea">
        		<p class="message"><strong>고객님의 주문이 정상적으로 완료되었습니다.</strong></p>
        		<div class="resultInfo">
            		<div class="ec-base-table gCellNarrow">
                	<table border="1">
                    <colgroup>
						<col style="width:94px">
						<col style="width:auto">
					</colgroup>
						<tbody>
							<tr>
								<th scope="row">주문자</th>
                        		<td class="right">
                        			<span class="txtEm"><%=loginUserInfo.getUserName()%></span>
                        		</td>
                    		</tr>
							<tr>
								<th scope="row">결제금액</th>
                        		<td class="right">
                                	<span class="txtEm"><%=orders.getOrderRealTotalPrice() %> won<span class="refer displaynone"></span></span>
                        		</td>
                   			</tr>
						</tbody>
					</table>
					</div>
        		</div>
    		</div>
    		
    		
    			
				<div class="ec-base-button gColumn">
        			<a href="../main/index.jsp" class="btnSubmit">주문확인하기</a>
        			<a href="../main/index.jsp" class="btnSubmit">쇼핑계속하기</a>
    			</div>
				</div>
			</div>
		</form>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>