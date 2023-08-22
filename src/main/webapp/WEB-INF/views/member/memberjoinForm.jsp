<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script>
     function fn_idCheck() {
         var m_id = $("#m_id").val();
         $.ajax({
             url: "idCheck.do",
             type: "POST",
             dataType: "text",
             data: { "m_id": m_id },
             success: function (data) {
                 if (data === "fail") {
                     alert("중복된 아이디입니다.");
                     $("#idCheck").val("fail");
                } else if (data === "success") {
                    alert("사용 가능한 아이디입니다.");
                    $("#idCheck").val("success");
                }
             }
         });
      }
 
function checkInput() {
    var m_id = $("#m_id").val();
    var pw = $("#pw").val();
    var pwck = $("#pwck").val();
    var email = $("#email").val();
    var tel = $("#tel").val();
    var name=$("#name").val();

    // 아이디 중복 체크 여부 검사
    if ($("#idCheck").val() !== "success") { 
        alert("아이디 중복 체크를 해주세요.");
        return false;
    }

    // 비밀번호와 비밀번호 확인이 일치하는지 검사
    if (pw !== pwck) {
        alert("비밀번호가 일치하지 않습니다.");
        return false;
    }

    // 이메일과 전화번호가 입력되었는지 검사
    if (email === "" || tel === "") {
        alert("이메일과 전화번호를 모두 입력해주세요.");
        return false;
    }
 	var passwordPattern = /^(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[@#$%^&+=!]).{8,}$/;
    if (!passwordPattern.test(pw)) {
        alert("비밀번호는 숫자와 영어, 특수문자가 하나 이상 포함되고 8자 이상이어야 합니다.");
        return false;
    } 
    if (name.length < 2) {
        alert("이름은 2글자 이상이어야 합니다.");
        return false;
    }
    var telPattern = /^010[0-9]{8}$/;
    if (!tel.match(telPattern)) {
        alert("전화번호는 '010'으로 시작하고 뒤에 8자리 숫자가 있어야 합니다.");
        return false;
    }
    
    
       return true;
}
      
</script>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.min.js" ></script>
<title>Insert title here</title>
</head>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/img/favicon.ico">

<body>
<form action="memberjoin.do" method="post" name="join" onsubmit="return checkInput();">
    <table border="2">
        <tr>
            <th>아이디</th>
            <td>
                <input type="text" id="m_id" name="m_id" placeholder="영문,숫자 함께 사용" autocomplete="off"required>
                <button type="button" id="idCheck" onclick="fn_idCheck()">중복 확인</button>
                <span id="check"></span>
            </td>
        </tr>
        <tr>
            <th>비밀번호</th>
            <td>
                <input type="password" name="m_pw"id="pw"required>
                <div class="valid" placeholder="영어, 숫자, 특수문자 조합의 8자 이상"></div>
            </td>
        </tr>
        <tr>
            <th>비밀번호 확인</th>
            <td>
                <input type="password" name="m_pwck" id="pwck"required>
               <span id="pwCheck" ></span>
            </td>
        </tr>
        <tr>
            <th>이메일</th>
            <td>
                <input type="email" id="email"name="m_email">
                             
            </td>
        </tr>
        <tr>
            <th>이름</th>
            <td>
                <input type="text" name="m_name"id="name"required>
            </td>
        </tr>
        <tr>
            <th>전화번호</th>
            <td>
                <input type="text" name="m_tel"id="tel">
            </td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="회원가입"></td>
        </tr>
    </table>
</form>
</body>
</html>
