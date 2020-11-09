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
	<jsp:include page="../common/header.jsp" />
	<!-- js호출 -->
	<script type="text/javascript" src ="../js/join.js"></script>
</head>
<body>
<!-- nav 호출 -->
<jsp:include page="../common/nav.jsp" />

<!-- contents start -->


<!-- contents end -->


<!-- footer호출 -->
<jsp:include page="../common/footer.jsp" />

</body>
</html>