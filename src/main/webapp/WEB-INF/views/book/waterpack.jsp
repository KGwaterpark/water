<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
   href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
   src="${pageContext.request.contextPath }/resources/js/waterpack.js"></script>
<script
   src="${pageContext.request.contextPath}/resources/js/datepicker_wp.js"></script>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/waterpack.css" />

</head>
<body>
   <header class="he2"><%@ include file="../header2.jsp"%></header>
   <header><%@ include file="../header.jsp"%></header>
<section class="waterbody">
   <table class="watertable" width="1600"  >
      <tr>
         <td>
            <h1>워터파크 패키지</h1> <img
            src="${pageContext.request.contextPath }/resources/img/waterpack.jpg">
</td>
          
              
         <td width="20%">
           <div class="watercount">
            <div class="counter">
               <h2>01 . 인원 선택</h2>
               <label for="adults">인원</label>
               <button class="minusbtn" id="decreaseAdults">-</button>
               <span id="adultsCount">0</span>
               <button class="plusbtn" id="increaseAdults">+</button>
            </div>
            </div>
         </td>

         <td width="30%">
            <div class="waterpack2">
               <h2>02 . 날짜 선택</h2>
               <%@ include file="./datepicker_waterpack.jsp"%>
            </div>
         </td>
          <td width="30%">
            <div class="waterpack3">
               <h2>03 . 예약 정보</h2>
               예약자명 :  ${sessionScope.loginsession.m_name}<br><hr>
               휴대폰번호: ${sessionScope.loginsession.m_tel}<br><hr>
               락커위치 : 실내락커+카바나<br>
               <hr>
               이용날짜 :<span id="indate1"></span><br>
               <hr>
               인원수 :<span id="sooCount">0</span>명 <br>
               <hr>
               금액: <span id ="totalPrice"></span><br>
               <br>
               <!-- 예약 버튼 -->
               <button class="custom-btn btn-12" id="waterbookbtn" ><span>Click!</span><span>예약</span></button>
            </div>

         </td>
      </tr>
   </table>
   </section>
   <footer><%@ include file="../footer.jsp" %></footer>
</body>
</html>