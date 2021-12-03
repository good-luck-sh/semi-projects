<%@page import="vo.NoticeBoard"%>
<%@page import="dao.NoticeBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
    <title>공지사항 상세페이지</title>
</head>
<body>
<%
	pageContext.setAttribute("menu", "noticeboard");
%>
<%@ include file="../navbar/nav.jsp" %>
<div class="container">    
<div class="row mb-3">
		<div class="col">
			<h1 class="fs-3">notice</h1>
		</div>
	</div>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	String pageNo = request.getParameter("pageNo");
	String error = request.getParameter("error");
	
	NoticeBoardDao noticeBoardDao = NoticeBoardDao.getInstance();
	NoticeBoard noticeBoard = noticeBoardDao.getBoardDetail(no);
%>	
	<div class="row mb-3">
		<div class="col">
			<table class="table">
				<tbody>
					
					<tr class="d-flex">
						<th class="col-2">제목</th>
						<td class="col-10"><%=noticeBoard.getBoardTitle() %></td>
					</tr>
					<tr class="d-flex">
						<th class="col-2">작성일</th>
						<td class="col-10"><%=noticeBoard.getCreateDate() %></td>
					</tr>
					<tr class="d-flex">
						<th class="col-2">내용</th>
						<td class="col-10"><%=noticeBoard.getBoardContent() %></td>
					</tr>
				</tbody>
			</table>
			<div class="col-6 text-end">
				<a href="notice.jsp" class="btn btn-outline-primary">목록</a>
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>