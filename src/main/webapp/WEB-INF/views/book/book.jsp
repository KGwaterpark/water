<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약</title>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/book.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/book.css" />
<% if(session.getAttribute("loginsession")==null){%>
<script>		
	alert("로그인이 필요한 서비스 입니다.");
	location.href="login.do";
	 // URL 매개변수를 확인하고 해당 버튼을 클릭하는 함수
	  f
</script>
<%}
if (session.getAttribute("ocean_vo") != null) {
    session.removeAttribute("ocean_vo");
}else if(session.getAttribute("book_vo")!=null){
    session.removeAttribute("book_vo");
}else if(session.getAttribute("패키지")!=null){
    session.removeAttribute("패키지");
}
%>

	

<script>
   function allpack() {
      window.open('pop_allpack.do', "", 'width=630, height=520');
   }
   function waterpack() {
      window.open('pop_waterpack.do', "", 'width=630, height=520');
   }
   function resortpack() {
      window.open('pop_resortpack.do', "", 'width=630, height=520');
   }
</script>
<script>
  // URL 매개변수를 확인하고 해당 버튼을 클릭하는 함수
  function checkUrlParameterAndClickButton(event) {
    event.preventDefault(); // 기본 동작 막기

    const urlParams = new URLSearchParams(window.location.search);
    const menu = urlParams.get('menu');
    
    if (menu === 'waterpark') {
      waterparkReservationClick();
    } else if (menu === 'package') {
      packageReservationClick();
    } else {
      resortReservationClick();
    }
  }

  // "워터파크 예약" 버튼 클릭 이벤트 처리 함수
  function waterparkReservationClick() {
    // book.jsp에서 해당 레이블을 클릭 이벤트 처리
    document.querySelector('label[for="waterpark"]').click();
  }

  // "패키지 예약" 버튼 클릭 이벤트 처리 함수
  function packageReservationClick() {
    // book.jsp에서 해당 레이블을 클릭 이벤트 처리
    document.querySelector('label[for="package"]').click();
  }

  // "리조트 예약" 버튼 클릭 이벤트 처리 함수
  function resortReservationClick() {
    // book.jsp에서 해당 레이블을 클릭 이벤트 처리
    document.querySelector('label[for="resort"]').click();
  }

  // URL 매개변수를 확인하고 해당 버튼을 클릭
  document.addEventListener("DOMContentLoaded", checkUrlParameterAndClickButton);
</script>
</head>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/img/favicon.ico">
<body>
	<header class="he2"><%@ include file="../header2.jsp"%></header>
	<header><%@ include file="../header.jsp"%></header>

	<!-- <h6></h6> -->
	<h1></h1>
	<div class="main">
		<!-- 위에 메뉴 -->
		<input type="radio" id="resort" name="show"  /> <input
			type="radio" id="waterpark" name="show" checked/> <input type="radio"
			id="package" name="show" />

		<div class="tab">
			<label for="resort">리조트</label> <label for="waterpark">워터파크</label> <label
				for="package">패키지</label>
		</div>

		<div class="content">
			<!-- 리조트 -->
			<div class="content-resort">

<!-- ------------- RESORT ----------------------- -->
				<div class="resort2">
					<div class="resort2-date">
						<h2>01 . 날짜 선택</h2>
						<%--                     <%@ include file="./datepicker_resort.jsp" %> --%>
						<div class="calendar-container">
							<div class="calendar">
								<label for="recheckInDate">Check-in</label>
								<div id="recheckInDate" name="recheckInDate"></div>
							</div>

							<div class="calendar">
								<label for="recheckOutDate">Check-out</label>
								<div id="recheckOutDate" name="recheckOutDate"></div>
							</div>
						</div>
					</div>
				</div>

				<div class="resort1">
					<h2>02 . 리조트 선택</h2>
					<div class="f_stand">패밀리 스탠다드</div>
					<br>
					<div class="f_prem">패밀리 프리미엄</div>
					<br>
					<div class="s_stand">스위트 스탠다드</div>
					<br>
					<div class="s_prem">스위트 프리미엄</div>
					<br>
				</div>


				<div class="resort3">
					<h2>03 . 예약 정보</h2>
					예약자명 :  ${sessionScope.loginsession.m_name}<br>
					<hr>
					휴대폰번호: ${sessionScope.loginsession.m_tel}<br>
					<hr>
					이용객실 : <span class="selected-resortdata"></span>
					<hr>
					이용일정 : <span id="indate">${selectedCheckInDate}</span> ~ <span id="outdate">${selectedCheckOutDate}</span><br>
					<hr>
					금액: <span id="resortPrice">${price}</span> <br>
					<br>
					<br>
					<!-- 예약 버튼 -->
					<button class="custom-btn btn-12" id="rebookbtn">
						<span>Click!</span><span>예약</span>
					</button>
				</div>
			</div>
<!-- ------------------------------------------------------------- -->
		<!-- 워터파크 -->
			<div class="content-waterpark">

				<div class="waterpark1">
					<h2>01 . 실내/실외</h2>
					<div class="in_locker">실내락커</div>
					<br>
					<div class="out_locker">실외락커</div>
					<br>
					<div class="super_locker">슈퍼파크인</div>
					<br>
				</div>

				<div class="waterpark2">

					<h2>02 . 인원 선택</h2>
					<div class="counter">
						<label for="adults">성인</label>
						<button class="minusbtn" id="decreaseAdults">-</button>
						<span id="adultsCount">0</span>
						<button class="plusbtn" id="increaseAdults">+</button>
					</div>
					<br>
					<div class="counter">
						<label for="teenagers">소인</label>
						<button class="minusbtn" id="decreaseTeenagers">-</button>
						<span id="teenagersCount">0</span>
						<button class="plusbtn" id="increaseTeenagers">+</button>
					</div>
				</div>


				<div class="waterpark3">
					<h2>03 . 날짜 선택</h2>
					<%@ include file="./datepicker_waterpack.jsp"%>
				</div>

				<div class="waterpark4">
					<h2>04 . 예약 정보</h2>
                	예약자명 : ${sessionScope.loginsession.m_name}<br><hr>
               		이용락커 : <span class="selected-lockerdata"></span><hr>
                	날짜 : <span id="indate1">${checkInDate1}</span><hr>
                	휴대폰번호:${sessionScope.loginsession.m_tel}<br><hr>
                 	성인: <span id="adtoto">0</span>명&nbsp;&nbsp;&nbsp;
                 	소인: <span id="teentoto">0</span>명<br><hr>
                	금액:<span id ="totalPrice"></span> <br><hr><br>

					<!-- 예약 버튼 -->
					<!-- <button id="booking-button">예약하기</button> -->
					<button class="custom-btn btn-12" id="oceanbookbtn">
						<span>Click!</span><span>예약</span>
					</button>
					
				</div>
			</div>


			<!-- 패키지 -->
			<div class="content-package">
				<ul>
					<li class="allpack"><img class="allpack"
						src="${pageContext.request.contextPath}/resources/img/allpack.jpg"
						onclick="allpack()">

						<h3>프리미엄 패키지</h3></li>

					<li class="waterpack"><img class="waterpack"
						src="${pageContext.request.contextPath}/resources/img/waterpack.jpg"
						onclick="waterpack()">

						<h3>워터파크 패키지</h3></li>

					<li class="resortpack"><img class="resortpack"
						src="${pageContext.request.contextPath}/resources/img/resortpack.jpg"
						onclick="resortpack()">
						<h3>리조트 패키지</h3></li>
				</ul>
			</div>

		</div>
	</div>
	<footer><%@ include file="../footer.jsp"%></footer>
</body>
</html>
