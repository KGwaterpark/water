<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>사원입력</h1>  <!-- 나는 insertForm.jsp -->
<table  border="2">
    <form action="insertinfo" method="post">
    <tr> <td > 이름 </td>
        <td> <input type="text" name="name"> </td></tr>
    <tr><td> 전화번호 </td>
        <td> <input type="text" name="tel"> </td></tr>
     <tr>  <td colspan="2"> <input type="submit" value="가자입력"></tr>
    </form> 
</table>  <br>
     <a href="getallinfo">[사원전체보기]</a>
  
</body>
</html>



