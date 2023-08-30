<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자(회원정보)</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/admin.css" />
<style>
#birth-td {
	width: 500px;
}

#tel-td {
	width: 450px;
}

#gender-td {
	width: 200px;
}

li {
	list-style: none;
	float: left;
	padding: 6px;
}

.adminm-body{
	display:grid;
	place-content:center;
}

/* 검색 컨테이너에 대한 스타일 */
.adminm-Filter {
  display: flex;
  align-items: center;
  margin-bottom: 20px;
 float: center;
}

/* 검색 폼에 대한 스타일 */
.adminm-Filter form {
  display: flex;
  align-items: center;
}

/* 검색 입력란에 대한 스타일 */
.adminm-Filter input[type="text"],
.adminm-Filter select {
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
  margin-right: 10px;
  font-size: 20px;
}

/* 검색 버튼에 대한 스타일 */
.adminm-Filter input[type="submit"] {
  background-color: black;
  color: white;
  border: none;
  padding: 10px 20px;
  border-radius: 5px;
  cursor: pointer;
  font-size: 20px;
}

.pagination{
	font-size:40px;
}

  .pagination li a {
    text-decoration: none;
    color: gray;
}
  .pagination li.active a {
    color: black;
    font-weight: bold; 
  }
}
</style>


</head>
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/resources/img/favicon.ico">
<body class="adminm-body">


	<table class="adminm-table">
		<tr></tr>
		<tr>
			<td><h1 style="font-size: 50px;">회원명단</h1></td>
		</tr>
		<tr></tr>
		<tr class="mt-td">
			<td width="945" class="mt-td"></td>
			<td class="mt-td">
				<div class="adminm-Filter">
					<!-- 멤버검색 -->
					<form
						action="${pageContext.request.contextPath}/memberPageFilter.do"
						method="get">
						<select name="memberFilter">
							<option value="m_id">아이디</option>
							<option value="m_name">이름</option>
						</select> <input type="text" name="memberSearch" placeholder="검색어를 입력해주세요.">
						<input type="submit" value="검색">
					</form>
				</div>
			</td>
		</tr>
	</table>
	<!-- 명단 -->
	<table border="2" class="table-fill">
		<thead class="adminth">
			<tr>
				<th>CODE</th>
				<th>&nbsp;&nbsp; ID<c:set var="totalMembers"
                  value="${fn:length(getAllMember)}" /> <span id="memp">(${totalcount2}명)</span></th>
				<th>이름</th>
				<th id="tel-td">전화</th>
				<th>이메일</th>
				<th id="birth-td">&nbsp;생일<span id="m_age">&nbsp;(나이)&nbsp;</span></th>
				<th id="gender-td">성별</th>
			</tr>
		</thead>
		<tbody class="table-hover">

			<c:forEach var="mem" items="${getAllMember}" varStatus="loop">
				<tr class="admintr" >
				 
        <td align="center" class="admintd" style="cursor:pointer;" onClick="location.href='memberGet.do?m_id=${mem.m_id}'">${paging.startIndex + loop.index + 1}</td>

					<td class="admintd" style="cursor:pointer;" onClick="location.href='memberGet.do?m_id=${mem.m_id}'"><c:set var="naverid"
							value="${fn:split(mem.m_id, ',')}" /> <c:forEach var="str"
							items="${naverid}">
							<c:choose>
								<c:when test="${fn:contains(str, 'NAVER')}">
									<c:set var="id" value="${fn:substring(str, 0, 7)}" />
									<a href="memberGet.do?m_id=${str}"><c:out value="${id}" /></a>
								</c:when>
								<c:otherwise>
									<a href="memberGet.do?m_id=${str}"><c:out value="${str}" /></a>
								</c:otherwise>
							</c:choose>
							<br />
						</c:forEach></td>
					<td class="admintd" style="cursor:pointer;" onClick="location.href='memberGet.do?m_id=${mem.m_id}'">${mem.m_name}</td>
					<td class="admintd" style="cursor:pointer;" onClick="location.href='memberGet.do?m_id=${mem.m_id}'">${mem.m_tel}</td>
					<td class="admintd" style="cursor:pointer;" onClick="location.href='memberGet.do?m_id=${mem.m_id}'">${mem.m_email}</td>
					<td class="admintd" style="cursor:pointer;" onClick="location.href='memberGet.do?m_id=${mem.m_id}'">${mem.m_birth}
							&nbsp;<span id="memp">(${mem.m_age}살)</span> </td>
					<td class="admintd" style="cursor:pointer;" onClick="location.href='memberGet.do?m_id=${mem.m_id}'">${mem.m_gender}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<script type="text/javascript">
		function PageMove(page3) {
			const url = new URL(window.location.href);
			url.searchParams.set("page3", page3);
			window.location.href = url.toString();
		}
	</script>
	<table>
		<tr></tr>
		<tr>
			<td width=500></td>
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
	<div>
		<input type="button" value="뒤로가기" onclick="history.back()"
			class="adminmit" id="adbtn">

	</div>
</body>
</html>