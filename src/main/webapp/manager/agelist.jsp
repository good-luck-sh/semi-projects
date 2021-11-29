<%@page import="dao.ManagerDao"%>
<%@page import="java.util.List"%>
<%@page import="dto.AgeDto"%>
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
	List<AgeDto> ageList = managerDao.countUsersByAge();
	
	
%>
	<table class="table">
		
		<thead>
			<tr>
				<th>연령</th>
				<th>인원수</th>
			</tr>
		</thead>
		<tbody>
<%
	for (AgeDto age : ageList) {
		
%>
			<tr>
				<td><%=age.getAge() %>대</td>
				<td><%=age.getCnt() %>명</td>
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