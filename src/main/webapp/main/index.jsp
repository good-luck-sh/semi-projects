
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
<%
	pageContext.setAttribute("menu","home");
%>
<%@ include file="../navbar/nav.jsp" %>
<div class="container" style="width:2119px; max-width:none!important;"> 
<%
	String register = request.getParameter("register");
	if ("completed".equals(register)) {
%>
	<div class="row">
		<div class="col">
			<div class="alert alert-success">
				<strong>회원가입 완료</strong>
				<P>로그인 후 다양한 서비스를 이용하세요</P>
			</div>
		</div>
	</div>
<% 		
	}
%>	

	<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
  		<div class="carousel-inner">
    		<div class="carousel-item active">
      			<img src="../navbar/resource/img_main1.png" class="d-block w-100" alt="...">
    		</div>
    		<div class="carousel-item">
      			<img src="../navbar/resource/img_main2.png" class="d-block w-100" alt="...">
    		</div>
    		<div class="carousel-item">
      			<img src="../navbar/resource/img_main3.png" class="d-block w-100" alt="...">
   	 		</div>
    		<div class="carousel-item">
      			<img src="../navbar/resource/img_main4.png" class="d-block w-100" alt="...">
   			</div>
  		</div>
  		<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
    		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
    		<span class="visually-hidden">Previous</span>
  		</button>
  		<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
    		<span class="carousel-control-next-icon" aria-hidden="true"></span>
    		<span class="visually-hidden">Next</span>
  		</button>
	</div> 
	<hr>
	<h4 style="line-height:400%; text-indent:10em;">best</h4>
	<div class="row">
		<div class="col-md-5" style="width:180px; padding-left:350px;">
			<div class="card-mx-200px;" style="width: 290px;">
				<a class="card-link" href="main/login.jsp"></a>
  				<img src="../navbar/resource/outer-haze_wellon_fur_collar_padding.png" class="card-img-top" alt="...">
  				
  				<div class="card-body">
    				<h6 class="card-title">[OUTER]haze wellon fur collar padding</h6>
    				<p class="card-text">카라 부분 퍼 소재가 더해져 귀여운 포인트가 되어주는 패딩 웰론100% 충전재로 가벼우면서 따뜻한 착용이 가능합니다.</p>
    				<p class="card-text">42,500 won</p>
  				</div>
			</div>
		</div>
		<div class="col" style="width:180px; padding-left:365px;">
			<div class="card-mx-200px;" style="width: 290px;">
  				<img src="../navbar/resource/outer-haze_wellon_fur_collar_padding.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<h6 class="card-title">[OUTER]haze wellon fur collar padding</h6>
    				<p class="card-text">카라 부분 퍼 소재가 더해져 귀여운 포인트가 되어주는 패딩 웰론100% 충전재로 가벼우면서 따뜻한 착용이 가능합니다.</p>
    				<p class="card-text">42,500 won</p>
  				</div>
			</div>
		</div>
		<div class="col" style="width:180px; padding-left:145px;">
			<div class="card-mx-200px;" style="width: 290px;">
  				<img src="../navbar/resource/outer-haze_wellon_fur_collar_padding.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<h6 class="card-title">[OUTER]haze wellon fur collar padding</h6>
    				<p class="card-text">카라 부분 퍼 소재가 더해져 귀여운 포인트가 되어주는 패딩 웰론100% 충전재로 가벼우면서 따뜻한 착용이 가능합니다.</p>
    				<p class="card-text">42,500 won</p>
  				</div>
			</div>
		</div>
		<div class="col" style="width:180px; padding-left:150px; padding-right:410px;">
			<div class="card-mx-200px;" style="width: 290px;">
  				<img src="../navbar/resource/outer-haze_wellon_fur_collar_padding.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<h6 class="card-title">[OUTER]haze wellon fur collar padding</h6>
    				<p class="card-text">카라 부분 퍼 소재가 더해져 귀여운 포인트가 되어주는 패딩 웰론100% 충전재로 가벼우면서 따뜻한 착용이 가능합니다.</p>
    				<p class="card-text">42,500 won</p>
  				</div>
			</div>
		</div>
	</div>
	<h4 style="line-height:400%; text-indent:10em;">top</h4>
	<div class="row">
		<div class="col-md-5" style="width:180px; padding-left:350px;">
			<div class="card-mx-200px;" style="width: 290px;">
				<a class="card-link" href="main/login.jsp"></a>
  				<img src="../navbar/resource/outer-haze_wellon_fur_collar_padding.png" class="card-img-top" alt="...">
  				
  				<div class="card-body">
    				<h6 class="card-title">[OUTER]haze wellon fur collar padding</h6>
    				<p class="card-text">카라 부분 퍼 소재가 더해져 귀여운 포인트가 되어주는 패딩 웰론100% 충전재로 가벼우면서 따뜻한 착용이 가능합니다.</p>
    				<p class="card-text">42,500 won</p>
  				</div>
			</div>
		</div>
		<div class="col" style="width:180px; padding-left:365px;">
			<div class="card-mx-200px;" style="width: 290px;">
  				<img src="../navbar/resource/outer-haze_wellon_fur_collar_padding.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<h6 class="card-title">[OUTER]haze wellon fur collar padding</h6>
    				<p class="card-text">카라 부분 퍼 소재가 더해져 귀여운 포인트가 되어주는 패딩 웰론100% 충전재로 가벼우면서 따뜻한 착용이 가능합니다.</p>
    				<p class="card-text">42,500 won</p>
  				</div>
			</div>
		</div>
		<div class="col" style="width:180px; padding-left:145px;">
			<div class="card-mx-200px;" style="width: 290px;">
  				<img src="../navbar/resource/outer-haze_wellon_fur_collar_padding.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<h6 class="card-title">[OUTER]haze wellon fur collar padding</h6>
    				<p class="card-text">카라 부분 퍼 소재가 더해져 귀여운 포인트가 되어주는 패딩 웰론100% 충전재로 가벼우면서 따뜻한 착용이 가능합니다.</p>
    				<p class="card-text">42,500 won</p>
  				</div>
			</div>
		</div>
		<div class="col" style="width:180px; padding-left:150px; padding-right:410px;">
			<div class="card-mx-200px;" style="width: 290px;">
  				<img src="../navbar/resource/outer-haze_wellon_fur_collar_padding.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<h6 class="card-title">[OUTER]haze wellon fur collar padding</h6>
    				<p class="card-text">카라 부분 퍼 소재가 더해져 귀여운 포인트가 되어주는 패딩 웰론100% 충전재로 가벼우면서 따뜻한 착용이 가능합니다.</p>
    				<p class="card-text">42,500 won</p>
  				</div>
			</div>
		</div>
	</div>
	<h4 style="line-height:400%; text-indent:10em;">pants</h4>
	<div class="row">
		<div class="col-md-5" style="width:180px; padding-left:350px;">
			<div class="card-mx-200px;" style="width: 290px;">
				<a class="card-link" href="main/login.jsp"></a>
  				<img src="../navbar/resource/outer-haze_wellon_fur_collar_padding.png" class="card-img-top" alt="...">
  				
  				<div class="card-body">
    				<h6 class="card-title">[OUTER]haze wellon fur collar padding</h6>
    				<p class="card-text">카라 부분 퍼 소재가 더해져 귀여운 포인트가 되어주는 패딩 웰론100% 충전재로 가벼우면서 따뜻한 착용이 가능합니다.</p>
    				<p class="card-text">42,500 won</p>
  				</div>
			</div>
		</div>
		<div class="col" style="width:180px; padding-left:365px;">
			<div class="card-mx-200px;" style="width: 290px;">
  				<img src="../navbar/resource/outer-haze_wellon_fur_collar_padding.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<h6 class="card-title">[OUTER]haze wellon fur collar padding</h6>
    				<p class="card-text">카라 부분 퍼 소재가 더해져 귀여운 포인트가 되어주는 패딩 웰론100% 충전재로 가벼우면서 따뜻한 착용이 가능합니다.</p>
    				<p class="card-text">42,500 won</p>
  				</div>
			</div>
		</div>
		<div class="col" style="width:180px; padding-left:145px;">
			<div class="card-mx-200px;" style="width: 290px;">
  				<img src="../navbar/resource/outer-haze_wellon_fur_collar_padding.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<h6 class="card-title">[OUTER]haze wellon fur collar padding</h6>
    				<p class="card-text">카라 부분 퍼 소재가 더해져 귀여운 포인트가 되어주는 패딩 웰론100% 충전재로 가벼우면서 따뜻한 착용이 가능합니다.</p>
    				<p class="card-text">42,500 won</p>
  				</div>
			</div>
		</div>
		<div class="col" style="width:180px; padding-left:150px; padding-right:410px;">
			<div class="card-mx-200px;" style="width: 290px;">
  				<img src="../navbar/resource/outer-haze_wellon_fur_collar_padding.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<h6 class="card-title">[OUTER]haze wellon fur collar padding</h6>
    				<p class="card-text">카라 부분 퍼 소재가 더해져 귀여운 포인트가 되어주는 패딩 웰론100% 충전재로 가벼우면서 따뜻한 착용이 가능합니다.</p>
    				<p class="card-text">42,500 won</p>
  				</div>
			</div>
		</div>
	</div>
			<h4 style="line-height:400%; text-indent:10em;">shirt</h4>
	<div class="row">
		<div class="col-md-5" style="width:180px; padding-left:350px;">
			<div class="card-mx-200px;" style="width: 290px;">
				<a class="card-link" href="main/login.jsp"></a>
  				<img src="../navbar/resource/outer-haze_wellon_fur_collar_padding.png" class="card-img-top" alt="...">
  				
  				<div class="card-body">
    				<h6 class="card-title">[OUTER]haze wellon fur collar padding</h6>
    				<p class="card-text">카라 부분 퍼 소재가 더해져 귀여운 포인트가 되어주는 패딩 웰론100% 충전재로 가벼우면서 따뜻한 착용이 가능합니다.</p>
    				<p class="card-text">42,500 won</p>
  				</div>
			</div>
		</div>
		<div class="col" style="width:180px; padding-left:365px;">
			<div class="card-mx-200px;" style="width: 290px;">
  				<img src="../navbar/resource/outer-haze_wellon_fur_collar_padding.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<h6 class="card-title">[OUTER]haze wellon fur collar padding</h6>
    				<p class="card-text">카라 부분 퍼 소재가 더해져 귀여운 포인트가 되어주는 패딩 웰론100% 충전재로 가벼우면서 따뜻한 착용이 가능합니다.</p>
    				<p class="card-text">42,500 won</p>
  				</div>
			</div>
		</div>
		<div class="col" style="width:180px; padding-left:145px;">
			<div class="card-mx-200px;" style="width: 290px;">
  				<img src="../navbar/resource/outer-haze_wellon_fur_collar_padding.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<h6 class="card-title">[OUTER]haze wellon fur collar padding</h6>
    				<p class="card-text">카라 부분 퍼 소재가 더해져 귀여운 포인트가 되어주는 패딩 웰론100% 충전재로 가벼우면서 따뜻한 착용이 가능합니다.</p>
    				<p class="card-text">42,500 won</p>
  				</div>
			</div>
		</div>
		<div class="col" style="width:180px; padding-left:150px; padding-right:410px;">
			<div class="card-mx-200px;" style="width: 290px;">
  				<img src="../navbar/resource/outer-haze_wellon_fur_collar_padding.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<h6 class="card-title">[OUTER]haze wellon fur collar padding</h6>
    				<p class="card-text">카라 부분 퍼 소재가 더해져 귀여운 포인트가 되어주는 패딩 웰론100% 충전재로 가벼우면서 따뜻한 착용이 가능합니다.</p>
    				<p class="card-text">42,500 won</p>
  				</div>
			</div>
		</div>
	</div>
			<h4 style="line-height:400%; text-indent:10em;">shoes</h4>
	<div class="row">
		<div class="col-md-5" style="width:180px; padding-left:350px;">
			<div class="card-mx-200px;" style="width: 290px;">
				<a class="card-link" href="main/login.jsp"></a>
  				<img src="../navbar/resource/outer-haze_wellon_fur_collar_padding.png" class="card-img-top" alt="...">
  				
  				<div class="card-body">
    				<h6 class="card-title">[OUTER]haze wellon fur collar padding</h6>
    				<p class="card-text">카라 부분 퍼 소재가 더해져 귀여운 포인트가 되어주는 패딩 웰론100% 충전재로 가벼우면서 따뜻한 착용이 가능합니다.</p>
    				<p class="card-text">42,500 won</p>
  				</div>
			</div>
		</div>
		<div class="col" style="width:180px; padding-left:365px;">
			<div class="card-mx-200px;" style="width: 290px;">
  				<img src="../navbar/resource/outer-haze_wellon_fur_collar_padding.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<h6 class="card-title">[OUTER]haze wellon fur collar padding</h6>
    				<p class="card-text">카라 부분 퍼 소재가 더해져 귀여운 포인트가 되어주는 패딩 웰론100% 충전재로 가벼우면서 따뜻한 착용이 가능합니다.</p>
    				<p class="card-text">42,500 won</p>
  				</div>
			</div>
		</div>
		<div class="col" style="width:180px; padding-left:145px;">
			<div class="card-mx-200px;" style="width: 290px;">
  				<img src="../navbar/resource/outer-haze_wellon_fur_collar_padding.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<h6 class="card-title">[OUTER]haze wellon fur collar padding</h6>
    				<p class="card-text">카라 부분 퍼 소재가 더해져 귀여운 포인트가 되어주는 패딩 웰론100% 충전재로 가벼우면서 따뜻한 착용이 가능합니다.</p>
    				<p class="card-text">42,500 won</p>
  				</div>
			</div>
		</div>
		<div class="col" style="width:180px; padding-left:150px; padding-right:410px;">
			<div class="card-mx-200px;" style="width: 290px;">
  				<img src="../navbar/resource/outer-haze_wellon_fur_collar_padding.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<h6 class="card-title">[OUTER]haze wellon fur collar padding</h6>
    				<p class="card-text">카라 부분 퍼 소재가 더해져 귀여운 포인트가 되어주는 패딩 웰론100% 충전재로 가벼우면서 따뜻한 착용이 가능합니다.</p>
    				<p class="card-text">42,500 won</p>
  				</div>
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>