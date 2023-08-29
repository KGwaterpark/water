<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
    
    .info {
        border: 1px solid #ccc; 
        padding: 10px; 
        margin-bottom: 20px; 
        font-size: 18px;
    }
    .info,
    .info * { 
        font-size: 30px;
    }
</style>

</head>
<body>

<section>
  <div class="info">
    <form id="bookForm" action="myupdateinfoR.do" method="post">
 
		<div class="info">
			<div>
				예약상태 : ${bookVO.state eq 'Y' ? '예약' : '예약취소'}
			</div>
			<div>
				예약번호 : ${bookVO.rebook_id}
			</div>
			<div>
				예약타입 : ${bookVO.re_type}
			</div>
			<div>
				금액 : ${bookVO.price}
			</div>
			<div>
				체크인 : ${bookVO.check_in_date}
				체크아웃 : ${bookVO.check_out_date}
			</div>
			<div>
				예약한날 ${bookVO.book_date}
			</div>
			
			<input type="hidden" name="rebook_id" value="${bookVO.rebook_id}">
			<input type="hidden" name="m_id" value="${bookVO.m_id}">
			<input type="hidden" name="state" value="예약취소">
			<input type="hidden" name="re_type" value="${bookVO.re_type}">
			<input type="hidden" name="price" value="${bookVO.price}">
			<input type="hidden" name="check_in_date" value="${bookVO.check_in_date}">
			<input type="hidden" name="check_out_date" value="${bookVO.check_out_date}">
			<input type="hidden" name="newState" id="newState" value="Y">
			
			<div>
    			<button onclick="formSubmitForReview();" class="btn-tazone">리뷰작성</button>
    			<button onclick="cancelReservation();" class="btn-tazone">예약취소</button><br>
			</div>	
		</div>
	</form>
  </div>
</section>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    function formSubmit() {
      $("#bookForm").submit();
    }

    function cancelReservation() {
      // 예약 상태 값을 "예약취소"로 설정
    	document.getElementById("newState").value = "N";
  	  	document.getElementById("bookForm").submit();
    }

    function formSubmitForReview() {
    	$("#bookForm").attr("action", "rev_getinfoR.do");

        
        // 쿼리 파라미터로 값을 전달하기 위해 hidden input 필드 값을 설정
        $("#bookForm").append('<input type="hidden" name="re_type" value="' + '${resort_bookVO.re_type}' + '">');
        $("#bookForm").append('<input type="hidden" name="m_id" value="' + '${resort_bookVO.m_id}' + '">');

        // 폼 제출
        $("#bookForm").submit();
    }
  </script>
</body>
</html>