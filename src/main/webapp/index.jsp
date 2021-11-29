<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
    <title></title>
</head>
<body>
<%
	pageContext.setAttribute("menu","home");
%>
<%@ include file="../navbar/nav.jsp" %>
<div class="container"> 

<%
	UserTable user = (UserTable)session.getAttribute("LOGIN_USER_INFO");
	if (user == null) {
	
%>

<%
	} else {		
%>
	<div class="mt-3">
		<p class="fs-4"><%=user.getUserName() %>님 환영합니다:)</p>
		<p class="fs-4">다양한 상품들을 만나보세요</p> 
	</div>
<%
	}
%>

<%
	String register = request.getParameter("register");
	if ("completed".equals(register)) {
%>
	<div class="row mb-3">
		<div class="col">
			<div class="alert alert-success">
				<strong>회원가입 완료</strong>
				<P>로그인 후 서비스를 사용하세요</P>
			</div>
		</div>
	</div>
<% 		
	}
%>	


	
  

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>