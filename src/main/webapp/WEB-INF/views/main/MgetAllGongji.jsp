<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
                <th id="admidgong">날짜</th>
                <th id="admidgong2">제목</th>
                <th>내용</th>
            </tr>
        </thead>
        <tbody class="table-hover">
            <c:forEach var="gongji" items="${getAllGongji}">
                <tr class="admintr">
                    <form method="post">
                        <td class="admintd"><a href="MgongjiGet.do?g_title=${gongji.g_title}">${gongji.g_date}</a></td>
                        <td class="admintd"><a href="MgongjiGet.do?g_title=${gongji.g_title}">${gongji.g_title}</a></td>
                        <td class="admintd"><a href="MgongjiGet.do?g_title=${gongji.g_title}">
                            ${fn:substring(gongji.g_content, 0, 20)}${fn:length(gongji.g_content) > 20 ? '.......' : ''}
                        </a></td>
                    </form>
                </tr>
                <input type="hidden" value="${gongji.g_id}" name="g_id">
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
