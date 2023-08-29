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
    <form id="bookForm" action="myupdateinfoP.do" method="post">
 
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
				금액 : ${package_bookVO.price}
			</div>
			<div>
				이용일 : ${package_bookVO.use_date}
			</div>
			<div>
				인원수 :  ${package_bookVO.book_cnt}
			</div>
			
			<input type="hidden" name="state" value="${package_bookVO.state}">
			<input type="hidden" name="pabook_id" value="${package_bookVO.pabook_id}">
			<input type="hidden" name="m_id" value="${package_bookVO.m_id}">
			<input type="hidden" name="p_type" value="${package_bookVO.p_type}">
			<input type="hidden" name="use_date" value="${package_bookVO.use_date}">
			<input type="hidden" name="book_cnt" value="${package_bookVO.book_cnt}">
			<input type="hidden" name="price" value="${package_bookVO.price}">
			
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
    	$("#bookForm").attr("action", "rev_getinfoP.do");

        
        // 쿼리 파라미터로 값을 전달하기 위해 hidden input 필드 값을 설정
        $("#bookForm").append('<input type="hidden" name="p_type" value="' + '${pacakge_bookVO.p_type}' + '">');
        $("#bookForm").append('<input type="hidden" name="m_id" value="' + '${package_bookVO.m_id}' + '">');

        // 폼 제출
        $("#bookForm").submit();
    }
  </script>
</body>
</html>