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
        
        border:1 px;
    }
    
    
    
    
    
 .review{
 text-align:left;
    }
    
#span_review{
font-size: 40px;
font-weight: bold;
}    
    
.star {
  display: inline-block;
  width: 40px;
  height: 50px;
  cursor: pointer;
  font-size: 50px;
  margin: 0;
  padding: 0;
  position: relative;
}

.star:before {
  content: "\2606"; /* 빈 별 모양 유니코드 문자 */
  display: block;
  width: 40px;
  height: 50px;
  line-height: 1;
  color: gray; /* 회색으로 초기화 */
  transition: color 0.3s;
  position: absolute;
  top: 0;
  left: 0;
  z-index: -1;
}

.star.highlight:before {
  content: "\2605"; /* 채워진 별 모양 유니코드 문자 */
  color: gold;
  z-index: 1;
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
  
  
 
  
  
  document.addEventListener("DOMContentLoaded", function () {
	  const stars = document.querySelectorAll(".star");
	  const rating = document.getElementById("rating");
	  const revScoreInput = document.getElementById("rev_score");
	  
	  
	  let selectedValue = 1;
	  
	  highlightStars(selectedValue);
	  
	  
	  stars.forEach((star) => {
	    star.addEventListener("mouseover", () => {
	      resetStars();
	      const value = parseInt(star.getAttribute("data-value"));
	      highlightStars(value);
	    });

	    star.addEventListener("mouseout", () => {
	      resetStars();
	      highlightStars(selectedValue);
	    });

	    star.addEventListener("click", () => {
	      selectedValue = parseInt(star.getAttribute("data-value"));
	      revScoreInput.value = selectedValue;
	      resetStars();
	      highlightStars(selectedValue);
	    });
	  });

	  function highlightStars(value) {
	    for (let i = 0; i < value; i++) {
	      stars[i].classList.add("highlight");
	    }
	  }

	  function resetStars() {
	    stars.forEach((star) => {
	      star.classList.remove("highlight");
	    });
	  }

	 
	  
	});

  
</script>
</head>
<body>

<section>

<div class="rev_my"> 
			<b class="cont-user-my">리뷰 작성</b>
	</div>

<form id="reviewinsert" action="rev_insertW.do" method="post">
<div class="info">

<div class="reviewView-line">
  <div class="review">
    <div class="rating" id="rating"><span id="span_review">별점</span>
      <span class="star" data-value="1"></span>
      <span class="star" data-value="2"></span>
      <span class="star" data-value="3"></span>
      <span class="star" data-value="4"></span>
      <span class="star" data-value="5"></span>
    </div>
    <input type="hidden" name="rev_score" id="rev_score">
  </div>
</div>
<br>
						
						<div class="rev_cont">
			
							<div class="rev_text">
								<input type="text" name="rev_contents">
							</div>			
							
						</div>
						 	<input type="hidden" name="rev_date" id="currentDate" readonly>
        					<input type="hidden" name="m_id" value="${param.m_id}">
        					<input type="hidden" name="type" value="${param.type}">

						<div>
							<button onclick="formSubmit();" class="btn-tazone">리뷰작성</button><br>
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