<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>매니저 메뉴 확인하기</title>
</head>
<body>
<%
	pageContext.setAttribute("menu", "login");
	//네비바 활성화를 위하여 pageContext에서 값을 꺼내온다.
%>
<%@ include file="../navbar/nav.jsp" %>
<div class ="container mt-3">
	<div class="row">
		<div class="col">
<%
	if(loginUserInfo == null) {
	response.sendRedirect("../main/loginform.jsp?error=empty");
	return;
	}
	if(loginUserInfo.getManagerCheck() == null) {
		response.sendRedirect("../main/loginform.jsp?error=login-required");
	}
%>
			<h1 class=>매니저 메뉴 확인하기</h1>
			<div class="dropdown">
			  <button class="btn btn-secondary dropdown-toggle  mt-3" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
 				매니저 메뉴 
  			</button>
			<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
				<li><a class="dropdown-item" href="saleslist.jsp">월별 매출 조회</a></li>
				<li><a class="dropdown-item" href="agelist.jsp">연령별 가입 현황 조회</a></li>
				<li><a class="dropdown-item" href="genderlist.jsp">성별 가입 현황 조회</a></li>
				<li><a class="dropdown-item" href="userSystem.jsp">매니저 등록하기</a></li>
				<li><a class="dropdown-item" href="totalordereview.jsp?cpno=1">주문 리뷰 보기</a></li>
			</ul>
			</div>
			<div class="text-right mt-3">
			<a href="../user/detail.jsp" class="btn btn-info">뒤로 가기</a>
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> 
</body>
</html>