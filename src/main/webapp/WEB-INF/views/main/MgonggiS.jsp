<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 리스트</title>

</head>
     
<style>
  * {
  text-decoration: none;
    color: inherit; /* 링크의 색상 제거 */
}
/* 공지사항 */
.maintable_5{
   width: 1380px;
   height: 60px;
   align-content: center;
   justify-content: center;
   margin: auto;

   font-size: 25px;
   font-weight: bold;
   padding-bottom: 5px;
   
}

.slider-container {
  overflow: hidden;
  height: 35px; /* 한 줄의 높이에 맞게 조절하세요 */
}
.maintable4{
   width: 1380px;
   height: 30px;
   align-content: center;
   justify-content: center;
   margin: auto;
    animation: slide-up 12s linear infinite;
    margin-top: 0;
    margin-bottom: 0;
    border-collapse: collapse;
}

.go_span{
font-size: 40px;
font-weight: bold;
}



.admintd{
font-size: 30px;

}

.go_hr{
width: 1400px;
font-weight: bold;
}

@keyframes slide-up {
  0%, 25% {
    transform: translateY(-45px);
  }
  25%, 50% {
    transform: translateY(-90px); /* 시작 높이에 맞게 조절하세요 */
  }
  50%, 75% {
    transform: translateY(-135px); /* 2번 줄의 높이에 맞게 조절하세요 */
  }
   75%,100% {
    transform: translateY(-180px); /* 3번 줄의 높이에 맞게 조절하세요 */
  }
} 
</style>
<body>
   
  <hr class="go_hr">
<table class="maintable_5">
  <tr><td width="1300"><span class="go_span">공지사항</span></td><td><h6><a href="">+more</a></h6></td></tr>
  </table>
       <div class="slider-container">
      <table class="maintable4" >
            <tr><td width="200"> <c:forEach var="gongji" items="${getAllGongji}"></td></tr>
                <tr>
                    <form method="post" >
                        <td class="admintd"><a href="MgongjiGet.do?g_title=${gongji.g_title}">${gongji.g_date}</a></td>
                        <td class="admintd"><a href="MgongjiGet.do?g_title=${gongji.g_title}">${gongji.g_title}</a></td>
                        <td class="admintd"><a href="MgongjiGet.do?g_title=${gongji.g_title}">
                            ${fn:substring(gongji.g_content, 0, 20)}${fn:length(gongji.g_content) > 20 ? '.......' : ''}
                        </a></td>
                    </form>
                    <br>
                </tr>
                <input type="hidden" value="${gongji.g_id}" name="g_id">
            </c:forEach>
        </tbody>
    </table>
     </div>
     <hr class="go_hr">
</body>
</html>
