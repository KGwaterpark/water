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
	 border: 5px solid transparent; 
  border-image: url("${pageContext.request.contextPath }/resources/img/wavebox.png")round;
  border-image-slice: 30;
  overflow: hidden;
  background:#B0F7FF;

}

	.bababa span{
	color:#323C73;
	font-weight: bold;}
</style>
</head>
<body>
<%-- <header class="he2"><%@ include file="../header2.jsp" %></header>
<header><%@ include file="../header.jsp" %></header> --%>
<section>
<div class="rev_book"> 
			<b class="cont-user-my">${sessionScope.loginsession.m_name}님 예약 내역</b>
	</div>
	<hr>
	<h3>워터파크 예약 내역</h3>
 <%-- loginsession에서 MemberLogin 객체를 가져옴 --%>
<c:set var="memberLogin" value="${loginsession}" />

<%-- m_id 값만 가져와서 변수에 저장 --%>

<c:set var="m_id" value="${memberLogin.m_id}" />


	<c:forEach var="ocean" items="${oceanlist}">

	<c:if test="${ocean.m_id eq m_id && ocean.state eq 'Y'}">
		<button class="bababa" id = "sangsese" onclick="location.href='oc_sangse.do?ocbook_id= ${ocean.ocbook_id}'">
     <table>
	<tr>
		<td >예약상태</td><td> : </td><td><span> ${ocean.state eq 'Y' ? '예약' : '예약취소'} </span></td>
		<td >예약번호</td><td> : </td><td><span> ${ocean.ocbook_id} </span></td>
		<td >예약일</td><td> : </td><td><span> ${ocean.oc_date }</span></td>
		<td >인원수</td><td> : </td><td><span> ${ocean.adult_cnt+ocean.child_cnt}명</span></td>
	</tr>
	<tr align ="center"><td colspan = "9">상세정보를 보려면 클릭 하세요</td></tr>
	</table>
       
     </button>
   <br><br>
		</c:if>
	</c:forEach>


	 <hr><br>
	<h3>리조트예약 내역</h3>
	<c:forEach var="resort" items="${resortlist}">

		<c:if test="${resort.m_id eq m_id && resort.state eq 'Y'}">
		<button class="bababa" id = "sangsese"onclick="location.href='re_sangse.do?rebook_id=${resort.rebook_id}'">
		<table>
			<tr>
				<td >예약</td><td> : </td><td><span> ${resort.state eq 'Y' ? '예약' : '예약취소'} </span></td>
				<td >예약번호</td><td> : </td><td><span> ${resort.rebook_id} </span></td>
				<td >예약일</td><td> : </td><td><span> ${resort.check_in_date.substring(0, 10)} ~ ${resort.check_out_date.substring(0, 10)}</span></td>
			</tr>
			<tr align ="center"><td colspan = "6">상세정보를 보려면 클릭 하세요</td></tr>
		</table>	 
		</button> 
		<br><br>
	</c:if>
	</c:forEach>
	
	<hr><br>
	<h3>패키지예약 내역</h3>
	<c:forEach var="mypackage" items="${packagelist}">

		<c:if test="${mypackage.m_id eq m_id && mypackage.state eq 'Y'}">
		<button class="bababa" id = "sangsese"onclick="location.href='pa_sangse.do?pabook_id=${mypackage.pabook_id}'">
		<table>
			<tr>
				<td >예약</td><td> : </td><td><span> ${mypackage.state eq 'Y' ? '예약' : '예약취소'} </span></td>
				<td >예약번호</td><td> : </td><td><span> ${mypackage.pabook_id} </span></td>
				<td >예약일</td><td> : </td><td><span> ${mypackage.use_date }</span></td>
			</tr>
			<tr align ="center"><td colspan = "6">상세정보를 보려면 클릭 하세요</td></tr>
		</table>	 
		</button> 
		<br><br>
	</c:if>
	</c:forEach>
	

	</section>
</body>
</html>