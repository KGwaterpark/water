$(function () {
  $("#checkInDate").datepicker({
    dateFormat: 'yy년 mm월 dd일', // Korean date format
    minDate: 0, // Minimum selectable date (today)
    onSelect: function (selectedDate) {
      $("#selectedCheckInDate").text(selectedDate);

      var selectedDateObj = $.datepicker.parseDate('yy년 mm월 dd일', selectedDate);

      selectedDateObj.setDate(selectedDateObj.getDate() + 1);

      var nextDay = $.datepicker.formatDate('yy년 mm월 dd일', selectedDateObj);

      $("#checkOutDate").datepicker("option", "minDate", nextDay);
      updateSelectedDates(selectedDate, null);
      // Reset the value of checkOutDate
      $("#checkOutDate").val("").trigger("change");
    }
  });

  $("#checkOutDate").datepicker({
    dateFormat: 'yy년 mm월 dd일', // Korean date format
    minDate: 1, // Minimum selectable date (tomorrow)
    onSelect: function (selectedDate) {
      $("#selectedCheckOutDate").text(selectedDate);
    },
    onClose: function (selectedDate) {
      // Convert selectedDate to a Date object
      var selectedDateObj = $.datepicker.parseDate('yy년 mm월 dd일', selectedDate);

      // Add one day to the selectedDate
      selectedDateObj.setDate(selectedDateObj.getDate() + 1);

      // Convert the updated date back to the Korean date format
      var nextDay = $.datepicker.formatDate('yy년 mm월 dd일', selectedDateObj);

      // Update the minDate option for checkOutDate
      $("#checkOutDate").datepicker("option", "minDate", nextDay);

      // Update the selected dates info
      var checkInDate = $("#checkInDate").val();
      var checkOutDate = $("#checkOutDate").val();
      console.log(checkInDate)
      updateSelectedDates(checkInDate, checkOutDate);
    }
  });
});
// 리조트 이용일정을 업데이트하는 함수
function updateSelectedDates(checkInDate, checkOutDate) {
  const selectedCheckInDate = checkInDate ? checkInDate : $("#indate").text();
  const selectedCheckOutDate = checkOutDate ? checkOutDate : $("#outdate").text();

  // 선택한 checkInDate와 checkOutDate를 "이용일정" 옆에 표시
  $("#indate").text(selectedCheckInDate);
  $("#outdate").text(selectedCheckOutDate);
}
// Update the selected dates info
function updateSelectedDatesInfo(checkInDate, checkOutDate) {
  if (checkOutDate !== '') {
    $("#selectedDatesInfo").text("이용일정: " + checkInDate + " ~ " + checkOutDate);
  } else {
    $("#selectedDatesInfo").text("이용일정: " + checkInDate + " ~ ");
  }
}