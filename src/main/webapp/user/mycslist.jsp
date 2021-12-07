<%@page import="vo.Pagination"%>
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
    <title>마이 페이지:내 게시글 보기</title>
</head>
<body>
<%
		pageContext.setAttribute("menu", "login");
%>
<%@ include file="../navbar/nav.jsp" %>
<%
	//로그인한 사용자정보가 세션에 존재하지 않으면 마이페이지를 요청할 수 없다.
	// 클라이언트에게 로그인 정보를 입력하는 loginform.jsp를 재요청하는 응답을 보낸다.
	// 재요청 URL에 오류원인을 포함시킨다.
	if (loginUserInfo == null) {
		response.sendRedirect("../main/loginform.jsp?error=login-required");
		return;
	}

%>
<div class="container">
<hr>
	<div class="row mb-3">
		<div class="col">
			<h4>my post</h4>
		</div>
	</div>
<%


	// 요청파라미터에서 pageNo값을 조회한다.
	// 요청파라미터에 pageNo값이 존재하지 않으면 Pagination객체에서 1페이지로 설정한다.
	String pageNo = request.getParameter("pageNo");
	
	// 게시글 정보 관련 기능을 제공하는 CsBoardDao객체를 획득한다.
	CsBoardJdbcDao boardDao = CsBoardJdbcDao.getInstance();
	
	// 총 데이터 갯수를 조회한다.
	int totalRecords = boardDao.getAllCountCsBoard();
	
	// 페이징 처리 필요한 값을 계산하는 Paginatition객체를 생성한다.
	Pagination pagination = new Pagination(pageNo, totalRecords);
	
	// 현재 페이지번호에 해당하는 게시글 목록을 조회한다.
	List<CsBoard> boardList = boardDao.getAllcsBoardById(loginUserInfo.getUserNo(), pagination.getBegin(), pagination.getEnd());
%>
	<div class="row mb-3" style="border-top: 1px solid #a10000; padding: 10px;">
		<div class="col">
			<table class="table">
				<thead>
					<tr>
						<th class="col-2">등록일</th>
						<th class="col-6">제목</th>
						<th class="col-2">작성자</th>
						<th class="col-1">추천수</th>
						<th class="col-1">조회수</th>
					</tr>
				</thead>
				<tbody>
<%
	if(boardList.isEmpty()){
%>
						<tr>
							<td class="text-center" colspan="6">게시글이 존재하지 않습니다.</td>
						</tr>
						
<%
	} else {
		for(CsBoard board : boardList){
			

%>
					<tr>
						<td class="col-2"><%=board.getCsCreateDate() %></td>
						<td class="col-6"><a href="../csBoard/detail.jsp?no=<%=board.getCsBoardNo() %>&userNo=<%=loginUserInfo.getUserNo() %>" class="text-black"><%=board.getCsBoardTitle() %></a>
						<span class="badge text-black" style="background-color: #f2efe4""><%=board.getCsReplyCheck() %></span></td> <!-- 게시글 상세보기 연결,페이지네이션후 cpno추가 -->
						<td class="col-2"><%=board.getUserTable().getUserName() %></td>
						<td class="col-1"><%=board.getCsBoardLikeCount() %> 개</td>
						<td class="col-1"><%=board.getCsBoardViewCount() %></td>
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
					<!-- 
						Pagination객체가 제공하는 isExistPrev()는 이전 블록이 존재하는 경우 true를 반환한다.
						Pagination객체가 제공하는 getPrevPage()는 이전 블록의 마지막 페이지값을 반환한다.
					 -->
				<li class="page-item <%=!pagination.isExistPrev() ? "disabled" : "" %>"><a class="page-link" href="mycslist.jsp?pageNo=<%=pagination.getPrevPage()%>" >이전</a></li>
<%
	// Pagination 객체로부터 해당 페이지 블록의 시작 페이지번호와 끝 페이지번호만큼 페이지내비게이션 정보를 표시한다.
	for (int num = pagination.getBeginPage(); num <= pagination.getEndPage(); num++) {
%>					
				<li class="page-item <%=pagination.getPageNo() == num ? "active" : "" %>"><a class="page-link" href="mycslist.jsp?pageNo=<%=num%>"><%=num %></a></li>
<%
	}
%>					
					<!-- 
						Pagination객체가 제공하는 isExistNext()는 다음 블록이 존재하는 경우 true를 반환한다.
						Pagination객체가 제공하는 getNexPage()는 다음 블록의 첫 페이지값을 반환한다.
					 -->
				<li class="page-item <%=!pagination.isExistNext() ? "disabled" :"" %>"><a class="page-link" href="mycslist.jsp?pageNo=<%=pagination.getNextPage()%>" >다음</a></li>
			</ul>
		</div>
		<div class="col-3 text-end">
			<div class="col">
				<a href="../csBoard/form.jsp" class="btn btn-outline-secondary">문의사항쓰기</a>
				<a href="detail.jsp" class="btn text-white" style="background-color: #a45339;">되돌아가기</a>
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>