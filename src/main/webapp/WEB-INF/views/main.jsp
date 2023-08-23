<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KG WATER PARK</title>
<%String msg = (String)request.getAttribute("msg"); %>

 <script src="${pageContext.request.contextPath }/resources/js/slide.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/slide.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main.css" />
</head>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/img/favicon.ico">
<body onload="loadPage('MgonggiS.do')">
<script>
function loadPage(url) {
    document.getElementById("pageFrameM").src = url;
  }
</script>
<script>
let msg='<%=msg%>';
   if(msg!='null'){
      alert(msg);
   }
</script>

<header class="he2"><%@ include file="header2.jsp" %></header>
<header><%@ include file="header.jsp" %></header>

    <main>
        <section>
          <img class="mainpark" src="${pageContext.request.contextPath }/resources/img/park.jpg">
        </section>
  <div class="slide slide_wrap">
<div class="slide_item item1">
	    <table border=0 align="center" width=90% height=80% >
	    <tr>
	    <td><a href="book.do?menu=waterpark"><img class="mainimg1" src="${pageContext.request.contextPath }/resources/img/waterpark22.jpg"></a></td>
	    <td><a href="book.do"><img class="mainimg1" src="${pageContext.request.contextPath }/resources/img/resort22.jpg"></a></td>
	    <td><a href="#"><img class="mainimg1" src="${pageContext.request.contextPath }/resources/img/kabana22.jpg" onclick="alert('정비 중입니다.')"></a></td>
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
  
   <div id="contentM">
      <iframe id="pageFrameM" src=""></iframe>
    </div>
    </main>
         <footer><%@ include file="footer.jsp" %></footer>
</body>
</html>