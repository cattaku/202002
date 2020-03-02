<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<style type="text/css">
.row {
	background-color : #FFDD59;
}
</style>
</head>
<body>
	<div style="width:50%;float:left;">
		<table id="listTb" border = "1">
			<thead>
				<tr>
				<th>idx</th>
				<th>name</th>
				<th>date</th>
				</tr>
			</thead>
			<tbody id="testBody"></tbody>
		</table>
	</div>
	
	<div class="detailPop" style="width:40%;float:right;">
		<table>
			<thead>
				<tr> </tr>
			</thead>
			<tbody id="detailBody"></tbody>
			
		</table>
	</div>
</body>
</html>

<script>
// $(document).ready(function() {
	
	
		var dataList = '[{"idx":0,"name":"Black Machine","date":"2020-02-28","content":"TEST_CONTENT_0","money":105166.823243745},{"idx":1,"name":"Playful Host","date":"2020-02-28","content":"TEST_CONTENT_1","money":102792.37053061783},{"idx":2,"name":"Sure-footed Trash","date":"2020-02-28","content":"TEST_CONTENT_2","money":238063.2377462746},{"idx":3,"name":"Blushing Pace","date":"2020-02-28","content":"TEST_CONTENT_3","money":256027.84303359324},{"idx":4,"name":"Second-hand Slice","date":"2020-02-28","content":"TEST_CONTENT_4","money":398845.76541184477},{"idx":5,"name":"Showy Relation","date":"2020-02-28","content":"TEST_CONTENT_5","money":287015.54291430325},{"idx":6,"name":"Phony Independence","date":"2020-02-28","content":"TEST_CONTENT_6","money":380466.42156417255},{"idx":7,"name":"Stained Pension","date":"2020-02-28","content":"TEST_CONTENT_7","money":243219.7523674703},{"idx":8,"name":"Tender Lunch","date":"2020-02-28","content":"TEST_CONTENT_8","money":114291.86789916387},{"idx":9,"name":"Euphoric Pause","date":"2020-02-28","content":"TEST_CONTENT_9","money":252849.5905748338},{"idx":10,"name":"Bubbly Worker","date":"2020-02-28","content":"TEST_CONTENT_10","money":224246.5891911194},{"idx":11,"name":"Stiff Self","date":"2020-02-28","content":"TEST_CONTENT_11","money":84061.3127184655},{"idx":12,"name":"Flimsy Great","date":"2020-02-28","content":"TEST_CONTENT_12","money":149444.9539433181},{"idx":13,"name":"Obvious Convert","date":"2020-02-28","content":"TEST_CONTENT_13","money":364172.2468362293},{"idx":14,"name":"Tight Possible","date":"2020-02-28","content":"TEST_CONTENT_14","money":315834.2760503046},{"idx":15,"name":"Common Sector","date":"2020-02-28","content":"TEST_CONTENT_15","money":271527.0384794326},{"idx":16,"name":"Frayed Length","date":"2020-02-28","content":"TEST_CONTENT_16","money":129923.15373307388},{"idx":17,"name":"Cute Account","date":"2020-02-28","content":"TEST_CONTENT_17","money":211649.4116902449},{"idx":18,"name":"Carefree Excuse","date":"2020-02-28","content":"TEST_CONTENT_18","money":225586.284176988},{"idx":19,"name":"Treasured Chain","date":"2020-02-28","content":"TEST_CONTENT_19","money":352222.618090259},{"idx":20,"name":"Sudden Button","date":"2020-02-28","content":"TEST_CONTENT_20","money":175230.68675979908},{"idx":21,"name":"Fat Presence","date":"2020-02-28","content":"TEST_CONTENT_21","money":136352.12138448204},{"idx":22,"name":"Snarling Recording","date":"2020-02-28","content":"TEST_CONTENT_22","money":212972.52116263047},{"idx":23,"name":"Oval Mood","date":"2020-02-28","content":"TEST_CONTENT_23","money":124539.88949914763},{"idx":24,"name":"Dreary Spirit","date":"2020-02-28","content":"TEST_CONTENT_24","money":214770.61349498402},{"idx":25,"name":"Flickering Pull","date":"2020-02-28","content":"TEST_CONTENT_25","money":84668.80832696529},{"idx":26,"name":"Spectacular Character","date":"2020-02-28","content":"TEST_CONTENT_26","money":122756.4819644031},{"idx":27,"name":"Kooky Fill","date":"2020-02-28","content":"TEST_CONTENT_27","money":386302.4918040958},{"idx":28,"name":"Exemplary Hire","date":"2020-02-28","content":"TEST_CONTENT_28","money":32066.75979048379},{"idx":29,"name":"Perky Fortune","date":"2020-02-28","content":"TEST_CONTENT_29","money":258066.58096112852},{"idx":30,"name":"Colorless Operation","date":"2020-02-28","content":"TEST_CONTENT_30","money":161955.7601717207},{"idx":31,"name":"Powerful Analysis","date":"2020-02-28","content":"TEST_CONTENT_31","money":84492.23607365601},{"idx":32,"name":"Fat Lake","date":"2020-02-28","content":"TEST_CONTENT_32","money":309287.8630534085},{"idx":33,"name":"Frightening Growth","date":"2020-02-28","content":"TEST_CONTENT_33","money":342070.2268277222},{"idx":34,"name":"Stiff Split","date":"2020-02-28","content":"TEST_CONTENT_34","money":53646.42707892173},{"idx":35,"name":"Infamous Pressure","date":"2020-02-28","content":"TEST_CONTENT_35","money":372265.62150207616},{"idx":36,"name":"Dirty Second","date":"2020-02-28","content":"TEST_CONTENT_36","money":261722.91531889647},{"idx":37,"name":"Worst Hat","date":"2020-02-28","content":"TEST_CONTENT_37","money":350771.2522770791},{"idx":38,"name":"Strange Trash","date":"2020-02-28","content":"TEST_CONTENT_38","money":319059.4067275695},{"idx":39,"name":"Weighty Lawyer","date":"2020-02-28","content":"TEST_CONTENT_39","money":386462.62638879294},{"idx":40,"name":"Young Report","date":"2020-02-28","content":"TEST_CONTENT_40","money":38345.48900182018},{"idx":41,"name":"Honored Mess","date":"2020-02-28","content":"TEST_CONTENT_41","money":232751.95830502958},{"idx":42,"name":"Mixed Difficulty","date":"2020-02-28","content":"TEST_CONTENT_42","money":332284.4818001496},{"idx":43,"name":"Unwritten Cancel","date":"2020-02-28","content":"TEST_CONTENT_43","money":192342.96338549984},{"idx":44,"name":"Prickly Economics","date":"2020-02-28","content":"TEST_CONTENT_44","money":5443.364517899063},{"idx":45,"name":"Heavy Project","date":"2020-02-28","content":"TEST_CONTENT_45","money":255843.4633119619},{"idx":46,"name":"Aggravating Hire","date":"2020-02-28","content":"TEST_CONTENT_46","money":38559.816980562544},{"idx":47,"name":"Prize Handle","date":"2020-02-28","content":"TEST_CONTENT_47","money":127321.15640317377},{"idx":48,"name":"Masculine Iron","date":"2020-02-28","content":"TEST_CONTENT_48","money":342994.92676500254},{"idx":49,"name":"Arid Radio","date":"2020-02-28","content":"TEST_CONTENT_49","money":265020.75086718786}]';
		var dataObj = JSON.parse(dataList); 
		var testHtmlbody = "";

		if (dataObj.length > 0) {
			 for(var i=0; i<dataObj.length; i++ ){ 
			
				testHtmlbody += "<tr onclick='fn_detail(" + dataObj[i].idx + ");'>";
				testHtmlbody += "<th>" + dataObj[i].idx + "</th>";
				testHtmlbody += "<th>" + dataObj[i].name + "</th>";
				testHtmlbody += "<th>" + dataObj[i].date + "</th>"; 
				testHtmlbody += "</tr>"
			 } 
			$("#testBody").html(testHtmlbody);  // html 또는 append 
			 // html은 선택한 요소를 지우고 추가됨.
			 // append 선택한 요소를 유지시키고 마지막 부분에 추가함.
			 

		} 
		
		$("#testBody tr").on('click', function() {  // 선택한 리스트 색상변경 이벤트
			$(this).siblings().removeClass("row");      // .siblings() 선택한 요소의 형제 요소 중에서 지정한 선택자에 해당하는 요소를 모두 선택
			$(this).addClass("row");      // $(this) <-- 선택한 행에 클래스를 추가
			
			/* <tr> onclick 이벤트를 사용하지 않고 선택자의 인덱스 값으로 함수를 실행하는 방법 */
// 			var num = $(this).index;
// 			fn_detail(num);
		});
		
			function fn_detail(str) {
				var detailHtml = "";
				

				detailHtml += "<tr>" + "<th>" + "idx" + "</th>" + "<th>" + dataObj[str].idx + "</th>" + "</tr>";
				detailHtml += "<tr>" + "<th>" + "name" + "</th>" + "<th>" + dataObj[str].name + "</th>" + "</tr>";
				detailHtml += "<tr>" + "<th>" + "date" + "</th>" + "<th>" + dataObj[str].date + "</th>" + "</tr>";
				detailHtml += "<tr>" + "<th>" + "content" + "</th>" + "<th>" + dataObj[str].content + "</th>" + "</tr>";
				detailHtml += "<tr>" + "<th>" + "money" + "</th>" + "<th>" + dataObj[str].money + "</th>" + "</tr>";
		
				
				$("#detailBody").html(detailHtml);
		
			}
	

// });


</script>