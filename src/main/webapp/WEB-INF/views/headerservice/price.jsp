<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>요금표</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/service_style.css" />
</head>
<body>
<header class="he2"><%@ include file="../header2.jsp" %></header>
<header><%@ include file="../header.jsp" %></header>
<section>
<table border="0" align="center" width="1000">
<tr bgcolor="#3de2ff" >
<th colspan="4" align="center"><span class="gd1"><h2>요금표</h2></span> </th>
</tr>
</table>

<table class="privet" border="0.1" align="center" width="1000" height="100">
<tr align="center">
<th rowspan="3">구분</th><td colspan="2">하이시즌</td><td colspan="2">하이시즌2</td ><td colspan="2">골드시즌</td></tr>
		
<tr align="center">
<td colspan="2">6/3~6/23</td><td colspan="2">6/24~7/14</td><td colspan="2">7/15~8/20</td>
</tr>
<tr align="center">
<td></td><td>주중</td><td>주말</td><td>주중</td><td>주말</td><td>주중</td><td>주말</td>
</tr>
<tr>
				<th rowspan="2" scope="row">실내락커</th>
				<th scope="row">대인</th>
				<td>35,000원</td>
				<td>40,000원</td>
				<td>40,000원</td>
				<td>50,000원</td>
				<td>54,000원</td>
				<td class=" last">59,000원</td>
			</tr>
			<tr>
				<th scope="row">소인</th>
				<td>25,000원</td>
				<td>30,000원</td>
				<td>30,000원</td>
				<td>40,000원</td>
				<td>44,000원</td>
				<td class=" last">49,000원</td>
			</tr>
			<tr>
				<th rowspan="2" scope="row">야외락커</th>
				<th scope="row">대인</th>
				<td>30,000원</td>
				<td>35,000원</td>
				<td>35,000원</td>
				<td>45,000원</td>
				<td>49,000원</td>
				<td class=" last">54,000원</td>
			</tr>
			<tr>
				<th scope="row">소인</th>
				<td>20,000원</td>
				<td>25,000원</td>
				<td>25,000원</td>
				<td>35,000원</td>
				<td>39,000원</td>
				<td class=" last">44,000원</td>
			</tr>
			<tr>
			    <th rowspan="2" scope="row">
			    슈퍼파크인
			    	<div class="btnWrap_s" >
			    	<a href="#">자세히보기</a>
			    	</div>
			    </th>
			    <th scope="row">슈퍼파크인 only</th>
			    <td colspan="4">-</td>
			    <td colspan="2"  class=" last">150,000원</td>
		    </tr>
			<tr>
			    <th scope="row">슈퍼파크인<br>+ 입장권</th>
			    <td colspan="4">-</td>
			    <td colspan="2"  class=" last">200,000원</td>
		    </tr>
		</tbody>
	</table>


<!--  -->
<table border="0" align="center" width="1000"height="550" >
<tr bgcolor="#3de2ff">
<td class="tab1">
&nbsp;&nbsp; <h3>※ 슈퍼파크인은 투숙객에 한하여 오션월드 정상 개장시간보다 90분 먼저 입장할 수 있는 상품입니다.</h3><br>
&nbsp;&nbsp;10/31일까지 운영 후 동계 휴장 진행	<br><br>
&nbsp;&nbsp;소인 기준 :  48개월 ~ 초등학생/ 보호자 동반입장必  나이확인이 가능한 신분 증빙 서류를 지참하셔야 합니다.<br><br>
&nbsp;&nbsp;신장 120cm 미만의 분들은 일부 어트랙션 이용을 제한하고 있습니다.	<br><br><br>


<div class="gd4">[소인 안내]</div>
ㆍ만 4세이상~만 18세미만의 학생 또는 청소년(어린이)<br><br><br>


<div class="gd4">[군인 무료입장]</div>
ㆍ군인 : 휴가증 및 외출증 또는 전투복을 입은 군인(간부는 반드시 본인의 신분증 지참)
<br><br><br>

<div class="gd4">[기타 안내]</div>
ㆍ48개월 미만의 경우 증빙원(의료보험증, 주민등록 초/등본 등) 지참 시에만 무료입장 가능합니다.<br><br>

</td>
</tr>

</table>
</section>
 <footer><%@ include file="../footer.jsp" %></footer>
</body>
</html>