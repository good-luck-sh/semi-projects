<%@page import="vo.UserTable"%>
<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
    <title>마이 페이지</title>
</head>
<body>
<%
		pageContext.setAttribute("menu", "login");
%>
<%@ include file="../navbar/nav.jsp" %>
<%
	// 로그인한 사용자정보가 세션에 존재하지 않으면 마이페이지를 요청할 수 없다.
	// 클라이언트에게 로그인 정보를 입력하는 loginform.jsp를 재요청하는 응답을 보낸다.
	// 재요청 URL에 오류원인을 포함시킨다. board-app user/detail 참고
	if (loginUserInfo == null) {
		response.sendRedirect("../main/loginform.jsp?error=login-required");
		return;
	}

%>
<div class="container"> 

<hr>
	<div class="row mb-3">
		<div class="col">
			<h4>my page</h4>
		</div>
	</div>
<hr>
<%
	UserDao uDao = UserDao.getInstance();
	UserTable user = uDao.getUserAllInfoByNo(loginUserInfo.getUserNo());

%>
	<div class="row mb-3">
		<div class="col-2">
			<h6><span class="badge bg-secondary"><%=user.getUserDegree() %></span>등급</h6>
		</div>
		<div class="col-10">
			<div>
				<button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#userDegree">멤버십안내
				</button>
			</div>
		 	<div class="modal" id="userDegree">
		 		<div class="modal-dialog modal-lg">
		 			<div class="modal-content">
		 				<div class="modal-header">
		 					<h4>고객 등급 정보</h4>
		 				</div>
		 				<div class="modal-body">
		 					<div class="card">
		 						<div class="card-header">고객등급표</div>
		 						<div class="card-body">
		 							<table class="table">
		 								<thead>
		 									<tr>
		 										<th>브론즈</th>
		 										<th>실버</th>
		 										<th>골드</th>
		 										<th>다이아</th>
		 									</tr>
		 								</thead>
		 								<tbody>
		 									<tr>
		 										<td>총 누적금액 10만원 미만, 적립률 0%</td>
		 										<td>총 누적금액 100만원 미만, 적립률 1%</td>
		 										<td>총 누적금액 1000만원 미만, 적립률 2%</td>
		 										<td>총 누적금액 1000만원 이상, 적립률 3%</td>
		 									</tr>
		 								</tbody>
		 							</table>
		 						</div>
		 					</div>
		 				</div>
		 				<div class="modal-footer">
        					<button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
      					</div>
		 			</div>
		 		</div>
		 	</div>
		</div>
	</div>
<hr>
<%
	final double DIAMOND_POINT_DEPOSIT_RATE = 0.03;
	final double GOLD_POINT_DEPOSIT_RATE = 0.02;
	final double SILVER_POINT_DEPOSIT_RATE = 0.01;
	
	int pointRate = 0;

	if("다이아몬드".equals(user.getUserDegree())){
		pointRate = (int)(DIAMOND_POINT_DEPOSIT_RATE*100);
	} else if("골드".equals(user.getUserDegree())){
		pointRate = (int)(GOLD_POINT_DEPOSIT_RATE*100);
	} else if("실버".equals(user.getUserDegree())){
		pointRate = (int)(SILVER_POINT_DEPOSIT_RATE*100);
	} else if("브론즈".equals(user.getUserDegree())){
		pointRate = 0;
	}
%>

	<div class="row mb-3 border border-dark">
		<div clas="col">
			<h6><Strong>안녕하세요 :) <%=user.getUserName() %> 회원님</Strong></h6>
			<h6>상품 구매시 <%=pointRate %>%을 추가적립 받으실 수 있습니다.</h6>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<h6><a href="userpointdetail.jsp">적립금</a></h6>
			<h6><%=user.getUserOrderPoint() %> 원</h6>
		</div>
	</div>
<hr>
	<div class="row mb-3">
		<div class="col-4">
			<a href="basket.jsp?no=<%=user.getUserNo() %>" class="btn btn-primary">장바구니</a>
		</div>
		<div class="col-4">
			<a href="modifyform.jsp?no=<%=user.getUserNo() %>" class="btn btn-primary">회원 정보 수정</a>
		</div>
		<div class="col-4">
			<a href="../main/logout.jsp" class="btn btn-primary">로그아웃</a>
		</div>
	</div>
<hr>
	<div class="row mb-3">
		<div class="col">
			<h4>my menu</h4>
		</div>
	</div>
<hr>
<%
	if(loginUserInfo.getManagerCheck() == null) {	//사용자가 일반사용자인 경우 
%>
	<div class="row mb-3">
		<div class="col">
			<a href="mycslist.jsp?no=<%=user.getUserNo() %>">나의 게시글</a>
		</div>
		<div class="col">
			<a href="myreviewlist.jsp?no=<%=user.getUserNo() %>">나의 리뷰</a>		
		</div>
	</div>
<%
	} else {	//매니저의 경우 
%>
	<div class="row mb-3">
		<div class="col">
			<a href="../csBoard/managercsboard.jsp?cpno=1">cs 전체 게시물 확인하기</a>
		</div>
		<div class="col">
			<a href="../manager/managerlist.jsp">매니저 메뉴 확인하기</a>		
		</div>
	</div>
<%
	}
%>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">


</script>
</body>
</html>