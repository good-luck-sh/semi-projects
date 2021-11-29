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
<div class ="container">
		<div class="row">
			<div class="col">
				<table class="table">
					<tbody>
						<tr class="d-flex">
							<th class="col-2">번호</th>
							<td class="col-4">100</td>
							<th class="col-2">게시물 이름</th>
							<td class="col-4">햄스터</td>
						</tr>
						<tr>
							<th class="col-2">조회수</th>
							<td class="col-4">0</td>
							<th class="col-2">좋아요 수</th>
							<td class="col-4">150</td>
						</tr>
						<tr>
							<th class="col-2">내용</th>
							<td class="col-10">
								<textarea>
									내용에 대해서 이야기하면 뭐문의하고싶은데 
									어케 해야할지 웅앵웅앵
								</textarea>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row-3 text-right">
			<div class="col">
				<div>
					<a class="btn btn-primary">추천하기</a><!-- 작성자가 아니면 보이기 -->
					<a class="btn btn-warning">수정하기</a><!-- 작성자만 보이기 -->
					<a class="btn btn-danger">삭제하기</a><!-- 작성자만 보이기 -->
				</div>
			</div>
		</div>
		<div>
			<form class="well" method="post" action="replyrRegister.jsp">
				<input type="hidden" name="no" value="no">
				<input type="hidden" name="cpno" value="cpno">
				<input type="hidden" name="user" value="userNo">
				<!-- userNo는 loginInfo에서 가져온다. -->
				<div>
					<label>제목</label>
					<input type="text" value="" name="" />
				</div>
				<div>
					<label>cs게시판 작성자 성함</label>
					<input type="text" value="" name="" readonly="readonly"/>
				</div>
				<div>
					<label>내용</label>
					<textarea rows="3" placeholder="내용을 입력하세요"></textarea>
					<input />
				</div>
				<div class="text-right">
					<button type="submit" class="btn default">등록</button>
				</div>
			</form>
		</div>
		<div class="row">
			<div class="col">
				<table>
					<colgroup>
						<col width="*">
						<col width="10%">
						<col width="20%">
						<col width="9%">
					</colgroup>
					<tbody>
					<tr>
						<td>제목</td>
						<td>매니저</td>
						<td>내용</td>
						<td class="text-center"><a href="">삭제</a></td>
					</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> 
</body>
</html>