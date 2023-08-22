<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footer_style.css" />
</head>
<%
String contextPath11 = request.getContextPath();
String redirectUrl22 = "http://localhost:8080" + contextPath11 ;


String redirectUrl33 = "http://localhost:8080" + contextPath11 + "/FootService/" ;

%>  
<body>

<footer>

<a href="main.do" ><span class="ft1">KG</span> &nbsp;<span class="ft2">HOLDINGS</span></a>

<div class= nav>

	<ul > 
		<li><a href="#">회사소개</a></li><li>|</li>
		<li><a href="#">이용약관</a>	</li><li>|</li>
		<li><a href="#">뉴스룸</a></li><li>|</li>
		<li><a href="#">인재채용</a></li><li>|</li>
		<li><a href="#">제휴문의</a></li><li>|</li>
		<li><a href="#">원격지원</a></li><li>|</li>
		<li><a href="#">개인정보처리방침</a></li>
		
	</ul>
</div>
<div class="ft3">
(주)KG홀딩스   강원 홍천군 서면 한치골길  대표이사 : 김수지, 김호진   개인정보 보호책임자 : James Lee<br>
사업자등록번호 : 123-45-67890    통신판매업신고 : 2023-경기포천-00008    통신판매사업자 정보<br>
<b>KG예약센터 1588-8888</b>  운영시간 09:00 ~ 18:00(연중무휴)    이메일 KGocean@waterpark.com <br>
COPYRIGHT© KG HOLDINGS ALL RIGHT RESERVED.<br>
</div>
</footer>

</body>
</html>