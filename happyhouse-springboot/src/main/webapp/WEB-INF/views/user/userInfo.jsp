<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>HappyHouse-회원가입</title>
	<meta charset="utf-8">
	
	<!-- header호출 -->
	<jsp:include page="../common/header.jsp" />
	<!-- js호출 -->
	<script type="text/javascript" src ="../resources/js/join.js"></script>
	<!-- css호출 -->
	<link rel="stylesheet" href="../css/login.css" type="text/css">
	
</head>
<body>
<!-- nav 호출 -->
<%-- <jsp:include page="../common/nav.jsp" /> --%>
	<div class="container" align="center">
		<div id="inner-head">
		<br>
		<img src="${root}/resources/images/logo.png">
		</div>
		<h2>회원가입</h2>
		<div class="col-lg-6" align="center">
			<form id="memberform" method="post" action="">
				<input type="hidden" name="act" id="act" value="join">
				<div class="form-group" align="left">
					<label for="name">이름</label> <input type="text"
						class="form-control" id="username" name="username" placeholder="">
				</div>
				<div class="form-group" align="left">
					<label for="">아이디</label> <input type="text" class="form-control"
						id="userid" name="userid" placeholder="">
				</div>
				<div class="form-group" align="left">
					<label for="">비밀번호</label> <input type="password"
						class="form-control" id="userpwd" name="userpwd" placeholder="">
				</div>
				<div class="form-group" align="left">
					<label for="">비밀번호재입력</label> <input type="password"
						class="form-control" id="pwdcheck" name="pwdcheck" placeholder="">
				</div>
				<div class="form-group" align="left">
					<label for="email">이메일</label><br>
					<div id="email" class="custom-control-inline">
						<input type="text" class="form-control" id="emailid"
							name="emailid" placeholder="" size="25"> @ <select
							class="form-control" id="emaildomain" name="emaildomain">
							<option value="naver.com">naver.com</option>
							<option value="google.com">google.com</option>
							<option value="daum.net">daum.net</option>
							<option value="nate.com">nate.com</option>
							<option value="hanmail.net">hanmail.net</option>
						</select>
					</div>
				</div>
				<div class="form-group" align="center">
					<button type="button" class="btn btn-primary" id="updateBtn">수정</button>
					<button type="button" class="btn btn-danger" id="deleteBtn" onclick="">삭제</button>
					
<%-- 					<a href="${root}/memberDelete?articleno=${article.articleno}">삭제</a> --%>
				</div>
			</form>
		</div>
	</div>
	<div class="inner-foot">
		<p class="tag">HappyHouse in SSAFY</p>
	</div>
<jsp:include page="../common/footer.jsp" />
</body>
</html>