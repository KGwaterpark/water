<%@page import="com.water.park.vo.Ocean_bookVO"%>
<%@page import="com.water.park.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 페이지</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/payment.css">
</head>
<%
	
	MemberVO mvo = (MemberVO) session.getAttribute("loginsession");
	Ocean_bookVO ovo = (Ocean_bookVO) session.getAttribute("ocean_vo");
	
	String name = mvo.getM_name();
	String email = mvo.getM_email();
	String tel = mvo.getM_tel();
	
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
<body>
	<header class="he2"><%@ include file="../header2.jsp"%></header>
	<header><%@ include file="../header.jsp"%></header>
	<br><br><br><br><br><br><br><br><br><br>
    
	<div class="wrap">
		<form action="payimsi.do" method="post">
			<!-- 예약정보 -->
			<a class="pm-a">예약정보</a><br> <br>
			<table class="pm-class">
				<tr>
					<td class="th">이용날짜</td><td><%=indate2 %></td>
				</tr>
				<tr>
					<td class="th">이용락커</td><td class="area"><%=selectedLocker%></td>
				</tr>
				<tr>
					<td class="th">이용 인원</td>
					<td>성인:<%=adultsCount%></td>
					<td>소인:<%=teenagersCount%></td>
				</tr>
				<tr>
					<td class="th">결제금액</td>
					<td class="total"><%=ocean_price%><span id="won">&nbsp;원</span></td>
				</tr>
			</table>
			<br>

			<!-- 이용자정보 -->
			<a class="pm-a">이용자정보</a><br> <br>
			<table>
				<tr>
					<td class="th">상품명</td>
					<td class="product">온라인 회원 <%=selectedLocker %> </td>
				</tr>
				<tr>
					<td class="th">이용자명</td>
					<td><span><%=name %></span></td>
				</tr>
				<tr>
					<td class="th">이메일</td>
					<td><span><%=email %></span></td>
				</tr>
				<tr>
					<td class="th">휴대폰번호</td>
					<td><span><%=tel %></span></td>
				</tr>
				<tr>
					<td class="th">수령장소</td>
					<td>KG 프론트 데스크</td>
				</tr>
				<tr>
					<td class="th">결제방법</td>
					<td><input type="radio" name="pay" value="card" checked>신용카드<br>
						<input type="radio" name="pay" value="bank">실시간계좌이체<br>
						<input type="radio" name="pay" value="nobank">무통장입금</td>
				</tr>
			</table>
			<br>
			<!-- 개인정보 -->
			<a class="pm-a"><span class="nemo">■</span> ((주)KG HOLDINGS)개인정보 수집•이용 동의( 필수
				)</a><br> <br>
			<div class="privacy">
				<ul class="square">
					<li>수집항목: 회원번호, 성명, 휴대폰 번호, 이메일주소</li>
					<br>
					<li>이용목적<br>리조트(호텔)및 부대시설 예약/조회/이용과 서비스 제공 등을 위한 본인확인, 회원
						불만처리
					</li>
					<br>
					<li>수집항목: 회원번호, 성명, 휴대폰 번호, 이메일주소</li>
					<br>
					<li>보유 및 이용기간<br> <span class="accent">수집일로부터 5년간
							보관</span>(관련법령에 별도 규정이 명시되어 있는 경우 그 기간에 따름)
					</li>
					<br>
					<li>회원은 개인정보의 필수적 수집과 관련한 위 사항에 대하여 원하지 않는 경우 동의를 거부할 수 있습니다.
						그러나 동의하지 않을 경우 리조트 및 부대시설 예약이 제한됩니다.</li>
				</ul>
			</div>
			<br>
			<div class="privacy-select">
				<input type="radio" name="pri" value="agree" checked>동의합니다.
				<input type="radio" name="pri" value="noagree">동의하지 않습니다.
			</div>
			<br>
			<!-- 결제버튼 -->
			<div class="btn-pay">
				<input type="submit" class="submit" value="결제"> <input
					type="reset" class="reset" value="취소">
			</div>
		</form>
	</div>

	<br><br><br><br><br>
	<footer><%@ include file="../footer.jsp"%></footer>

</body>
</html>