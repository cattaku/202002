<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- header -->
<%@ include file = "../include/header.jsp" %>
<!-- 부트스트랩 스타일링크 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<style type="text/css">
.row {
	background-color : #FFDD59;
}
p { margin:20px 0px; }
</style>
</head>

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
	<!-- 페이징 화면 -->
			
	<div class="container">
		<div class="row">
			<div class="col">
			<ul class="pagination">
				
			</ul>
			</div>
		</div>	
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
    var startList = $(this).attr("data-page");
	
	if(filmTitle == ""){
		alert("검색할 영화명을 입력해주세요");
		return false;
	}
	
 	 $.ajax({
		url  : "getRentalList",
		type : "post",
		data : { "filmTitle":filmTitle 
			    ,"startList":startList },
		dataType : "json",
		success : function(data) {
			var listData = data.list;
	        var listCnt = data.listCnt
	    	var listBodyHtml = "";
			
			if(listData.length < 10){
				$("#pagination").remove();
			}else if(listData.length > 0) {
				
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
			}
				$("#listBody").html(listBodyHtml);
				
				paging(listCnt);   //페이징 함수 호출
				
				$("#listBody tr").on('click', function() {  //선택행에 스타일 
					$(this).siblings().removeClass("row");
					$(this).addClass("row");
				});
		} 
 	}); 
 }
			
function paging(listCnt) {
	
	$(".pagination").empty();     //페이징에 필요한 객체내부를 비워준다.
	
	// ============================ 페이징 처리
	
	if(listCnt > 10){
		$("#pagination").addClass();

		var endPage = listCnt/10;
		var pageHtml = "";
			
		for(var i=0; i < 10; i++){
			var page = Number(i)+1;
			
			pageHtml += "<li class='page-item' data-page='"+ page +"'>";
// 			pageHtml += "<a class='page-link' href='javascript:void(0);' onclick='rentalSearch();'>" + page + "</a>";
			pageHtml += "<a class='page-link'>" + page + "</a>";
			pageHtml += "</li>";		
		}
		$(".pagination").append(pageHtml);
	}
	
}
			
			 

			/* 
			$(".page-item").click(function() {
				page = $(this).attr("data-page");
				document.write(rentalSearch(page));
			});
			 */
		


</script>