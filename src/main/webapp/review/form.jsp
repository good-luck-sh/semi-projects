<%@page import="vo.Product"%>
<%@page import="dao.ProductReviewJdbcDao"%>
<%@page import="dao.ProductDao"%>
<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="shortcut icon" href="../navbar/resource/img.png" type="image/x-icon">
    <title>리뷰 작성하기</title>
</head>
<body>
<%
	pageContext.setAttribute("menu", "login");
	//네비바 활성화를 위하여 pageContext에서 값을 꺼내온다.
%>
<%@ include file="../navbar/nav.jsp" %>
<%
	if(loginUserInfo == null) {
		response.sendRedirect("../main/loginform.jsp?error=empty");
		return;
	}

	UserDao userDao = UserDao.getInstance();
	UserTable user = userDao.getUserAllInfoByNo(loginUserInfo.getUserNo());
	int productNo = Integer.parseInt(request.getParameter("productNo"));
	int orderNo = Integer.parseInt(request.getParameter("orderNo"));
	ProductReviewJdbcDao productDao = ProductReviewJdbcDao.getInstance();
	Product product = productDao.getProductByProductNo(productNo);
	
%>
<div class ="container">
	<div class="row form-control mt-3">
		<div class="col mb-3 mt-3">
			<h3 class="mb-3">리뷰 작성 폼</h3>
			<p class=""><strong>안녕하세요 :)<%=user.getUserName() %> 회원님</strong></p>
			<p class="">리뷰 작성시 주문금액의 1%를 추가 적립 받으실 수 있습니다.</p>
		</div>
	</div>
	<div class="row mt-3">
			<div class="col">
<%
	String error = request.getParameter("error");	
%>
<%
	if("reviewTitle".equals(error)) {
%>
				<div class="alert alert-danger">
					<strong>리뷰 작성 실패</strong>리뷰의 제목은 필수 입력값입니다.
				</div>
<%
} else if("reviewText".equals(error)) {
%>
				<div class="alert alert-danger">
					<strong>리뷰 작성 실패</strong>리뷰의 내용은 필수 입력값입니다.
				</div>
<%
} else if("noStar".equals(error)) {
%>
				<div class="alert alert-danger">
					<strong>리뷰 작성 실패</strong>별점입력은 필수 입력값입니다.
				</div>
<% 
}
%>
				<form action="register.jsp "method="post">
					<div class="mb-3" id="text-review-1">
						<input type="hidden" class="form-control" name="orderNo" value="<%=orderNo %>">
						<input type="hidden" class="form-control" name="productNo" value="<%=productNo %>">
						<input type="hidden" class="form-control" name="ordercheck" value="1">
						<label for="exampleFormControlInput1" class="form-label">리뷰 제목</label> 
						<input type="text" class="form-control" name="reviewTitle">
					</div>
					<div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label">작성자</label>
						<input type="text" class="form-control" name="" disabled="disabled" readonly="readonly" value="<%=loginUserInfo.getUserName()%>">
					</div>
					<div class="mb-3" id="text-review-2">
						<label for="exampleFormControlInput1" class="form-label">해당하는 리뷰 상품</label>
						<input type="text" class="form-control" name="" disabled="disabled" readonly="readonly" value="<%=product.getProductName()%>">
					</div>
					<div class="mb-3" id="text-review-2">
						<label class="mb-3">리뷰 내용</label>
						<textarea class="form-control col-sm-5" rows="5" name="reviewText" placeholder="내용을 입력하세요"></textarea>
					</div>
					<div>
						<label class="mb-3">별점 입력</label>
						 <select class="form-select form-select-lg mb-3" name="star">
							<option selected="selected" disabled="disabled">별점 입력하기</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>

					</div>
					<div class="text-end">
						<button class="btn btn-outline-primary" type="submit">등록하기</button>
						<button class="btn btn-outline-danger"><a href="../order/list.jsp">취소하기</a></button>
					</div>
				</form>
			</div>
		</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">

</script> 
</body>
</html>