var naver_id_login = new naver_id_login("_8q7HtRG7cqwbUCaB6s6",
			"http://localhost:8080/park/callback.do");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("green", 4);
	naver_id_login.setState(state);
	//naver_id_login.setPopup();
	naver_id_login.init_naver_id_login();
	
	 if (event.data === 'NaverLoginSuccess') {
	 	alert("성공");
        window.location.href = 'main.do';}