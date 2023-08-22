<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 리스트</title>
      <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin.css" />
    
</head>
<body>
    <h1>공지사항 리스트</h1>

    <table class="table-fill">
        <thead class="adminth">
            <tr class="admintr">
                <th id="admidgong">ID</th>
                <th id="admidgong">Date</th>
                <th id="admidgong2">Title</th>
                <th colspan="2">Content</th>
            </tr>
        </thead>
        <tbody class="table-hover">
            <c:forEach var="gongji" items="${getAllGongji}">
            
                <tr class="admintr">
           <form action="deleteGongji.do?g_id=${gongji.g_id}" method="post">
                    <td class="admintd"><a href="gongjiGet.do?g_title=${gongji.g_title}">${gongji.g_id}</a></td>
                    <td class="admintd"><a href="gongjiGet.do?g_title=${gongji.g_title}">${gongji.g_date}</a></td>
                    <td class="admintd"><a href="gongjiGet.do?g_title=${gongji.g_title}">${gongji.g_title}</a></td>
                    <td class="admintd"><a href="gongjiGet.do?g_title=${gongji.g_title}">${gongji.g_content}</a></td>
                	<td id="admidgong3"><input type="submit" value="삭제"  id="adbtn" class="gongadbtn"></td>
                </tr>
                <input type="hidden" value="${gongji.g_id}" name="g_id">
            </c:forEach>
            </form>
        </tbody>
        
      
    </table>
    
      <input type="button" value="뒤로가기" onclick="history.back()" class="adminmit" id="adbtn">

</body>
</html>
