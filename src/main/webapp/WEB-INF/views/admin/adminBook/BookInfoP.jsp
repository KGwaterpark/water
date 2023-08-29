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
    </style>
</head>
<body>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 필요한 라이브러리와 스타일시트를 추가 -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<div class="rev_book">
    <b class="cont-user-my">회원 전체 패키지 예약 내역</b>
</div>
<hr>

<select id="reservationStatus" name="search">
    <option value="all" ${selectedStatus == 'all' ? 'selected' : ''}>전체</option>
    <option value="reservation" ${selectedStatus == 'reservation' ? 'selected' : ''}>예약</option>
    <option value="cancellation" ${selectedStatus == 'cancellation' ? 'selected' : ''}>예약취소</option>
</select>

<input type="text" id="memberId" name="searchId" placeholder="아이디 검색">
<button type="button" id="searchIdButton">검색</button>

<table data-status="${mypackage.state}" data-number="${mypackage.pabook_id}" border="1" width="100%" height="100%" cellspacing="5">
    <thead>
        <tr align="center">
            <th>예약상태</th>
			<th>예약번호</th>
			<th>예약타입</th>
			<th>예약일</th>
			<th>인원수</th>
			<th>가격</th>
            <th>아이디</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="mypackage" items="${packagelist}">
            <tr align="center">
                <td>${mypackage.state eq 'Y' ? '예약' : '예약취소'}</td>
				<td><a href="pa_sangseA.do?pabook_id=${mypackage.pabook_id}">${mypackage.pabook_id}</a></td> 
				<td>${mypackage.p_type}</td>
				<td>${mypackage.use_date }</td>
				<td>${mypackage.book_cnt}</td>
				<td>${mypackage.price}</td>
				<td>${mypackage.m_id}</td>
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


</div>
</body>
</html>