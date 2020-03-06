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
<style type="text/css">
.row {
	background-color : #FFDD59;
}
</style>
<body>
<div class="" align="center">
	<div class="" align="center">
		<button>회원관리</button>
		<button>렌탈현황</button>
		<button>재고현황</button>
	</div>
	<div padding-top="3px">
		<tr>
			<td><input type="text" id="filmTitle" placeholder="search Film..."></td>
		</tr>	
		<button id="searchBtn" onclick="rentalSearch();">조회</a></button>
	</div>
	
	<div>
	<table border="1" padding="2">
		<colgroup>
			<col width="10%"><col width="40%"><col width="10%"><col width="10%"><col width="30%">
		</colgroup>
		
		<thead>
		<tr>
			<td >No.</td>
			<td>영화명</td>
			<td>점포명</td>
			<td>재고위치</td>
			<td>대여 고객명</td>
		</tr>
		</thead>
		
		<tbody id="listBody">
		</tbody>
	</table>
	
	</div>
	
</div>
</body>
</html>

<script>

//input창 Enter키 입력시 실행
$("#filmTitle").keypress(function(event){
	if ( event.which == 13 ){
		rentalSearch();
	}
});

function rentalSearch() {
	var filmTitle = $("#filmTitle").val();
// 	var startNum = $("#listBody tr").length;

	if(filmTitle == ""){
		alert("검색할 영화명을 입력해주세요");
		return false;
	}
	
 	 $.ajax({
		url  : "getRentalList",
		type : "post",
		data : { "filmTitle":filmTitle },
		dataType : "json",
		success : function(data) {
			var listData = data;
			var listBodyHtml = "";
			
			console.log("data", data);
			
			
			
			
			if(listData.length > 0){
				for(var i=0; i < listData.length; i++){
					var idx = Number(i)+1;
					
					listBodyHtml += "<tr>";
					listBodyHtml += "<td>" + idx + "</td>";
					listBodyHtml += "<td>" + listData[i].title + "</td>";
					listBodyHtml += "<td>" + listData[i].storeId + "</td>";
					listBodyHtml += "<td>" + listData[i].invenId + "</td>";
					listBodyHtml += "<td>" + listData[i].customerNm +"</td>";
					listBodyHtml += "</tr>";
				}
				$("#listBody").html(listBodyHtml);
				//선택행에 스타일 
				$("#listBody tr").on('click', function() {
					$(this).siblings().removeClass("row");
					$(this).addClass("row");
				});
			}		
		}
	});  
}



</script>