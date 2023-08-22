<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나는 헤더</title>
<%-- <script src="${pageContext.request.contextPath }/resources/js/aa.js"></script> --%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/header_style2.css" />
</head>
<body>
<header class="he2">
<a href="main.do" ><span class="he1"><span class="he3">KG</span>&nbsp;HOME</span></a>


    <nav class="headnav2">
        <ul> <!-- 자기 포트번호 쓰면 됨. -->
        	<li><a href="http://localhost:8081/Mopt/index.jsp">KG시네마</a>
    		<li><a href="main.do">KG워터파크</a>
    		<li><a href="#">KG리조트</a>
    		<li><a href="wedding.do">KG컨벤션</a>
    		<li><a href="#" onclick="alert('홈페이지 리뉴얼 중입니다.')">KG레저&스포츠</a>
        </ul>
        
        <ul class="headul2">
        	
    		<li><a href="#" onclick="alert('회원권 준비 중입니다.')" >회원권</a>
   
        </ul>
    </nav>7


</header>

</body>
</html>