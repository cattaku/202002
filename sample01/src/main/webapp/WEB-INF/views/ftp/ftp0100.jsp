<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>
</head>
<%@ include file = "../include/header.jsp" %>
<body>
<%-- <div style="text-align:right;">
  <c:choose>
     <c:when test="${sessionScope.userId==null}">
        <a href="${path}/login">login</a> 
	 </c:when>
	<c:otherwise>
        ${sessionScope.userNm}님이 로그인 중입니다.
        <a href="${path}/logout">logout</a> 
     </c:otherwise> 
   </c:choose>
</div> --%>
<div>
<table>
<tr>
<td>아이디</td>
<td>이름</td>
<td>회원타입</td>
</tr>
<tr>
${list}
<td>${userId}</td>
<td>${userNm}</td>
<td>${userType}</td>
</tr>
</table>
</div>	

<!-- ============================== -->
 
<div>
<h2>file upload</h2>
<form id="fileForm" method="post" action="${path}/ftp/ftp0200" enctype="multipart/form-data">
	<div>
		<table>
			<tr>
				<td><label>파일 1: </label><input>
				<input type="file" name="file" id="fileTag1">
				</td>
			</tr>	
			<tr>
				<td><label>파일2 : </label><input>
				<input type="file" name="file" id="fileTag2">
				</td>
			</tr>
		</table>
	</div>
	<div class="botBtn">
		<!-- <input type="submit" id="fileBtn" value="upload"> -->
		<input type="button" id="fileBtn" value="upload" onclick="fileUpload();">
	</div>
		

</form>
</div>
</body>
</html>

<script>

 function fileUpload() {
	var form = $("#fileForm")[0];
	var formData = new FormData(form);
	
	formData.append("fileObj1", $("#fileTag1")[0].files[0]);
	formData.append("fileObj2", $("#fileTag2")[0].files[0]);
	
	$.ajax({
		url : "",
		type : "post",
		processData : false,
		contentType : false,
		data : formData, 
		dataType : "text",
		success : function(json) {
			var obj = JSON.parse(json);
			
		}
		
		
		
	})	
	
} 
</script>