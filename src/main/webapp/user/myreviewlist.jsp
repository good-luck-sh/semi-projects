<%@page import="vo.Pagination"%>
<%@page import="dao.ReviewJdbcDao"%>
<%@page import="vo.Review"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
    <title>마이 페이지:: 내 리뷰 보기</title>
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
			<h4>my review</h4>
		</div>
	</div>
<hr>
<%

	// 요청파라미터에서 pageNo값을 조회한다.
	// 요청파라미터에 pageNo값이 존재하지 않으면 Pagination객체에서 1페이지로 설정한다.
	String pageNo = request.getParameter("pageNo");
	
	// 리뷰 정보 관련 기능을 제공하는 ReviewJdbcDao객체를 획득한다.
	ReviewJdbcDao rvDao = ReviewJdbcDao.getInstance();
	
	// 총 데이터 갯수를 조회한다.
	int totalRecords = rvDao.getAllCountReview();
	
	// 페이징 처리 필요한 값을 계산하는 Paginatition객체를 생성한다.
	Pagination pagination = new Pagination(pageNo, totalRecords);
	List<Review> reviewList = rvDao.getAllReviewById(loginUserInfo.getUserNo(), pagination.getBegin(), pagination.getEnd());
%>
	<div>
		<table class="table">
			<thead>
				<tr>
					<th>등록날짜</th>
					<th>제목</th>
					<th>별점</th>
					<th>리뷰</th>
					<th>좋아요</th>
				</tr>
			</thead>
			<tbody>
<%
	if(reviewList.isEmpty()){
%>
				<tr>
					<td class="text-center" colspan="6">리뷰가 존재하지 않습니다.</td>
				</tr>
<%
	} else{
	for (Review rv : reviewList){
%>
				<tr>

					<td><%=rv.getReviewCreatedDate() %></td>
					<td><a href="../review/detail.jsp?no=<%=rv.getReviewNo()%>&cpno=1"><%=rv.getReviewTitle() %></a></td>

					<!--  페이지네이션 완성되면 cpno입력하기  -->
					<td><%=rv.getReviewStarPoint() %> 점</td>
					<td><%=rv.getReviewContent() %></td>
					<td><%=rv.getReviewReviewLikeCount() %> 개</td>
				</tr>
<%
		}
	}
%>
			</tbody>
		</table>
	</div>
	<div class="row mb-3">
		<div class="col-6 offset-3">
			<ul class="pagination justify-content-center">
					<!-- 
						Pagination객체가 제공하는 isExistPrev()는 이전 블록이 존재하는 경우 true를 반환한다.
						Pagination객체가 제공하는 getPrevPage()는 이전 블록의 마지막 페이지값을 반환한다.
					 -->
				<li class="page-item <%=!pagination.isExistPrev() ? "disabled" : "" %>"><a class="page-link" href="list.jsp?pageNo=<%=pagination.getPrevPage()%>" >이전</a></li>
<%
	// Pagination 객체로부터 해당 페이지 블록의 시작 페이지번호와 끝 페이지번호만큼 페이지내비게이션 정보를 표시한다.
	for (int num = pagination.getBeginPage(); num <= pagination.getEndPage(); num++) {
%>					
				<li class="page-item <%=pagination.getPageNo() == num ? "active" : "" %>"><a class="page-link" href="list.jsp?pageNo=<%=num%>"><%=num %></a></li>
<%
	}
%>					
					<!-- 
						Pagination객체가 제공하는 isExistNext()는 다음 블록이 존재하는 경우 true를 반환한다.
						Pagination객체가 제공하는 getNexPage()는 다음 블록의 첫 페이지값을 반환한다.
					 -->
				<li class="page-item <%=!pagination.isExistNext() ? "disabled" :"" %>"><a class="page-link" href="list.jsp?pageNo=<%=pagination.getNextPage()%>" >다음</a></li>
			</ul>
		</div>
		<div class="col-3 text-end">
			<div class="col">
				<a href="detail.jsp" class="btn btn-primary">되돌아가기</a>
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>