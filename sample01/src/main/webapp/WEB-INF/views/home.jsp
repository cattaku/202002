<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<html>
<head>
	<title>Home</title>
</head>
<%@ include file = "include/header.jsp" %>
<body>
<div align="center">
	<tr>
		<th><a href="${path}/ftp/fileupload">&nbsp; 파일업로드 &nbsp;</a></th>
		<th><a href="${path}/study">&nbsp; Study  &nbsp;</a></th>	
		<th><a href="${path}/user/login">&nbsp; login  &nbsp;</a></th>	
	</tr>
</div>
<div class="mainSlider">
<h1 align="center">
	Hello world!  <br>
	메인입니다.
</h1>
</div>
<div>
	<table>
	<tr>adfasd</tr>
	<tr></tr>
	</table>
</div>

<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
