document.addEventListener('DOMContentLoaded', function() {
  //let adultsCount = 0;

 const getElement = (selector) => document.querySelector(selector);
	const allBookBtn = getElement('#allbookbtn');
	
	allBookBtn.addEventListener('click', () => allbookbtn());
	   
	 
	function allbookbtn(){
		if(adultsCount===0){
			alert("인원을 선택해 주세요");
		}else if (indate2===null){
			alert("날짜를 선택해 주세요");
	}else{
		url = 'allpackpay.do?'+'indate2='+ indate2 +'&adultsCount=' + adultsCount
				+'&ocean_price='+ ocean_price;
		indate2===null;
		
		console.log(indate2);
		console.log(adultsCount);
		location.href=url;
	}
}

  document.getElementById('increaseAdults').addEventListener('click', function() {
    if (checkTotalCount() && adultsCount < 4) {
      adultsCount++;
      updateCounter('adultsCount', adultsCount);
      updateCounter('sooCount', adultsCount);
      updatePrice();
    }
  });

  document.getElementById('decreaseAdults').addEventListener('click', function() {
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
});
//////가격//////////
let indate2=null;
let ocean_price=null;
 let adultsCount = 0;
function updatePrice(){

const totalPrice=adultsCount * 1000000;
document.getElementById('totalPrice').textContent=totalPrice + "원";
ocean_price=totalPrice;
}


//////////////////////

 $(function () {
  $("#checkInDate1").datepicker({
    dateFormat: 'yy-mm-dd', 
    minDate: 0, 
    onSelect: function (selectedDate) {
      updateSelectedDates1(selectedDate);
     indate2=selectedDate;
      $("#selectedDatesInfo").text(selectedDate);
    }
  });

  function updateSelectedDates1(checkInDate1) {
    const selectedCheckInDate1 = checkInDate1 ? checkInDate1 : $("#checkInDate1").val();
    $("#indate1").text(selectedCheckInDate1);
  }
  $("#checkInDate1").datepicker("show");
});
 
 
 
 
 
 
 
