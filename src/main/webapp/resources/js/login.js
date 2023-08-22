

document.addEventListener('DOMContentLoaded', function() {
  const signInBtn = document.getElementById("signIn");
  const signUpBtn = document.getElementById("signUp");
  const firstForm = document.getElementById("form1");
  const secondForm = document.getElementById("form2");
  const container = document.querySelector(".container");

  signInBtn.addEventListener("click", function() {
    container.classList.remove("right-panel-active");
  });

  signUpBtn.addEventListener("click", function() {
    container.classList.add("right-panel-active");
  });

  firstForm.addEventListener("submit", function(e) {

    const formData = new FormData(firstForm); // 폼 데이터 가져오기
    fetch("memberInsertForm.do", {
      method: "POST",
      body: formData
    })
      .then(response => response.json()) // 서버 응답을 JSON 형식으로 파싱
      .then(data => {
        // 서버에서 받은 응답에 따른 처리를 수행
        // 예시: 회원가입 성공 시 페이지 리로드
        if (data.success) {
          window.location.reload();
        } else {
          alert("회원가입 실패. 다시 시도해주세요.");
        }
      })
      .catch(error => {
        console.error("서버와 통신 중 오류 발생:", error);
      });
  });

  secondForm.addEventListener("submit", function(e) {

    // AJAX를 사용하여 폼 데이터를 서버로 전송하는 코드

    const formData = new FormData(secondForm); // 폼 데이터 가져오기
    fetch("loginprocess.do", {
      method: "POST",
      body: formData
    })
      .then(response => response.json()) // 서버 응답을 JSON 형식으로 파싱
      .then(data => {
        // 서버에서 받은 응답에 따른 처리를 수행
        // 예시: 로그인 성공 시 페이지 리로드
        if (data.success) {
          window.location.reload();
        } else {
        }
      })
      .catch(error => {
        console.error("서버와 통신 중 오류 발생:", error);
      });
  });
});