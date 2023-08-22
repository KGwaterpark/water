<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>   
     <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!DOCTYPE html>
<html>
<head>
<style>
.mainback1{
padding: 10px;
width: 140px;
height: 70px;
color: blue;
font-size: 100px;
} 


</style>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/header_style.css" />

</head>
<body>
	<form action="updateGongji.do?g_id=${gongjiVO.g_id}" method="POST">
	<table border="2" class="table-fill">
<thead class="adminth"><tr><th width=600>작성일자</th><th class="jm1" width=600>제목</th><th class="admintd11"  width=100><input type="button" value="뒤로가기" onclick="history.back()" class="mainback1" id="adbtn"></th></tr></thead>
<tbody>

	<tr class="admintr1" height="100">
		<td class="admintd1"width=500 >${gongjiVO.g_date }</td> 
	<td class="admintd1" colspan="2" width=500>${gongjiVO.g_title }</td>
		
	
	</tr>

			
	<thead class="adminth"><tr><th colspan="3">내용</th></tr></thead>
	<tr>
	<td colspan="3"><textarea name="g_content" id="gongarea"  rows="5" cols="70" readonly>${gongjiVO.g_content }</textarea></td>
		
	</tbody>
	</table>


<%-- 
<input type="hidden" name="g_date" value="${gongjiVO.g_date}">
<input type="hidden" name="g_content1" value="${gongjiVO.g_content}">
<input type="hidden" name="g_title1" value="${gongjiVO.g_title}"> --%>
	
	</form>

	
</body>
</html>