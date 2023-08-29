document.addEventListener('DOMContentLoaded', function () {
  const getElement = (selector) => document.querySelector(selector);//
  //let adultsCount = 0;
  /////리조트
  const fStandElement = getElement('.f_stand');
  const fPremElement = getElement('.f_prem');
  const sStandElement = getElement('.s_stand');
  const sPremElement = getElement('.s_prem');

  const rePackBookBtn = getElement('#repackbtn');
  const selectedResortElement = getElement('.selected-resortdata');
   rePackBookBtn.addEventListener('click', () => repackbtn());
   
  


  // 선택한 데이터를 표시할 요소들을 가져옵니다.
  
  let selectedResort = null;// 현재 선택된 리조트를 저장할 변수를 선언합니다.

  fStandElement.addEventListener('click', () => showSelectedResortData('패밀리 스탠다드', fStandElement));
  fPremElement.addEventListener('click', () => showSelectedResortData('패밀리 프리미엄', fPremElement));
  sStandElement.addEventListener('click', () => showSelectedResortData('스위트 스탠다드', sStandElement));
  sPremElement.addEventListener('click', () => showSelectedResortData('스위트 프리미엄', sPremElement));

  
  // 리조트 선택을 보여주는 함수
  function showSelectedResortData(data, element) {
       selectedResort = data;
       adultsCount = 0;
      updateCounter('adultsCount', adultsCount);
      updatePrice();   
      updateSelectedResortData();

    // 선택한 요소의 배경색을 변경합니다.
    resetResortBackgroundColors();
    element.style.backgroundColor = 'yellow'; // 선택한 요소의 배경색 변경
  }

  function updateSelectedResortData() {
    if (selectedResort) {
      const selectedData = selectedResort;
      selectedResortElement.textContent = selectedData;
    }
  }

  // 리조트 선택 요소들의 배경색을 초기화하는 함수
  function resetResortBackgroundColors() {
    fStandElement.style.backgroundColor = '';
    fPremElement.style.backgroundColor = '';
    sStandElement.style.backgroundColor = '';
    sPremElement.style.backgroundColor = '';
  }









  ////////////////////////////////////////////////////////////////////////////////////////////////
  document.getElementById('increaseAdults').addEventListener('click', function () {
    if (checkTotalCount() && adultsCount < 4) {
      adultsCount++;
      updateCounter('adultsCount', adultsCount);
      updateCounter('sooCount', adultsCount);
      updatePrice();
    }
  });

  document.getElementById('decreaseAdults').addEventListener('click', function () {
    if (adultsCount > 0) {
      adultsCount--;
      updateCounter('adultsCount', adultsCount);
      updateCounter('sooCount', adultsCount);
      updatePrice();
    }
  });

  function updateCounter(elementId, count) {
    document.getElementById(elementId).textContent = count;
  }

  function checkTotalCount() {
    if (adultsCount < 4) {
      return true;
    } else {
      alert("한번에 예약 가능한 최대 인원은 4명입니다");
      return false;
    }
  }




 $("#rePackdate").datepicker({
    dateFormat: 'yy-mm-dd',
    minDate: 0,
    onSelect: function (selectedDate) {
      indate = selectedDate;
      outdate=new Date(selectedDate).getDate()+1;
      console.log(outdate);
     const dateArray = selectedDate.split('-');

      // 년, 월, 일 정보 추출
      const year = dateArray[0];
      const month = dateArray[1];
      const day = dateArray[2];
      const formattedDate = year + "년 " + month + "월 " + day + "일";
      updateSelectedDates1(formattedDate); 

    }
  });
  
  function repackbtn() {
    if (indate === null) {
      alert("날짜 정보를  선택해주세요");
    } else if (selectedResort === null) {
      alert("리조트를 선택해주세요");
      } else if (adultsCount === 0){
        alert("인원을 선택해주세요");
      } else {
      // 보내야 할 정보 입력
      url = 'pay.do?' + 'indate=' + indate + '&outdate=' + outdate + '&reType=' + selectedResort + '&price=' + totalPrice;

      console.log(url);
      location.href = url;
    }
  }

//////가격//////////
function updatePrice() {
if ( selectedResort === '패밀리 스탠다드'){
   totalPrice = adultsCount * 20000 + 200000;
}else if( selectedResort === '패밀리 프리미엄'){
   totalPrice = adultsCount * 20000 + 250000;
}else if( selectedResort === '스위트 스탠다드'){
   totalPrice = adultsCount * 20000 + 400000;
}else if( selectedResort === '스위트 프리미엄'){
   totalPrice = adultsCount * 20000 + 450000;
}
 
  document.getElementById('totalPrice').textContent = totalPrice + "원";
}


//////////////////////
let adultsCount = 0;

////////////////////////////////////////////////////////////////////
});
  let indate = null;
  let outdate = null;
$(function () {
  $("#checkInDate1").datepicker({
    dateFormat: 'yy-mm-dd',
    minDate: 0,
    onSelect: function (selectedDate) {
    indate = selectedDate;
    const out = new Date(selectedDate);
    out.setDate(out.getDate() + 1);
    var year1 = out.getFullYear();
   var month1 = String(out.getMonth() + 1).padStart(2, '0');
   var day1 = String(out.getDate()).padStart(2, '0');
   outdate= year1 + '-' + month1 + '-' + day1;
    const dateArray = selectedDate.split('-');

      // 년, 월, 일 정보 추출
      const year = dateArray[0];
      const month = dateArray[1];
      const day = dateArray[2];
      console.log(outdate);
     
      const formattedDate = year + "년 " + month + "월 " + day + "일";
      updateSelectedDates1(formattedDate); 

    }
  });

  function updateSelectedDates1(checkInDate1) {
    const selectedCheckInDate1 = checkInDate1 ? checkInDate1 : $("#checkInDate1").val();
    $("#indate1").text(selectedCheckInDate1);
  }
  $("#checkInDate1").datepicker("show");
});


