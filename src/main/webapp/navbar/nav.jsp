

<%@page import="vo.Categorys"%>
<%@page import="java.util.List"%>
<%@page import="dao.CategorysDao"%>
<%@page import="vo.UserTable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String menu = (String)pageContext.getAttribute("menu");
	UserTable loginUserInfo = (UserTable)session.getAttribute("LOGIN_USER_INFO");
%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="../navbar/nav.css">
    <link rel="shortcut icon" href="../navbar/resource/img.png" type="image/x-icon">
    <title>커먼 유니크</title>
</head>
<%
	CategorysDao categorysDao = new CategorysDao();
	List<Categorys> cateList = categorysDao.selectAllCategories();
	
%>   
    <nav>
        <div class=" container m-2">
            <a href="../main/index.jsp">
                <img src="../navbar/resource/logo.png" alt="로고메세지" style="float: left;" class="icon">
            </a>
                <span class=""></span>
            <div>
                <ul class="nav-font">
                    <li class="nav-li"><a href="../product/list_best.jsp">best</a></li>
<%
	for (Categorys category : cateList) {
		
%>
                    <li class="nav-li"><a href="../product/list.jsp?categorysNo=<%=category.getCategorysNo() %>"><%=category.getCategorysName() %></a></li>
<%
	}
%>

<%
	if(loginUserInfo == null) {
%>          

					<li class="nav-li"><a href="../main/loginform.jsp" class="btn btn-primary btn-sm<%="login".equals(menu) ? "active" : "" %>">login</a></li>
                    <!-- 로그인이 안되어 있으면 활성화 시켜서 로그인 jsp로 이동하도록 입력한다. -->
                    <li class="nav-li"><a href="../main/registerform.jsp" class="btn btn-secondary btn-sm<%="register".equals(menu) ? "active" : "" %>">join</a></li>


                    <!-- 로그인이 안되어 있으면 활성화 시켜서 회원가입 jsp로 이동하도록 입력한다. -->
<%
	} else {
%>      

                 	<li class="nav-li"><a href="../user/detail.jsp"><img src="../navbar/resource/ico_headuser.png" alt="" class="userIcon <%="login".equals(menu) ? "active" : "" %>" id="icon-1" ></a></li>
                    <!-- 로그인이 되어있으면 활성화 시켜서 마이페이지 jsp로 이동하도록 입력한다. -->

                    <li class="nav-li"><a href="../user/mycslist.jsp"><img src="../navbar/resource/ico_headsearch.png" alt="" class="userIcon <%="login".equals(menu) ? "active" : "" %>"id="icon-2" ></a></li>
                    <!-- 로그인이 되어있으면 활성화 시켜서 cs게시판 jsp로 이동하도록 입력한다. -->

                    <li class="nav-li"><a href="http://localhost/semi-projects/noticeboard/notice.jsp"><img src="../navbar/resource/ico_headhm.png" alt="" class="userIcon <%="login".equals(menu) ? "active" : "" %>"id="icon-3" ></a></li>
                	<!-- 로그인이 되어있지 않으면 icon을 누르면 카테고리의 별 상품정보가 출력되도록 한다.  -->
					<li class="nav-li"><a href="http://localhost/semi-projects/main/logout.jsp" class="btn btn-primary btn-sm">out</a></li>

<%
	}
%>
                 </ul>
            </div>
        </div>
    </nav>
<body>
</body>
</html>
