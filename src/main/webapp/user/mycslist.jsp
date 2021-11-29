<%@page import="java.util.List"%>
<%@page import="vo.CsBoard"%>
<%@page import="dao.CsBoardJdbcDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
    <title>마이 페이지:내 게시글</title>
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
<hr>
	<div class="row mb-3">
		<div class="col">
			<h4>my post</h4>
		</div>
	</div>
<hr>
<%
	// int userNo = Integer.parseInt(request.getParameter("no"));
	CsBoardJdbcDao boardDao = CsBoardJdbcDao.getInstance();
	// List<CsBoard> boardList = boardDao.getBoardInfoByNo(userNo); 
%>
	<div class="row mb-3">
		<div class="col">
			<table class="table">
				<thead>
					<tr>
						<th class="col-1">번호</th>
						<th class="col-5">제목</th>
						<th class="col-2">작성자</th>
						<th class="col-1">추천수</th>
						<th class="col-1">조회수</th>
						<th class="col-2">등록일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="col-1">1</td>
						<td class="col-5"><a href="">문의드립니다.</a> (new)</td> <!-- 게시글 상세보기 연결 -->
						<td class="col-2">홍길동</td>
						<td class="col-1">5 개</td>
						<td class="col-1">10</td>
						<td class="col-2">2021-11-14</td>
					</tr>
					<tr>
						<td class="col-1">2</td>
						<td class="col-5"><a href="">배송은 언제오나요?</a> (new)</td> <!-- 게시글 상세보기 연결 -->
						<td class="col-2">홍길동</td>
						<td class="col-1">6 개</td>
						<td class="col-1">11</td>
						<td class="col-2">2021-11-14</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
<hr>
	<div class="row mb-3">
		<div class="col">
			<a href="detail.jsp" class="btn btn-primary">되돌아가기</a>
		</div>
	</div>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>