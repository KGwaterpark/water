<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
<script src="${pageContext.request.contextPath}/resources/js/package.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/package.css" />

<script>
    function waterpack() {
    	
    	window.close();
    	opener.location.href='resortpack.do'; 
    }
    // 이 함수가 팝업 창이 닫힐 때 호출됩니다.
    function PopupClose() {
 
        opener.location.href = 'resortpack.do';
    }

    //팝업 창이 닫히기 직전에 호출되는 함수
//     window.onbeforeunload = PopupClose; 
    
  
    
    

</script>
</head> 
<body>
<div class="popup">
    <div class="popup_wrap">
        <div class="popup_inner">
            <div class="popup_layer">
                <div class="text_area">
                    <strong class="title"><h2>리조트 패키지</h2></strong>
                    <p class="text">
<h5>
리조트 : 펜트하우스 객실<br>
워터파크 : 실내 락커 이용<br>
</h5>
<h6><font color="#DC143C">*패키지 상품은 구성을 추가 또는 변경 하실 수 없습니다*</font></h6>
                </div>
                <div class="btn_area">
                    <button type="submit" name="button" class="btn" onclick="waterpack()">예약</button>
                    <button type="reset" name="button" class="btn no" onClick='window.close()'>취소</button>
                </div>
            </div>
        </div>
    </div>
    <div class="popup_dimmed">
    </div>
   </div>

</body>
</html>