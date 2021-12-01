<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title></title>
</head>
<body>
<!-- 나중에 매니저마이리스트에서 출력되게 만든다. -->
<%
	String error = request.getParameter("error");
	if("empty".equals(error)) {
%>				
				<div class="alert alert-danger">
					<strong>작성 실패</strong>설정이 필요합니다.
				</div>
<% 
}
%>
	<div class="container">
		<div class="row">
			<div class="col">
				<h1>매니저 관리 폼</h1>
				<form action="userSystemRegister.jsp" method="post">
					<label class="mb-3">별점 입력</label> 
					<select class="form-select form-select-lg mb-3" name="manager">
						<option selected="selected" disabled="disabled">매니저 설정하기</option>
						<option value="매니저">매니저</option>
					</select>
					<div class="text-end">
						<button class="btn btn-outline-primary" type="submit">등록하기</button>
						<button class="btn btn-outline-danger"><a href="">취소하기</a></button><!-- 매니저 마이리스트 -->
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> 
</body>
</html>