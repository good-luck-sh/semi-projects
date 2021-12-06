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
<style>
.border1{
    border: 2px solid #f44336;
    border-radius: 20px;
}
</style>
   <title></title>
</head>
<body>
<%@include file="../navbar/nav.jsp" %>
<div class="container border1">  
<%
	ManagerDao managerDao = new ManagerDao();
	
	List<GenderDto> genderList = managerDao.countAllUsersByGender();
%>
<div class="row mt-3 border1">
		<div class="col-sm-4">
			<div class="card">
				<div class="card-header">성별 가입현황</div>
				<div class="card-body">
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
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
<script>
	var xArray = ["영업1팀", "영업2팀", "영업3팀", "영업4팀", "영업5팀"];
	var yArray = [55, 49, 44, 24, 15];

	Plotly.newPlot("chart-pie",  [{labels:xArray, values:yArray, type:"pie"}]);
</script>
</body>
</html>
