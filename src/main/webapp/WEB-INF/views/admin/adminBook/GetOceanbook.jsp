<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <form id="bookForm" action="updateoceaninfo.do" method="post">
 
		<div class="info">
			<div>
				예약상태 : 결제완료
			</div>
			<div>
				예약번호 : ${ocean_bookVO.ocbook_id}
			</div>
			<div>
				예약타입 : ${ocean_bookVO.type}
			</div>
			<div>
				금액 : ${ocean_bookVO.tot_cnt}
			</div>
			<div>
				이용일 : ${ocean_bookVO.oc_date}
			</div>
			<div>
				인원수 :  ${ocean_bookVO.tot_cnt}
			</div>

			<input type="hidden" name="ocbook_id" value="${ocean_bookVO.ocbook_id}">
			<input type="hidden" name="m_id" value="${ocean_bookVO.m_id}">
			<input type="hidden" name="type" value="${ocean_bookVO.type}">
			<input type="hidden" name="state" value="예약취소">
			
			
			<div>
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
      $("input[name='state']").val("예약취소");
      // 폼 제출
      $("#bookForm").submit();
    }

    function formSubmitForReview() {
    	$("#bookForm").attr("action", "rev_getinfo.do");

        // 쿼리 파라미터로 값을 전달하기 위해 hidden input 필드 값을 설정
        $("#bookForm").append('<input type="hidden" name="type" value="' + '${ocean_bookVO.type}' + '">');
        $("#bookForm").append('<input type="hidden" name="m_id" value="' + '${ocean_bookVO.m_id}' + '">');

        // 폼 제출
        $("#bookForm").submit();
    }
  </script>
</body>
</html>