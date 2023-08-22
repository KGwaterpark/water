<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<style>

.mymymy{
	font-size: 50px;
    	font-align: center;
    	align-content: center;
}
.myjungbo{
	font-size:35px;
	font-weight: bolder;
}
.myjungbo span{
	color:green;
}
#coloo{
	
}

</style>
<section>
<br>
<div class="mymymy">${sessionScope.loginsession.m_name}님의 개인정보는 소중합니다.</div><br><hr>

<c:set var="memberLogin" value="${loginsession}" />
<c:set var="m_id" value="${memberLogin.m_id}" />
<form action="deletemypageinfo.do" method=post>
<br>
<c:forEach var="mv" items="${mvlist}">
		<c:if test="${mv.m_id eq m_id}">
	<div class="myjungbo">
	<table>
	<tr><td id="coloo">name</td><td> : </td><td><span>${mv.m_name}</span></td></tr>
	<tr><td id="coloo">id</td><td> : </td><td><span>${mv.m_id}</span></td></tr>
	<tr><td id="coloo">phone</td><td> : </td><td><span>${mv.m_tel}</span></td></tr>
	<tr><td id="coloo">email</td><td> : </td><td><span>${mv.m_email}</span></td></tr>
	
	</table>
</div>
</c:if>
				
</c:forEach>

  	
  	<br>
  	 <input type="submit" value="회원탈퇴" class="next-btn" onclick="redirectToMain()">
  	
</form>
</section>
<script>
    function redirectToMain() {
       alert("회원탈퇴 되었습니다");
        window.top.location.href = "main.do"; 
    }
</script>



</body>
</html>