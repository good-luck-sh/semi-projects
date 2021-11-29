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
<%@ include file="../navbar/nav.jsp" %>
<div class="container">

	<h4>mileage</h4>
<hr>
	<div>
		<table class="table">
			<thead>
				<tr>
					<th>날짜</th>
					<th>번호</th>
					<th>차감/적립</th>
					<th>이유</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>2021-11-11</td>
					<td>1</td>
					<td>+1000</td>
					<td>상품 구매</td>
				</tr>
			</tbody>
		</table>
	</div>
<hr>
	<div class="row mb-3">
		<div class="col">
			<h2>총 포인트: 10000 원</h2>
		</div>
	</div>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>