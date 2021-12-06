<%@page import="dto.monthDto"%>
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
   <style>
.border1{
    border: 2px solid #f44336;
    border-radius: 20px;
}
   </style>
   <title></title>
</head>
<%@include file="../navbar/nav.jsp" %>
<body>
<div class="container border1">
	<div class="row">
<%
ManagerDao managerDao = new ManagerDao();
	List<monthDto> ordersList = managerDao.monthlySalesCheckByOrderDate();
%>
	<div id="container" style="width: 600px; height: 550px; margin:0; "></div>
		<div class="col">
		<table id="datatable" class="table table-bordered table-hover">
			<thead class="table-secondary">
				<tr><th>월</th><th>총 매출액</th><th>실제 결제금액</th><th>사용 포인트</th></tr>
			</thead>
			<tbody class="table-light">
<%
for (monthDto orders : ordersList) {
%>
				<tr><th><%=orders.getOrderDate() %></th><td><%=orders.getTotalSales() %></td><td><%=orders.getRealSales() %></td><td><%=orders.getUsePoint() %></td></tr>
<%
	}
%>
			</tbody>
		</table>
		<p style="font-size:14px;">총 매출액 : 실제 결제금액 + 사용 포인트</p>
		</div>
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
      text: '월별매출통계'   
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
   $('#container').highcharts(json);
});

</script>




</body>
</html>