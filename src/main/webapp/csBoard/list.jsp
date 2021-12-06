<%@page import="javax.xml.catalog.CatalogException"%>
<%@page import="vo.CsBoard"%>
<%@page import="java.util.List"%>
<%@page import="dao.CsBoardJdbcDao"%>
<%@page import="vo.Pagination"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>cs게시판 리스트</title>
</head>
<body>
<%
	pageContext.setAttribute("menu", "login");
	//네비바 활성화를 위하여 pageContext에서 값을 꺼내온다.
%>
<%@ include file="../navbar/nav.jsp" %>
<div class ="container p-3">
<%

	if (loginUserInfo == null) {
		response.sendRedirect("../main/loginform.jsp?error=empty");
		return;
	}
	


	String error = request.getParameter("error");
	if ("nomanager".equals(error)) {
	%>
	<div class="alert alert-danger">
		<strong>실패</strong>권한이 없습니다.
	</div>
	<%
	}
	if ("empty".equals(error)) {
	%>
	<div class="alert alert-danger">
		<strong>작성 실패</strong>입력값이 존재하지 않습니다.
	</div>
	<%
	}
	if ("complete".equals(error)) {
	%>
	<div class="alert alert-primary">
		<strong>등록 성공</strong>입력이 완료되었습니다.
	</div>
	<% 
}
	CsBoardJdbcDao csBoardDao = CsBoardJdbcDao.getInstance();
	List<CsBoard> csBoards = csBoardDao.getAllcsBoardByReplyCheck("답변미완료");
%>
		<div class="row">
			<div class="col">
				<h1 class="mb-4">답변 미완료 게시판 리스트</h1>
				<table class="table">
					<colgroup>
						<col width="10%">
						<col width="15%">
						<col width="12%">
						<col width="10%">
						<col width="15%">
						<col width="15%">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>좋아요</th>
							<th>조회수</th>
							<th>등록일</th>
							<th>답변유무</th>
						</tr>
					</thead>
					<tbody>
<%
	for(CsBoard csBoard : csBoards) {
			
%>
						<tr>
							<td><%=csBoard.getCsBoardNo() %></td>
							<td><a href="detail.jsp?no=<%=csBoard.getCsBoardNo()%>&cpno=1&userNo=<%=csBoard.getUserTable().getUserNo()%>"><%=csBoard.getCsBoardTitle() %></a></td>
							<td><%=csBoard.getCsBoardLikeCount() %></td>
							<td><%=csBoard.getCsBoardViewCount() %></td>
							<td><%=csBoard.getCsCreateDate() %></td>
							<td><%=csBoard.getCsReplyCheck() %></td>
						</tr>
<%
	}
%>
					</tbody>
				</table>
				<div class="text-right">
					<a href="managercsboard.jsp?cpno=1" class="btn btn-outline-primary p-2">목록</a>
			</div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> 
</body>
</html>