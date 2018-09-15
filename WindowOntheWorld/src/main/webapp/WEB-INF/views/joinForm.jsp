<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Window On the World</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
<!-- 	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/> -->
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./resources/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./resources/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="./resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="./resources/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./resources/css/util.css">
	<link rel="stylesheet" type="text/css" href="./resources/css/main.css">
<!--===============================================================================================-->
<style type="text/css">
.joinForm{
	padding: 55px;
}
#cma_image{
	position: relative;
	display: inline-block;
    background: center center no-repeat;
    border-radius: 50%;
    width: 100px;
    height: 100px;
    background-size: 100px;
}
</style>
<script type="text/javascript">
<c:if test="${errorMsg != null}">alert('${errorMsg}');</c:if>
//가입폼 확인
function formCheck() {
	var id = document.getElementById('id');
	var pw = document.getElementById('password');
	var pw2 = document.getElementById('password2');
	var nickname = document.getElementById('nickname');
	
	if (id.value.length < 3 || id.value.length > 10) {
		alert("ID는 3~10자로 입력하세요.");
		id.focus();
		id.select();
		return false;
	}
	if (pw.value.length < 3 || pw.value.length > 10) {
		alert("비밀번호는 3~10자로 입력하세요.");
		pw.focus();
		pw.select();
		return false;
	}
	if (pw.value != pw2.value) {
		alert("비밀번호를 정확하게 입력하세요.");
		pw.focus();
		pw.select();
		return false;
	}
	if (nickname.value == '') {
		alert("이름을 입력하세요.");
		name.focus();
		name.select();
		return false;
	}
	return true;
}
//ID 중복확인 창 열기
function idcheckOpen() {
	window.open("idcheck","newwin","top=200,left=400,width=400,height=300,resizable=no");
}
function getThumbnailPrivew(html, $target) {
    if (html.files && html.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $target.css('display', '');
            $target.css('background-image', 'url(\"' + e.target.result + '\")'); 
        }
        reader.readAsDataURL(html.files[0]);
    }
}
</script>
</head>
<body style="background-color: #666666;">	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form joinForm" id="joinform" action="join" method="post" onSubmit="return formCheck();">
					ID<br/>
					<input type="text" name="id" id="id" maxlength="10" readonly="readonly" value="${members.id}" ><br/>
					<button onclick="idcheckOpen()">overlap check</button><br/>
		
					Password<br/>
					<input type="password" name="password" id="password" value="${members.password}"><br/>

					Password check<br/>
					<input type="password" name="password2" id="password2" value="${members.password}"><br/>

					Email<br/>
					<input type="text" name="email" id="email" value="${members.email}"><br/>

					Name<br/>
					<input type="text" name="nickname" id="nickname"><br/>
					
					Gender<br/>
					<input type="radio" name="gender" value="male" checked />male
					<input type="radio" name="gender" value="female" />female
					
					<br/>

					Age<br/>
					<input type="number" name="age" min="1" max="99" name="age" value="${members.age}"><br/>

					Image<br/>
					<input type="file" name="filename" id="cma_file" accept="image/*" capture="camera" onchange="getThumbnailPrivew(this,$('#cma_image'))" />
       				<div id="cma_image"></div>
       				
					Nation<br/>
					<select name="nationality">
			  			<option value="Korea" >Korea</option>
			  			<option value="Japan">Japan</option>
			  			<option value="USA">USA</option>
			  			<option value="China">China</option>
					</select>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn">Join</button>
					</div>
				</form>
				<div class="login100-more" style="background-image: url('./resources/images/login_back.jpg');">
				</div>
			</div>
		</div>
	</div>
<!--===============================================================================================-->
	<script src="./resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="./resources/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="./resources/vendor/bootstrap/js/popper.js"></script>
	<script src="./resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="./resources/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="./resources/vendor/daterangepicker/moment.min.js"></script>
	<script src="./resources/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="./resources/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="./resources/js/main.js"></script>
</body>
</html>