<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title></title>
</head>
<body>
<%
	pageContext.setAttribute("menu", "login");
	//네비바 활성화를 위하여 pageContext에서 값을 꺼내온다.
%>
<%@ include file="../navbar/nav.jsp" %>
<%
	String error = request.getParameter("error");
	if("empty".equals(error)) {
%>				
				<div class="alert alert-danger">
					<strong>작성 실패</strong>설정이 필요합니다.
				</div>
<% 
}
%>
	<div class="container">
		<div class="row">
			<div class="col">
				<h1>매니저 관리 폼</h1>
<%
	UserDao user = UserDao.getInstance();
	List<UserTable> users= user.getAllUser();
	for(UserTable finduser : users) {
%>
				<form action="userSystemRegister.jsp" method="post">
					<input type="hidden" name="userNo" value="<%=finduser.getUserNo() %>">
					<select class="form-select form-select-lg mb-3" name="manager">
						<option selected="selected" disabled="disabled"></option>
						<option value="매니저">매니저</option>
					</select>
<%
	}
%>
					<div class="text-end">
						<button class="btn btn-outline-primary" type="submit">등록하기</button>
						<button class="btn btn-outline-danger"><a href="managerlist.jsp">취소하기</a></button><!-- 매니저 마이리스트 -->
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> 
</body>
</html>