<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<nav class="navbar navbar-expand-md bg-dark navbar-dark">
		<a class="navbar-brand" href="../index.jsp">HappyHouse</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="#">공지사항</a></li>
			</ul>
		</div>
		<div class="collapse navbar-collapse justify-content-end"
			id="collapsibleNavbar">
			<ul class="navbar-nav">

				<c:if test="${not empty userinfo}">
					<li class="nav-item"><button type="button"
							onclick="javascript:logout();">로그아웃</button></li>
					<li class="nav-item"><button type="button"
							onclick="javascript:memberDetail();">회원정보</button></li>
				</c:if>
				<c:if test="${empty userinfo}">
					<li class="nav-item"><a class="nav-link"
						href="../user/login.jsp">Login</a></li>
					<li class="nav-item"><a class="nav-link"
						href="../user/join.jsp">회원가입</a></li>
				</c:if>

			</ul>
		</div>
	</nav>
</body>
</html>