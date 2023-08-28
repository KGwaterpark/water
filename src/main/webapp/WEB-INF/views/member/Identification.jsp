<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%  
     long currentTime = new Date().getTime();
     int idenid = (int)currentTime;
     %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>본인확인</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/loading.css" />


<meta charset="UTF-8">
</head>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/img/favicon.ico">
<body>
<script>
//교차 사이트 요청에서 쿠키를 보내는 경우 (제3자 사용을 허용)
document.cookie = "Secure=Secure; SameSite=None; Secure";

//// 교차 사이트 요청에서 쿠키를 보내지 않는 경우
//document.cookie = "Strict=Strict; SameSite=Strict";
//// 또는
document.cookie = "SameSite=Lax";

$(function(){
 var IMP = window.IMP; // 생략 가능
 IMP.init('imp55773133'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

 IMP.certification({
     merchant_uid: <%=idenid%>
 }, function(rsp) {
     if (rsp.success) {
         jQuery.ajax({
             url: "che.do",
             method: "POST",
             headers: { "Content-Type": "application/json" },
             data: JSON.stringify({ 'imp_uid': rsp.imp_uid })
          }).done((data) => {
        	  var name_tel = data; 
              var name = name_tel[0];
              var tel = name_tel[1];
              var birthday = name_tel[2]; // 생년월일 추가
			console.log(name,tel,birthday)
			
              if (name_tel[3]===undefined || name_tel[3]===null) { // name과 tel 데이터가 정상적으로 존재하는지 확인
             	 console.log(name_tel[3]);
             	 location.href = "memberInsertForm.do?name=" + name + "&tel=" + tel +"&birthday=" + birthday ;
              } else {
             	 // 이미 가입된 회원일 때
             	 console.log(name_tel[3]);
             	 if(name_tel[3].includes('NAVER')){
             		 alert("SNS로 가입된 계정입니다. SNS로그인 기능을 이용해주세요!");
             		location.href = "main.do";
             	 }else{
				window.open("alReady.do?name=" + name + "&tel=" + tel, '_blank', 'width=500,height=400');
             	 }
              }
          })
     } else {
         msg = '인증에 실패하였습니다.';
         msg += '실패 사유 : ' + rsp.error_msg;
         location.href="login.do";
         alert(msg);
     }
 }); 
});
</script>
 
<h1> </h1>
<div class="loading-container">
    <div class="loading"></div>
    <div id="loading-text">loading</div>
</div>
<h2></h2>
<!--// Link Attribution -->
<a href="#"  id="link">KGWaterPark.com</a>
</body>
</html>