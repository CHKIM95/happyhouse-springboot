<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="utf-8" />

<!DOCTYPE html>
<html lang="en">
	<head>
		<title>HappyHouse</title>
		<meta charset="utf-8">
		<!-- header호출 -->
		<jsp:include page="common/header.jsp" />
		<!-- css호출 -->
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
				
		</script>
		
	</head>
	
	<body>
	
		<!-- carousel 시작 -->
		<div id="demo" class="carousel slide" data-ride="carousel"
			data-interval="3000">
			<ul class="carousel-indicators">
				<li data-target="#demo" data-slide-to="0" class="active"></li>
				<li data-target="#demo" data-slide-to="1"></li>
				<li data-target="#demo" data-slide-to="2"></li>
			</ul>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="${root}/resources/images/home1.jpg" alt="Los Angeles" width="1100"
						height="500">
					<div class="carousel-caption">
						<h3>Los Angeles</h3>
						<p>We had such a great time in LA!</p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="${root}/resources/images/home2.jpg" alt="Chicago" width="1100" height="500">
					<div class="carousel-caption">
						<h3>Chicago</h3>
						<p>Thank you, Chicago!</p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="${root}/resources/images/home3.jpg" alt="New York" width="1100" height="500">
					<div class="carousel-caption">
						<h3>New York</h3>
						<p>We love the Big Apple!</p>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#demo" data-slide="prev"> <span
				class="carousel-control-prev-icon"></span>
			</a> <a class="carousel-control-next" href="#demo" data-slide="next">
				<span class="carousel-control-next-icon"></span>
			</a>
		</div>
		<!-- carousel 끝 -->
	
		<!-- select 검색 시작 -->
		<div class="div-select">
			<form id="dong-form" action="${root}/house/synchronousSearch" method="get">
				<select id="houseType" name="houseType" class="background-gray">
					<option value="">선택</option>
					<option value="apartment">아파트</option>
					<option value="multiGeneration">주택</option>
				</select>
				<select id="dealType" name="dealType" class="background-gray">
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
				<input type="submit" id = "searchButton" value="검색" class="background-gray">
			</form>
		</div>
		<!-- select 검색 끝 -->
	
		<br />
		<!-- 카카오 맵 시작 -->
<!-- 		<div id="map" style="width: 80%; height: 350px; margin: 0 auto;"></div> -->
		<!-- 카카오 맵 끝 -->
	
		<br />
	
		<!-- contents 시작 -->
		<div class="container-fluid contents">
			<div class="row">
				<div class="col-sm-8">
					<h3>게시판</h3>
					<table class="table table_striped">
						<thead>
							<tr>
								<th class="title">제목</th>
								<th>작성자</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>덕분에 좋은 집 얻고갑니다!</td>
								<td>윤기현</td>
								<td>1756</td>
							</tr>
							<tr>
								<td>저희 부모님이 너무 좋아하세요!</td>
								<td>박지현</td>
								<td>998</td>
							</tr>
							<tr>
								<td>구해줘 홈즈는 필요없다!</td>
								<td>한혜원</td>
								<td>856</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="col-sm-4">
					<h3>[ News! ]</h3>
					<table class="table table_bordered table_hover">
						<thead>
							<tr>
								<th class="title">제목</th>
								<th>작성자</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>정부 아파트정책 Happay Hou..</td>
								<td>기자</td>
								<td>12</td>
							</tr>
							<tr>
								<td>문재인 대통령 HH대표에게 표창장을..</td>
								<td>기자</td>
								<td>998</td>
							</tr>
							<tr>
								<td>30년만에 내집마련 이곳에서!</td>
								<td>기자</td>
								<td>856</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- contents 끝 -->
		<br />

		<!-- footer호출 -->
		<jsp:include page="common/footer.jsp" />
	</body>

</html>
