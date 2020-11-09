<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<jsp:include page="common/header.jsp" />
		<link rel="stylesheet" href="${root}/resources/css/index.css" type="text/css">
		
		<script>
			
			$(function(){
				$.ajax({
					url:"${root}/house/sido",
					type:"GET",
					contentType:"application/json; charset=utf-8",
					dataType:"json",
					success:function(sidos){
						$.each(sidos, function(index, sido){
							$("#sido").append(
									"<option value='"+sido.sidoCode+"'>"
											+ sido.sidoName + "</option>");
						}); //each
					},
					error:function(xhr, status, msg){
						console.log("상태값:"+status+" http에러메시지:" + msg);
					}
				});
			}); //ready
			
			$(function(){
				
				$("#sido").change(
					function(){
						$.ajax({
							url:"${root}/house/gugun",
							type:"GET",
							contentType:"application/json; charset=utf-8",
							data:{"sido" : $("#sido").val()},
							dataType:"json",
							success:function(guguns){
								$("#gugun").empty();
								$("#gugun").append(
								'<option value="0">선택</option>');
								$.each(guguns, function(index, gugun){
									$("#gugun").append(
											"<option value='"+gugun.gugunCode+"'>"
													+ gugun.gugunName
													+ "</option>");
								}); //each
							},
							error:function(xhr, status, msg){
								console.log("상태값:"+status+" http에러메시지:" + msg);
							}
						});
					});	//sido
				
			}); //ready
			
			$(function(){
				let searchWords = ["${houseType}", "${dealType}", "${gugun}", "${dong}"];
				showDatas(searchWords)
			})
			
			$(function(){
				$("#searchButton").click(function(){
					let searchWords = [$("#houseType").val(), $("#dealType").val(), $("#gugun").val(), $("#dong").val()];
					showDatas(searchWords);
				});//click
			});
			
			let houseInfoArr = new Array();
			
			function showDatas(searchWords){
				$("#result").empty();
				$.ajax({
					url:"${root}/house/asynchronousSearch",
					type: "GET",
					contentType:"application/json; charset=utf-8",
					data: {"houseType" : searchWords[0],
						"dealType" : searchWords[1],
						"gugun" : searchWords[2],
						"dong" : searchWords[3]},
					dataType: "xml",
					success : function(xml){
						houseInfoArr = new Array();
						let i = 0;
						$(xml).find("item").each(function(){
							let builtYear = $(this).find("건축년도").text();
							let dong =  $(this).find("법정동").text();
							let price;
							if(searchWords[1]=="rent")
								price = $(this).find("보증금액").text();	
							else if(searchWords[1]=="buy")
								price = $(this).find("거래금액").text();
							
							let houseName;
							if(searchWords[0]=="apartment")
								houseName = $(this).find("아파트").text();
							else if(searchWords[0]=="multiGeneration")
								houseName = $(this).find("연립다세대").text();
							
							let jibun = $(this).find("지번").text();
							let area = $(this).find("전용면적").text();
							let floor = $(this).find("층").text();
							let gugunCode = $(this).find("지역코드").text();

							let houseInfo = [builtYear, dong, price, houseName, jibun, area, floor, gugunCode];
							houseInfoArr[i++] = houseInfo;
						});//each
						kakaoMap(houseInfoArr);
						
					},
					error:function(xhr, status, msg){
						console.log("상태값:"+status+" http에러메시지:" + msg);
					}
				});//ajax
			}
				
			function kakaoMap(houseInfoArr){
				$(function(){
					
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = {
				        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				        level: 7 // 지도의 확대 레벨
				    };  

					// 지도를 생성합니다    
					var map = new kakao.maps.Map(mapContainer, mapOption); 
	
					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();
					let listDatas = "<table class=\"table mt-2\">";
					listDatas += "<tr><th>번호</th><th>법정동</th><th>집이름</th><th>지번</th><th>지역코드</th><th>상세거래정보</th></tr>";
					$.each(houseInfoArr, function(index, houseInfo){
		
						let listData = "<tr>" 
							+ "<td>"+ index +"</td>"
							+ "<td>"+houseInfo[1]+"</td>"
							+ "<td>"+houseInfo[3]+"</td>"
							+ "<td>"+houseInfo[4]+"</td>"
							+ "<td>"+houseInfo[7]+"</td>"
							+ "<td>   <button type='button' class='btn btn-primary' data-toggle='modal' data-target='#myModal' onclick='modalFunc("+index+")'> "
						    + "상세정보</button> </td>"
				    		+ "</tr>";
				    	listDatas += listData;
						
						// 주소로 좌표를 검색합니다
						geocoder.addressSearch(houseInfo[1] + " " + houseInfo[4], function(result, status) {
		
						    // 정상적으로 검색이 완료됐으면 
						     if (status === kakao.maps.services.Status.OK) {
		
						        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
						        // 결과값으로 받은 위치를 마커로 표시합니다
						        var marker = new kakao.maps.Marker({
						            map: map,
						            position: coords
						        });
								

							     // 커스텀 오버레이에 표시할 컨텐츠 입니다
							     // 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
							     // 별도의 이벤트 메소드를 제공하지 않습니다 
							     var content = '<div class="wrap">' + 
							                 '    <div class="info">' + 
							                 '        <div class="title">' + 
							                			+ houseInfo[3] +
							                 '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
							                 '        </div>' + 
							                 '        <div class="body">' + 
							                 '            <div class="img">' +
							                 '                <img src="#" width="73" height="70">' +
							                 '           </div>' + 
							                 '            <div class="desc">' + houseInfo[1] + " " + houseInfo[4] + 
							                 '                <div class="ellipsis">'+ "가격 : " + houseInfo[2] + 
							                 '                <div class="jibun ellipsis">'+ "평수 : " + houseInfo[5] + " 층 : " + houseInfo[6] + 
							                 '                <div>' + "구군 코드 " + houseInfo[7] + '</div>' + 
							                 '            </div>' + 
							                 '        </div>' + 
							                 '    </div>' +    
							                 '</div>';
	
							     // 마커 위에 커스텀오버레이를 표시합니다
							     // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
							     var overlay = new kakao.maps.CustomOverlay({
							         content: content,
							         map: map,
							         position: marker.getPosition()       
							     });
	
							     // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
							     kakao.maps.event.addListener(marker, 'mouseover', function() {
							         overlay.setMap(map);
							     });
							     kakao.maps.event.addListener(marker, 'mouseout', function() {
							         overlay.setMap(null);
							     });
							     closeOverlay(overlay);
							  	// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							   	map.setCenter(coords);
						    } //end ok
						});    //endSearch
						
					});// end each
					listDatas += "</table>"
					$("#data-show").empty();
					$("#data-show").html(listDatas);
					
				});//end ready
			}
			
			function closeOverlay(overlay) {
			    overlay.setMap(null);     
			}
			
			function modalFunc(index){
				let infoData = "<table class=\"table mt-2\">";
				infoData += "<tr><th>건축년도</th><th>"+houseInfoArr[index][0]+"</th><tr/>"
				infoData += "<tr><th>동</th><th>"+houseInfoArr[index][1]+"</th><tr/>"
				infoData += "<tr><th>가격</th><th>"+houseInfoArr[index][2]+"</th><tr/>"
				infoData += "<tr><th>집이름</th><th>"+houseInfoArr[index][3]+"</th><tr/>"
				infoData += "<tr><th>지번</th><th>"+houseInfoArr[index][4]+"</th><tr/>"
				infoData += "<tr><th>평수</th><th>"+houseInfoArr[index][5]+"</th><tr/>"
				infoData += "<tr><th>층</th><th>"+houseInfoArr[index][6]+"</th><tr/>"
				infoData += "</table>"
				
				$("#modalBody").html(infoData);
			}
		     
		</script>
	</head>
	
	<body>
	
		<!-- select 검색 시작 -->
		<div class="div-select">
			<select id="houseType" name="houseType" class="background-gray">
				<option value="">선택</option>
				<option value="apartment">아파트</option>
				<option value="multiGeneration">주택</option>
			</select> 
			<select id="dealType" name="dealType" default class="background-gray">
				<option value="">선택</option>
				<option value="buy">매매</option>
				<option value="rent">전월세</option>
			</select> 
			<select id="sido" name="sido" class="background-gray">
				<option value="">선택</option>
			</select> 
			<select id="gugun" name="gugun" class="background-gray">
				<option value="">선택</option>
			</select> 
			<input type="submit" id="searchButton" value="검색" class="background-gray">
		</div>
		<!-- select 검색 끝 -->

		<!-- kakao map -->
		<br/>
		<div id="map" style="width:80%; height:500px; margin:0 auto;"></div>
		<br/>
		<!-- kakao map 끝 -->
		
		<!-- 모달 -->
		<div class="container">

		  <!-- The Modal -->
		  <div class="modal fade" id="myModal">
		    <div class="modal-dialog modal-lg">
		      <div class="modal-content">
		      
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h4 class="modal-title">상세정보</h4>
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        
		        <!-- Modal body -->
		        <div class="modal-body" id = "modalBody">

		        </div>
		        
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        </div>
		        
		      </div>
		    </div>
		  </div>
		  
		</div>
		<!-- 모달 끝 -->
		
		<div id="data-show"></div>
		
		
		
		<!-- footer호출 -->
		<jsp:include page="common/footer.jsp" />
		
	</body>
</html>