<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<!-- header호출 -->
	<jsp:include page="common/header.jsp" />
	<script>

		$(function(){
			
			let lati = 37.5642135;
			let longi = 127.0016985;
			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(lati, longi), // 지도의 중심좌표
		        level: 7 // 지도의 확대 레벨
		    };  
	
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			
			// 주소로 좌표를 검색합니다.
		
			<c:if test="${clinics ne null}">
				
				let listDatas = "<table class=\"table mt-2\">";
		        listDatas += "<tr><th>기준날짜</th><th>검체 채취</th><th>시도</th><th>구군</th><th>이름</th>"
		        +"<th>주소</th><th>주중</th><th>토요일</th><th>일요일</th><th>번호</th></tr>"
				
		        let listData;
		        <c:forEach var="clinic" items="${clinics}" varStatus="status">
					
			      listData = "<tr>" 
						+ "<td>${clinic.date}</td>"
						+ "<td>${clinic.extract}</td>"
						+ "<td>${clinic.sido}</td>"
						+ "<td>${clinic.gugun}</td>"
						+ "<td>${clinic.name}</td>"
						+ "<td>${clinic.address}</td>"
						+ "<td>${clinic.weekOp}</td>"
						+ "<td>${clinic.satOp}</td>"
						+ "<td>${clinic.sunOp}</td>"
						+ "<td>${clinic.tel}</td>"
		        + "</tr>";
		    		listDatas += listData;
					
					geocoder.addressSearch("${clinic.address}", function(result, status) {
					
					    // 정상적으로 검색이 완료됐으면 
					     if (status === kakao.maps.services.Status.OK) {
					
					        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					
					        // 결과값으로 받은 위치를 마커로 표시합니다
					        var marker = new kakao.maps.Marker({
					            map: map,
					            position: coords
					        });
					
					        // 인포윈도우로 장소에 대한 설명을 표시합니다
					        var infowindow = new kakao.maps.InfoWindow({
					            content: '<div style="width:150px;text-align:center;padding:6px 0;"> ${clinic.name}</div>'
					        });
					        infowindow.open(map, marker);
					
					        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					        map.setCenter(coords);
				    	
					    } 
					});    
					
				</c:forEach> 	//end each
				
				$("#data-show").empty();
		    	$("#data-show").html(listDatas);
		    </c:if>
			
		});
	
	</script>

</head>
<body>
	
	<!-- contents start -->
	
	<br/>
	<div id="map" style="width:80%; height:500px; margin:0 auto;"></div>
	<br/>
	<div id="data-show"></div>
	<!-- contents end -->
	
	
	<!-- footer호출 -->
	<jsp:include page="./common/footer.jsp" />

</body>
</html>