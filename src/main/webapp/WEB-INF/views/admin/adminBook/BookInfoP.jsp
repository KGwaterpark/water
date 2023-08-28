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
    <b class="cont-user-my">회원 전체 워터파크 예약 내역</b>
</div>
<hr>

<!-- 예약 상태 선택 드롭다운 목록 -->
<select id="reservationStatus" name="search">
    <option value="all" ${selectedStatus == 'all' ? 'selected' : ''}>전체</option>
    <option value="reservation" ${selectedStatus == 'reservation' ? 'selected' : ''}>예약</option>
    <option value="cancellation" ${selectedStatus == 'cancellation' ? 'selected' : ''}>예약취소</option>
</select>
<script type="text/javascript">
    // 예약 상태 선택 드롭다운 엘리먼트 가져오기
    var reservationStatusSelect = document.getElementById('reservationStatus');
    var currentPageInput = document.getElementById('currentPage');

    // 페이지 로드 시 URL에서 예약 상태 읽어와 설정
    var currentURL = new URL(window.location.href);
    var selectedStatus = currentURL.searchParams.get("search");
    if (selectedStatus !== null) {
        reservationStatusSelect.value = selectedStatus;
    }

    // 예약 상태 변경 이벤트 처리
    reservationStatusSelect.addEventListener('change', function () {
        // 선택한 예약 상태 가져오기
        var selectedStatus = reservationStatusSelect.value;

        // 모든 예약 항목을 가져오기
        var reservationItems = document.querySelectorAll('.reservation-item');

        // 각 예약 항목에 대해 필터링 수행
        reservationItems.forEach(function (item) {
            var status = item.getAttribute('data-status');

            // 선택한 예약 상태에 따라 필터링
            if ((selectedStatus === 'all') || (selectedStatus === 'reservation' && status === 'Y') || (selectedStatus === 'cancellation' && status === 'N')) {
                item.style.display = 'table'; // 테이블 로우를 표시합니다.
            } else {
                item.style.display = 'none'; // 테이블 로우를 숨깁니다.
            }
        });

        // 현재 페이지 값 설정
        var currentPage = currentPageInput.value;

        // 페이지 URL 업데이트
        var newURL = currentURL.href.split('?')[0] + '?page=' + currentPage + '&search=' + selectedStatus;
        window.history.replaceState(null, null, newURL);
    });

    // 페이지 로드 시 예약 상태 필터 적용
    window.addEventListener('load', function () {
        // 선택한 예약 상태 가져오기
        var selectedStatus = reservationStatusSelect.value;
        var currentPage = currentPageInput.value;

        var reservationItems = document.querySelectorAll('.reservation-item');
        reservationItems.forEach(function (item) {
            var status = item.getAttribute('data-status');

            if ((selectedStatus === 'all') || (selectedStatus === 'reservation' && status === 'Y') || (selectedStatus === 'cancellation' && status === 'N')) {
                item.style.display = 'table'; // 테이블 로우를 표시합니다.
            } else {
                item.style.display = 'none'; // 테이블 로우를 숨깁니다.
            }
        });
    });
</script>


<c:forEach var="mypackage" begin="${(currentPage - 1) * itemsPerPage}" end="${currentPage * itemsPerPage - 1}" items="${packagelist}">
<table class="reservation-item" data-status="${mypackage.state}" border="1" width="50%" height="200" cellspacing="5" style="display: table;">
				<thead>
					<tr align="center">
						<th>예약상태</th>
						<th>예약번호</th>
						<th>예약타입</th>
						<th>예약일</th>
						<th>인원수</th>
						<th>가격</th>
						
				</thead>
				
				<tbody>
					<tr align="center">
						<td>${mypackage.state eq 'Y' ? '예약' : '예약취소'}</td>
						<td><a href="pa_sangseA.do?pabook_id=${mypackage.pabook_id}">${mypackage.pabook_id}</a></td> 
						<td>${mypackage.p_type}</td>
						<td>${mypackage.use_date }</td>
						<td>${mypackage.book_cnt}</td>
						<td>${mypackage.price}</td>
				</tbody>
			</table>
	
	</c:forEach>

<%-- 페이지 목록 출력 --%>
<div class="pagination">
    <c:forEach var="page" begin="${startPage}" end="${endPage}">
        <c:url value="" var="pageURL">
            <c:param name="page" value="${page}" />
        </c:url>
        <c:choose>
            <c:when test="${page == currentPage}">
                <span class="current-page">${page}</span>
            </c:when>
            <c:otherwise>
                <a href="${pageURL}">${page}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
</div>
</body>
</html>