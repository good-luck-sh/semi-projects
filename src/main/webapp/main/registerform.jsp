<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="../navbar/resource/img.png" type="image/x-icon">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
    <title>회원가입폼</title>
</head>
<body>
<%
	pageContext.setAttribute("menu", "login");
%>
<%@ include file="../navbar/nav.jsp" %>
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
	} else if ("id-empty".equals(error)) {					
%>
		<div class="alert alert-danger">
			<strong>회원가입 실패</strong> 아이디를 입력하세요.
		</div>
<%
	} else if ("password-empty".equals(error)) {					
%>
		<div class="alert alert-danger">
			<strong>회원가입 실패</strong> 비밀번호를 입력하세요.
		</div>
<%
	} else if ("all-empty".equals(error)) {					
%>
		<div class="alert alert-danger">
			<strong>회원가입 실패</strong> 기본정보를 입력하세요.
		</div>		
<%
	} else if ("name-empty".equals(error)) {					
%>
		<div class="alert alert-danger">
			<strong>회원가입 실패</strong> 이름을 입력하세요.
		</div>		
<%
	} else if ("address-empty".equals(error)) {					
%>
		<div class="alert alert-danger">
			<strong>회원가입 실패</strong> 주소를 입력하세요.
		</div>
<%
	}
%>


	<div class="row mb-3">
		<div class="col">
			<p class="fs-3">회원가입</p>
			<hr style="border: solid 2px brown;">
			<div class="row mb-3">
				<p class="col-2">회원구분</p>
				<div class="col">
					<input type="radio"checked="checked"/>개인회원
				</div>
			</div>
			<h4 style="line-height:200%;">기본정보</h4>
			<hr style="border: solid 2px brown;">
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
						<input type="radio" name="gender" value="남자" checked="checked"/>남자
						<input type="radio" name="gender" value="여자" />여자
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