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
							
							let area = $(this).find("전용면적").text();
							let floor = $(this).find("층").text();
							let gugunCode = $(this).find("지역코드").text();

							let houseInfo = [builtYear, dong, price, houseName, area, floor, gugunCode];
							$("#result").append(houseInfo + "<br/>");
							houseInfoArr[i++] = houseInfo;
						});//each
					},
					error:function(xhr, status, msg){
						console.log("상태값:"+status+" http에러메시지:" + msg);
					}
				});//ajax
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
		<div id = "result">

		</div>
	
		<!-- footer호출 -->
		<jsp:include page="common/footer.jsp" />
		
	</body>
</html>