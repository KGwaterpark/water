<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러페이지</title>



</head>

<table border="2">
<tr><td>이름</td><td>전화번호</td></tr>
<c:forEach var="imsi" items="${getallinfo}">
<tr>
	<td><a href="getinfo?name=${imsi.name}">${imsi.name}</a></td>
	<td>${imsi.tel}</td>
</c:forEach>
</table>
<br>
<a href="insertForm">[사원입력]</a>

</body>
</html>