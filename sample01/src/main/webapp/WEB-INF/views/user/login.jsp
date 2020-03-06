<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<title>로그인</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0, width=device-width">
<meta name="description" content="">
<meta name="keywords" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<link rel="stylesheet" type="text/css" href="../resources/css/login.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

</head>
<body>
<!-- wrapper -->
<div id="wrapper" class="wrapper">
    <div class="loginWrap">
        <div class="loginForm">
          
                <fieldset>
                    <legend>Login</legend>
                    <ul>
                        <li><input type="text" id="userId" name="userId" placeholder="이메일 형식으로 입력해 주세요" autofocus></li>
                        <li><input type="password" id="userPw" name="userPw"></li>
                    </ul>
                    <div class="flexWrap">
                        <div class="flexBox saveWrap"><input type="checkbox" id="saveId" class="saveId"tabindex="0"><label for="saveId">아이디 저장</label></div>
                        <div class="flexBox joinWrap"><a href="#" class="join">회원가입</a></div>
                    </div>
                    <div class="btn-box"><button class="btn-login" onclick="login()">Login</button></div>
                </fieldse>
            
        </div>
    </div>
</div>
<!-- //wrapper -->
</body>
</html>

<script>
function login() {
	
	var userId = $("#userId").val();
	var userPw = $("#userPw").val();
	
	console.log("userPw",userPw);
	$.ajax({
		url : "loginChk",
		type : "post",
		data : { "userId":userId, "userPw":userPw },
		success : function(result) {
			console.log("result",result.list);
			if(result.list.length > 0){
				location.href = "/";
			}else{
				alert("로그인 실패!!!!!!!");
				$("#userId").val("");
				$("#userPw").val("");
				return false;
			}
		}
	});	
}
</script>