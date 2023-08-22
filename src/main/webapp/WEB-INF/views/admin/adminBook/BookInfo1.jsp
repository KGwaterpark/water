<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매내역</title>
<style type="text/css">
    
    .rev_book{
    	font-size: 50px;
    	font-align: center;
    	align-content: center;
    }
    
    #sangsese{
    cursor: pointer;
    }
    
    
    .bababa{
    font-size:30px;
	 border: 5px solid transparent; /* 선의 두께를 5px로 설정 */
  border-image: url("${pageContext.request.contextPath }/resources/img/wavebox.png")round;
  border-image-slice: 30;
  overflow: hidden;

}

	.bababa span{
	color:green;
	font-weight: bold;}
</style>
</head>
<body>
<%-- <header class="he2"><%@ include file="../header2.jsp" %></header>
<header><%@ include file="../header.jsp" %></header> --%>
<section>
<div class="rev_book"> 
			<b class="cont-user-my">회원 전체 리조트 예약 내역</b>
	</div>
 <%-- loginsession에서 MemberLogin 객체를 가져옴 --%>
<c:set var="memberLogin" value="${loginsession}" />




<hr>
	<h3>리조트예약 내역</h3>
	<c:forEach var="resort" items="${resortlist}">

		
		<button class="bababa" id = "sangsese"onclick="location.href='re_sangse.do?rebook_id=${resort.rebook_id}'">
		<table>
			<tr>
				<td >예약번호</td><td> : </td><td><span> ${resort.rebook_id} </span></td>
				<td >예약일</td><td> : </td><td><span> ${resort.check_in_date.substring(0, 10)} ~ ${resort.check_out_date.substring(0, 10)}</span></td>
			</tr>
			<tr align ="center"><td colspan = "6">상세정보를 보려면 클릭 하세요</td></tr>
		</table>	 
		</button> 
	<br><br><br>
	</c:forEach>
	<hr>

	</section>
</body>
</html>