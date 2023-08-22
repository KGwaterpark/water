<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
    if (remainder >= 0.5) {
      starString += ' &#9733; '; // Half-filled star character (★½)
    } else if (remainder > 0) {
      // Less than half star, fill with empty star
      starString += '&#189; '; // Empty star character (½)
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
</style>

</head>
<body>
<section>

    <c:set var="sumScores" value="0" />
    <c:set var="numReviews" value="0" />

	<div class="rev_my"> 
        <b class="cont-user-my">리뷰</b>
    </div>
    
    <c:forEach var="water" items="${revlist}">
    
        <c:set var="sumScores" value="${sumScores + water.rev_score}" />
        <c:set var="numReviews" value="${numReviews + 1}" />

        

        <div class="info">
            <div>
                ${water.m_id}
                <script>
                    document.write(convertToStars(${water.rev_score}));
                </script>
                ${water.rev_date}
            </div>

            <div>
                <%-- <a>${water.rev_contents}</a> --%>
                 <a href="admingetrevinfo.do?rev_contents=${water.rev_contents}">${water.rev_contents}</a>
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
            <p>총평점</p>
            <script>
                document.write(convertToStars(${averageScore}));
            </script>
        </div>
 
</section>
</body>
</html>