<%@page import="dto.SalesDto"%>
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
   <script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
   <script src="http://code.highcharts.com/highcharts.js"></script> 
   <script src="http://code.highcharts.com/modules/data.js"></script> 
   <title>월별 매출현황 조회</title>
</head>
<%@include file="../navbar/nav.jsp" %>
<body>
<div class="container">
	<div class="row">
<%
	ManagerDao managerDao = new ManagerDao();
	List<SalesDto> ordersList = managerDao.monthlySalesCheckByOrderDate();
%>
		<div id="monthlyChart" class="col-md-8"></div>
		<div class="col-md-4">
			<table id="datatable" class="mt-5 table table-bordered table-striped table-hover">
				<thead class="table-primary" style="font-size:15px;">
					<tr><th>월</th><th>총 매출액</th><th>실제 결제금액</th><th>사용 포인트</th></tr>
				</thead>
				<tbody class="table-light" style="font-size:14px;">
<%
	for (SalesDto orders : ordersList) {
%>
					<tr><th><%=orders.getOrderDate() %>월</th><td><%=orders.getTotalSales() %></td><td><%=orders.getRealSales() %></td><td><%=orders.getUsePoint() %></td></tr>
<%
	}
%>
				</tbody>
			</table>
			<p style="font-size:13px;" align="right"><i>총 매출액 : 실제 결제금액(원)+ 사용 포인트</i></p>
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
		      text: '<b>' + '< 2021 월별 매출 통계 >' + '</b>'   
   };      
   var yAxis = {
      allowDecimals: false,
      title: {
         text: '금액'
      }
   };
   var tooltip = {
      formatter: function () {
         return '<b>' + this.series.name + '</b><br/>' +
            this.point.y + ' ';
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
   $('#monthlyChart').highcharts(json);
});

</script>




</body>
</html>