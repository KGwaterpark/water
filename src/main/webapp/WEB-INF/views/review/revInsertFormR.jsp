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

    .review {
        text-align: center;
    }

    .reviews {
        margin-top: 100px;
    }
    .rev_my{
    	font-size: 50px;
    	font-align: center;
    
    }
    .info,
    .info * { 
        font-size: 30px;
    }
    
    .btn-tazone {
        display: block;
        margin: 0 auto;
        font-size: 24px;
    }

 
    .rev_text input[type="text"] {
        font-size: 24px;
        width: 100%;
        height: 200px;
        box-sizing: border-box;
    }

</style>
<script>
  // 현재 날짜를 가져오는 함수
  function getCurrentDate() {
    const now = new Date();
    const year = now.getFullYear();
    const month = String(now.getMonth() + 1).padStart(2, '0');
    const day = String(now.getDate()).padStart(2, '0');
    const currentDate = `${year}-${month}-${day}`;
    return currentDate;
  }

  // 페이지 로드 시 현재 날짜를 rev_date 필드에 설정
  window.onload = function() {
    document.getElementById('currentDate').value = getCurrentDate();
  };
</script>
</head>
<body>

<section>

<div class="rev_my"> 
			<b class="cont-user-my">리뷰 작성</b>
	</div>

<form id="reviewinsert" action="rev_insertR.do" method="post">
<div class="info">

					<div class="reviewView-line">
						<div class="rev_top">
							
								
									<select name="rev_score">
          								<option value="1" ${reviewVO.rev_score == '1' ? 'selected' : ''}>1점</option>
         								<option value="2" ${reviewVO.rev_score == '2' ? 'selected' : ''}>2점</option>
          								<option value="3" ${reviewVO.rev_score == '3' ? 'selected' : ''}>3점</option>
          								<option value="4" ${reviewVO.rev_score == '4' ? 'selected' : ''}>4점</option>
          								<option value="5" ${reviewVO.rev_score == '5' ? 'selected' : ''}>5점</option>
        							</select>
						</div>

						
						<div class="rev_cont">
			
							<div class="rev_text">
								<input type="text" name="rev_contents">
							</div>			
							
						</div>
						 	<input type="hidden" name="rev_date" id="currentDate" readonly>
        					<input type="hidden" name="m_id" value="${param.m_id}">
        					<input type="hidden" name="type" value="${param.re_type}">
        					

						<div>
							<button onclick="formSubmit();" class="btn-tazone">리뷰작성</button><br>
						</div>	
					</div>
			</div> 
			
  
</form>
</section>
<script>
		function formSubmit(){
			$("#reviewinsert").submit();
		}
</script>
</body>
</html>