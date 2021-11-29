<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
    <title>마이페이지::장바구니</title>
</head>
<body>
<%@ include file="../navbar/nav.jsp" %>
<div class="container">    
<!-- 
	카드로 구현하기?
 -->
 	<h4>basket</h4>
 <hr>
 	<div>
 		<table class="table">
 			<thead>
 				<tr>
 					<th>장바구니 번호</th>
 					<th>제품 번호</th>
 					<th>수량</th>
 				</tr>
 			</thead>
 			<tbody>
 				<tr>
 					<td>1</td>
 					<td>121</td>
 					<td>1 개</td>
 				</tr>
 			</tbody>
 		</table>
 	</div>
 	<div class="row mb-3">
 		<div class="col">
 			<h4>총 상품 금액</h4>
 			<h3>1000000 원</h3>
 		</div>
 	</div>


</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	// sample14-dom 참고
	function toggleCheckbox(){
		
		
	}
</script>
</body>
</html>