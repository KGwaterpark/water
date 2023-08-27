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
.paymentinfo{
  font-size:20px;
  background:#E0FEFF;
  
}
.paysel{
  font-size:20px;
  }

.paytext{
  height:20px;
  width: 200px;
}
.adminth{
  background:#CEDFEA;
}

#p_price{
 background:#FFB6C1;
}
#p_amount{
 color:red;
}

    .pay-failure {
      color: red;
    }

    .pay-pending {
      color: orange;
    }

    .pay-cancelled {
      color: gray;
    }
    
    .cancleMd {
    display: none; /* 초기에는 모달을 숨김 */
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.7); /* 모달 뒷 배경을 어둡게 함 */
}

.modal-content {
    background-color: #fff;
    margin: 10% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
}
 .blue-text {
    background: #46D2D2;
}
 .orange-text {
    background: #FFA01E;
}
 .red-text {
    background: #E16A9D;
}
 .yellow-text {
    background: #FFF978;
}
</style>

<script>
/* function backC(state) {
	console.log(state);
const paymentStatus = document.getElementById("paymentStatus"); */

/* if (state === "결제완료") {
    paymentStatus.classList.add("blue-text");
}else if  (state === "미결제") {
    paymentStatus.classList.add("yellow-text");
}else if  (state === "결제취소") {
    paymentStatus.classList.add("orange-text");
}else if  (state === "결제실패") {
    paymentStatus.classList.add("red-text");
} */

// $(document).ready(function() {
    
//     var paymentStatus = document.getElementById("status");  
//     var textColor;
//     switch (paymentStatus) {
//         case "결제완료":
//             textColor = "green";
//             break;
//         case "미결제":
//             textColor = "blue";
//             break;
//         case "결제취소":
//             textColor = "red";
//             break;
//         case "결제실패":
//             textColor = "orange";
//             break;
//         default:
//             textColor = "red"; // 
//     }

    
//     $(".status").text(paymentStatus);
//     $(".status").css("color", textColor);
// });
</script>
<body>
  <div class="paymentinfo">
   <form action="paymentAll.do">
   결제 상태 : <br>
      <input type="checkbox" name="state" value="all" checked="checked"> 전체
      <input type="checkbox" name="state" value="ready"> 미결제
      <input type="checkbox" name="state" value="paid"> 결제완료
      <input type="checkbox" name="state" value="cancelled"> 결제취소
      <input type="checkbox" name="state" value="failed"> 결제실패
      
      <br><br>
      <select class="paysel" name="search">
         <option value="merchant_uid">결제고유번호</option>
         <option value="buyer_name">구매자 성명</option>
         <option value="buyer_email">구매자 이메일</option>
         <option value="buyer_tel">구매자 전화번호(뒷번호 4자리)</option>
      </select>
      <input class="paytext" type="text" name="query"><br><br>
      <input type="submit" value="검색">
   </form>
</div>

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
              <td><span id="p_state">${pay.state}</span><br><span id="p_price">${pay.price }</span><br><span id="p_amount">${pay.cancel_amount}</span></td>
               <td>${pay.channel }<br>${pay.pg_provider }</td>
               <td>${pay.card_name }<br>승인: (${pay.apply_num })<br>카드번호 : ${pay.card_num }</td>
               <td>${pay.re_type }<br>${pay.buyer_name }<br>${pay.buyer_email }<br>${pay.buyer_tel }</td>
               <td>${pay.pay_date }</td>
               <td> <span class="status" id="status" >${pay.state}</span><br>
             
               <c:if test="${pay.state == '결제완료'}"> <input type="button" value="취소하기" onclick="openModal('${pay.merchant_uid}','${pay.price }')"></c:if>
               ${pay.cancelled_at } ${pay.cancel_reason }${pay.fail_reason }</td>
            </tr>
<!--             <script> -->
<!-- //             var paymentStatus = document.querySelectorAll(".status"); -->
<!-- //             paymentStatus.forEach(function(statusElement) { -->
<%-- //                 var paymentState = "${pay.state}"; // JSP 변수를 JavaScript 변수로 가져옴 --%>

<!-- //                 if (paymentState === '결제완료') { -->
<!-- //                     statusElement.classList.add("blue-text"); -->
<!-- //                     break; -->
<!-- //                 } else if (paymentState === '결제취소') { -->
<!-- //                     break; -->
<!-- //                     statusElement.classList.add("orange-text"); -->
<!-- //                     break; -->
<!-- //                 } else if (paymentState === '결제실패') { -->
<!-- //                     statusElement.classList.add("red-text"); -->
<!-- //                     break; -->
<!-- //                 } else if (paymentState === '미결제') { -->
<!-- //                     statusElement.classList.add("yellow-text"); -->
<!-- //                     break; -->
<!-- //                 } -->
<!-- //             }); -->
<!--         </script> -->
         </c:forEach>


      </tbody>
   </table>
   <div></div>
   <!-- 이곳은 취소 모달 창~ 꺄르륽 -->
   <div id="cancleMd" class="cancleMd">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h1>결제 취소</h1><hr>
        <form action="payCancle.do">
        환불 사유 <br><textarea rows="10" cols="40" name="reason" placeholder="관리자페이지취소.">관리자페이지취소.</textarea><br><br>
        결제 취소 및 환불처리 <br>
        <input type="radio" name="type" value="all" id="fullRadio" checked="checked"> 전액 취소
        <input type="radio" name="type" value="part" id="partialRadio"> 부분 취소 
        <input type="text" name="amount" id="amountText" value="" disabled>
		<input type="hidden" name="merchant_uid" id="merchant_uid" value="">
		<br><br><hr>
		<input type=button value="아니요. 그냥 두겠습니다.">
		<input type="submit" value="네. 취소해주세요.">
        </form>
    </div>
</div>
</body>
<script>
 
//모달 열기
 function openModal(merchant_uid,amount) {
     document.getElementById("cancleMd").style.display = "block";
     var hiddenInput = document.getElementById("merchant_uid");
     hiddenInput.value = merchant_uid;
     var amountInput = document.getElementById("amountText");
     amountInput.value = amount;
     
     
     document.getElementById("fullRadio").addEventListener("click", function () {
 	    var reasonText = document.getElementById("reasonText");
 	    reasonText.setAttribute("disabled", "disabled"); // 전액 취소 선택 시 텍스트 상자 비활성화
 	});

 	document.getElementById("partialRadio").addEventListener("click", function () {
 	    var reasonText = document.getElementById("reasonText");
 	    reasonText.removeAttribute("disabled"); // 부분 취소 선택 시 텍스트 상자 활성화
 	});
 }

 // 모달 닫기
 function closeModal() {
     document.getElementById("cancleMd").style.display = "none";
 }

 // 모달 닫기 버튼에 클릭 이벤트 추가
 document.querySelector(".close").addEventListener("click", closeModal);
 
 

</script>
</html>