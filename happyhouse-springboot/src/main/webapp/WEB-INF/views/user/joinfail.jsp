<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>회원가입 실패</title>
  <meta charset="utf-8">
<!-- header호출 -->
<jsp:include page="../common/header.jsp" />
</head>
<body>
<!-- nav 호출 -->
<jsp:include page="../common/nav.jsp" />
<div class="container">
  <div class="jumbotron">
    <h1>회원 가입 실패...!</h1>      
    <p>${msg}</p>
  </div>  
  <p><a href="${root}">메인으로 가기</a></p>
</div>
<!-- footer호출 -->
<jsp:include page="../common/footer.jsp" />
</body>
</html>