<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin.css" />
</head>
<body>
    <h1>새로운 공지사항 작성</h1>
    <form action="write.do" method="post">
    <table border="2" class="table-fill">

       <thead class="adminth">
            <tr class="admintr">
                <th >제목</th>
                <th >내용</th>
            </tr>
        </thead>

<tbody class="table-hover">
    <td class="admintd" id="wirteText"><input type="text" name="g_title" id="wirteText"></td>
	<td class="admintd" id="wirteArea"><textarea name="g_content"   rows="5" cols="50" id="wirteArea"></textarea></td>
</tbody>

</table>

    <input type="submit" value="작성" id="adbtn" class="writebtn">
   










</form>


</body>
</html>