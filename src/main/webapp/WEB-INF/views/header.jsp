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
    <a href="main.do"><img  class="logo" src="${pageContext.request.contextPath }/resources/img/main.png"></a>
    <nav class="headnav">
      <ul><!-- 1 -->
        <li><a href="#">워터파크</a><!-- 2 -->
          <ul><!-- 3 -->
            <li>워터파크 안내<!-- 4 -->
            	<ul class="ul_1"><!-- 5 -->
	                <li><a href="parkMap.do" onclick="window.open(this.href, '_blank', 'width=790, height=600'); return false;">워터파크 전체보기</a></li><!-- 6 -->
	              
                </ul><!-- 5 -->
                </li>
            <li>워터파크 이용안내
              <ul class="ul_1"><!-- 5 -->
                <li><a href="ibjang.do">입장안내</a></li><!-- 6 -->
                <li><a href="2young.do">운영시간 안내</a></li><!-- 6 -->
              </ul><!-- 5 -->
            </li><!-- 4 -->
            <li>워터파크 요금표<!-- 4 -->
              <ul class="ul_1"><!-- 5 -->
                <li><a href="price.do">요금이용안내</a></li><!-- 6 -->
              </ul><!-- 5 -->
            </li><!-- 4 -->
         
            <li>워터파크 부대시설<!-- 4 -->
              <ul class="ul_1"><!-- 5 -->
                <li><a href="에러페이지.do">사우나존</a></li>
                <li><a href="#">빌리지</a></li>
                <li><a href="#">편의시설</a></li>
              </ul><!-- 5 -->
            </li><!-- 4 -->
            <li>워터파크 후기
              <ul class="ul_1">
                <li><a href="water_review.do">후기</a></li>
              </ul>
            </li>
          </ul><!-- 3 -->
        </li><!-- 2 -->
         <li><a href="#">리조트</a><!-- 2 -->
          <ul><!-- 3 -->
            <li>리조트 안내<!-- 4 -->
            	<ul class="ul_1"><!-- 5 -->
	                <li><a href="parkMap.do" onclick="window.open(this.href, '_blank', 'width=790, height=600'); return false;">패키지 전체보기</a></li><!-- 6 -->
	              
                </ul><!-- 5 -->
                </li>
            <li>리조트 이용안내
              <ul class="ul_1"><!-- 5 -->
                <li><a href="#">이용안내 (스위트)</a></li><!-- 6 -->
                <li><a href="#">이용안내 (패밀리)</a></li><!-- 6 -->

              </ul><!-- 5 -->
            </li><!-- 4 -->
            <li>리조트 요금표<!-- 4 -->
              <ul class="ul_1"><!-- 5 -->
                <li><a href="price.do">요금이용안내</a></li><!-- 6 -->
              </ul><!-- 5 -->
            </li><!-- 4 -->
            <li>리조트 예약안내<!-- 4 -->
              <ul class="ul_1"><!-- 5 -->
                <li><a href="#">스위트스탠다드</a></li><!-- 6 -->
                <li><a href="#">스위트프리미엄</a></li><!-- 6 -->
                <li><a href="#">패밀리스탠다드</a></li><!-- 6 -->
                <li><a href="#">패밀라프리미엄</a></li><!-- 6 -->
              </ul><!-- 5 -->
            </li><!-- 4 -->
            <li>리조트 후기<!-- 4 -->
              <ul class="ul_1"><!-- 5 -->
                <li><a href="resort_review.do">후기</a></li>

              </ul><!-- 5 -->
            </li><!-- 4 -->
          </ul><!-- 3 -->
        </li><!-- 2 -->
              <li><a href="#">패키지</a><!-- 2 -->
          <ul><!-- 3 -->
            <li>패키지 안내<!-- 4 -->
            	<ul class="ul_1"><!-- 5 -->
	                <li><a href="parkMap.do" onclick="window.open(this.href, '_blank', 'width=790, height=600'); return false;">패키지 전체보기</a></li><!-- 6 -->
	              
                </ul><!-- 5 -->
                </li>
            <li>패키지 이용안내
              <ul class="ul_1"><!-- 5 -->
                <li><a href="#">이용안내 (스위트)</a></li><!-- 6 -->
                <li><a href="#">이용안내 (패밀리)</a></li><!-- 6 -->
				<li><a href="#">이용안내 (패밀리)</a></li><!-- 6 -->
              </ul><!-- 5 -->
            </li><!-- 4 -->
            <li>패키지 요금표<!-- 4 -->
              <ul class="ul_1"><!-- 5 -->
                <li><a href="price.do">요금이용안내</a></li><!-- 6 -->
              </ul><!-- 5 -->
            </li><!-- 4 -->
            <li>패키지 예약안내<!-- 4 -->
              <ul class="ul_1"><!-- 5 -->
                <li><a href="#">스위트스탠다드</a></li><!-- 6 -->
                <li><a href="#">스위트프리미엄</a></li><!-- 6 -->
                <li><a href="#">패밀리스탠다드</a></li><!-- 6 -->
              </ul><!-- 5 -->
            </li><!-- 4 -->
            <li>패키지 후기<!-- 4 -->
              <ul class="ul_1"><!-- 5 -->
                <li><a href="pakage_review.do">후기</a></li>

              </ul><!-- 5 -->
            </li><!-- 4 -->
          </ul><!-- 3 -->
        </li><!-- 2 -->
        
     <li><a href="book.do">예약하기</a><!-- 2 -->
          <ul><!-- 3 -->
          <li><a href="book.do?">리조트 예약</a></li><!-- 4 -->
            <li><a href="book.do?menu=waterpark">워터파크 예약</a><!-- 4 --></li>
            <li><a href="book.do?menu=package">패키지 예약</a><!-- 4 --></li>
          </ul><!-- 3 -->
        </li><!-- 2 -->
      </ul><!-- 1 -->
    </nav>
    

  <!--  "window.open('alReady.do', this.href, '_blank', 'width=790, height=600'); return false;" -->

<!--    <button class="login_btn" id="admin-button" type="button" 
                onclick="location.href='payfin.do'">payfin</button> -->
                
<%-- loginsession에서 MemberLogin 객체를 가져옴 --%>

<c:set var="memberLogin" value="${loginsession}" />

<%-- m_id 값만 가져와서 변수에 저장 --%>
<c:set var="m_id" value="${memberLogin.m_id}" />

<%-- 로그인 상태에 따라 출력하는 내용 분기 처리 --%>
<%if (session.getAttribute("loginsession") == null) { %>
    <button class="login_btn" id="login-button" type="button" 
            onclick="location.href='login.do'">Login</button>
<%} else { %>
    <%-- 아이디가 "ssuuji"일 때 관리자 버튼을 보여줌 --%>
    <c:if test="${m_id eq 'NAVERVmjOqtJLkdGdY6n5PyvurtE8oQmZDkbw-yvbiqfRM4E'}">
        <button class="login_btn" id="admin-button" type="button" 
                onclick="location.href='admin.do'">Admin</button>
    </c:if>
    <c:if test="${m_id ne 'NAVERVmjOqtJLkdGdY6n5PyvurtE8oQmZDkbw-yvbiqfRM4E'}">
        <button class="login_btn" id="mypage-button" type="button" 
                onclick="location.href='mypage.do'" >MyPage</button>
    </c:if>
            
    <button class="login_btn" id="logout-button" type="button" 
            onclick="location.href='logout.do'">Logout</button>
<%} %>



    
  </header>
</body>
</html>
