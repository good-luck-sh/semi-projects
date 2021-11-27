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
	int category = Integer.parseInt(request.getParameter("category"));
%>
<div class ="container mt-3">
		<div class="row p-3">
			<div class="col">
				<table>
					<tbody>
						<tr>
							<th>번호</th>
							<td>100</td>
							<th>작성자</th>
							<td>김쭝찌</td>
							<th>조회수</th>
							<td>0</td>
							<th>좋아요</th>
							<td>0</td>
							<th>생성일</th>
							<td>2021.11.27</td>
							<th>수정일</th>
							<td>2021.11.27</td>
						</tr>
						<tr>
							<th>내용</th>
							<td></td>
						</tr>
					</tbody>
				</table>
				<div class="text-right">
					<a href="update.jsp" class="btn warning">수정</a> <a href="delete.jsp" class="btn danger">삭제</a>
					<a href="detail.jsp?no=" class="btn primary">목록</a>
				</div>
			</div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> 
</body>
</html>