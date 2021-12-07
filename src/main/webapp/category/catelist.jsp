<%@page import="vo.Categorys"%>
<%@page import="java.util.List"%>
<%@page import="dao.CategorysDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="../navbar/nav.css">
   <link rel="shortcut icon" href="../navbar/resource/img.png" type="image/x-icon">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
   <title>카테고리 리스트</title>
</head>
<body>
<div class="container">

<%
	CategorysDao categorysDao = new CategorysDao();
	List<Categorys> categoryList = categorysDao.selectAllCategories();
	
%>    
	<div class="row">
		<div class="col">카테고리목록</div>
		<div>
			<table class="table">
				<thead>
					<tr>
						<th>카테고리 번호</th>
						<th>카테고리 이름</th>
						</tr>	
				</thead>
				<tbody>
<%
	for (Categorys category : categoryList) {
%>
					<tr>
						<td><%=category.getCategorysNo() %></td>
					</tr>
<%
	}
%>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>