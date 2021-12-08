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
    <link rel="shortcut icon" href="../navbar/resource/img.png" type="image/x-icon">
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

	int cpno = Integer.parseInt(request.getParameter("cpno"));
	if (loginUserInfo == null) {
		response.sendRedirect("../main/loginform.jsp?error=empty");
		return;
	}
	if (loginUserInfo.getManagerCheck() == null) {
		response.sendRedirect("../csBoard/list.jsp?cpno=1&error=nomanager");
		return;
	}

	CsBoardJdbcDao csBoardDao = CsBoardJdbcDao.getInstance();
	int findCount = csBoardDao.getAllCountCsBoard();
	Pagination paging = new Pagination(request.getParameter("cpno"),findCount);
	List<CsBoard> csBoards = csBoardDao.getAllcsBoard(paging.getBegin(), paging.getEnd());
%>
		<div class="row">
			<div class="col">
				<h1 class="mb-4">cs 게시판 리스트</h1>
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
							<td><a href="detail.jsp?no=<%=csBoard.getCsBoardNo()%>&cpno=<%=paging.getPageNo()%>&userNo=<%=csBoard.getUserTable().getUserNo()%>"><%=csBoard.getCsBoardTitle() %></a></td>
							<td><%=csBoard.getCsBoardLikeCount() %></td>
							<td><%=csBoard.getCsBoardViewCount() %></td>
							<td><%=csBoard.getCsCreateDate() %></td>

<%	
	if(csBoard.getCsReplyCheck() == null) {
%>
						<td>답변미완료</td>
<% 
	}	else {
%>
							<td><%=csBoard.getCsReplyCheck() %></td>
						</tr>
<%
	}}
%>
					</tbody>
				</table>
				<div class="text-right">
<%
	if(loginUserInfo.getManagerCheck() == null ){
%>				
					<a href="form.jsp" class="btn btn-primary">새글 쓰기</a>
<%
	} else {
%>
					<a href="list.jsp" class="btn btn-primary">답변 미완료 확인하기</a>
<%
	}
%>			
				</div>
			</div>
		</div>
	</div>
	<div class="row text-center" style="justify-content: center;">
		<div class="col ">
			<div class="">
				<!-- 이전페이지가 0일 경우 disable이 실행된다.  -->
<%
	if(paging.getPrevPage() != 0) {
%>
				<a href="managercsboard.jsp?cpno=<%=paging.getPrevPage() %>" class="<%=paging.getPrevPage() == 0 ? "disable" : ""%>">이전</a>
<%
	}
%>
<%
	
	for(int pno = paging.getBeginPage(); pno<=paging.getEndPage(); pno++ ) {
		if(pno > 0) {
%>
				<a href="managercsboard.jsp?cpno=<%=pno %>" class="<%=pno == paging.getPageNo() ? "disable" : ""%>"><%=pno%></a>
<%
	} }

	if(paging.getNextPage() != 0 ) {

%>
				<!-- 다음페이지가 동일할 경우 disable이 실행된다. -->
				<a href="managercsboard.jsp?cpno=<%=paging.getNextPage() %>" class="<%=paging.getNextPage() == paging.getPageNo() ? "disable" : ""%>">다음</a>
<%
	}
%>
			</div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> 
</body>
</html>