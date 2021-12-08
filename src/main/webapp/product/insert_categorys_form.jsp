<%@page import="vo.Categorys"%>
<%@page import="service.Service"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../navbar/nav.css">
    <link rel="shortcut icon" href="../navbar/resource/img.png" type="image/x-icon">
    <title>관리자::카테고리등록</title>
	<%@ include file="../navbar/nav.jsp" %>
</head>
<body>
<%
	pageContext.setAttribute("menu", "login");
	if (loginUserInfo == null) {
		response.sendRedirect("../main/loginform.jsp?error=login-required");
		return;
	}
	// 매니저 권한이 없을 경우 메인화면으로 보낸다.
	if(loginUserInfo.getManagerCheck() == null) {
		response.sendRedirect("../main/index.jsp");
		return;
	}
%>
<div class="container p-3">
<%
	Service service = Service.getInstance();
	
	String error = request.getParameter("error");
	String success = request.getParameter("success");
	
	if ("empty-categorysName".equals(error)) {
%>
		<div class="alert alert-danger">
			<strong>카테고리 등록 실패</strong> 카테고리명을 입력하세요.
		</div>
<%
	}
	if ("overlapping".equals(error)) {
%>
		<div class="alert alert-danger">
			<strong>카테고리 등록 실패</strong> 중복된 카테고리명입니다.
		</div>
<%
	} 
%>
<%
	if ("commit".equals(success)) {
%>
		<div class="alert alert-primary">
			<strong>카테고리 등록 완료</strong>
		</div>
<%
	} 
%>
		<div class="row">
		<div class="col">
			<div class="card">
				<div class="card-header mb-3">신규 카테고리 등록</div>
				<div class="card-body">
					<form class="row g-3" method="post" action="insert_categorys.jsp">
  						<div class="col">
    						<label for="categorys_name" class="form-label">카테고리명을 입력하세요</label>
    						<input type="text" class="form-control" id="categorys_name" name="categorys_name">
  						</div>
  						
  						<div class="col-12 text-end">
    						<button type="submit" class="btn btn-primary">등록</button>
  						</div>
  						
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>