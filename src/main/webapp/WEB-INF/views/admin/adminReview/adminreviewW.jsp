<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>



<!DOCTYPE html>
<html>
<script>
function convertToStars(score) {
    let percentage = (score / 4) * 100; // 점수를 백분율로 변환
    let filledStars = Math.floor((percentage / 100) * 4); // 총 5개 별 중에서 몇 개의 별이 채워질지 계산
    let remainingPercentage = (percentage / 100) * 4 - filledStars; // 남은 백분율로 얼마나 채워질지 계산
    
    let starsHTML = '';
    
    // 채워진 별 추가
    for (let i = 0; i < filledStars; i++) {
        starsHTML += '<i class="fa fa-star"></i> ';
    }
    
    // 0.1 단위로 반 별 추가 (만약 남은 백분율이 0.1 이상이면)
    if (remainingPercentage >= 0.1) {
        starsHTML += '<i class="fa fa-star-half"></i> ';
    }
    // 0.1 단위로 빈 별 추가해서 총 5개로 완성
    for (let i = filledStars + (remainingPercentage >= 0.1 ? 1 : 0); i < 5; i++) {
        starsHTML += '<i class="fa fa-star-o"></i> ';
    }
    
    return starsHTML;
}
</script>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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


  .review-container {
    margin-bottom: 10px;
  }

 
  .review-content a {
    margin-bottom: 100px; 
  }

    .score{
font-size: 40px;
font-weight: bold;
  
  }
   
    .fa-star  {
        color: gold; /* 별 아이콘의 색상을 gold로 설정 */
    }
    .fa-star-half  {
        color: gold; /* 별 아이콘의 색상을 gold로 설정 */
    }


</style>

</head>
<body>
<section>

    <c:set var="sumScores" value="0" />
    <c:set var="numReviews" value="0" />

	<div class="rev_my"> 
        <b class="cont-user-my">워터파크 리뷰</b>
    </div>
    
    <c:forEach var="water" items="${revlist}">
    
        <c:set var="sumScores" value="${sumScores + water.rev_score}" />
        <c:set var="numReviews" value="${numReviews + 1}" />

        

        <div class="info">
            <div>
                ${water.m_id}
       
                ${water.rev_date}
            </div>

            <div>
                <%-- <a>${water.rev_contents}</a> --%>
                 <a href="admingetrevinfoW.do?rev_contents=${water.rev_contents}">${water.rev_contents}</a>
            </div>
        </div>
    </c:forEach>

    
    <c:choose>
        <c:when test="${numReviews > 0}">
            <c:set var="averageScore" value="${sumScores / numReviews}" />
        </c:when>
        <c:otherwise>
           
            <c:set var="averageScore" value="0" />
        </c:otherwise>
    </c:choose>
    

<div class="score">
    <span>평점</span>
    <span class="score1">
        <script>
            let averageScore = ${averageScore}; // JSP 변수를 가져옴
            let starsHTML = convertToStars(averageScore);
            
            document.write(starsHTML);

            document.write(" " + averageScore.toFixed(1) + "점"); // 소수 둘째 자리에서 반올림한 점수를 출력
        </script>
    </span>
</div>


</section>
</body>
</html>