
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

    
    <nav>
        <div class=" container m-2">
            <a href="index.jsp">

            </a>
                <span class=""></span>
            <div>
                <ul class="nav-font">
                    <li><a href="">best</a></li>

                    <!-- 로그인이 안되어 있으면 활성화 시켜서 회원가입 jsp로 이동하도록 입력한다. -->
<%
	} else {
%>      
                 	<li><a href=""><img src="../navbar/resource/ico_headuser.png" alt="" class="userIcon <%="login".equals(menu) ? "active" : "" %>"></a></li>
                    <!-- 로그인이 되어있으면 활성화 시켜서 마이페이지 jsp로 이동하도록 입력한다. -->

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