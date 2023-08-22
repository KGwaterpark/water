<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hotel Reservation</title>
    <!-- Include the necessary CSS and JavaScript files for jQuery and jQuery UI -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/datepicker_wp.js"></script> 
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/datepicker_wp.css"> 
</head>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/img/favicon.ico">
<body>
    <div class="calendar-container1">
        <div class="calendar1">
            <label for="checkInDate1"></label>
            <div id="checkInDate1" name="checkInDate1" readonly></div>
        </div>
	</div>
</body>
</html>