<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.dal_btn{
padding-left: 60px;

}
.alname{
font-size: 50px;
font-weight: bold;
padding-left: 20px;
}
.alname2{
font-size: 30px;
}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/service_style.css"/>
<script>
    function login11() {
    	window.close();
    	opener.location.href='login.do'; 
    
    }
    // 이 함수가 팝업 창이 닫힐 때 호출됩니다.
    function PopupClose() {
 
        opener.location.href = 'main.do';
    
    }
    
    // 팝업 창이 닫히기 직전에 호출되는 함수
    window.onbeforeunload = PopupClose;
    
  
    
    
/*     function pw() {
    	window.location.href='pwFindForm.do'; 
    	window.close();
    
    } */
</script>
</head> 
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/img/favicon.ico">
<body>
<%-- <span class="alname">${name }님의 ID는 ${id }입니다.</span> --%>
<div class="alname">${m_name}<span class="alname2">님의</span>  
<br><span class="alname2">ID는</span> 
${m_id}<span class="alname2"> 입니다</span> </div>
<div class="dal_btn">
<input class="al_btn" type="button" value="로그인" onclick="login11()">


<input class="al_btn" type="button" value="비밀번호찾기" onclick="location.href='pwFindForm.do';">
</div>
</body>
</html>