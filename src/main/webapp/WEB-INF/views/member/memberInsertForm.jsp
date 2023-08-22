<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="${pageContext.request.contextPath}/resources/js/login.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/join.js"></script> 
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css"/>
<script>
//휴대폰 하이픈 - 넣기
window.onload = function() {
	  let input = document.getElementById('tel');
	  if (input) {
	    let telValue = input.value.replace(/[^0-9]/g, '');
	    let formattedTel = telValue.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
	    input.value = formattedTel;
	  }
	};
</script>
</head>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/img/favicon.ico">
<body>
<div class="container right-panel-active">
  <!-- Sign Up -->
  <div class="container__form container--signup">
  
    <form action="memberjoin.do" class="form" id="form1" method="post" name="join" onsubmit="return checkInput();">
       <button class="xbtnM" onclick="location.href='main.do';">
       <img src="${pageContext.request.contextPath}/resources/img/bx.png"></button>
      <h2 class="form__title1">회원가입</h2>
      
      <input type="text" placeholder="아이디" class="id" id="m_id"
				maxlength="13" name="m_id" required> 
	  <button type="button" class="idch" id="idCheck" onclick="fn_idCheck()">중복확인</button>
      <input type="password" placeholder="비밀번호" class="input" name="m_pw" id="pw" required/>
      <input type="password" placeholder="비밀번호확인" class="input" name="m_pwck" id="pwck" required/>
      <input type="email" placeholder="이메일" class="input"name="m_email" id="email" required/>
      <input type="text" placeholder="이름" class="input" name="m_name" id="name" value="${name}" readonly required/>
      <input type="text" placeholder="전화번호" class="input" name="m_tel" id="tel" value="${tel}" readonly required />


      <input type="submit" value="회원가입" class="btn">
    </form>
  </div>

    <!-- Sign In -->
  <div class="container__form container--signin">
    <form action="loginprocess.do" class="form" id="form2">
      <h2 class="form__title">로그인</h2>
      <input type="text" name="id" placeholder="Id" class="input" />
      <input type="password" name="pw" placeholder="Password" class="input" />
      
       <!-- 실패 메시지 요소 -->
    <p id="loginErrorMessage" class="error-message"></p>
      
            
         <div class="idpw">
      <a href="#" class="link">아이디찾기</a> 
        <span class="idpwspace">|</span>
      <a href="#" class="link">비밀번호찾기</a> 
      </div>
      
      <input type="submit" value="로그인" class="btn"><br><br>
      
    <!-- 네이버아이디로 로그인 -->
	<div id="naver_id_login" style="text-align:center"><a href="${naverurl}">
	<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>     
 
    </form>
  </div>

  <!-- Overlay -->
  <div class="container__overlay">
    <div class="overlay">
      <div class="overlay__panel overlay--left">
        <button class="btn" id="signIn">로그인</button>
      </div>
      
      
           <div class="overlay__panel overlay--right">
                           <button class="xbtnL" onclick="location.href='main.do';">
                           <img src="${pageContext.request.contextPath}/resources/img/wx.png"></button>
        <h1></h1><br><br><br><br><br><br><br><br><br>
        <button class="btn" id="signUp">회원가입</button>
      <br><br><br><br><br><br><br><br><br><br><br><br>
        

      </div>
    </div>
  </div>
</div>




</body>
</html>