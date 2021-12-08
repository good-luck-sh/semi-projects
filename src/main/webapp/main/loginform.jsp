<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="../navbar/resource/img.png" type="image/x-icon">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
    <title>로그인폼</title>
</head>
<body>
<%
	pageContext.setAttribute("menu", "login");
%>
<div class="container">    
<%	
	String error = request.getParameter("error");
	
	if ("empty".equals(error)) {							
%>
	<div class="alert alert-danger">
		<strong>로그인 실패</strong> 아이디와 비밀번호를 입력해주세요.
	</div>
<%
	} else if ("notfound-user".equals(error)) {			
%>
	<div class="alert alert-danger">
		<strong>로그인 실패</strong> 회원정보가 존재하지 않습니다.
	</div>
<%	
	} else if ("mismatch-password".equals(error)) {			
%>
	<div class="alert alert-danger">
		<strong>로그인 실패</strong> 비밀번호가 일치하지 않습니다.
	</div>
<%		
	} else if("login-required".equals(error)) {				
%>
	<div class="alert alert-danger">
		<strong>로그인 필수</strong> 로그인이 필요한 페이지를 요청하였습니다.
	</div>
<%
	}
%>
	<div style="display; inline-block;float:left;">
    	<a href="index.jsp" class="btn btn-link">뒤로가기</a>
    </div>	
	<div style="text-align:center;">
		<img src="../navbar/resource/logo.png">	
		<hr>
		<div>
			<h1 class="fs-3">로그인</h1>
		</div>
	</div>
	<div style="text-align:center;">
		<img src="../navbar/resource/login.png">
	</div>
	<hr>
	<form class="" method="post" action="login.jsp">
		<input type="text" class="form-control" name="id" id="user-id" placeholder="아이디"><br>   	
		<input type="password" class="form-control" name="password" id="user-password" placeholder="비밀번호"><br>
		<div class="checkbox">
          	<label>
            	<input type="checkbox" value="아이디저장"> 아이디저장
          	</label>
       	 </div>   
       	 <div class="d-grid">
       		<button type="submit" class="btn btn-primary">로그인 </button>
       	 </div>
       	 <div style="display; inline-block;float:right;">
       	 	<a href="registerform.jsp" class="btn btn-link">회원가입</a>
       	 </div>
   </form>  	 	
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>