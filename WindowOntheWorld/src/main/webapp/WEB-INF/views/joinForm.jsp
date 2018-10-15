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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
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
	/* position: relative; */
	display: inline-block;
	align-self:center;
	align-content:center;
	align-items:center;
	margin:auto;
	justify-content:center;
	display:flex;
    background: center center no-repeat;
    border-radius: 50%;
    width: 125px;
    height: 125px; 
    background-size: 125px; 
}

.centered {
  position: relative;
  display: inline-block;
 
  width: 70%;
  padding: 1em;

 
}

.red{
 background-color: red;
}

.blue{
 background-color: blue;
}

.yellow{
 background-color: yellow;
}

/*----start-header----*/
.header{
  	position: fixed;
  	top: 0;
  	left: 0;
  	width: 100%;
  	background: #222730;
  	z-index: 1000;
  	overflow: hidden;
  	padding-top: 10px;
  	padding-bottom: 10px;
}
.logo{
	max-width:150px;
	max-height:auto;
	float:left;
}

.search_area{
	background-color:#FFF;
	text-align:center;
	padding-top: 150px;
}

.search_area input#input_keyword{
	width: 90%;
	height: 100px;
	font-size:50px;
}

.search_area input#search_button{
	display: inline-block;
    vertical-align: middle;
    height: 85px;
    width: auto;
}

.table {
    display:table;
    width:100%;
}
.cell {
    display:table-cell;
    border:1px solid black;
    width:50%;
    height:200px;
    vertical-align:middle;
}
html, body{
    margin: 0;

    padding: 0;

    min-width: 100%;
    width: 100%;
    max-width: 100%;

    min-height: 100%;
    height: 100%;
    max-height: 100%;
}


/* [ Button ] */
.container-login100-form-btn {
  width: 100%;
  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
}

.login100-form-btn {
  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 0 20px;
  width: 100%;
  height: 50px;
  border-radius: 10px;
  background: #06a6c2;

  font-family: Montserrat-Bold;
  font-size: 12px;
  color: #fff;
  line-height: 1.2;
  text-transform: uppercase;
  letter-spacing: 1px;

  -webkit-transition: all 0.4s;
  -o-transition: all 0.4s;
  -moz-transition: all 0.4s;
  transition: all 0.4s;
}

.login100-form-btn:hover {
  background: #333333;
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
			<div class="wrap-login100"  >
				<form  class="login100-form validate-form joinForm" id="joinform" action="join" method="post" onSubmit="return formCheck();">
					
					<div class="jumbotron text-center">
  					<img src="resources/images/wow_logo.png" width="150px" height="150px"/>
  					<h1><strong>Sign UP</strong></h1>
  					<br>
 					 <p>WOW 서비스의 회원이 되어보세요!</p> 
					</div>
					
					<div class="flex-container" style="height:200px; right: 100px; justify-content: center;align-content: center;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>프로필사진</strong><br/>
					<img class="form-control red" id="cma_image"  style="align-content: center;"> 			
					<input type="file" name="filename" id="cma_file" accept="image/*" capture="camera" onchange="getThumbnailPrivew(this,$('#cma_image'))"  class="form-control"/>
       				<div class="blue" id="cma_image" style="height: 100px; size: 100px;"></div>
       				</div>
					
					ID<br/>
					<input class="form-control" type="text" name="id" id="id" maxlength="10" readonly="readonly" value="${members.id}" ><br/>
					<span class="glyphicon glyphicon-search">	</span> 
					<button class="glyphicon glyphicon-search login100-form-btn" onclick="idcheckOpen()">overlap check</button><br/>
				
					Password<br/>
					<input class="form-control"  type="password" name="password" id="password" value="${members.password}"><br/>

					Password check<br/>
					<input class="form-control"  type="password" name="password2" id="password2" value="${members.password}"><br/>

					Email<br/>
					<input class="form-control"  type="text" name="email" id="email" value="${members.email}"><br/>

					Name<br/>
					<input class="form-control"  type="text" name="nickname" id="nickname"><br/>
					
					Gender<br/>
					<div class="" style="margin: auto;">	
						<select class="form-control" name="gender">
			  			<option value="male" >male</option>
			  			<option value="female">female</option>
			  		</select>
					</div>
					<br/>

					Age<br/>
					<input class="form-control" type="number" name="age" min="1" max="99" name="age" value="${members.age}"><br/>

					Nation<br/>
					<select class="form-control" name="nationality">
			  			<option value="Korea" >Korea</option>
			  			<option value="Japan">Japan</option>
			  			<option value="USA">USA</option>
			  			<option value="China">China</option>
					</select>
					
					<div class="btn-group" role="group">
  					<button type="submit" class="login100-form-btn " style="width: 150px; margin-top:10px;">Join</button>
  					<button type="reset" class="login100-form-btn " style="width: 150px; margin-top:10px;">Reset</button>
  					<button type="button" class="login100-form-btn " style="width: 150px; margin-top:10px;"  onclick="location.href='login'">Main</button>
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