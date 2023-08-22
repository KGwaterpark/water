<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러페이지</title>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/error.css" />

<script>

setTimeout('gotoPage()', 6000); // 6초 후 실행



function gotoPage(){

    location.href="http://localhost:8080/park/main.do";  // 이동주소

}

</script>


</head>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/img/favicon.ico">
<body>  


   <div class="box1">
      <div class="clock"></div>

    </div>  
<div class="box">
      <div class="loader4"></div>
 
    </div>


</body>
</html>