<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin.css" />

</head>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/img/favicon.ico">
<body onload="loadPage('adminLoding.do')"> 

<section class="adsect">

  <div id="header">
    <div class="adblink"><a href="admin.do">KG WaterPark</a></div>
    <h1>관리자 페이지</h1>
    <div class="right-buttons">
      <button id="adbtn" class="main-button" onclick="location.href='main.do';">메인으로</button>
      <button id="adbtn" class="logout-button" onclick="logout()">로그아웃</button>
    </div>
  </div>
      

  
  <div id="container">
  
    <div id="sidebar">
      <h3 class="admenu">관리자 메뉴</h3>
      <hr>
      <ul>
        
        <li class="submenu">
          <a href="#" onclick="toggleSubMenu('submenu1')">등록관리</a>
          <ul id="submenu1">
  
            <li><a href="#" onclick="loadPage('gongjiWrite.do')">공지사항등록</a></li>
            <li><a href="#" onclick="loadPage('AgetAllGongji.do')">공지사항목록</a></li>
          </ul>
        </li>
       
       
      <li class="submenu">
          <a href="#" onclick="toggleSubMenu('submenu2')">예약관리</a>
          <ul id="submenu2">

            <li><a href="#" onclick="loadPage('AdBookInfoW.do')">워터파크예약내역</a></li>
            <li><a href="#" onclick="loadPage('AdBookInfoR.do')">리조트예약내역</a></li>
            <li><a href="#" onclick="loadPage('AdBookInfoP.do')">패키지예약내역</a></li>
           <li><a href="#" onclick="loadPage('paymentAll.do')">결제조회</a></li>

          </ul>
        </li>
        
        <li class="submenu">
          <a href="#" onclick="toggleSubMenu('submenu3')">리뷰관리</a>
          <ul id="submenu3">
             <li><a href="#" onclick="loadPage('adminreviewW.do')">워터파크리뷰</a></li>
            <li><a href="#" onclick="loadPage('adminreviewR.do')">리조트리뷰</a></li>
            <li><a href="#" onclick="loadPage('adminreviewP.do')">패키지리뷰</a></li>
          </ul>
        </li>
        
        <li class="submenu">
          <a href="#" onclick="toggleSubMenu('submenu4')">회원관리</a>
          <ul id="submenu4">
            <li><a href="#" onclick="loadPage('memberAll.do')">회원조회 및 수정</a></li>
             <li><a href="#" onclick="loadPage('memberImg.do')">회원연령조회</a></li>
			<li><a href="#" onclick="loadPage('MPayment.do')">결제수단</a></li>
          </ul>
        </li>

      </ul>
    </div>
  
    <div id="content">
        

      <iframe id="pageFrame" src=""></iframe>
    </div>
</div>
  
  </section>
  
  <script>
    function loadPage(url) {
      document.getElementById("pageFrame").src = url;
    }
    
    function toggleSubMenu(submenuId) {
      var submenu = document.getElementById(submenuId);
      if (submenu.style.display === 'block') {
        submenu.style.display = 'none';
      } else {
         
         
        submenu.style.display = 'block';
      }
    }
    
    function logout() {
      sessionStorage.removeItem('id');
      alert("로그아웃 되었습니다.");
      window.location.href = "logout.do";
    }
    
    function goToMain() {
        window.location.href = "";
      }
  </script>

</body>
</html>