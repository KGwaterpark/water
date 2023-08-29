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
    <form id="bookForm" action="updateinfoR.do" method="post">
 
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
				체크인 : ${bookVO.check_in_date}
				체크아웃 : ${bookVO.check_out_date}
			</div>
			
	<%-- 		<div>
    			체크인 : ${bookVO.check_in_date?substring(0, 10)}
    			체크아웃 : ${bookVO.check_out_date?substring(0, 10)}
			</div> --%>
			<div>
				금액 : ${bookVO.price}
			</div>
			
			<input type="hidden" name="state" value="${bookVO.state}">
			<input type="hidden" name="rebook_id" value="${bookVO.rebook_id}">
			<input type="hidden" name="m_id" value="${bookVO.m_id}">
			<input type="hidden" name="re_type" value="${bookVO.re_type}">
			<input type="hidden" name="check_in_date" value="${bookVO.check_in_date}">
			<input type="hidden" name="check_out_date" value="${bookVO.check_out_date}">
			<input type="hidden" name="price" value="${bookVO.price}">
			
			<input type="hidden" name="newState" id="newState" value="Y">
			
			
			<div>
     			<button onclick="cancelReservation();" class="btn-tazone">예약취소</button><br>
			</div>	
		</div>
	</form>
  </div>
</section>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
function cancelReservation() {
	  document.getElementById("newState").value = "N";
	  document.getElementById("bookForm").submit();
	}

  </script>
</body>
</html>