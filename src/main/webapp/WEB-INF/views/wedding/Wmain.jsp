<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <script src="${pageContext.request.contextPath }/resources/js/slide.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/slide.css" />

<style>


</style>
</head>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/img/favicon.ico">
<body>
<header class="he2"><%@ include file="Wheader2.jsp" %></header>
<header><%@ include file="Wheader.jsp" %></header>

    <main>
     
        <section>
         
      
        
          <img class="mainpark" src="${pageContext.request.contextPath }/resources/img/wedding.jpg">
          

        </section>
  <div class="slide slide_wrap">
<div class="slide_item item1">
	    <table border=0 align="center" width=90% height=80% >
	    <tr>
	    <td><a href="#"><img class="mainimg1" src="${pageContext.request.contextPath }/resources/img/waterpark22.jpg"></a></td>
	    <td><a href="#"><img class="mainimg1" src="${pageContext.request.contextPath }/resources/img/resort22.jpg"></a></td>
	    <td><a href="#"><img class="mainimg1" src="${pageContext.request.contextPath }/resources/img/kabana22.jpg"></a></td>
	    </tr></table></div>
	<div class="slide_item item2">
		<table border=0 align="center" width=90% height=80% >
	    <tr>
	    <td><a href="busAnnae.do"><img class="mainimg1" src="${pageContext.request.contextPath }/resources/img/bus22.jpg"></a></td>
	    <td><img class="mainimg1" src="${pageContext.request.contextPath }/resources/img/discount22.jpg"></td>
	    <td><img class="mainimg1" src="${pageContext.request.contextPath }/resources/img/card22.jpg"></td>
	    </tr></table></div>
<!--     <div class="slide_item item3">
    	<table border=0 align="center" width=90% height=80% >
	    <tr>
	    <td>이벤트</td>
	    <td>현장할인</td>
	    <td>결제방식안내</td>
	    </tr></table></div>
 -->
    <div class="slide_prev_button slide_button">◀</div>
    <div class="slide_next_button slide_button">▶</div>
    <ul class="slide_pagination"></ul>
  </div>
 
    </main>
    
         <footer><%@ include file="Wfooter.jsp" %></footer>
  

</body>
</html>