<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header class="he2"><%@ include file="../header2.jsp" %></header>
<header><%@ include file="../header.jsp" %></header>
<section>
<table border=1 width="1100" align="center" >
<tr><td colspan="1">
   <img class="busAnnaeimg" src="${pageContext.request.contextPath }/resources/img/busAnnae.png">
<td align="center" width="500">
<span class="busA3">KG워터파크</span><br><br>
<span class="busA2">수도권 무료셔틀버스 운영 안내</span><br><br><br>
<span class="busA1">
23년 하계시즌부터 변경되는 셔틀버스 운영에 대하여<br>
아래와 같이 안내 드립니다.<br><br>

고객님의 안전과 이용 편의를 개선하고<br>
보다 향상된 서비스를 제공하기 위해<br>
셔틀버스를 무료로 운영합니다.<br>
노선은 셔틀버스 안내페이지를 통해 확인가능합니다.<br><br>

고객님의 안전을 최우선으로 하여<br>
편안하게 이용하실 수 있도록 최선을 다하는<br>
KG워터파크가 되겠습니다.<br>
감사합니다.<br>
</span>
<br>
<a class="alink1" href="stbusAnnae.do" onclick="window.open(this.href, '_blank', 'width=790, height=600'); return false;">셔틀버스 안내</a>
</td>
</tr>
 </table>      
</section>
<footer><%@ include file="../footer.jsp" %></footer>
  

</body>
</html>