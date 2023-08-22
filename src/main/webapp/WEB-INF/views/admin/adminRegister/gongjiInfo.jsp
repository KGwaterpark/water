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
	<form action="updateGongji.do?g_id=${gongjiVO.g_id}" method="POST">
	<table border="2" class="table-fill">
<thead class="adminth"><tr><th>공지번호</th><th>제목</th><th>작성일자</th></tr></thead>
<tbody>

	<tr class="admintr1" height="100">
	<td class="admintd1">${gongjiVO.g_id }</td>
	<td class="admintd1"><input type="text" name="g_title" value="${gongjiVO.g_title }" id="admintext2"></td>
	<td class="admintd1">${gongjiVO.g_date }</td> 
	</tr>

			
	<thead class="adminth"><tr><th colspan="3">내용</th></tr></thead>
	<tr>
	<td colspan="3"><textarea name="g_content" id="gongarea"  rows="5" cols="70">${gongjiVO.g_content }</textarea></td>
	</tbody>
	</table>
<input type="submit" value="수정" class="adminmit" id="adbtn">
<input type="button" value="뒤로가기" onclick="history.back()" class="adminmit" id="adbtn">

<%-- 
<input type="hidden" name="g_date" value="${gongjiVO.g_date}">
<input type="hidden" name="g_content1" value="${gongjiVO.g_content}">
<input type="hidden" name="g_title1" value="${gongjiVO.g_title}"> --%>
	
	</form>

	
</body>
</html>