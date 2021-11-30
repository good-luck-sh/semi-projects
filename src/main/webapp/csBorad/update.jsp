<%@page import="vo.CsBoard"%>
<%@page import="dao.CsBoardJdbcDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title></title>
</head>
<body>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	int cpno = Integer.parseInt(request.getParameter("cpno"));
	
	CsBoardJdbcDao csBoardDao = CsBoardJdbcDao.getInstance();
	CsBoard csBoard = csBoardDao.getBoardByCsBoardNo(no);
%>
<div class ="container p-3">
	<div class="row">
			<div class="col">
				<form action="register.jsp">
					<input type="hidden" name="no">
					<input type="hidden" name="cpno">
					<div class="mt-3 " id="text-review-1">
						<label for="exampleFormControlInput1" class="form-label">문의사항 게시글 제목</label> 
						<input type="text" class="form-control" name="title" value="<%=csBoard.getCsBoardTitle() %>>">
					</div>
					<div class="mt-3">
						<label for="exampleFormControlInput1" class="form-label">작성자</label>
						<input type="text" class="form-control" name="userName" disabled="disabled" value="<%=csBoard.getUserTable().getUserName() %>">
					</div>
					<div class="mt-3" id="text-review-2">
						<label class="mb-3">문의 사항 게시판 내용</label>
						<textarea class="form-control col-sm-5" rows="5" name="text" placeholder="<%=csBoard.getCsBoardContent() %>>"></textarea>
					</div>
					<div class="text-end mt-3">
						<button class="btn btn-outline-primary m-3" type="submit">등록하기</button>
						<button class="btn btn-outline-danger ml-3"><a href="../user/mycslist.jsp">취소하기</a></button>
					</div>
				</form>
			</div>
		</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> 
</body>
</html>