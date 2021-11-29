<%@page import="vo.Review"%>
<%@page import="dao.ReviewJdbcDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>리뷰 확인 하기</title>
</head>
<body>
<%@ include file="../navbar/nav.jsp" %>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	int cpno = Integer.parseInt(request.getParameter("cpno"));
	
	//if(loginUserInfo == null) {
	//	response.sendRedirect("../loginform.jsp?error=empty");
	//	return;
	//} 나중에 loginform을 입력한다. 
	
	ReviewJdbcDao reviewDao = ReviewJdbcDao.getInstance();

	
%>
<div class ="container mt-3">
		<div class="row p-3">
			<div class="col">
				<table class="table">

						</tr>
					</tbody>
				</table>
				<div class="text-right">
<%

				</div>
			</div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> 
</body>
</html>