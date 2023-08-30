<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 리스트</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/admin.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/gongji.css" />

</head>
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/img/favicon.ico">

<style type="text/css">
li {
	list-style: none;
	float: left;
	padding: 6px;
}
</style>
<body class="mgongji-body">

	<header class="he2"><%@ include file="../header2.jsp"%></header>
	<header><%@ include file="../header.jsp"%></header>
	<br>
	<br>
	<br>
	<br>
	<br>

	<table class="g-table">
		<tr></tr>
		<tr>
			<td><h1 style="font-size: 50px;">공지사항</h1></td>
		</tr>
		<tr></tr>
		<tr class="gt-td">
			<td width="945" class="gt-td"></td>
			<td class="gt-td">
				<div class="g-Filter">
					<!-- 공지검색 -->
					<form
						action="${pageContext.request.contextPath}/gongjiPageFilter.do"
						method="get">
						<select name="gongjiFilter">
							<option value="g_title">제목</option>
							<option value="g_content">내용</option>
						</select> <input type="text" name="gongjiSearch" placeholder="검색어를 입력해주세요.">
						<input type="submit" value="검색">
					</form>
				</div>
			</td>
		</tr>
	</table>
	</div>



	<table class="table-fill">
		<thead class="adminth">
			<tr class="admintr">
				<th id="admidgong">날짜</th>
				<th id="admidgong2">제목</th>
				<th>내용</th>
			</tr>
		</thead>
		<tbody class="table-hover">
			<c:forEach var="gongji" items="${getAllGongji2}">
				<tr class="admintr">
					<td class="admintd"><a
						href="MgongjiGet.do?g_id=${gongji.g_id}">${gongji.g_date}</a></td>
					<td class="admintd"><a
						href="MgongjiGet.do?g_id=${gongji.g_id}">${gongji.g_title}</a></td>
					<td class="admintd"><a
						href="MgongjiGet.do?g_id=${gongji.g_id}">
							${fn:substring(gongji.g_content, 0, 20)}${fn:length(gongji.g_content) > 20 ? '...' : ''}
					</a></td>
					<input type="hidden" value="${gongji.g_id}" name="g_id">
					
				</tr>
				<input type="hidden" value="${gongji.g_id}" name="g_id">

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
	<table>
		<tr></tr>
		<td width=500></td>
		<td>
			<ul class="pagination">
				<li><a href="javascript:PageMove(${paging.firstPageNo})">≪</a></li>
				<li><a href="javascript:PageMove(${paging.prevPageNo})">＜</a></li>
				<c:forEach var="i" begin="${paging.startPageNo}"
					end="${paging.endPageNo}" step="1">
					<c:choose>
						<c:when test="${i eq paging.pageNo}">
							<li class="active"><a href="javascript:PageMove(${i})">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="javascript:PageMove(${i})">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<li><a href="javascript:PageMove(${paging.nextPageNo})">＞</a></li>
				<li><a href="javascript:PageMove(${paging.finalPageNo})">≫</a></li>
			</ul>
		</td>
	</table>
</body>
</html>