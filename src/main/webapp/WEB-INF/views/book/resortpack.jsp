<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/resort.js"></script>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/resortpack.css" />
    <style> </style>
</head>
<body>
   <header class="he2"><%@ include file="../header2.jsp"%></header>
   <header><%@ include file="../header.jsp"%></header>
   
<section class="resortbody">
   <table class="resorttable" width="1600"  >
      <tr>
         <td>
            <h1>리조트팩</h1> <img
            src="${pageContext.request.contextPath }/resources/img/resortpack.jpg">
		</td>
         
         <td width="300">
                <div class="resortpack1" style="height:300px;">
                <h2>01 . 리조트 선택</h2>
                <div class="f_stand">패밀리 스탠다드</div><br>
                <div class="f_prem">패밀리 프리미엄</div><br>
                <div class="s_stand">스위트 스탠다드</div><br>
                <div class="s_prem">스위트 프리미엄</div><br>
            	</div>     
  
           <div class="resortcount" style="height:300px;">
            <div class="counter">
               <h2>02 . 인원 선택</h2>
               <label for="adults">인원</label>
               <button class="minusbtn" id="decreaseAdults">-</button>
               <span id="adultsCount">0</span>
               <button class="plusbtn" id="increaseAdults">+</button>
            </div>
            </div>
         </td>

         <td width="500">
            <div class="resortpack2">
               <h2>03 . 날짜 선택</h2>
                <%@ include file="./datepicker_resortpack.jsp"%> 
            </div>
         </td>
         <td width="300">
            <div class="resortpack3">
              <h2>03 . 예약 정보</h2>
               예약자명 :  ${sessionScope.loginsession.m_name}<br><hr>
               휴대폰번호: ${sessionScope.loginsession.m_tel}<br><hr>
               이용객실 : <span class="selected-resortdata"></span><hr>
               락커위치 : 실내락커<br>
               <hr>
               
               이용날짜 :<span id="indate1"></span><br>
               <hr>
               인원수 :<span id="sooCount">0</span>명 <br>
               <hr>
               금액: <span id ="totalPrice"></span><br>
               <br>
               <!-- 예약 버튼 -->
               <button class="custom-btn btn-12" id="repackbtn"><span>Click!</span><span>예약</span></button>
            </div>
         </td>
      </tr>
   </table>
   </section>
</body>
</html>