<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- JavaScript 추가 -->
<script>
function convertToStars(score) {
    let fullStars = Math.floor(score); // Calculate the number of full stars
    let remainder = score - fullStars; // Calculate the decimal part

    let starString = '';

    // Full stars
    for (let i = 0; i < fullStars; i++) {
      starString += '&#9733; '; // Filled star character
    }

    // Half star (if the decimal part is greater than or equal to 0.5)
    if (remainder >= 0.1) {
      starString += ' &#9733; '; // Half-filled star character (★½)
    } 

    // Empty stars
    for (let i = 0; i < 5 - Math.ceil(score); i++) {
      starString += '☆ '; // Empty star character (☆)
    }

    return starString;
  }
</script>

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
    .info *,
    .score { 
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
  
   .image-container {
        display: flex;
        align-items: center; 
    }

    .rev_waterimg {
     
        max-width: 200px;
        max-height: 200px;
       
        margin-right: 20px;
    }


    .score {
        position: absolute;
        display: flex;
        align-items: center;
     	top: 120px;
        left: 20px;
    }

  
</style>
<script src="${pageContext.request.contextPath }/resources/js/slide.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/slide.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/rev_star.css" />
</head>
<body>

<header class="he2"><%@ include file="../header2.jsp" %></header>
<header><%@ include file="../header.jsp" %></header>

<section>

    <c:set var="sumScores" value="0" />
    <c:set var="numReviews" value="0" />

	<div class="rev_my"> 
        <b class="cont-user-my">리뷰</b>
    </div>
    
    <c:forEach var="resort" items="${revlist}">
    
        <c:set var="sumScores" value="${sumScores + resort.rev_score}" />
        <c:set var="numReviews" value="${numReviews + 1}" />

        

        <div class="info">
            <div>
                ${resort.m_id}
                <script>
                    document.write(convertToStars(${resort.rev_score}));
                </script>
                ${resort.rev_date}
            </div>

            <div>
                <a>${resort.rev_contents}</a>
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
            <p>평점</p>
            <script>
                document.write(convertToStars(${averageScore}));
            </script>
        </div>
 
</section>

</body>
</html>