<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="../navbar/resource/img.png" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>매니저 관리 폼</title>
</head>
<body>
<%
	pageContext.setAttribute("menu", "login");
	//네비바 활성화를 위하여 pageContext에서 값을 꺼내온다.
%>
<%@ include file="../navbar/nav.jsp" %>
<%
	if (loginUserInfo == null) {
	response.sendRedirect("../main/loginform.jsp?error=empty");
	return;
	}
	if (loginUserInfo.getManagerCheck() == null) {
	response.sendRedirect("../main/loginform.jsp?error=login-required");
	}
	String error = request.getParameter("error");
	if ("empty".equals(error)) {
%>				
				<div class="alert alert-danger">
					<strong>작성 실패</strong>설정이 필요합니다.
				</div>
<% 
} 
	if("complete".equals(error)) {
%>
				<div class="alert alert-danger">
					<strong>권한 부여 성공</strong>매니저 권한이 부여되었습니다.
				</div>
<%
	}
%>
	<div class="container mt-3">
		<div class="row">
			<div class="col">
				<h1>매니저 관리 폼</h1>
				<p>매니저 권한을 부여합니다.</p>
<%
	UserDao user = UserDao.getInstance();
	List<UserTable> users= user.getAllUser();
	for(UserTable finduser : users) {
	if(finduser.getManagerCheck() == null) {
%>	
					<form action="userSystemRegister.jsp" method="post">
					<input type="hidden" name="usergiveManager" value="<%=finduser.getUserNo() %>">
					<label for="exampleFormControlInput1" class="form-label">회원 아이디</label>
					<input type="text" name="" value="<%=finduser.getUserId() %>" class="form-control" disabled="disabled">
					<select class="form-select form-select-lg mb-3" name="manager">
						<option selected="selected" disabled="disabled">매니저 설정하세요</option>
						<option value="manager">설정</option>
					</select>
<%
	} }
%>
					<div class="text-end">
						<button class="btn btn-outline-primary" type="submit" onclick="register();">등록하기</button>
						<button class="btn btn-outline-danger"><a href="managerlist.jsp">취소하기</a></button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> 
	<script type="text/javascript">
	function register(){
		alert("권한을 부여합니다.");
	}
	</script>
</body>
</html>