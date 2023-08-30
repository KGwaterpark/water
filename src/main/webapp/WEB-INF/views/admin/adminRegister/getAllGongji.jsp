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

.pagination {
	font-size: 40px;
}

.pagination li a {
	text-decoration: none;
	color: gray;
}

.pagination li.active a {
	color: black;
	font-weight: bold;
}
</style>
<body class="mgongji-body">

	<table class="g-table">
		<tr></tr>
		<tr>
			<td><h1>공지사항 리스트</h1></td>
		</tr>
		<tr></tr>
		<tr class="gt-td">
			<td width="945" class="gt-td"></td>
			<td class="gt-td">
				<div class="g-Filter">
					<!-- 공지검색 -->
					<form
						action="${pageContext.request.contextPath}/gongjiPageFilter2.do"
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

	<table class="table-fill">
		<thead class="adminth">
			<tr class="admintr">
				<th id="admidgong">번호</th>
				<th id="admidgong">날짜</th>
				<th id="admidgong2">제목</th>
				<th colspan="2">내용</th>
			</tr>
		</thead>
		<tbody class="table-hover">
			<c:forEach var="gongji" items="${getAllGongji2}">
				<tr class="admintr">
					<form action="deleteGongji.do?g_id=${gongji.g_id}" method="post">
						<td class="admintd"><a
							href="gongjiGet.do?g_id=${gongji.g_id}">${gongji.g_id}</a></td>
						<td class="admintd"><a
							href="gongjiGet.do?g_id=${gongji.g_id}">${gongji.g_date}</a></td>
						<td class="admintd"><a
							href="gongjiGet.do?g_id=${gongji.g_id}">${gongji.g_title}</a></td>
						<td class="admintd"><a
							href="gongjiGet.do?g_id=${gongji.g_id}">${gongji.g_content}</a></td>
						<td id="admidgong3"><input type="submit" value="삭제"
							id="adbtn" class="gongadbtn"></td>
						<input type="hidden" value="${gongji.g_id}" name="g_id">
					</form>
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
	<table>
		<tr></tr>
		<tr>
			<td width=400></td>
			<td style="font-size: 40px;">
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
		</tr>
	</table>

</body>
</html>