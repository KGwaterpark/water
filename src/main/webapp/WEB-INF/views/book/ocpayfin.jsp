<%@page import="java.util.Date"%>
<%@page import="com.water.park.vo.MemberVO"%>
<%@page import="com.water.park.vo.Package_bookVO"%>
<%@page import="com.water.park.vo.BookVO"%>
<%@page import="com.water.park.vo.Ocean_bookVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- 숙소 결제 완료 페이지 -->
<head>
<%
MemberVO mvo = (MemberVO) session.getAttribute("loginsession");
Ocean_bookVO ovo = (Ocean_bookVO) session.getAttribute("ocean_vo");

String name = mvo.getM_name();
String email = mvo.getM_email();
String tel = mvo.getM_tel();
long currentTime =new Date().getTime();
int ocbook_id= (int)currentTime;

String indate2 = ovo.getOc_date();
String selectedLocker = ovo.getType();


int adultsCount=ovo.getAdult_cnt();

int teenagersCount=ovo.getChild_cnt();

int ocean_price= ovo.getTot_cnt();
int oriprice = 0;
if(selectedLocker.equals("in_locer")){
  oriprice = 40000;
}else if(selectedLocker.equals("out_locker")){
  oriprice = 35000;
}else if(selectedLocker.equals("super_locker")){
  oriprice = 200000;
}

if(selectedLocker.equals("in_locker")){
   selectedLocker = "실내락커";
}else if(selectedLocker.equals("out_locker")){
   selectedLocker = "실외락커";
}else if(selectedLocker.equals("super_locker")){
   selectedLocker = "슈퍼파크인";
}
	  
%>
<meta charset="UTF-8">
<title>결제완료</title>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/payfin.css">
</head>
<body>
   <header class="he2"><%@ include file="../header2.jsp"%></header>
   <header><%@ include file="../header.jsp"%></header>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>



   <div class="wrap">
      <br>
      <div class=wrap-payinfo>
         <br> <a class="title"><span class="sp-title">결제가
               정상적으로 완료</span>되었습니다.</a> <br> <br> <br> <br>
         <table class="pay-info-t">
            <!-- 예약번호 -->
            <tr>
               <td class="pay-th">예약번호</td>
               <td style="color: #29cdff;"><%=ocbook_id %><br> <br></td>
            </tr>
            <!-- 예약정보 -->
            <tr>
               <td class="pay-th" rowspan="3">예약정보</td>
               <td><%=name %></td>
            </tr>
            <tr>
               <td><%=selectedLocker%></td>
            </tr>
            <tr>
               <td><%=indate2 %> <br> <br></td>
            </tr>
            <!-- 결제정보 -->
            <tr>
               <td class="pay-th" rowspan="2">결제정보</td>
               <td>결제타입</td>
               <!-- 신용카드? -->
            </tr>
            <tr>
               <td>신용카드</td>
            </tr>
         </table>
      </div>

      <!-- 결제금액 -->
      <div class="wrap-price">
         <div>
            <a class="kglogo">KG<br>WATER PARK
            </a>
            <hr>
            <a class="poom">상품명<br>온라인 회원 [NEW 워터파크]<br><%=selectedLocker%>
            </a>
            <hr>
            <table class="pay-price-t">
               <tr>
                  <td class="pay-th">상품 금액</td>
                  <td class="pay-td"><%=oriprice %><span> 원</span></td>
               </tr>
               <tr>
                  <td class="pay-th">할인 금액</td>
                  <td class="pay-td">(-) 0<span> 원</span></td>
               </tr>
            </table>
            <hr>
            <table class="pay-price-t">
               <tr>
                  <td class="pay-th">총 금액</td>
                  <td class="pay-td"><span
                     style="font-size: 40px; font-weight: bold;"><%=ocean_price %></span>원</td>
               </tr>
            </table>
         </div>
      </div>
      <br> <br> <br>

      <!-- 결제버튼 -->
      <div class="btn-pay">
         <button class="gomain" onclick="goToMain()">메인으로 가기</button>
      </div>


   </div>

   <br>
   <br>
   <br>
   <br>
   <br>
   <footer><%@ include file="../footer.jsp"%></footer>



   <script>
      function goToMain() {
         window.location.href = "main.do"; // 메인 페이지로 이동
      }
   </script>
</body>
</html>