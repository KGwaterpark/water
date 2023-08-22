<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/img/favicon.ico">
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/img/favicon.ico">
<body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("_8q7HtRG7cqwbUCaB6s6", "http://localhost:8080/park/naverLogin.do");
  // 접근 토큰 값 출력
  let accessToken = naver_id_login.oauthParams.access_token;
  window.close();
  location.href=("naverLogin.do?accessToken="+accessToken);
  window.parent.postMessage('NaverLoginSuccess', '*');
</script>
</body>
</html>