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
    <form id="bookForm" action="updateinfoW.do" method="post">
				
		<div class="info">
			<div>
				예약상태 : ${ocean_bookVO.state eq 'Y' ? '예약' : '예약취소'}
			</div>
			<div>
				예약번호 : ${ocean_bookVO.ocbook_id}
			</div>
			<div>
				예약타입 : ${ocean_bookVO.type}
			</div>
			<div>
				예약일 : ${ocean_bookVO.oc_date}
			</div>
			<div>
				어른 인원수 : ${ocean_bookVO.adult_cnt}
			</div>
			<div>
				아이 인원수 :  ${ocean_bookVO.child_cnt}
			</div>
			<div>
				총 인원수 :  ${ocean_bookVO.tot_cnt}
			</div>
			
			
			<input type="hidden" name="state" value="${ocean_bookVO.state}">
			<input type="hidden" name="ocbook_id" value="${ocean_bookVO.ocbook_id}">
			<input type="hidden" name="m_id" value="${ocean_bookVO.m_id}">
			<input type="hidden" name="type" value="${ocean_bookVO.type}">
			<input type="hidden" name="oc_date" value="${ocean_bookVO.oc_date}">
			<input type="hidden" name="adult_cnt" value="${ocean_bookVO.adult_cnt}">
			<input type="hidden" name="child_cnt" value="${ocean_bookVO.child_cnt}">
			<input type="hidden" name="tot_cnt" value="${ocean_bookVO.tot_cnt}">
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