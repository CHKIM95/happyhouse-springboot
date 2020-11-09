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
	<link rel="stylesheet" href="${root}/resources/css/login.css" type="text/css">
	
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
			<form id="memberform" method="post" action="./join">
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
<!-- 				<div class="form-group" align="left"> -->
<!-- 					<label for="">주소</label><br> -->
<!-- 					<div id="addressdiv" class="custom-control-inline"> -->
<!-- 						<input type="text" class="form-control" id="zipcode" -->
<!-- 							name="zipcode" placeholder="우편번호" size="7" maxlength="5" -->
<!-- 							readonly="readonly"> -->
<!-- 					</div> -->
<!-- 					<input type="text" class="form-control" id="address" name="address" -->
<!-- 						placeholder=""> <input type="text" class="form-control" -->
<!-- 						id="address_detail" name="address_detail" placeholder=""> -->
<!-- 				</div> -->
				<div class="form-group" align="center">
					<button type="button" class="btn btn-primary" id="registerBtn">회원가입</button>
					<button type="reset" class="btn btn-warning">초기화</button>
				</div>
			</form>
		</div>
	</div>

	<div id="zipModal" class="modal fade" role="dialog">
		<h5 class="modal-title" id="myModalLabel">우편번호검색</h5>
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header text-center">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
<!-- 				<div class="modal-body text-center"> -->
<!-- 					<form id="zip_codeForm"> -->
<!-- 						<div align="center"> -->
<!-- 							<label>도로명 주소검색</label> -->
<!-- 						</div> -->
<!-- 						<div class="input-group" align="left"> -->
<!-- 							<input type="text" class="form-control" id="doro" name="doro" -->
<!-- 								placeholder="검색 할 도로명 입력(예: 대왕판교로, 학하서로)"> <span -->
<!-- 								class="input-group-btn"> <input type="submit" -->
<!-- 								class="btn btn-warning" value="검색" id="searchBtn"> -->
<!-- 							</span> -->
<!-- 						</div> -->
<!-- 					</form> -->
<!-- 					<div style="width: 100%; height: 200px; overflow: auto"> -->
<!-- 						<table class="table text-center"> -->
<!-- 							<thead> -->
<!-- 								<tr> -->
<!-- 									<th style="width: 150px;">우편번호</th> -->
<!-- 									<th style="width: 600px;">주소</th> -->
<!-- 								</tr> -->
<!-- 							</thead> -->
<!-- 							<tbody id="zip_codeList"></tbody> -->
<!-- 						</table> -->
<!-- 					</div> -->
 				</div>
			</div>
		</div>
	</div>
	<div class="inner-foot">
		<p class="tag">HappyHouse in SSAFY</p>
	</div>
<jsp:include page="../common/footer.jsp" />
</body>
</html>