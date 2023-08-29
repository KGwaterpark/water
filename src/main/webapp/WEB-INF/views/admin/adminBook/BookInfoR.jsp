<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예매내역</title>
    <style type="text/css">
        .rev_book {
            font-size: 50px;
            text-align: center;
            align-content: center;
        }

        #sangsese {
            cursor: pointer;
        }

        .bababa {
            font-size: 30px;
            border: 5px solid transparent;
            border-image: url("${pageContext.request.contextPath }/resources/img/wavebox.png") round;
            border-image-slice: 30;
            overflow: hidden;
        }

        .bababa span {
            color: green;
            font-weight: bold;
        }

        .pagination {
            margin-top: 10px;
            text-align: center;
        }

        .pagination a,
        .pagination .current-page {
            display: inline-block;
            padding: 5px 10px;
            margin: 0 5px;
            background-color: #e0e0e0;
            border: 1px solid #ccc;
            text-decoration: none;
            color: #333;
        }

        .pagination .current-page {
            background-color: #333;
            color: #fff;
        }
         #Tbal{
	width:1200px;
	font-size: 30px;
	height:50px;
}
#Tbal th{
background: #91F8D0;
}
#Tbal tbody :hover{
background: #888;
}
    </style>
</head>
<body>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 필요한 라이브러리와 스타일시트를 추가 -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<%-- 한 페이지당 목록 아이템 수와 현재 페이지 번호 설정 --%>
<c:set var="itemsPerPage" value="5" />
<c:set var="currentPage" value="${not empty param.page ? param.page : 1}" />

<%-- 페이지 번호와 페이지 수 계산 --%>
<c:set var="totalItems" value="${oceanlist.size()}" />
<c:set var="totalPages" value="${(totalItems + itemsPerPage - 1) / itemsPerPage}" />

<%-- 페이징 목록 생성 --%>
<c:set var="startPage" value="1" />
<c:set var="endPage" value="100" />
<c:choose>
    <c:when test="${totalPages <= 100}">
        <%-- totalPages가 100 이하인 경우 --%>
        <c:set var="endPage" value="${totalPages}" />
    </c:when>
    <c:otherwise>
        <%-- totalPages가 10을 초과하는 경우 --%>
        <c:set var="startPage" value="${currentPage - 4}" />
        <c:set var="endPage" value="${currentPage + 5}" />
        <c:if test="${startPage < 1}">
            <c:set var="startPage" value="1" />
            <c:set var="endPage" value="10" />
        </c:if>
        <c:if test="${endPage > totalPages}">
            <c:set var="startPage" value="${totalPages - 9}" />
            <c:set var="endPage" value="${totalPages}" />
        </c:if>
    </c:otherwise>
</c:choose>

<div class="rev_book">
    <b class="cont-user-my">회원 전체 리조트 예약 내역</b>
</div>
<hr>

<select id="reservationStatus" name="search">
    <option value="all" ${selectedStatus == 'all' ? 'selected' : ''}>전체</option>
    <option value="reservation" ${selectedStatus == 'reservation' ? 'selected' : ''}>예약</option>
    <option value="cancellation" ${selectedStatus == 'cancellation' ? 'selected' : ''}>예약취소</option>
</select>

<input type="text" id="memberId" name="searchId" placeholder="아이디 검색">
<button type="button" id="searchIdButton">검색</button>

<table data-status="${resort.state}" data-number="${resort.rebook_id}" id="Tbal">
    <thead>
        <tr align="center">
            
            <th>예약상태</th>
			<th>예약번호</th>
			<th>예약타입</th>
			<th>체크인</th>
			<th>체크아웃</th>
			<th>가격</th>
			<th>아이디</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="resort" items="${resortlist}">
            <tr align="center">
                <td>${resort.state eq 'Y' ? '예약' : '예약취소'}</td>
				<td><a href="re_sangseA.do?rebook_id=${resort.rebook_id}">${resort.rebook_id}</a></td> 
				<td>${resort.re_type}</td>
				<td>${resort.check_in_date}</td>
				<td>${resort.check_out_date}</td>
				<td>${resort.price}</td>
				<td>${resort.m_id}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<!-- 예약 상태 선택에 따른 필터링 -->
<script type="text/javascript">
    var reservationStatusSelect = document.getElementById('reservationStatus');

    // 페이지 로드 시 예약 상태 필터 적용
    filterByStatus();

    // 예약 상태 변경 이벤트 처리
    reservationStatusSelect.addEventListener('change', filterByStatus);

    function filterByStatus() {
        var selectedStatus = reservationStatusSelect.value;
        var tableRows = document.querySelectorAll('table tbody tr');

        tableRows.forEach(function (row) {
            var statusCell = row.querySelector('td:first-child');
            var status = statusCell.textContent.trim();

            if (selectedStatus === 'all' || (selectedStatus === 'reservation' && status === '예약') || (selectedStatus === 'cancellation' && status === '예약취소')) {
                row.style.display = 'table-row';
            } else {
                row.style.display = 'none';
            }
        });
    }
</script>

<!-- 검색 기능 -->
<script type="text/javascript">
    // 아이디 검색 버튼 클릭 시 검색 결과 표시
    var searchIdButton = document.getElementById('searchIdButton');
    searchIdButton.addEventListener('click', searchById);

    function searchById() {
        var memberId = document.getElementById('memberId').value.toLowerCase(); // 입력된 아이디를 소문자로 변환

        var tableRows = document.querySelectorAll('table tbody tr'); // 테이블의 모든 행을 선택

        tableRows.forEach(function (row) {
            var memberIdCell = row.querySelector('td:last-child'); // 아이디가 있는 열 선택 (마지막 열)
            var memberIdText = memberIdCell.textContent.toLowerCase(); // 열 내용을 소문자로 변환

            if (memberIdText.includes(memberId)) {
                row.style.display = 'table-row'; // 일치하는 아이디를 포함한 행 표시
            } else {
                row.style.display = 'none'; // 일치하지 않는 아이디를 포함한 행 숨김
            }
        });
    }
</script>

<!-- 예약 상태 선택에 따른 필터링 -->
<script type="text/javascript">
    var reservationStatusSelect = document.getElementById('reservationStatus');
    var memberIdInput = document.getElementById('memberId');

    // 페이지 로드 시 예약 상태 필터 적용
    filterByStatusAndId();

    // 예약 상태 변경 이벤트 처리
    reservationStatusSelect.addEventListener('change', filterByStatusAndId);

    // 검색 버튼 클릭 이벤트 처리
    var searchIdButton = document.getElementById('searchIdButton');
    searchIdButton.addEventListener('click', filterByStatusAndId);

    function filterByStatusAndId() {
        var selectedStatus = reservationStatusSelect.value.toLowerCase();
        var memberId = memberIdInput.value.toLowerCase();

        var tableRows = document.querySelectorAll('table tbody tr');

        tableRows.forEach(function (row) {
            var statusCell = row.querySelector('td:first-child');
            var status = statusCell.textContent.trim().toLowerCase();
            var memberIdCell = row.querySelector('td:last-child');
            var memberIdText = memberIdCell.textContent.trim().toLowerCase();

            if ((selectedStatus === 'all' || (selectedStatus === 'reservation' && status === '예약') || (selectedStatus === 'cancellation' && status === '예약취소')) &&
                (memberId === '' || memberIdText.includes(memberId))) {
                row.style.display = 'table-row';
            } else {
                row.style.display = 'none';
            }
        });
    }
</script>


</body>
</html>