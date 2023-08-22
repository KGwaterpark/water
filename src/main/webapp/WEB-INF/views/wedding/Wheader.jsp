<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">



  
  <title>나는 헤더</title>
  <script src="${pageContext.request.contextPath }/resources/js/header_js.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.min.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/header_style.css" />

<script>
    function login1() {
    	
    	window.open('alReady.do',"", 'width=500, height=400'); 
        }
</script>

</head>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/img/favicon.ico">
<body>
  <header>
    <a href="wedding.do"><span class="sp1">KG</span><br><span class="sp2">&nbsp;&nbsp;Convention</span></a>
    <nav class="headnav">
      <ul><!-- 1 -->
        <li><a href="#">웨딩홀</a><!-- 2 -->
          <ul><!-- 3 -->
            <li>워터파크 안내<!-- 4 -->
            	<ul class="ul_1"><!-- 5 -->
	                <li><a href="parkMap.do" onclick="window.open(this.href, '_blank', 'width=790, height=600'); return false;">워터파크 전체보기</a></li><!-- 6 -->
	              
                </ul><!-- 5 -->
                </li>
            <li>워터파크 이용안내
              <ul class="ul_1"><!-- 5 -->
                <li><a href="ibjang.do">입장안내</a></li><!-- 6 -->
                <li><a href="#">실내 아쿠아존 이용안내</a></li><!-- 6 -->
                <li><a href="#">야외 익스트림존 이용안내</a></li><!-- 6 -->
                <li><a href="2young.do">운영시간 안내</a></li><!-- 6 -->
              </ul><!-- 5 -->
            </li><!-- 4 -->
            <li>워터파크 요금표<!-- 4 -->
              <ul class="ul_1"><!-- 5 -->
                <li><a href="price.do">요금이용안내</a></li><!-- 6 -->
              </ul><!-- 5 -->
            </li><!-- 4 -->
            <li>워터파크 어트랙션<!-- 4 -->
              <ul class="ul_1"><!-- 5 -->
                <li><a href="#">아쿠아존</a></li><!-- 6 -->
                <li><a href="#">익스트림존</a></li><!-- 6 -->
                <li><a href="#">다이나믹존</a></li><!-- 6 -->
                <li><a href="#">슬라이드존</a></li><!-- 6 -->
              </ul><!-- 5 -->
            </li><!-- 4 -->
            <li>워터파크 부대시설<!-- 4 -->
              <ul class="ul_1"><!-- 5 -->
                <li><a href="#">사우나존</a></li>
                <li><a href="#">빌리지</a></li>
                <li><a href="#">편의시설</a></li>
              </ul><!-- 5 -->
            </li><!-- 4 -->
          </ul><!-- 3 -->
        </li><!-- 2 -->
        <li><a href="#">웨딩복</a>
        	<ul>
        		<li>객실 리뷰<!-- 4 -->
            		<ul class="ul_1">
	         	       <li><a href="resort_review.do">리뷰보기</a></li><!-- 6 -->
            	    </ul><!-- 5 -->
                </li>
        	</ul>
        </li>
        <li><a href="#">피로연</a>
        <ul>
        		<li>객실 리뷰<!-- 4 -->
            		<ul class="ul_1">
	         	       <li><a href="kabana_review.do">리뷰보기</a></li><!-- 6 -->
            	    </ul><!-- 5 -->
                </li>
        	</ul>
        </li>
      </ul><!-- 1 -->
    </nav>
    
    

<!-- 	<button class="login_btn" id="login1" type="button" 
				onclick="login1()">alReady</button>  -->
  <!--  "window.open('alReady.do', this.href, '_blank', 'width=790, height=600'); return false;" -->
  
  
  
				
				 <%-- loginsession에서 MemberLogin 객체를 가져옴 --%>
<c:set var="memberLogin" value="${loginsession}" />

<%-- m_id 값만 가져와서 변수에 저장 --%>
<c:set var="m_id" value="${memberLogin.m_id}" />

<%-- 로그인 상태에 따라 출력하는 내용 분기 처리 --%>
<%if(session.getAttribute("loginsession") == null){ %>
    <button class="login_btn" id="login-button" type="button" 
            onclick="location.href='login.do'">Login</button>
<%} else { %>
    <button class="login_btn" id="mypage-button" type="button" 
            onclick="location.href='BookInfo.do'" >마이페이지</button>
    <button class="login_btn" id="logout-button" type="button" 
            onclick="location.href='logout.do'">Logout</button>
<%} %>
    
  </header>
</body>
</html>
