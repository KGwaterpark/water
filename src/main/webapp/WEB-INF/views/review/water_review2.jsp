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
<script src="${pageContext.request.contextPath }/resources/js/slide.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/slide.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/rev_star.css" />
<script src="${pageContext.request.contextPath }/resources/js/reviewScript.js"></script>
</head>
<body>

<header class="he2"><%@ include file="../header2.jsp" %></header>
    <header><%@ include file="../header.jsp" %></header>

   <section>
        <img class="rev_waterimg" src="${pageContext.request.contextPath}/resources/img/waterpark.jpg">
        

        <%-- loginsession에서 MemberLogin 객체를 가져옴 --%>
        <c:set var="memberLogin" value="${loginsession}" />

        <%-- m_id 값만 가져와서 변수에 저장 --%>
        <c:set var="m_id" value="${memberLogin.m_id}" />

        <li>
            <%-- 변수 초기화 --%>
            <c:set var="sumScores" value="0" />
            <c:set var="numReviews" value="0" />

            <c:forEach var="water" items="${revlist}">
                <%-- 각 리뷰의 평점을 누적하여 더함 --%>
                <c:set var="sumScores" value="${sumScores + water.rev_score}" />
                <%-- 리뷰의 개수를 세기 위해 변수를 증가시킴 --%>
                <c:set var="numReviews" value="${numReviews + 1}" />
                
               
				<div class="rev_my"> 
            		<b class="cont-user-my">리뷰</b>
        		</div>

                <div class="info">
                    <div>
                        ${water.m_id}
                        <script>
                            // JavaScript 함수를 호출하여 별점 표시
                            document.write(convertToStars(${water.rev_score}));
                        </script>
                        ${water.rev_date}
                    </div>
                  
                    <div>
                        <a>${water.rev_contents}</a>
                    </div>
                </div>
            </c:forEach>
 				<c:choose>
    			<c:when test="${numReviews > 0}">
        			<div>
            			<script>
            			 		document.write(convertToStars(${sumScores / numReviews}));
            			 </script>
        			</div>
    			</c:when>
    			<c:otherwise>
        			<%-- 리뷰가 없는 경우 --%>
        			<div>
            			 리뷰가 없습니다.
        			</div>
    			</c:otherwise>
				</c:choose>

            
      </li>
   </section>

</body>
</html>