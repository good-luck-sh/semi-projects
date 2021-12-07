<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
    <title>공지사항</title>
</head>
<body>
<%
	pageContext.setAttribute("menu", "noticeBoard");
%>
<%@ include file="/navbar/nav.jsp" %>
<%
	if (loginUserInfo == null) {
		response.sendRedirect("../main/loginform.jsp?error=login-required");
		return;
	}
%>
<div class="container">      
	<div class="row mb-3">
		<div class="col">
			<h1 class="fs-3">공지사항 등록</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
<%
	String error = request.getParameter("error");	
	if ("empty-title".equals(error)) {
%>
			<div class="alert alert-danger">
				<strong>공지사항 등록에 실패하였습니다:(</strong> 제목을 확인해주세요.
			</div>
<%
	} else if ("empty-content".equals(error)) {
%>		
			<div class="alert alert-danger">
				<strong>공지사항 등록에 실패하였습니다:(</strong> 내용을 확인해주세요.
			</div>
<%
	}
%>		
			<form class="border p-3 bg-light" method="post" action="register.jsp">
				<div class="mb-3">
					<label class="form-label" for="board-title">제목</label>
					<input type="text" class="form-control" name="title" id="board-title">
				</div>
				<div class="mb-3">
					<label class="form-label" for="board-content">내용</label>
					<textarea rows="6" class="form-control" name="content"></textarea>
				</div>
				<div class="mb-3 text-end">
					<a href="notice.jsp" class="btn btn-secondary">취소</a>
					<button type="submit" class="btn btn-primary">등록</button>
				</div>
			</form>
		</div>
	</div>		
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>