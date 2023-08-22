

let currentTime = new Date().getTime();
let idenid = parseInt(currentTime);
//교차 사이트 요청에서 쿠키를 보내는 경우 (제3자 사용을 허용)
document.cookie = "Secure=Secure; SameSite=None; Secure";

//// 교차 사이트 요청에서 쿠키를 보내지 않는 경우
//document.cookie = "Strict=Strict SameSite=Strict";
//// 또는
document.cookie = "SameSite=Lax";

$(function(){
 var IMP = window.IMP; // 생략 가능
 IMP.init('imp55773133'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

 IMP.certification({
     merchant_uid: idenid
 }, function(rsp) {
     if (rsp.success) {
         jQuery.ajax({
             url: "che.do",
             method: "POST",
             headers: { "Content-Type": "application/json" },
             data: JSON.stringify({ imp_uid: rsp.imp_uid }) 
         }).fail(function(jqXHR, textStatus, errorThrown) {
             console.error("토큰 요청에 실패하였습니다.", textStatus, errorThrown);
         });
     } else {
         msg = '인증에 실패하였습니다.';
         msg += '실패 사유 : ' + rsp.error_msg;
         location.href="login.do";
         alert(msg);
     }
 }); 
});
