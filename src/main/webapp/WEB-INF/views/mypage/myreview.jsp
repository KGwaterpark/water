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
	<div class="rev_my"> 
			<b class="cont-user-my">나의 리뷰보기</b>
	</div>
    <%-- loginsession에서 MemberLogin 객체를 가져옴 --%>
    <c:set var="memberLogin" value="${loginsession}" />

    <%-- m_id 값만 가져와서 변수에 저장 --%>
    <c:set var="m_id" value="${memberLogin.m_id}" />

 

      <c:forEach var="rev" items="${revlist}">
         <c:if test="${rev.m_id eq m_id}">
          <div class="info">
            <div>
                  		${rev.type}
                  <script>
                        document.write(convertToStars(${rev.rev_score}));
                  </script>
            </div>
            <div>       
                     
                   <span>
                 	 ${rev.rev_date}
                  </span>
            </div>
                  
                  <div>
                  <a href="getrevinfo.do?rev_contents=${rev.rev_contents}">${rev.rev_contents}</a>
           		  </div>
          </div>
         </c:if>
      </c:forEach>


</section>
</body>
</html>