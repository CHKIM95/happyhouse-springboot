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
				
				$("#gugun").change(
						function(){
							$.ajax({
								url:"${root}/house/dong",
								type:"GET",
								contentType:"application/json; charset=utf-8",
								data:{"gugun" : $("#gugun").val()},
								dataType:"json",
								success:function(dongs){
									$("#dong").empty();
									$("#dong").append(
									'<option value="0">선택</option>');
									$.each(dongs, function(index, dong){
										$("#dong").append(
												"<option value='"+dong.dongName+"'>"
														+ dong.dongName
														+ "</option>");
									}); //each
								},
								error:function(xhr, status, msg){
									console.log("상태값:"+status+" http에러메시지:" + msg);
								}
							});
						});	//gugun
				
			}); //ready
			
/* 			$(function(){
				
				$.ajax({
					url:"${root}/house/synchronousSearch",
					type: "GET",
					dataType: "xml",
					success : function(xml){
						$(xml).find("item").each(function(){
							let dong = $(this).find("법정동").text();
							$("#result").append(dong);
						});//each
					}//success
				});
				
			}); */
				
		</script>
	</head>
	
	<body>
	
		<!-- select 검색 시작 -->
		<div class="div-select">
			<select id="houseType" name="houseType" class="background-gray">
				<option value="">선택</option>
				<option value="all">전체</option>
				<option value="apartment">아파트</option>
				<option value="multiGeneration">주택</option>
			</select> 
			<select id="sido" name="sido" class="background-gray">
				<option value="">선택</option>
			</select> 
			<select id="gugun" name="gugun" class="background-gray">
				<option value="">선택</option>
			</select> 
			<select id="dong" name="dong" class="background-gray">
				<option value="">선택</option>
			</select>
			<input type="submit" id="searchButton" value="검색" class="background-gray">
		</div>
		<!-- select 검색 끝 -->
		<div id = "result">
			${xml}
		</div>
	
		<!-- footer호출 -->
		<jsp:include page="common/footer.jsp" />
		
	</body>
</html>