<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/service_style.css"/>


</head>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/img/favicon.ico">
<body>


<div class="pwFind-form">
    <form action="pwFindForm.do" method="post" class="form-horizontal" name="pfrm">
	
      	<div class="row">
        	<div align="center">
			<h2>비밀번호 찾기</h2>
		</div>	
      	</div>			
        <div class="form-group row">
		<label class="col-form-label col-4">아이디</label>
		<div class="col-8">
			<input class="intext" type="text" class="form-control" name="id" placeholder="아이디를 입력하세요." required="required">
		</div>        	
        </div>

	<div class="form-group row">
		<label class="col-form-label col-4">새 비밀번호</label>
		<div class="col-8">
			<input  class="intext" type="text" class="form-control" name="pw" placeholder="비밀번호를 입력하세요." required="required">
		</div>        	
        </div>
        
	<div class="form-group row">
		<label class="col-form-label col-4">새 비밀번호확인</label>
		<div class="col-8">
			<input  class="intext" type="text" class="form-control" name="pw2" placeholder="비밀번호를 입력하세요." required="required">
		</div>        	
        </div>        
        
        <br>
	<div class="form-group row">
		<button type="submit" id="submit" class="btn btn-primary btn-lg">비밀번호 변경</button>
	</div>		

    </form>
</div>
</body>
</html>