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
<style type="text/css">
a:link { color:black;text-decoration:none; }
a:visited { color:black;text-decoration:none; }
a:hover { color:black;text-decoration:none; }

</style>

<div align="center">
	<tr>
		<th><a href="${path}/ftp/fileupload">&nbsp; 파일업로드 &nbsp;</a></th>
		<th><a href="${path}/study">&nbsp; 숙제  &nbsp;</a></th>
		<th><a href="${path}/userList">&nbsp; 회원목록  &nbsp;</a></th>
		
	</tr>
</div>
<div class="mainSlider">
<h1 align="center">
	Hello world!  
	메인입니다.
</h1>
</div>
<div>
	<table>
	<tr>
		<th>1</th>
		<th>2</th>
	</tr>
	</table>
</div>

<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
