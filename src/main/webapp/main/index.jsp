
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
	String success = request.getParameter("success");
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
	
	if ("complete-cancelMembership".equals(success)){
%>
	<div class="row">
		<div class="col">
			<div class="alert alert-primary">
				<strong>회원탈퇴 완료</strong>
				<P>그동안 감사했습니다.</P>
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
		<div class="col" style="width:180px; padding-left:355px;">
			<div class="space" style="width: 290px;">
	    		<a href=""><img src="../navbar/resource/images/main/best1.png" alt="상품 섬네일" title="상품 섬네일"/></a>
        		<div class="product-info">
            		<div class="product-name"><a href="" style="color:black">[OUTER] HAZE WELLON FUR COLLAR PADDING</a></div>
            		<div class="product-text"><a href="" style="color:black">카라 부분 퍼 소재가 더해져 귀여운 포인트가 되어주는 패딩 웰론100% 충전재로 가벼우면서 따뜻한 착용이 가능합니다</a></div>
               		<div class="prd-price"><span class="consumer">42,500 won</span></div> 
            	</div>
        	</div>
		</div>
		<div class="col" style="width:180px; padding-left:140px;">
			<div class="space" style="width: 290px;">
	    		<a href=""><img src="../navbar/resource/images/main/best2.png" alt="상품 섬네일" title="상품 섬네일"/></a>
        		<div class="product-info">
            		<div class="product-name"><a href="" style="color:black">[TOP] ANGORA V NECK KNIT</a></div>
            		<div class="product-text"><a href="" style="color:black">벌룬 소매로 여성스런 포인트를 준 자체제작 앙고라 V넥 니트 WOOL 40%, 높은 퀄리티와 보온성을 자랑하는 추천 아이템</a></div>
               		<div class="prd-price"><span class="consumer">36,000 won</span></div> 
            	</div>
           	</div>
		</div>
		<div class="col" style="width:180px; padding-left:145px;">
			<div class="space" style="width: 290px;">
	    		<a href=""><img src="../navbar/resource/images/main/best3.png" alt="상품 섬네일" title="상품 섬네일"/></a>
        		<div class="product-info">
            		<div class="product-name"><a href="" style="color:black">[OUTER] GOLDEN BUTTON KNIT CARDIGAN</a></div>
            		<div class="product-text"><a href="" style="color:black">자체제작, 세련되면서 고급스러움이 물씬 느껴지는 니트 가디건 골드버튼과 배색 디테일로 포인트를 주어 분위기 있게 연출됩니다</a></div>
               		<div class="prd-price"><span class="consumer">29,500 won</span></div> 
            	</div>
           </div>
		</div>
		<div class="col" style="width:180px; padding-left:150px; padding-right:410px;">
			<div class="space" style="width: 290px;">
	    		<a href=""><img src="../navbar/resource/images/main/best4.png" alt="상품 섬네일" title="상품 섬네일"/></a>
        		<div class="product-info">
            		<div class="product-name"><a href="" style="color:black">[TOP] SILKY BACK CROSS COVER BLOUSE</a></div>
            		<div class="product-text"><a href="" style="color:black">백 라인의 크로스 커버 디테일이 매력적인 자체제작 블라우스 은은한 광택감의 실키한 원단으로 고급스러워 보입니다</a></div>
               		<div class="prd-price"><span class="consumer">24,500 won</span></div> 
            	</div>
           </div>
		</div>
	</div>
	<h4 style="line-height:400%; text-indent:10em;">top</h4>
	<div class="row">
		<div class="col" style="width:180px; padding-left:355px;">
			<div class="space" style="width: 290px;">
	    		<a href=""><img src="../navbar/resource/images/main/top1.png" alt="상품 섬네일" title="상품 섬네일"/></a>
        		<div class="product-info">
            		<div class="product-name"><a href="" style="color:black">[TOP] KELLY NAPPING WAPPEN BOXY HOOD T</a></div>
            		<div class="product-text"><a href="" style="color:black">알파벡과 성조기 와펜으로 귀여운 포인트를 더해 준 박시 후드티 도톰하고 부드러운 양기모 원단으로 바디를 포근하게 감싸줍니다</a></div>
               		<div class="prd-price"><span class="consumer">32,000 won</span></div> 
            	</div>
        	</div>
		</div>
		<div class="col" style="width:180px; padding-left:140px;">
			<div class="space" style="width: 290px;">
	    		<a href=""><img src="../navbar/resource/images/main/top2.png" alt="상품 섬네일" title="상품 섬네일"/></a>
        		<div class="product-info">
            		<div class="product-name"><a href="" style="color:black">[TOP] WISCO GOLGI WRAP MTM SET</a></div>
            		<div class="product-text"><a href="" style="color:black">여리여리하고 걸리쉬한 무지 골지 맨투맨 & 솔리브리스 세트 니트 느낌의 부드러운 원단으로 포근하게 착용하실 수 있습니다</a></div>
               		<div class="prd-price"><span class="consumer">19,800 won</span></div> 
            	</div>
           </div>
		</div>
		<div class="col" style="width:180px; padding-left:145px;">
			<div class="space" style="width: 290px;">
	    		<a href=""><img src="../navbar/resource/images/main/top3.png" alt="상품 섬네일" title="상품 섬네일"/></a>
        		<div class="product-info">
            		<div class="product-name"><a href="" style="color:black">[TOP] FLUFFY NAPPING RAGLAN OVER HOOD T</a></div>
            		<div class="product-text"><a href="" style="color:black">6 COLOR, 높은 퀄리티의 커먼유니크 자체제작 후드티 톡톡한 두께감의 양기모 원단으로 포근하게 즐기기 좋답니다</a></div>
               		<div class="prd-price"><span class="consumer">29,500 won</span></div> 
            	</div>
           </div>
		</div>
		<div class="col" style="width:180px; padding-left:150px; padding-right:410px;">
			<div class="space" style="width: 290px;">
	    		<a href=""><img src="../navbar/resource/images/main/top4.png" alt="상품 섬네일" title="상품 섬네일"/></a>
        		<div class="product-info">
            		<div class="product-name"><a href="" style="color:black">[TOP]COCUN CORDUROY BALLOON CROP MTM</a></div>
            		<div class="product-text"><a href="" style="color:black">크롭 기장과 벌룬 소매 라인으로 멋스러운 핏감이 돋보이는 맨투맨 보드라운 촉감의 코듀로이 원단으로 따뜻한 분위기를 담았습니다</a></div>
               		<div class="prd-price"><span class="consumer">27,000 won</span></div> 
            	</div>
           </div>
		</div>
	</div>
	<h4 style="line-height:400%; text-indent:10em;">pants</h4>
	<div class="row">
		<div class="col" style="width:180px; padding-left:355px;">
			<div class="space" style="width: 290px;">
	    		<a href=""><img src="../navbar/resource/images/main/pants1.png" alt="상품 섬네일" title="상품 섬네일"/></a>
        		<div class="product-info">
            		<div class="product-name"><a href="" style="color:black">[BOTTOM] DENTY NAPPING WASHING DENIM SKINNY</a></div>
            		<div class="product-text"><a href="" style="color:black">슬림한 핏감으로 어디에나 예쁘게 매치되는 워싱 데님 스키니 도톰한 기모 안감으로 보온성을 높여 포근하게 착용되는 아이템</a></div>
               		<div class="prd-price"><span class="consumer">29,000 won</span></div> 
            	</div>
        	</div>
		</div>
		<div class="col" style="width:180px; padding-left:140px;">
			<div class="space" style="width: 290px;">
	    		<a href=""><img src="../navbar/resource/images/main/pants2.png" alt="상품 섬네일" title="상품 섬네일"/></a>
        		<div class="product-info">
            		<div class="product-name"><a href="" style="color:black">[BOTTOM] SECOND 9 DENIM PANTS</a></div>
            		<div class="product-text"><a href="" style="color:black">센슈얼한 무드를 느낄 수 있는 크롭 데님 팬츠 다리가 더욱길고 가늘어 보이게 연출되는 아이템입니다</a></div>
               		<div class="prd-price"><span class="consumer">28,000 won</span></div> 
            	</div>
           </div>
		</div>
		<div class="col" style="width:180px; padding-left:145px;">
			<div class="space" style="width: 290px;">
	    		<a href=""><img src="../navbar/resource/images/main/pants3.png" alt="상품 섬네일" title="상품 섬네일"/></a>
        		<div class="product-info">
            		<div class="product-name"><a href="" style="color:black">[BOTTOM] LUCK NAPPING SEMI BOOTS SLACKS</a></div>
            		<div class="product-text"><a href="" style="color:black">도톰한 두께에 기모 안감으로 겨울 내내 따뜻하게 착용될 슬랙스 세미 부츠컷 라인으로 과한 느낌 없이 세련되게 연출 가능합니다</a></div>
               		<div class="prd-price"><span class="consumer">36,000 won</span></div> 
            	</div>
           </div>
		</div>
		<div class="col" style="width:180px; padding-left:150px; padding-right:410px;">
			<div class="space" style="width: 290px;">
	    		<a href=""><img src="../navbar/resource/images/main/pants4.png" alt="상품 섬네일" title="상품 섬네일"/></a>
        		<div class="product-info">
            		<div class="product-name"><a href="" style="color:black">[BOTTOM] CLOUD DAMAGE DENIM PANTS</a></div>
            		<div class="product-text"><a href="" style="color:black">커먼유니크에서 만나 보실 수 있는 자체제작 데님 팬츠 흔하지 않은 언발 디자인과 디테일로 포인트가 됩니다</a></div>
               		<div class="prd-price"><span class="consumer">28,500 won</span>
            		</div> 
            	</div>
           </div>
		</div>
	</div>	
	<h4 style="line-height:400%; text-indent:10em;">shirt</h4>	
	<div class="row">
		<div class="col" style="width:180px; padding-left:355px;">
			<div class="space" style="width: 290px;">
	    		<a href=""><img src="../navbar/resource/images/main/shirt1.png" alt="상품 섬네일" title="상품 섬네일"/></a>
        		<div class="product-info">
            		<div class="product-name"><a href="" style="color:black">[TOP] VINTAGE CORDUROY POCKET SHIRTS</a></div>
            		<div class="product-text"><a href="" style="color:black">빈티지한 색감으로 멋스러운 무드가 느껴지는 코듀로이 셔츠 5COLOR, F/W시즌에 알맞는 컬러 구성으로 활용도 높습니다</a></div>
               		<div class="prd-price"><span class="consumer">26,000 won</span></div> 
            	</div>
           </div>
		</div>
		<div class="col" style="width:180px; padding-left:140px;">
			<div class="space" style="width: 290px;">
	    		<a href=""><img src="../navbar/resource/images/main/shirt2.png" alt="상품 섬네일" title="상품 섬네일"/></a>
        		<div class="product-info">
            		<div class="product-name"><a href="" style="color:black">[TOP] COST PEACH SLIT BOXY FIT SHIRTS</a></div>
            		<div class="product-text"><a href="" style="color:black">따뜻한 무드의 피치 원단으로 F/W시즌 활용하기 좋은 셔츠 5COLOR로 폭넓게 구성되어 취향에 따라 초이스 가능합니다</a></div>
               		<div class="prd-price"><span class="consumer">26,500 won</span></div> 
            	</div>
           </div>
		</div>
		<div class="col" style="width:180px; padding-left:145px;">
			<div class="space" style="width: 290px;">
	    		<a href=""><img src="../navbar/resource/images/main/shirt3.png" alt="상품 섬네일" title="상품 섬네일"/></a>
        		<div class="product-info">
            		<div class="product-name"><a href="" style="color:black">[TOP] EDIN WOOL CHECK LOOSE FIT SHIRTS</a></div>
            		<div class="product-text"><a href="" style="color:black">체크패턴을 더해 캐주얼하고 멋스럽게 즐기기 좋은 루즈핏 셔츠 도톰한 울 블렌딩 원단으로 F/W시즌 따뜻하게 착용됩니다</a></div>
               		<div class="prd-price"><span class="consumer">34,000 won</span></div> 
            	</div>
           </div>
		</div>
		<div class="col" style="width:180px; padding-left:150px; padding-right:410px;">
			<div class="space" style="width: 290px;">
	    		<a href=""><img src="../navbar/resource/images/main/shirt4.png" alt="상품 섬네일" title="상품 섬네일"/></a>
        		<div class="product-info">
            		<div class="product-name"><a href="" style="color:black">[TOP] HERID PEACH POCKET BOXY FIT SHIRTS</a></div>
            		<div class="product-text"><a href="" style="color:black">6COLOR, 베이직한 디자인과 막시한 핏으로 활용도 높은 셔츠 보드라운 촉감의 피치 기모 원단으로 따스하고 포근하게 착용</a></div>
               		<div class="prd-price"><span class="consumer">28,500 won</span></div> 
            	</div>
           </div>
		</div>
	</div>	
	<h4 style="line-height:400%; text-indent:10em;">shoes</h4>
	<div class="row">
		<div class="col" style="width:180px; padding-left:355px;">
			<div class="space" style="width: 290px;">
	    		<a href=""><img src="../navbar/resource/images/main/shoes1.png" alt="상품 섬네일" title="상품 섬네일"/></a>
        		<div class="product-info">
            		<div class="product-name"><a href="" style="color:black">[SHOES] RUVE MARY JANE FLAT SHOES</a></div>
            		<div class="product-text"><a href="" style="color:black">걸리쉬한 무드로 은근하게 포인트 업 시켜주는 플랫슈즈 세련된 느낌의 메리제인 스타일로 다양한 매치가 가능합니다</a></div>
               		<div class="prd-price"><span class="consumer">35,000 won</span></div> 
            	</div>
           </div>
		</div>
		<div class="col" style="width:180px; padding-left:140px;">
			<div class="space" style="width: 290px;">
	    		<a href=""><img src="../navbar/resource/images/main/shoes2.png" alt="상품 섬네일" title="상품 섬네일"/></a>
        		<div class="product-info">
            		<div class="product-name"><a href="" style="color:black">[SHOES] COVENT NAPPING ANKLE BOOTS</a></div>
            		<div class="product-text"><a href="" style="color:black">안감 기모 처리로 F/W시즌 따뜻하게 즐길 수 있는 앵클 부츠 트랜드에 구애받지 않는 깔끔한 디자인으로 소장가치 있습니다</a></div>
               		<div class="prd-price"><span class="consumer">43,000 won</span></div> 
            	</div>
           </div>
		</div>
		<div class="col" style="width:180px; padding-left:145px;">
			<div class="space" style="width: 290px;">
	    		<a href=""><img src="../navbar/resource/images/main/shoes3.png" alt="상품 섬네일" title="상품 섬네일"/></a>
        		<div class="product-info">
            		<div class="product-name"><a href="" style="color:black">[SHOES] MARCO BANDING CHELSEA BOOTS</a></div>
            		<div class="product-text"><a href="" style="color:black">감각적인 스타일링을 관성할 수 있는 밴딩첼시 부츠 깔끔한 디자인으로 다양한 코디에 활용하기 좋은 아이템</a></div>
               		<div class="prd-price"><span class="consumer">44,500 won</span></div> 
            	</div>
           </div>
		</div>
		<div class="col" style="width:180px; padding-left:150px; padding-right:410px;">
			<div class="space" style="width: 290px;">
	    		<a href=""><img src="../navbar/resource/images/main/shoes4.png" alt="상품 섬네일" title="상품 섬네일"/></a>
        		<div class="product-info">
            		<div class="product-name"><a href="" style="color:black">[SHOES]WOOD SQUARE ANKLE BOOTS</a></div>
            		<div class="product-text"><a href="" style="color:black">우드 통굽으로 빈티지한 무드가 연출되는 스웨어 앵클부츠 F/W시즌에 잘 어우러지는 메리트 있는 컬러 구성</a></div>
               		<div class="prd-price"><span class="consumer">45,000 won</span></div> 
            	</div>
           </div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>