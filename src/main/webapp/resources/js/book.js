document.addEventListener('DOMContentLoaded', function () {
  const getElement = (selector) => document.querySelector(selector);

  const reBookBtn = getElement('#rebookbtn');
  const oceanBookBtn = getElement('#oceanbookbtn');
  const fStandElement = getElement('.f_stand');
  const fPremElement = getElement('.f_prem');
  const sStandElement = getElement('.s_stand');
  const sPremElement = getElement('.s_prem');

  const inlockerElement = getElement('.in_locker');
  const outlockerElement = getElement('.out_locker');
  const superlockerElement= getElement('.super_locker');

  const selectedResortElement = getElement('.selected-resortdata');
  const selectedLockerElement = getElement('.selected-lockerdata');

  let selectedResort = null;
  let selectedLocker = null;

  reBookBtn.addEventListener('click', () => rebookbtn());
    oceanBookBtn.addEventListener('click', () => oceanbookbtn());
  function oceanbookbtn(){
     if(selectedLocker===null){
     alert("락커를 선택해주세요");
     }else if(indate2===null){
     alert("날짜를 선택해 주세요");
     }else{
     url2 = 'oceanpay.do?' + 'indate2=' + indate2 + '&selectedLocker=' + selectedLocker +
            '&adultsCount=' + adultsCount + '&teenagersCount=' + teenagersCount + '&ocean_price=' + ocean_price;
           indate2===null;
          // console.log(url2);
      location.href=url2;
  }
}
  function rebookbtn(){
    if(indate===null || outdate===null){
    alert("날짜 정보를 모두 선택해주세요");
    }else if(selectedResort===null){
      alert("리조트를 선택해주세요");
    }else{
      // 보내야 할 정보 입력
      url = 'pay.do?' + 'indate='+indate+'&outdate='+outdate+'&reType='+selectedResort+'&price='+reTotPrice;
    
      console.log(url);
      location.href=url;
    }
  }
  function showSelectedResortData(data, element) {
    selectedResort = data;
    updateSelectedResortData();
    resetResortBackgroundColors();
    element.style.backgroundColor = 'yellow';
  }
// 락커선택을 보여주는 함수
function showSelectedLockerData(data, element) {
  //////////////////////////////////////
  selectedLocker = data;
// 락커 선택이 변경될 때마다 인원수 초기화
adultsCount = 0;
teenagersCount = 0;
updateCounter('adultsCount', adultsCount);
updateCounter('teenagersCount', teenagersCount);
 updateCounter('adtoto', adultsCount);
updateCounter('teentoto', teenagersCount);
updatePrice();
updateSelectedLockerData();
  // 선택한 요소의 배경색을 변경합니다.
  resetLockerBackgroundColors();
  element.style.backgroundColor = 'yellow'; // 선택한 요소의 배경색 변경
}

  // 선택된 리조트 업데이트
  function updateSelectedResortData() {
    if (selectedResort) {
      const selectedData = selectedResort;
      selectedResortElement.textContent = selectedData;
    }
  }

  // 선택된 락커 업데이트
  function updateSelectedLockerData() {
     if (selectedLocker) {
      const selectedData = selectedLocker;
      selectedLockerElement.textContent = selectedData;
  
      $("#checkInDate1").datepicker("option", "disabled", false);
      $("#checkOutDate1").datepicker("option", "disabled", false);
    }
  }

  // 리조트 선택 배경 초기화
  function resetResortBackgroundColors() {
    fStandElement.style.backgroundColor = '';
    fPremElement.style.backgroundColor = '';
    sStandElement.style.backgroundColor = '';
    sPremElement.style.backgroundColor = '';
  }

   // 락커 선택 배경 초기화
  function resetLockerBackgroundColors() {
    inlockerElement.style.backgroundColor = '';
    outlockerElement.style.backgroundColor = '';
    superlockerElement.style.backgroundColor = '';
  }

  // 락커 선택 요소들을 보여주는 함수
inlockerElement.addEventListener('click', () => showSelectedLockerData('실내락커', inlockerElement));
  outlockerElement.addEventListener('click', () => showSelectedLockerData('실외락커', outlockerElement));
  superlockerElement.addEventListener('click',() => showSelectedLockerData('슈퍼파크인', superlockerElement));




  let indate = null;
  let outdate = null;

  // 리조트 체크인 데이트 선택기
  $("#recheckInDate").datepicker({
    dateFormat: 'yy-mm-dd',
    minDate: 0,
    onSelect: function (selectedDate) {
      indate = selectedDate;
      
      const minCheckoutDate = new Date(selectedDate);
      console.log(selectedDate);
      minCheckoutDate.setDate(minCheckoutDate.getDate() + 1);
      $("#recheckOutDate").datepicker("option", "minDate", minCheckoutDate);

      const dateArray = selectedDate.split('-');

      // 년, 월, 일 정보 추출
      const year = dateArray[0];
      const month = dateArray[1];
      const day = dateArray[2];

      resetResortBackgroundColors(); // 리조트 선택 초기화

      const formattedDate = year + "년 " + month + "월 " + day + "일";
      updateSelectedDates(formattedDate, null); // 체크인 날짜 표시
    }
  });

  // 리조트 체크아웃 데이트 선택기
  $("#recheckOutDate").datepicker({
    dateFormat: 'yy-mm-dd',
    minDate: 0,
    onSelect: function (selectedDate) {
      outdate = selectedDate;
      resetResortBackgroundColors(); // 리조트 선택 초기화

      
     const dateArray = selectedDate.split('-');

      // 년, 월, 일 정보 추출
      const year = dateArray[0];
      const month = dateArray[1];
      const day = dateArray[2];


      const formattedDate = year + "년 " + month + "월 " + day + "일";
      updateSelectedDates(null, formattedDate); // 체크아웃 날짜 표시

      
      let indate1=new Date(indate);
      let outdate1=new Date(outdate);
      function dateDiffInDays(date1, date2) { // 체크아웃 - 체크인 함수 (날짜 계산)
        const oneDay = 24 * 60 * 60 * 1000; // 하루를 밀리초로 표현한 값
        const diffInTime = Math.abs(date2.getTime() - date1.getTime());
        return Math.round(diffInTime / oneDay);
      }
      checkAvailabilityAndEnableResortOptions(dateDiffInDays(indate1, outdate1)); // 서버에서 사용가능한 날짜 검색
      resortUpdatePrice(0);
    }
  });
  let reTotPrice=0;
  // 리조트 선택시 금액을 예약정보에 표시 
  function resortUpdatePrice(price){
    reTotPrice=price;
    var formattedPrice = price.toLocaleString();
    document.getElementById('resortPrice').textContent = formattedPrice + "원";
  }
  function updateSelectedDates(checkInDate, checkOutDate) {
    const selectedCheckInDate = checkInDate ? checkInDate : $("#indate").text();
    const selectedCheckOutDate = checkOutDate ? checkOutDate : $("#outdate").text();
    $("#indate").text(selectedCheckInDate);
    $("#outdate").text(selectedCheckOutDate);
  }


  
  function checkAvailabilityAndEnableResortOptions(date) {
    $.ajax({
      url: "http://localhost:8080/park/booked_date.do",
      type: "GET",
      data: { 'indate': indate, 'outdate': outdate },
      contentType: "application/json",
      success: function (data) {
        const possibleReTypes = ['f_stand', 'f_prem', 's_stand', 's_prem'];
        for (const reType of possibleReTypes) {
          // 이미 data 배열에 해당 re_type이 있는지 확인합니다.
          const existingVo = data.find(vo => vo.re_type === reType);
    
          // data 배열에 해당 re_type이 없는 경우, 새로운 VO 객체를 생성하여 추가합니다.
          if (!existingVo) {
            const newVo = {
              re_type: reType,
              reservation_COUNT: 0,
            };
            data.push(newVo);
          }
        }        
        data.forEach(bookVO => {
          let remainingRooms = 5 - bookVO.reservation_COUNT;
          
          let f_standPrice =0;
          let f_premPrice =0;
          let s_standPrice =0;
          let s_premPrice =0;
          switch (bookVO.re_type) {
            case "f_stand":
              fStandElement.textContent = `패밀리 스탠다드 (남은 방: ${remainingRooms})`;
              if(remainingRooms!==0){
                fStandElement.addEventListener('click', () => showSelectedResortData('패밀리 스탠다드', fStandElement));
                f_standPrice = date*200000;
                fStandElement.addEventListener('click', () => resortUpdatePrice(f_standPrice));
              }
              break;
            case "f_prem":
              fPremElement.textContent = `패밀리 프리미엄 (남은 방: ${remainingRooms})`;
              if(remainingRooms!==0){
                fPremElement.addEventListener('click', () => showSelectedResortData('패밀리 프리미엄', fPremElement));
                f_premPrice = date*250000;
                fPremElement.addEventListener('click', () => resortUpdatePrice(f_premPrice));
              }
              break;
              case "s_stand":
                sStandElement.textContent = `스위트 스탠다드 (남은 방: ${remainingRooms})`;
                if(remainingRooms!==0){
                  sStandElement.addEventListener('click', () => showSelectedResortData('스위트 스탠다드', sStandElement));
                  s_standPrice = date*400000;
                  sStandElement.addEventListener('click', () => resortUpdatePrice(s_standPrice));
              }
              break;
              case "s_prem":
                sPremElement.textContent = `스위트 프리미엄 (남은 방: ${remainingRooms})`;
                if(remainingRooms!==0){
                  sPremElement.addEventListener('click', () => showSelectedResortData('스위트 프리미엄', sPremElement));
                  s_premPrice = date*450000;
                  sPremElement.addEventListener('click', () => resortUpdatePrice(s_premPrice));
                }
              break;
          }
        });
      },
      error: function (xhr, textStatus, errorThrown) {
        console.log(xhr);
        console.log(textStatus);
        console.log(errorThrown);
      }
    });
  }

  let adultsCount = 0;
  let teenagersCount = 0;
// 수영장 가격 표시
function updatePrice() {

  const inLockerPrice = (adultsCount * 40000) + (teenagersCount * 30000);
  const outLockerPrice = (adultsCount * 35000) + (teenagersCount * 25000);
  const superLockerPrice = (adultsCount * 200000) + (teenagersCount * 200000);
  
  let totalPrice = 0;
  
 if (selectedLocker === '실내락커') {
     totalPrice = inLockerPrice;
     ocean_price = inLockerPrice;
  } else if (selectedLocker === '실외락커') {
    totalPrice = outLockerPrice;
    ocean_price=outLockerPrice;
  } else if (selectedLocker === '슈퍼파크인') {
    totalPrice = superLockerPrice;
    ocean_price=superLockerPrice;
  }
  
  
  // 가격을 화면에 표시하는 요소를 가져와서 업데이트합니다.
  document.getElementById('totalPrice').textContent = totalPrice + "원";
}
function updateCounter(elementId, count) { //가격 표시
  document.getElementById(elementId).textContent = count;
}

// Function to handle increasing the count
function increaseCount(countType) {
  const total = adultsCount + teenagersCount;
  if (total < 10) {
    if (countType === 'adults' && adultsCount < 10) {
      adultsCount++;
      updateCounter('adultsCount', adultsCount);
      updateCounter('adtoto', adultsCount);
       updatePrice();
    } else if (countType === 'teenagers' && teenagersCount < 10) {
      teenagersCount++;
      updateCounter('teenagersCount', teenagersCount);
      updateCounter('teentoto', teenagersCount);
       updatePrice();
    }
  } else {
    // Display alert if the total count exceeds 10
    alert("최대 예약 가능한 인원은 10명입니다.");
  }
}



// Function to handle decreasing the count
function decreaseCount(countType) {
  if (countType === 'adults' && adultsCount > 0) {
    adultsCount--;
    updateCounter('adultsCount', adultsCount);
      updateCounter('adtoto', adultsCount);
       updatePrice();
  } else if (countType === 'teenagers' && teenagersCount > 0) {
    teenagersCount--;
    updateCounter('teenagersCount', teenagersCount);
    updateCounter('teentoto', teenagersCount);
     updatePrice();
  }
}


// Event listeners for the plus and minus buttons
document.getElementById('increaseAdults').addEventListener('click', function () {
  increaseCount('adults');
});

document.getElementById('decreaseAdults').addEventListener('click', function () {
  decreaseCount('adults');
});

document.getElementById('increaseTeenagers').addEventListener('click', function () {
  increaseCount('teenagers');
});

document.getElementById('decreaseTeenagers').addEventListener('click', function () {
  decreaseCount('teenagers');
});
let indate2=null;

       // 워터파크 Datepicker 초기화
      $("#checkInDate1").datepicker({
        dateFormat: 'yy-mm-dd', 
        minDate: 0,
        disabled: true, 
        beforeShowDay: function () {
          // 락커 옵션을 선택하지 않은 경우 해당 날짜를 비활성화하여 클릭할 수 없게 만듭니다.
          if (!selectedLocker) {
            return [false];
          }
          return [true];
        },
  onSelect: function (selectedDate) {
   
    updateSelectedDates1(selectedDate, null); 

          // check-in 날짜를 선택했을 때, check-out 날짜에 check-in 날짜 이전의 날짜를 선택하지 못하도록 설정
          $("#checkOutDate1").datepicker("option", "minDate", selectedDate);
         indate2=selectedDate;
          const selectedCheckInDate = new Date(selectedDate);
          const nextMonthDate = new Date(selectedCheckInDate);
          nextMonthDate.setMonth(nextMonthDate.getMonth() + 1);
          $("#checkOutDate1").datepicker("option", "defaultDate", nextMonthDate);
        }
      });

      $("#checkOutDate1").datepicker({
        dateFormat: 'yy년 mm월 dd일',
        minDate: 0, 
        disabled: true,
        beforeShowDay: function (date) {
          // 락커 옵션을 선택하지 않은 경우 해당 날짜를 비활성화하여 클릭할 수 없게 만듭니다.
          if (!selectedLocker) {
            return [false];
          }
          return [true];
        },
        onSelect: function (selectedDate) {
       updateSelectedDates1(null, selectedDate);

          // check-out 날짜를 선택했을 때, check-in 날짜에 check-out 날짜 이후의 날짜를 선택하지 못하도록 설정
          $("#checkInDate1").datepicker("option", "maxDate", selectedDate);
        }
      }); this.evaluate
// 워터파크 이용일정을 업데이트하는 함수
function updateSelectedDates1(checkInDate1, checkOutDate1) {
  const selectedCheckInDate1 = checkInDate1 ? checkInDate1 : $("#checkInDate1").val();

  // 선택한 checkInDate1와 checkOutDate1를 "이용일정" 옆에 표시
  $("#indate1").text(selectedCheckInDate1);
}


});