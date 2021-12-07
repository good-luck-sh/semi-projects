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
   <script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
   <script src="http://code.highcharts.com/highcharts.js"></script> 
   <script src="http://code.highcharts.com/modules/data.js"></script> 
   <title>나이대별 가입현황 조회</title>
</head>
<%@include file="../navbar/nav.jsp" %>
<body>
<div class="container">
	<div class="row">
<%
	ManagerDao managerDao = new ManagerDao();
	List<AgeDto> ageList = managerDao.countUsersByAge();
%>
		<div id="ageChart" style="width: 600px; height: 550px; margin:0;"></div>
		<div class="col-md-4">
			<table id="datatable" class="mt-5 table table-bordered table-striped table-hover">
				<thead class="table-primary" style="font-size:15px;">
					<tr><th>나이</th><th>가입자 수</th></tr>
				</thead>
				<tbody style="font-size:15px;">
<%
	for (AgeDto ages : ageList) {
		
%>		
					<tr height="40"><th><%=ages.getAge() %> 대</th><td><%=ages.getCnt() %></td></tr>
<%
	}
%>	
				</tbody>
			</table>
			<p style="font-size:13px;" align="right"><i>가입자 수 : 사람 (명)</i></p>
		</div>
	</div>
	<div class="text-right mt-3">
		<a href="managerlist.jsp" class="btn btn-info">뒤로 가기</a>
	</div>  
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
$(document).ready(function() { 
   var data = {	
      table: 'datatable'
   };
   var chart = {
      type: 'column'
   };
   var title = {
      text: '<b>' + '< 나이대별 가입자 통계 >' + '</b>'   
   };      
   var yAxis = {
      allowDecimals: false,
      title: {
         text: '가입자 수'
      }
   };
   var tooltip = {
      formatter: function () {
         return '<b>' + '가입 현황' + '</b><br/>' +
            this.point.y + ' ' + '명';
      }
   };
   var credits = {
      enabled: false
   };  
      
   var json = {};   
   json.chart = chart; 
   json.title = title; 
   json.data = data;
   json.yAxis = yAxis;
   json.credits = credits;  
   json.tooltip = tooltip;  
   $('#ageChart').highcharts(json);
});

</script>
</body>
</html>