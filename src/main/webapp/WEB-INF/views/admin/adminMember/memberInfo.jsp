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
<body>

	<form action="updateMember.do?m_id=${memberVO.m_id }" method="post">
	<table border="2" class="table-fill">
<thead class="adminth"><tr><th>ID</th><th>이름</th><th>전화</th><th>이메일</th></tr></thead>
<tbody>
	<tr class="admintr1" height="100">
	<td class="admintd1">
	         <c:choose>
            <c:when test="${fn:contains(memberVO.m_id, 'NAVER')}">
              <c:out value="${fn:substring(memberVO.m_id, 0, 7)}" />
            </c:when>
            <c:otherwise>
              <c:out value="${memberVO.m_id}" />
            </c:otherwise>
          </c:choose>
	
	</td> <!-- 출력만 -->
	

	<td class="admintd1"><input type="text" name="m_name" value="${memberVO.m_name }" id="admintext"></td>
	
	<td class="admintd1"><input type="text" name="m_tel" value="${memberVO.m_tel }" id="admintext"></td>

	<td class="admintd1">${memberVO.m_email }</td></tr>	<!-- 출력만 --> 
<!-- 			
	 <tr><td><input type="hidden" value="#" name="#"></td></tr> -->

	</tbody>
	</table>
<input type="submit" value="수정" class="adminmit" id="adbtn">
<input type="button" value="뒤로가기" onclick="history.back()" class="adminmit" id="adbtn">
	
	
	</form>
</body>
</html>