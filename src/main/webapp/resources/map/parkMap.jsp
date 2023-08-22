<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html>
<head>

<!-- 클릭한 위치의 위도: 37.538428044608736
클릭한 위치의 경도: 127.07068332079628 -->
    <meta charset="utf-8">
    <title>지도</title>
   <style>
        body {
            margin: 0;
            padding: 0;
        }


    </style>
    
</head>
<body>
<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=acbd5cd1de590a7f3dd3aa911f0fe026"></script>
															<!-- acbd5cd1de590a7f3dd3aa911f0fe026 -->
<script>
window.onload = function() {
	var joongang1 = new kakao.maps.LatLng(37.538428044608736, 127.07068332079628);
			//해당 위도 경도를 지도의 중심에 위치하기 위한 것
			
	var mapDesign1 = {
					zoom: 15,
					center: joongang1,
					mapTypeId: kakao.maps.MapTypeId.ROADMAP,//HYBRID
					level: 4
					
			};		
	var map= new kakao.maps.Map(document.getElementById("jido1"), mapDesign1);
	

	var markerPosition  = new kakao.maps.LatLng(37.538428044608736, 127.07068332079628); 

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
    var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="padding:10px;">주소: 서울 광진구 능동로 92 </div>'
    });
    
    kakao.maps.event.addListener(marker, 'click', function() {
        infowindow.open(map, marker);
    });
}

</script>


</head>
<body >
	<div id="jido1" style="width: 436px; height: 516px;"></div>
</body>
</html>