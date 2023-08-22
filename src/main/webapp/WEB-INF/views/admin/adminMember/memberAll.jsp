<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>   
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin.css" />

</head>
<style>
#memp{
color:blue;

}
</style>
<body>



<h1>회원명단(수정)</h1>
<table border="2" class="table-fill">
<thead class="adminth"><tr><th>회원번호 </th><th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:set var="totalMembers" value="${fn:length(alist)}" />
	<span id="memp">회원수: ${totalMembers} 명</span></th><th>이름</th><th>전화</th><th>이메일</th></tr></thead>
<tbody class="table-hover">

	<c:forEach var="mem" items="${alist}" varStatus="loop">
	<tr class="admintr">
		<td align="center" class="admintd">${loop.index + 1}</td>
		
		
		<td class="admintd"> 
	   <c:set var="naverid" value="${fn:split(mem.m_id, ',')}" />
            <c:forEach var="str" items="${naverid}">
              <c:choose>
                <c:when test="${fn:contains(str, 'NAVER')}">
                  <c:set var="id" value="${fn:substring(str, 0, 7)}" />
                  <a href="memberGet.do?m_id=${str}"><c:out value="${id}" /></a>
                </c:when>
                <c:otherwise>
                  <a href="memberGet.do?m_id=${str}"><c:out value="${str}" /></a>
                </c:otherwise>
              </c:choose>
              <br/>
            </c:forEach>
            
            </td>
		<td class="admintd"> <a href="memberGet.do?m_id=${mem.m_id}">${mem.m_name}</a></td>
		<td class="admintd"> <a href="memberGet.do?m_id=${mem.m_id}">${mem.m_tel}</a></td>
		<td class="admintd"> <a href="memberGet.do?m_id=${mem.m_id}">${mem.m_email}</a></td>
	</tr>
	</c:forEach>
</tbody>
</table>
<div>
<input type="button" value="뒤로가기" onclick="history.back()" class="adminmit" id="adbtn">
	
</div>
</body>
</html>