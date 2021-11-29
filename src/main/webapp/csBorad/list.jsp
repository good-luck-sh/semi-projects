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
<%@ include file="../navbar/nav.jsp" %>
<div class ="container p-3">
<%

	int cpno = Integer.parseInt(request.getParameter("cpno"));
	CsBoardJdbcDao csBoardDao = CsBoardJdbcDao.getInstance();
	int findCount = csBoardDao.getAllCountCsBoard(1);//loginInfo에서 입력받아서 값을 입력한다.

	Pagination paging = new Pagination(request.getParameter("cpno"),findCount);
	List<CsBoard> csBoards = csBoardDao.getAllcsBoardById(1);
	

%>
		<div class="row">
			<div class="col">
				<h1 class="mb-3">작성자님의 게시판 리스트</h1>
				<table class="table">
					<colgroup>
						<col width="10%">
						<col width="*">
						<col width="12%">
						<col width="10%">
						<col width="10%">
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
							<td><a href="detail.jsp?no=<%=csBoard.getCsBoardNo()%>&cpno<%=paging.getPageNo()%>"><%=csBoard.getCsBoardTitle() %></a></td>
							<td><%=csBoard.getCsBoardLikeCount() %></td>
							<td><%=csBoard.getCsBoardViewCount() %></td>
							<td><%=csBoard.getCsReplyCreateDate() %></td>
							<td><%=csBoard.getCsReplyCheck() %></td>
						</tr>
<%
	}
%>
					</tbody>
				</table>
				<div class="text-right">
					<a href="form.jsp" class="btn btn-primary">새글 쓰기</a>
				</div>
			</div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> 
</body>
</html>