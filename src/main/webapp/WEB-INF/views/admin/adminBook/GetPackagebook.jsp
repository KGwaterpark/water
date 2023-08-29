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
    <form id="bookForm" action="updateinfoP.do" method="post">
 
		<div class="info">
			<div>
				예약상태 : ${package_bookVO.state eq 'Y' ? '예약' : '예약취소'}
			</div>
			<div>
				예약번호 : ${package_bookVO.pabook_id}
			</div>
			<div>
				예약타입 : ${package_bookVO.p_type}
			</div>
			
			<div>
				이용일 : ${package_bookVO.use_date}
			</div>
			<div>
				인원수 :  ${package_bookVO.book_cnt}
			</div>
			
			<div>
				금액 : ${package_bookVO.price}
			</div>
			
			<input type="hidden" name="state" value="${bookVO.state}">
			<input type="hidden" name="pabook_id" value="${package_bookVO.pabook_id}">
			<input type="hidden" name="m_id" value="${package_bookVO.m_id}">
			<input type="hidden" name="p_type" value="${package_bookVO.p_type}">
			<input type="hidden" name="use_date" value="${package_bookVO.use_date}">
			<input type="hidden" name="book_cnt" value="${package_bookVO.book_cnt}">
			<input type="hidden" name="price" value="${package_bookVO.price}">
			
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