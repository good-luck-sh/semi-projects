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
<%
	//	pageContext.setAttribute("menu", "login");
%>
<%@ include file="../navbar/nav.jsp" %>
<%
	//로그인한 사용자정보가 세션에 존재하지 않으면 마이페이지를 요청할 수 없다.
	// 클라이언트에게 로그인 정보를 입력하는 loginform.jsp를 재요청하는 응답을 보낸다.
	// 재요청 URL에 오류원인을 포함시킨다.
	//if (loginUserInfo == null) {
	//	response.sendRedirect("../loginform.jsp?error=login-required");
	//	return;
	//}

%>
<div class="container">
<%
	int userNo = Integer.parseInt(request.getParameter("no"));
	UserDao utDao = UserDao.getInstance();
	UserTable user = utDao.getUserAllInfoByNo(userNo);
%>
<hr>
	<div class="row mb-3">
		<div class="col">
			<h4>my info</h4>
		</div>
	</div>
<hr>
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
	<div class="row mb-3">
		<div class="col">
<%
	String error = request.getParameter("error");

	if("empty-password".equals(error)){
%>
		<div class="alert alert-danger">
			<strong>회원정보 변경 실패!!</strong> 비밀번호는 필수입력값입니다.
		</div>
<%	
	}
	
	if("empty-address".equals(error)){
%>
		<div class="alert alert-danger">
			<strong>회원정보 변경 실패!!</strong> 주소는 필수입력값입니다.
		</div>
<%	
	}

%>
			<form class="border p-3 bg-light" method="post" action="update.jsp">
				<div class="mb-3">
					<label class="form-label" for="no">회원번호</label>
					<input type="number" name="no" id="no" value="<%=user.getUserNo() %>" readonly="readonly" disabled/>
				</div>
				<div class="mb-3">
					<label class="form-label" for="id">아이디</label>
					<input type="text" name="id" id="id" value="<%=user.getUserId() %>" readonly="readonly" disabled/>
				</div>
				<div class="mb-3">
					<label class="form-label" for="pwd">비밀번호</label>
					<input type="text" name="pwd" id="pwd"/>
				</div>
				<div class="mb-3">
					<label class="form-label" for="name">이름</label>
					<input type="text" name="name" id="name" value="<%=user.getUserName() %>" readonly="readonly" disabled/>
				</div>
				<div class="mb-3">
					<label class="form-label" for="address">주소</label>
					<input type="text" name="address" id="address" value="<%=user.getUserAddress() %>"/>
				</div>
				<div class="mb-3">
					<label class="form-label" for="createdDate">가입일</label>
					<input type="text" name="createdDate" id="createdDate" value="<%=user.getUserCreateDate() %>"  readonly="readonly" disabled/>
				</div>
				<div class="text-right">
					<input class="btn btn-primary" type="submit" value="회원정보수정"/>
					<a href="detail.jsp?no=1" class="btn btn-secondary">취소</a>
					<a href="delete.jsp" class="btn btn-danger">회원탈퇴</a>
				</div>
			</form>
		</div>
	</div>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>