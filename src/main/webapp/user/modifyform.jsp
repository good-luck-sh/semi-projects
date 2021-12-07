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
	pageContext.setAttribute("menu", "login");
%>
<%@ include file="../navbar/nav.jsp" %>
<%
	//로그인한 사용자정보가 세션에 존재하지 않으면 마이페이지를 요청할 수 없다.
	// 클라이언트에게 로그인 정보를 입력하는 loginform.jsp를 재요청하는 응답을 보낸다.
	// 재요청 URL에 오류원인을 포함시킨다.
	if (loginUserInfo == null) {
		response.sendRedirect("../main/loginform.jsp?error=login-required");
		return;
	}

%>
<div class="container">
<%
	UserDao utDao = UserDao.getInstance();
	UserTable user = utDao.getUserAllInfoByNo(loginUserInfo.getUserNo());
%>
<hr>
	<div class="row mb-3">
		<div class="col">
			<h4>my info</h4>
		</div>
	</div>
	<div class="row mb-3 border">
		<div class="col-2">
			<h6><span class="badge text-white" style="background-color: #d9c27c"><%=user.getUserDegree() %></span>등급</h6>
		</div>
<%
	final double DIAMOND_POINT_DEPOSIT_RATE = 0.04;
	final double GOLD_POINT_DEPOSIT_RATE = 0.03;
	final double SILVER_POINT_DEPOSIT_RATE = 0.02;
	final double BRONZE_POINT_DEPOSIT_RATE = 0.01;
	
	int pointRate = 0;
	
	if("다이아몬드".equals(user.getUserDegree())){
		pointRate = (int)(DIAMOND_POINT_DEPOSIT_RATE*100);
	} else if("골드".equals(user.getUserDegree())){
		pointRate = (int)(GOLD_POINT_DEPOSIT_RATE*100);
	} else if("실버".equals(user.getUserDegree())){
		pointRate = (int)(SILVER_POINT_DEPOSIT_RATE*100);
	} else if("브론즈".equals(user.getUserDegree())){
		pointRate = (int)(BRONZE_POINT_DEPOSIT_RATE*100);
	}
%>
		<div class="col-10">
			<p>안녕하세요! <%=user.getUserName() %>님은 <Strong><%=user.getUserDegree() %></Strong> 등급 입니다.</p>
			<p> <%=pointRate%>%할인을 받으실 수 있습니다.</p>
		</div>
	</div>
	<div style="padding: 10px;">
		<h6>기본 정보</h6>
	</div>
	<div class="row mb-3" style="border-top: 1px solid #a10000; padding: 10px;">
		<div class="col">
<%
	String success = request.getParameter("success");
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
	if("complete".equals(success)){
%>
		<div class="alert alert-primary">
			<strong>회원정보 변경 성공!!</strong> 정상 완료 되었습니다.
		</div>
<%
	}
%>
			<form class="border p-3 bg-light" method="post" action="update.jsp">
<%
	if(user.getManagerCheck() == null){
%>
				<div class="mb-3">
					<label class="form-label" for="managerCheck">회원분류</label>
					<input type="text" class="form-control" name="managerCheck" id="managerCheck" value="일반회원" readonly="readonly"/>
				</div>
<%
	} else {
%>
				<div class="mb-3">
					<label class="form-label" for="managerCheck">회원번호</label>
					<input type="text" class="form-control" name="managerCheck" id="managerCheck" value="매니저" readonly="readonly"/>
				</div>
<%
	}
%>
				<div class="mb-3">
					<label class="form-label" for="id">아이디</label>
					<input type="text" class="form-control" name="id" id="id" value="<%=user.getUserId() %>" readonly="readonly"/>
				</div>
				<div class="mb-3">
					<label class="form-label" for="pwd">비밀번호</label>
					<input type="password" class="form-control" name="pwd" id="pwd"/>
				</div>
				<div class="mb-3">
					<label class="form-label" for="name">이름</label>
					<input type="text" class="form-control" name="name" id="name" value="<%=user.getUserName() %>" readonly="readonly"/>
				</div>
				<div class="mb-3">
					<label class="form-label" for="gender">성별</label>
					<input type="text" class="form-control" name="gender" id="gender" value="<%=user.getUserGender() %>"  readonly="readonly"/>
				</div>
				<div class="mb-3">
					<label class="form-label" for="age">나이</label>
					<input type="number" class="form-control" name="age" id="age" value="<%=user.getUserAge() %>"  readonly="readonly"/>
				</div>
				<div class="mb-3">
					<label class="form-label" for="address">주소</label>
					<input type="text" class="form-control" name="address" id="address" value="<%=user.getUserAddress() %>"/>
				</div>
				<div class="mb-3">
					<label class="form-label" for="createdDate">가입일</label>
					<input type="text" class="form-control" name="createdDate" id="createdDate" value="<%=user.getUserCreateDate() %>"  readonly="readonly"/>
				</div>
				<div class="row mb-3">
					<div class="d-md-flex gap-2 justify-content-center">
						<input class="btn text-white" style="background-color: #a45339;" type="submit" value="회원정보수정"/>
						<a href="detail.jsp?no=<%=user.getUserNo() %>" class="btn btn-secondary">취소</a>
					</div>
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
						<a href="delete.jsp?no=<%=user.getUserNo() %>" class="btn btn-outline-danger">회원탈퇴</a>
					</div>
				</div>
			</form>
		</div>
	</div>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>