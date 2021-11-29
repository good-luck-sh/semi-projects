<%@page import="dto.GenderDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.ManagerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
   <title></title>
</head>
<body>
<div class="container">  
<%@include file="../navbar/nav.jsp" %>
<%
	ManagerDao managerDao = new ManagerDao();
	
	List<GenderDto> genderList = managerDao.countAllUsersByGender();
%>
	<table class="table">
		<thead>
			<tr>
				<th>성별</th>
				<th>가입현황</th>
			</tr>
		</thead>
		<tbody>
<%
	for (GenderDto gender : genderList) {
		
%>
			<tr>
				<td><%=gender.getGender() %></td>
				<td><%=gender.getCnt() %></td>
			</tr>
<%
	}
%>
		</tbody>
	</table>  

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>