<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<style>
#memp {
	color: blue;
}
</style>
<body>
	<form action="paymentAll.do">
	결제 상태 : <br>
		<input type="checkbox" name="state" value="all" checked="checked"> 전체
		<input type="checkbox" name="state" value="ready"> 미결제
		<input type="checkbox" name="state" value="paid"> 결제완료
		<input type="checkbox" name="state" value="cancelled"> 결제취소
		<input type="checkbox" name="state" value="failed"> 결제실패
		
		<br><br>
		<select name="search">
			<option value="merchant_uid">결제고유번호</option>
			<option value="buyer_name">구매자 성명</option>
			<option value="buyer_email">구매자 이메일</option>
			<option value="buyer_tel">구매자 전화번호(뒷번호 4자리)</option>
		</select>
		
		<input type="text" name="query"><br><br>
		
		<input type="submit" value="검색">
	</form>


	<h1>결제 정보</h1>
	<table border="2" class="table-fill">
		<thead class="adminth">
			<tr>
				<th>결제고유번호</th>
				<th>결제금액<br>(최종환불금액)</th>
				<th>구분</th>
				<th>결제 상세</th>
				<th>상품명<br>구매자정보</th>
				<th>결제시각</th>
				<th>상태</th>
			</tr>
		</thead>
		<tbody class="table-hover">

			<c:forEach var="pay" items="${paymentAll}" varStatus="loop">
				<tr>
					<td>${pay.merchant_uid }</td>
					<td>${pay.state }<br>${pay.price }<br>${pay.cancel_amount}</td>
					<td>${pay.channel }<br>${pay.pg_provider }</td>
					<td>${pay.card_name }<br>승인: (${pay.apply_num })<br>카드번호 : ${pay.card_num }</td>
					<td>${pay.re_type }<br>${pay.buyer_name }<br>${pay.buyer_email }<br>${pay.buyer_tel }</td>
					<td>${pay.pay_date }</td>
					<td>${pay.state }<br>${pay.cancelled_at } ${pay.cancel_reason }${pay.fail_reason }</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
	<div></div>
</body>
</html>