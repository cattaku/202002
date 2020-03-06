<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file = "../include/header.jsp" %>
<body>
<div>
	<table>
		<thead>
			<tr>
				<th>고객코드</th>
				<th>고객명</th>
				<th>마지막 접속일</th>
			</tr>
		</thead>
		<tbody id="listBody">
		<c:forEach items="${result}" var="list" varStatus="status">
			<tr>
				<td>${list.actor_id}</td>
				<td>${list.first_name}${list.last_name}</td>
				<td>${list.last_update}</td>
			</tr>
		</c:forEach>
		<!-- <tr id="addBtn">
			<td colspan="5"><a href="moreList();">더보기</a> -->
		</tbody>
	</table>
</div>

</body>
</html>

<script>


</script>