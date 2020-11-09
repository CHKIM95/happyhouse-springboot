<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>회원가입 성공</title>
  <meta charset="utf-8">
  <!-- header호출 -->
<jsp:include page="../common/header.jsp" />
</head>
<body>
<!-- nav 호출 -->
<jsp:include page="../common/nav.jsp" />
<div class="container">
  <div class="jumbotron">
    <h1>${registerinfo.username}님 회원 가입을 환영합니다.</h1>
    <p>가입하신 정보는 아래와 같습니다.</p>      
    <p>가입 아이디: ${registerinfo.userid}</p>
    <p>가입 이메일: ${registerinfo.email}</p>
    <p>가입 주소 : ${registerinfo.address}</p>
  </div>  
  <p><a href="${root}">메인으로 가기</a></p>
</div>
<!-- footer호출 -->
<jsp:include page="../common/footer.jsp" />
</body>
</html>