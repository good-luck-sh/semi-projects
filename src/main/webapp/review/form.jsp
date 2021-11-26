<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>리뷰 작성하기</title>
</head>
<body>
<%@ include file="../navbar/nav.jsp" %>
<div class ="container">
	<div class="row form-control mt-3">
		<div class="col mb-3 mt-3">
			<h3 class="mb-3">리뷰 작성 폼</h3>
			<p class=""><strong>안녕하세요 :) 김승희 회원님</strong></p>
			<p class="">리뷰 작성시 1%를 추가 적립 받으실 수 있습니다.</p>
		</div>
	</div>
	<div class="row mt-3">
		<div class="col">
			<form action="register.jsp" method="post">
		<div class="mb-3" id="text-review-1">
			<label for="exampleFormControlInput1" class="form-label">리뷰 제목</label>
  			<input type="text" class="form-control" name="reviewTitle">
		</div>
		<div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label">작성자</label>
  			<input type="text" class="form-control" name="" disabled="disabled" value="">
		</div>
		<div class="mb-3" id="text-review-2">
  			<label for="exampleFormControlInput1" class="form-label">내용 입력</label>
  			<input type="text" class="form-control" name="reviewText">
		</div>
		<div class="text-end">
			<button class="btn btn-outline-primary" type="submit">등록하기</button>
  			<button class="btn btn-outline-danger"><a href="">취소하기</a></button>
				</div>
			</form>
		</div>	
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	function alretAdd(event){
		
	} 
</script> 
</body>
</html>