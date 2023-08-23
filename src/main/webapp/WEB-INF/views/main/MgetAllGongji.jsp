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
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">

	 	<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
		</style>
<body>
    <h1>공지사항 리스트</h1>


<!-- <div class="g-Filter">
<form>
  <select name="language" >
    <option value="none">=== 선택 ===</option>
    <option value="korean">한국어</option>
    <option value="english">영어</option>
    <option value="chinese">중국어</option>
    <option value="spanish">스페인어</option>
  </select>
</form>
</div>

 -->

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
                    <td class="admintd"><a href="MgongjiGet.do?g_title=${gongji.g_title}">${gongji.g_date}</a></td>
                    <td class="admintd"><a href="MgongjiGet.do?g_title=${gongji.g_title}">${gongji.g_title}</a></td>
                    <td class="admintd"><a href="MgongjiGet.do?g_title=${gongji.g_title}">
                        ${fn:substring(gongji.g_content, 0, 20)}${fn:length(gongji.g_content) > 20 ? '...' : ''}
                    </a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
  <script type="text/javascript">
          function PageMove(page) {
              const url = new URL(window.location.href);
              url.searchParams.set("page", page);
              window.location.href = url.toString();
          }
   </script>
    <ul class="pagination">
        <li><a href="javascript:PageMove(${paging.firstPageNo})">맨 앞으로</a></li>
        <li><a href="javascript:PageMove(${paging.prevPageNo})">앞으로</a></li>
        <c:forEach var="i" begin="${paging.startPageNo}" end="${paging.endPageNo}" step="1">
            <c:choose>
                <c:when test="${i eq paging.pageNo}">
                    <li class="active"><a href="javascript:PageMove(${i})">${i}</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="javascript:PageMove(${i})">${i}</a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <li><a href="javascript:PageMove(${paging.nextPageNo})">뒤로</a></li>
        <li><a href="javascript:PageMove(${paging.finalPageNo})">맨 뒤로</a></li>
    </ul>
</body>
</html>
