<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
    <title>회원가입폼</title>
</head>
<body>
<%
	pageContext.setAttribute("menu", "register");
%>
<%@ include file="navbar/nav.jsp" %>
<div class="container">

<%
	String error = request.getParameter("error");
%>
<%
	if ("id-exists".equals(error)) {					
%>
	<div class="alert alert-danger">
				<strong>회원가입 실패</strong> 다른 사용자가 사용중인 아이디입니다. 아이디를 확인하세요.
			</div>
<%
	} 
%>
			
	
	
	<div class="row mb-3">
		<div class="col">
			<h1 class="fs-3">회원가입폼</h1>
			
			<form class="form-horizontal" method="post" action="register.jsp">
				<div class="row mb-3">
					<label class="col-2 col-form-label text-left">아이디</label>
					<div class="col-4">
						<input type="text" class="form-control" name="id" id="user-id">
					</div>
				</div>
				<hr>
				<div class="row mb-3">
					<label class="col-2 col-form-label text-left">비밀번호</label>
					<div class="col-4">
						<input type="password" class="form-control" name="password" id="user-password">
					</div>
				</div>
				<hr>
				<div class="row mb-3">
					<label class="col-2 col-form-label text-left">이름</label>
					<div class="col-4">
						<input type="text" class="form-control" name="name" id="user-name">
					</div>
				</div>
				<hr>
				<div class="row mb-3">
					<label class="col-2 col-form-label text-left">나이</label>
					<div class="col-4">
						<input type="text" class="form-control" name="age" id="user-age">
					</div>
				</div>
				<hr>
				<div class="row mb-3">
					<label class="col-2 col-form-label text-left">성별</label>
					<div class="col-4">
						<input type="text" class="form-control" name="gender" id="user-gender">
					</div>
				</div>
				<hr>
				<div class="row mb-3">
					<label class="col-2 col-form-label text-left">주소</label>
					<div class="col-4">
						<input type="text" class="form-control" name="address" id="user-address">
					</div>
				</div>
				<hr>
				<div class="mb-3 text-end">
					<button type="submit" class="btn btn-primary">회원가입</button>
				</div>
			</form>	

			
		</div>
	</div>	
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>