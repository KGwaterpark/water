<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
    width: 100%;
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
li {
   list-style: none;
   float: left;
   padding: 6px;
}

.pagination {
   font-size: 40px;
}

.pagination li a {
   text-decoration: none;
   color: gray;
}

.pagination li.active a {
   color: black;
   font-weight: bold;
</style>

<body>
  <div class="paymentinfo">
   <form action="paymentAll.do" id="paginationForm">
   결제 상태 : <br>
	<input type="checkbox" name="state" value="all" id="allCheckbox"> 전체
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
       <input type="hidden" id="pageNumberInput" name="page" value="1">
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
              <td><span class="status">${pay.state}</span><br><span id="p_price">${pay.price }</span><br><span id="p_amount">${pay.cancel_amount}</span></td>
               <td>${pay.channel }<br>${pay.pg_provider }</td>
               <td>${pay.card_name }<br>승인: (${pay.apply_num })<br>카드번호 : ${pay.card_num }</td>
               <td>${pay.re_type }<br>${pay.buyer_name }<br>${pay.buyer_email }<br>${pay.buyer_tel }</td>
               <td>${pay.pay_date }</td>
               <td> <span class="status" >${pay.state}</span><br>
             
               <c:if test="${pay.state == '결제완료'}"> <input type="button" value="취소하기" onclick="openModal('${pay.merchant_uid}','${pay.price }')"></c:if>
               ${pay.cancelled_at } ${pay.cancel_reason }${pay.fail_reason }</td>
            </tr>
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
   <div id="pagination-container">
        <!-- 페이지 번호를 여기에 동적으로 추가할 것입니다. -->
    </div>
     <script type="text/javascript">
          function PageMove(page) {
        	  // 페이지 번호 변경
        	    document.getElementById("pageNumberInput").value = page;
        	    // 폼 제출
        	    document.getElementById("paginationForm").submit();
          }
   </script>
<table>
		<tr></tr>
		<tr>
			<td width=290px></td>
			<td style="font-size: 40px;">
				<ul class="pagination">
					<li><a href="javascript:PageMove(${paging.firstPageNo})">≪</a></li>
					<li><a href="javascript:PageMove(${paging.prevPageNo})">＜</a></li>
					<c:forEach var="i" begin="${paging.startPageNo}"
						end="${paging.endPageNo}" step="1">
						<c:choose>
							<c:when test="${i eq paging.pageNo}">
								<li class="active"><a href="javascript:PageMove(${i})">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="javascript:PageMove(${i})">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<li><a href="javascript:PageMove(${paging.nextPageNo})">＞</a></li>
					<li><a href="javascript:PageMove(${paging.finalPageNo})">≫</a></li>
				</ul>
			</td>
		</tr>
	</table>
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
 	    var reasonText = document.getElementById("amountText");
 	    reasonText.setAttribute("disabled", "disabled"); // 전액 취소 선택 시 텍스트 상자 비활성화
 	});

     document.getElementById("partialRadio").addEventListener("click", function () {
    	    var reasonText = document.getElementById("amountText");
    	    reasonText.removeAttribute("disabled"); // 부분 취소 선택 시 텍스트 상자 활성화
    	});
 }

 // 모달 닫기
 function closeModal() {
     document.getElementById("cancleMd").style.display = "none";
 }

 // 모달 닫기 버튼에 클릭 이벤트 추가
 document.querySelector(".close").addEventListener("click", closeModal);
 
///////////////////////////////////////
  // "전체" 체크박스 요소 가져오기
  var allCheckbox = document.getElementById("allCheckbox");

  // 모든 다른 옵션 체크박스 요소 가져오기
  var otherCheckboxes = document.querySelectorAll('input[name="state"]:not(#allCheckbox)');

//"전체" 체크박스 요소 가져오기
  var allCheckbox = document.getElementById("allCheckbox");

  // 모든 옵션 체크박스 요소 가져오기
  var stateCheckboxes = document.querySelectorAll('input[name="state"]');

  // "전체" 체크박스의 이벤트 리스너 추가
  allCheckbox.addEventListener("change", function () {
    // "전체" 체크박스가 선택되었을 때
    if (allCheckbox.checked) {
      // 모든 옵션 체크박스들을 선택
      stateCheckboxes.forEach(function (checkbox) {
        checkbox.checked = true;
      });
    } else {
      // "전체" 체크박스가 해제되었을 때, 모든 옵션 체크박스들을 해제
      stateCheckboxes.forEach(function (checkbox) {
        checkbox.checked = false;
      });
    }
  });

  // 옵션 체크박스들의 이벤트 리스너 추가
  stateCheckboxes.forEach(function (checkbox) {
    checkbox.addEventListener("change", function () {
      // 선택된 모든 옵션 체크박스들을 확인
      var selectedCheckboxes = Array.from(stateCheckboxes).filter(function (cb) {
        return cb.checked;
      });

      // 모든 옵션 체크박스들이 선택되어 있으면 "전체" 체크박스를 선택
      if (selectedCheckboxes.length === stateCheckboxes.length) {
        allCheckbox.checked = true;
      } else {
        // 아니면 "전체" 체크박스를 해제
        allCheckbox.checked = false;
      }
    });
  });

  window.onload = readURLParameters;

  function readURLParameters() {
    var urlParams = new URLSearchParams(window.location.search);
    var selectedStates = urlParams.getAll("state");
    var selectedSearch = urlParams.get("search");
    var selectedQuery = urlParams.get("query");

    // 선택된 "state" 값들을 반복하여 각 체크박스를 선택 또는 해제합니다.
    stateCheckboxes.forEach(function (checkbox) {
      checkbox.checked = selectedStates.includes(checkbox.value);
    });
    if (selectedStates.length === 0) {
        // 선택된 "state"가 없는 경우, "전체" 체크박스를 선택
        allCheckbox.checked = true;
      }
    
    if (selectedSearch) {
      document.querySelector('.paysel').value = selectedSearch;
    }
    if (selectedQuery) {
      document.querySelector('.paytext').value = selectedQuery;
    }
  }
  
  /* ======결제상태에따른 배경색 변화========== */

  $(document).ready(function() {
      
       var statusBackgroundColors = {
             "미결제":  "#FFA01E",
             "결제완료": "#46D2D2",
             "결제취소": "#E16A9D",
               "결제실패": "#FFF978"
      };


      $(".status").each(function() {
          var paymentStatus = $(this).text(); 
          var backgroundColor = statusBackgroundColors[paymentStatus] || "cyan";
          $(this).css("background-color", backgroundColor);
      });
  });
  /* ================================================= */
  
 
</script>
</html>