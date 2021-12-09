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
    <link rel="shortcut icon" href="../navbar/resource/img.png" type="image/x-icon">
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
	String error = request.getParameter("error");
	if(loginUserInfo == null) {
		response.sendRedirect("../main/loginform.jsp?error=empty");
		return;
	}
	if ("complete".equals(error)) {
		%>
		<div class="alert alert-primary">
			<strong>댓글 성공</strong>완료 되었습니다. 
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
<div class ="container mt-3">
		<div class="row p-1">
			<div class="col">
				<table class="table">
					<colgroup>
						<col width="10%">
						<col width="40%">
						<col width="10%">
						<col width="40%">
					</colgroup>
					<tbody>
						<tr>
							<th>번호</th>
							<td><%=csBoard.getCsBoardNo() %></td>
							<th>제목</th>
							<td><%=csBoard.getCsBoardTitle() %></td>
						</tr>
						<tr>
							<th>조회수</th>
							<td><%=csBoard.getCsBoardViewCount() %></td>
<%
	if(loginUserInfo.getUserNo() != findUser.getUserNo()) {
%>
							<th><a href="like.jsp?no=<%=csBoard.getCsBoardNo() %>&cpno=<%=cpno %>">추천</a></th>
<%
	} else {			
%>	
							<th>추천</th>
<% 
	}
%>
							<td><%=csBoard.getCsBoardLikeCount() %></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><%=csBoard.getCsBoardContent() %></td>
							<th></th>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row-3 text-right">
			<div class="col">
				<div>

<%
	if(loginUserInfo.getUserNo() == findUser.getUserNo()) {
%>
					<a class="btn btn-warning p-2" href="update.jsp?no=<%=csBoard.getCsBoardNo() %>&cpno=<%=cpno %>">수정하기</a>
					<a class="btn btn-danger p-2" href="delete.jsp?no=<%=csBoard.getCsBoardNo()%>&cpno=<%=cpno%>">삭제하기</a>
<%
	}
%>
				</div>
			</div>
		</div>
		<div>
<%
	
	if(loginUserInfo.getManagerCheck() != null) {
%>
			<form class="well" method="post" action="replyUpdate.jsp">
				<input type="hidden" name="no" value="<%=no %>">
				<input type="hidden" name="cpno" value="<%=cpno%>">
				<input type="hidden" name="managercheck" value="<%=loginUserInfo.getManagerCheck() %>">
				<div class="mt-3">
					<label class="form-label ml-3">cs게시판 작성자 성함</label>
					<input type="text" value="<%=csBoard.getUserTable().getUserName() %>" name="" readonly="readonly"/>
				</div>
				<div class="mt-3">
					<label class="form-label">내용</label>
					<textarea class="form-control col-sm-5" rows="5" placeholder="댓글을 입력하세요" name="manager_content"></textarea>
				</div>
				<div class="text-right mt-3">
<%
	  
	if("답변미완료".equals(csBoard.getCsReplyCheck()) || csBoard.getCsReplyCheck() == null){
%>				
					<button type="submit" class="btn btn-danger p-2">등록</button>
<%
	}
%>					
					<a href="managercsboard.jsp?cpno=<%=cpno %>" class="btn btn-outline-primary p-2">목록</a></button>
				</div>
			</form>
<%
	}
%>
		</div>
<%
	if(csBoard.getCsReplyContent() != null ) {
%>
		<div class="row">
			<div class="col">
				<table class="table">
					<colgroup>
						<col width="10%">
						<col width="*">
						<col width="10%">
						<col width="20%">
						<col width="9%">
					</colgroup>
					<tbody>
						<tr>
							<td>댓글</td>
							<td><%=csBoard.getCsReplyContent() %></td>
							<td>매니저</td>
							<td><%=csBoard.getCsReplyCreateDate() %></td>
							<td class="text-center"><a href="replydelete.jsp?no=<%=no %>&cpno=<%=cpno %>">삭제</a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
<%
	}

%>
	</div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> 
</body>
</html>