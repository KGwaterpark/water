<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ALL 패키지</title>
 <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
     <script src="${pageContext.request.contextPath}/resources/js/allpack.js"></script> 
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/allpack.css"> 

</head>
<body>
   <header class="he2"><%@ include file="../header2.jsp"%></header>
   <header><%@ include file="../header.jsp"%></header>
<section class="allpackbody">
   <table class="allpacktable" width="1600"  >
      <tr>
         <td>
            <h1>프리미엄 패키지</h1> <img
            src="${pageContext.request.contextPath }/resources/img/allpack.jpg">
		</td>
          
              
         <td width="300">
           <div class="allpackcount">
            <div class="counter">
               <h2>01 . 인원 선택</h2>
               <label for="adults">인원</label>
               <button class="minusbtn" id="decreaseAdults">-</button>
               <span id="adultsCount">0</span>
               <button class="plusbtn" id="increaseAdults">+</button>
            </div>
            </div>
         </td>

         <td width="500">
            <div class="allpack2">
               <h2>02 . 날짜 선택</h2>
               <%@ include file="./datepicker_allpack.jsp"%>
            </div>
         </td>
         <td width="300">
            <div class="allpack3">
               <h2>03 . 예약 정보</h2>
               예약자명 :  ${sessionScope.loginsession.m_name}<br><hr>
               휴대폰번호: ${sessionScope.loginsession.m_tel}<br><hr>
               객실 : 팬트하우스<br><hr>
               락커위치 : 실내락커<br>
               <hr>
               이용날짜 :<span id="indate1"></span><br>
               <hr>
               인원수 :<span id="sooCount">0</span>명 <br>
               <hr>
               금액: <span id ="totalPrice"></span><br>
               <br>
               <!-- 예약 버튼 -->
               <button class="custom-btn btn-12"id="allbookbtn"><span>Click!</span><span>예약</span></button>
            </div>

         </td>
      </tr>
   </table>
   </section>
    <footer><%@ include file="../footer.jsp" %></footer>
</body>
</html>