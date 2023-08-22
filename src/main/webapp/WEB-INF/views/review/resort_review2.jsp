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
<script src="${pageContext.request.contextPath }/resources/js/slide.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/slide.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/rev_star.css" />
</head>
<body>

<header class="he2"><%@ include file="../header2.jsp" %></header>
<header><%@ include file="../header.jsp" %></header>

<section>
  <img class="rev_waterimg" src="${pageContext.request.contextPath }/resources/img/resort22.jpg">

  <h1>리뷰</h1>

  <table border=0>
    <c:forEach var="resort" items="${revlist}">
      <tr>
        <td>
          ${resort.m_id}
          <script>
            // JavaScript 함수를 호출하여 별점 표시
            document.write(convertToStars(${resort.rev_score}));
          </script>
          ${resort.rev_date}
        </td>
      </tr>
      <tr>
        <td width="900"><textarea class="water_rev" type="text" id="reviewContents">${resort.rev_contents}</textarea></td>
      </tr> 
    </c:forEach>
  </table>
</section>

</body>
</html>