<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
    <title>마이 페이지::개인정보수정</title>
</head>
<body>
<%@ include file="../navbar/nav.jsp" %>
<div class="container">
<%
	int userNo = Integer.parseInt(request.getParameter("no"));
	UserDao utDao = new UserDao();
	UserTable user = utDao.getUserAllInfoByNo(userNo);
%>
<hr>
	<div class="mb-3">
		<h4>my info</h4>
	</div>
	<div class="border border-dark">
		<div class="col-2">
			<h6><span class="badge bg-secondary"><%=user.getUserDegree() %></span>등급</h6>
		</div>
		<div class="col-10">
			<h6>안녕하세요! <%=user.getUserName() %>님은 <Strong><%=user.getUserDegree() %></Strong> 등급 입니다.</h6>
			<h6>0원 이상 구매시 1%할인을 받으실 수 있습니다.</h6>
		</div>
	</div>



<hr>

	<h4>기본 정보</h4>
	<div class="border border-dark">
		<form class="border p-3 bg-light" method="post" action="update.jsp">
			<div class="mb-3">
				<label class="form-label" for="board-title">아이디</label>
				<input type="text" name="id" id="id" value="<%=user.getUserId() %>" readonly="readonly"/>
			</div>
			<div class="mb-3">
				<label class="form-label" for="board-title">비밀번호</label>
				<input type="text" name="password" id="pwd"/>
			</div>
			<div class="mb-3">
				<label class="form-label" for="board-title">이름</label>
				<input type="text" name="name" id="name" value="<%=user.getUserName() %>" readonly="readonly"/>
			</div>
			<div class="mb-3">
				<label class="form-label" for="board-title">주소</label>
				<input type="text" name="address" id="address" value="<%=user.getUserAddress() %>"/>
			</div>
			<div class="mb-3">
				<label class="form-label" for="board-title">가입일</label>
				<input type="text" name="createdDate" value="<%=user.getUserCreateDate() %>"  readonly="readonly"/>
			</div>
			<div class="text-right">
				<input class="btn btn-primary" type="submit" value="회원정보수정"/>
				<a href="detail.jsp" class="btn btn-secondary">취소</a>
				<a href="delete.jsp" class="btn btn-danger">회원탈퇴</a>
			</div>
		</form>
	</div>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>