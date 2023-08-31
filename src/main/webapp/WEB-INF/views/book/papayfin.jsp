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
MemberVO mvo= (MemberVO) session.getAttribute("loginsession");
String m_name=mvo.getM_name();
Package_bookVO pvo = (Package_bookVO) session.getAttribute("pabook_vo");
BookVO bvo = (BookVO) session.getAttribute("book_vo");
int pabook_id = pvo.getPabook_id();
String indate = pvo.getUse_date();
String outdate = bvo.getCheck_out_date();
String p_type = pvo.getP_type();
int price = pvo.getPrice();
// session.removeAttribute("book_vo");


%>
<meta charset="UTF-8">
<title>결제완료</title>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/payfin.css">
</head>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/img/favicon.ico">
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
               <td style="color: #29cdff;"><%=pabook_id %><br> <br></td>
            </tr>
            <!-- 예약정보 -->
            <tr>
               <td class="pay-th" rowspan="3">예약정보</td>
               <td><%=m_name %></td>
            </tr>
            <tr>
               <td><%=p_type %></td>
            </tr>
            <tr>
               <td><%=indate %> ~ <%=outdate %> <br> <br></td>
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
            <a class="poom">상품명<br>온라인 회원 <br><%=p_type %>
            </a>
            <hr>
            <table class="pay-price-t">
               <tr>
                  <td class="pay-th">상품 금액</td>
                  <td class="pay-td"><%=price%><span> 원</span></td>
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
                     style="font-size: 40px; font-weight: bold;"><%=price %></span>원</td>
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