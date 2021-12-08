<%@page import="vo.NoticeBoard"%>
<%@page import="vo.Pagination"%>
<%@page import="java.util.List"%>
<%@page import="dao.NoticeBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="../navbar/resource/img.png" type="image/x-icon">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
    <title>공지사항</title>
</head>
<body>
<%
pageContext.setAttribute("menu", "noitceboard");
%>
<%@ include file="../navbar/nav.jsp" %>
<div class="container">    
	<div class="row mb-3">
		<div class="col">
			<h1 class="fs-3">공지사항 목록</h1>
		</div>
	</div>
<%
String pageNo = request.getParameter("pageNo");

	NoticeBoardDao noticeBoardDao = NoticeBoardDao.getInstance();
	
	int totalRecords = noticeBoardDao.getTotalRecords();
	
	Pagination pagination = new Pagination(pageNo, totalRecords);
	
	// 현재 페이지번호에 해당하는 게시글 목록을 조회한다.
	List<NoticeBoard> boardList = noticeBoardDao.getBoardList(pagination.getBegin(), pagination.getEnd());
%>
	<div class="row mb-3">
		<div class="col">
			<table class="table">
				<thead>
					<tr class="d-flex">
						<th class="col-1">번호</th>
						<th class="col-10">제목</th>
						<th class="col-1">작성일</th>
					</tr>
				</thead>
				<tbody>
<%
	if (boardList.isEmpty()) {
%>
					<tr>
						<td class="text-center" colspan="6">공지사항이 존재하지 않습니다.</td>
					</tr>
<%
	} else {
		for (NoticeBoard noticeBoard : boardList) {
%>
					<tr class="d-flex">
						<td class="col-1"><%=noticeBoard.getBooardNo() %></td>
						<td class="col-10"><a href="detail.jsp?no=<%=noticeBoard.getBooardNo()%>&pageNo=<%=pagination.getPageNo()%>"><%=noticeBoard.getBoardTitle() %></a></td>
						<td class="col-1"><%=noticeBoard.getCreateDate() %></td> 
					</tr>
<%
		}
	}
%>
				</tbody>				
			</table>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-6 offset-3">
			<ul class="pagination justify-content-center">
				<li class="page-item <%=!pagination.isExistPrev() ? "disabled" : "" %>"><a class="page-link" href="notice.jsp?pageNo=<%=pagination.getPrevPage()%>" >이전</a></li>
<%
	
	for (int num = pagination.getBeginPage(); num <= pagination.getEndPage(); num++) {
%>					
				<li class="page-item <%=pagination.getPageNo() == num ? "active" : "" %>"><a class="page-link" href="notice.jsp?pageNo=<%=num%>"><%=num %></a></li>
<%
	}
%>			
				<li class="page-item <%=!pagination.isExistNext() ? "disabled" :"" %>"><a class="page-link" href="notice.jsp?pageNo=<%=pagination.getNextPage()%>" >다음</a></li>
			</ul>
		</div>

		<div class="col-3 text-end">
<%
	
	if (loginUserInfo != null) { 
		if (loginUserInfo.getManagerCheck() != null) {
%>
			<a href="form.jsp" class="btn btn-outline-primary">새 공지사항 작성</a>
<%
		}
	}
%>
			</div>
		</div>
	</div>

			
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>