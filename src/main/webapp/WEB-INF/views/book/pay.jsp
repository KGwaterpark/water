<%@page import="com.water.park.vo.BookVO"%>
<%@page import="com.water.park.vo.Package_bookVO"%>
<%@page import="com.water.park.vo.Ocean_bookVO"%>
<%@page import="com.water.park.vo.MemberVO"%>
<%@page import="java.util.Date"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%  
     MemberVO mvo = (MemberVO) session.getAttribute("loginsession");
     long currentTime = new Date().getTime();
	 int book_id = (int)currentTime * -1;
     
     String m_id= mvo.getM_id();
     String m_pw= mvo.getM_pw();
     String m_tel = mvo.getM_tel();
     String m_name = mvo.getM_name();
     String m_email = mvo.getM_email();

     int price  = 0;
     String sangName="상품이름";
     if(session.getAttribute("ocean_vo")!=null){
    	 Ocean_bookVO ovo = (Ocean_bookVO) session.getAttribute("ocean_vo");
    	price = ovo.getTot_cnt();
    	ovo.setOcbook_id(book_id);
    	sangName=ovo.getType();
     }  else if(session.getAttribute("pabook_vo") != null){
    	 Package_bookVO pvo = (Package_bookVO) session.getAttribute("pabook_vo");
    	 price = pvo.getPrice();
    	 pvo.setPabook_id(book_id);
    	 sangName = pvo.getP_type();
     }else if(session.getAttribute("book_vo") != null){
    	 BookVO rmvo = (BookVO) session.getAttribute("book_vo");
    	 price = rmvo.getPrice();
    	 sangName = rmvo.getRe_type2();
    	 rmvo.setRebook_id(book_id);
     }
     
     
     %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KG 이니시스</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<meta charset="UTF-8">
</head>
<body>
<script>
	$(function(){
    	var IMP = window.IMP; // 생략가능
    		IMP.init('imp55773133'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
    	var msg;
    		
    	IMP.request_pay({
            pg : 'html5_inicis',
            pay_method : 'card',
            merchant_uid : <%=book_id%>,
            name : '<%= sangName%>',
            amount : <%=price%>,
            buyer_email : '<%=m_email%>',
            buyer_name : '<%=m_name%>',
            buyer_tel : '<%=m_tel%>',
        }, function(rsp) {
            if ( rsp.success ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        alert(msg);
                       location.href="paymentresult.do";
                      } else {
                msg = '결제에 실패하였습니다.';
                msg += '실패 사유 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                location.href="<%=request.getContextPath()%>";
                alert(msg);
            }
        });
        
    });
    </script> 
 
</body>
</html>