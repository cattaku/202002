<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file = "../include/header.jsp" %>
<body>
<ul>
	<li><a href="${path}/study/jsonList">&nbsp; json  &nbsp;</a></li>
	<li><a href="${path}/study/filmList">&nbsp; 영화 목록  &nbsp;</a></li>
	<li><a href="${path}/user/userList">&nbsp; 배우 목록  &nbsp;</a></li>
	<li><a href="${path}/study/rentalList">&nbsp; 대여 목록  &nbsp;</a></li>
</ul>
</body>
</html>