<%@page import="dao.UserDao"%>
<%@page import="dao.CsBoardJdbcDao"%>
<%@page import="dao.CsBoardDao"%>
<%@page import="vo.CsBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Cs게시판 상세 보기</title>
</head>
<body>
<%
	pageContext.setAttribute("menu", "login");
	//네비바 활성화를 위하여 pageContext에서 값을 꺼내온다.
%>
<%@ include file="../navbar/nav.jsp" %>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	int cpno = Integer.parseInt(request.getParameter("cpno"));
	int userNo = Integer.parseInt(request.getParameter("userNo"));
	String error = request.getParameter("error");
	if("nomanager".equals(error)) {
%>
	<div class="alert alert-danger">
		<strong>작성 실패</strong>권한이 없습니다.
	</div>
<% 
	}
	if("empty".equals(error)) {
%>
	<div class="alert alert-danger">
		<strong>작성 실패</strong>입력값이 존재하지 않습니다.
	</div>
<% 
	}
	if("complete".equals(error)) {
%>
	<div class="alert alert-primary">
		<strong>등록 성공</strong>입력이 완료되었습니다.
	</div>
<% 
	}
	
	CsBoardJdbcDao csBoardDao = CsBoardJdbcDao.getInstance();
	CsBoard csBoard = csBoardDao.getBoardByCsBoardNo(no);
	int viewCount = csBoard.getCsBoardViewCount() + 1;
	csBoard.setCsBoardViewCount(viewCount);
	csBoardDao.updateCsBoard(csBoard);
	
	UserDao user = UserDao.getInstance();
	UserTable findUser = user.getUserAllInfoByNo(csBoard.getUserTable().getUserNo());
	
%>
<div class ="container">
		<div class="row">
			<div class="col">
				<table class="table">
					<tbody>
						<tr class="d-flex">
							<th class="col-2">번호</th>
							<td class="col-4"><%=csBoard.getCsBoardNo() %></td>
							<th class="col-2">게시물 이름</th>
							<td class="col-4"><%=csBoard.getCsBoardTitle() %></td>
						</tr>
						<tr>
							<th class="col-2">조회수</th>
							<td class="col-4"><%=csBoard.getCsBoardViewCount() %></td>
							<th class="col-2">좋아요 수</th>
							<td class="col-4"><a href="like.jsp?no=<%=no %>&cpno=<%=cpno %>>>"><%=csBoard.getCsBoardLikeCount() %></a></td>
						</tr>
						<tr>
							<th class="col-2">내용</th>
							<td class="col-10">
								<textarea>
									<%=csBoard.getCsBoardContent() %>
								</textarea>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row-3 text-right">
			<div class="col">
				<div>
<%
	if(loginUserInfo != findUser) {
%>
					<a class="btn btn-primary" href="like.jsp?no=<%=no%>&cpno">추천하기</a>
<%
	} else {
%>
					<a class="btn btn-warning" href="update.jsp?no=<%=no %>&cpno=<%=cpno %>>">수정하기</a>
					<a class="btn btn-danger" href="delet.jsp?no=<%=no%>&cpno=<%=cpno%>">삭제하기</a>
<%
	}
%>
				</div>
			</div>
		</div>
		<div>
<%
	
	if("매니저".equals(loginUserInfo.getManagerCheck())) {
%>
			<form class="well" method="post" action="replyrRegister.jsp">
				<input type="hidden" name="no" value="<%=no %>">
				<input type="hidden" name="cpno" value="<%=cpno%>">
				<input type="hidden" name="managercheck" value="<%=loginUserInfo.getManagerCheck() %>">
				<div>
					<label>cs게시판 작성자 성함</label>
					<input type="text" value="<%=csBoard.getUserTable().getUserName() %>>" name="" readonly="readonly"/>
				</div>
				<div>
					<label>내용</label>
					<textarea rows="3" name="content" placeholder="내용을 입력하세요"></textarea>
					<input />
				</div>
				<div class="text-right">
					<button type="submit" class="btn default">등록</button>
				</div>
			</form>
<%
	}
%>
		</div>
		<div class="row">
			<div class="col">
				<table>
					<colgroup>
						<col width="*">
						<col width="10%">
						<col width="20%">
						<col width="9%">
					</colgroup>
					<tbody>
					<tr>
						<td><%=csBoard.getCsReplyContent() %></td>
						<td>매니저</td>
						<td><%=csBoard.getCsReplyCreateDate() %></td>
<%
	if("매니저".equals(loginUserInfo.getManagerCheck())) {
		
%>
						<td class="text-center"><a href="delete.jsp?no=<%=no %>&cpno=<%=cpno %>">삭제</a></td>
<%
	}
%>
					</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> 
</body>
</html>