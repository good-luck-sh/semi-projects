<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>새 게시글 작성하기</title>
</head>
<body>
<%
	pageContext.setAttribute("menu", "login");
	//네비바 활성화를 위하여 pageContext에서 값을 꺼내온다.
%>
<%@ include file="../navbar/nav.jsp" %>
<%
	String error = request.getParameter("error");
	if(loginUserInfo == null) {
		response.sendRedirect("../main/loginform.jsp?error=empty");
		return;
	}
	if("nomanager".equals(error)) {
	%>
	<div class="alert alert-danger">
		<strong>작성 실패</strong>권한이 없습니다.
	</div>
	<% 
	}
%>
<div class ="container p-3">
	<div class="row">
			<div class="col">
				<form action="register.jsp">
					<div class="mt-3 " id="text-review-1">
						<label for="exampleFormControlInput1" class="form-label">문의사항 게시글 제목</label> 
						<input type="text" class="form-control" name="title">
					</div>
					<div class="mt-3">
						<label for="exampleFormControlInput1" class="form-label">작성자</label>
						<input type="text" class="form-control" name="userName" disabled="disabled" value="<%=loginUserInfo.getUserName()%>">
					</div>
					<div class="mt-3" id="text-review-2">
						<label class="mb-3">문의 사항 게시판 내용</label>
						<textarea class="form-control col-sm-5" rows="5" name="text" placeholder="내용을 입력하세요"></textarea>
					</div>
					<div class="text-end mt-3">
						<button class="btn btn-outline-primary m-3" type="submit">등록하기</button>
						<button class="btn btn-outline-danger ml-3"><a href="mycslist.jsp">취소하기</a></button>
					</div>
				</form>
			</div>
		</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> 
</body>
</html>