$(function () {
  $("#checkInDate1").datepicker({
    dateFormat: 'yy년 mm월 dd일', // Korean date format
    minDate: 0, // Minimum selectable date (today)
    onSelect: function (selectedDate) {
      $("#selectedcheckInDate1").text(selectedDate);

      // Convert selectedDate to a Date object
      var selectedDateObj = $.datepicker.parseDate('yy년 mm월 dd일', selectedDate);

      // Add one day to the selectedDate
      selectedDateObj.setDate(selectedDateObj.getDate() + 1);

      // Convert the updated date back to the Korean date format
      var nextDay = $.datepicker.formatDate('yy년 mm월 dd일', selectedDateObj);

      // Update the minDate option for checkOutDate1
      $("#checkOutDate1").datepicker("option", "minDate", nextDay);

      // Reset the value of checkOutDate1
      $("#checkOutDate1").val("").trigger("change");
    }
  });

  $("#checkOutDate1").datepicker({
    dateFormat: 'yy년 mm월 dd일', // Korean date format
    minDate: 1, // Minimum selectable date (tomorrow)
    onSelect: function (selectedDate) {
      $("#selectedcheckOutDate1").text(selectedDate);
    },
    onClose: function (selectedDate) {
      // Convert selectedDate to a Date object
      var selectedDateObj = $.datepicker.parseDate('yy년 mm월 dd일', selectedDate);

      // Add one day to the selectedDate
      selectedDateObj.setDate(selectedDateObj.getDate() + 1);

      // Convert the updated date back to the Korean date format
      var nextDay = $.datepicker.formatDate('yy년 mm월 dd일', selectedDateObj);

      // Update the minDate option for checkOutDate1
      $("#checkOutDate1").datepicker("option", "minDate", nextDay);

      // Update the selected dates info
      var checkInDate1 = $("#checkInDate1").val();
      var checkOutDate1 = $("#checkOutDate1").val();
      updateSelectedDatesInfo(checkInDate1, checkOutDate1);
    }
  });
});

// Update the selected dates info
function updateSelectedDatesInfo(checkInDate1, checkOutDate1) {
  if (checkOutDate1 !== '') {
    $("#selectedDatesInfo").text("이용일정: " + checkInDate1 + " ~ " + checkOutDate1);
  } else {
    $("#selectedDatesInfo").text("이용일정: " + checkInDate1 + " ~ ");
  }
}


//인원선택

