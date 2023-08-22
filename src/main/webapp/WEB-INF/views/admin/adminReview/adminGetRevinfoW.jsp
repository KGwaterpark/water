<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰수정</title>

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

</head>
<body>


<section>
	<div class="rev_my"> 
			<b class="cont-user-my">관리자리뷰</b>
	</div>

	<form id="reviewForm" action="deleteadminRevinfoW.do" method="post">
 
		<div class="info">

					<div class="reviewView-line">
						<div class="rev_top">
								${reviewVO.type}
								${reviewVO.rev_date}
								
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
								<input type="text" name="rev_contents" value="${reviewVO.rev_contents}">
							</div>			
							
						</div>
						 	<input type="hidden" name="type" value="${reviewVO.type}" readonly>
						 	<input type="hidden" name="rev_date" value="${reviewVO.rev_date}" readonly>
						 	<input type="hidden" name="rev_id" value="${reviewVO.rev_id}">
						 	<input type="hidden" name="m_id" value="${reviewVO.m_id}">
						<div>
							<button onclick="forSubmitdelete();" class="btn-tazone">리뷰삭제</button><br>
						</div>	
					</div>
			</div> 

	</form>

</section>

<script>
function forSubmitdelete() {
    var encodedRevId = encodeURIComponent("${reviewVO.rev_id}");
    var url = "deleteadminRevinfoW.do?rev_id=" + encodedRevId;
    window.location.href = url;
}


</script>
</body>
</html>