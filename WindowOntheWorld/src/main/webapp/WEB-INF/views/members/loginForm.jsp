<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>

<!-- Required meta tags -->
 <link href="./resources/css/bootstrap.css" rel='stylesheet' type='text/css' />
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		 <script src="./resources/js/jquery.min.js"></script>
		 <!---- start-smoth-scrolling---->
		<script type="text/javascript" src="./resources/js/move-top.js"></script>
		<script type="text/javascript" src="./resources/js/easing.js"></script>
		 <!-- Custom Theme files -->
		<link href="./resources/css/theme-style.css" rel='stylesheet' type='text/css' />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		

	<!----font-Awesome----->
   		<link rel="stylesheet" href="./resources/fonts/css/font-awesome.min.css">
   		<!----font-Awesome----->
		<!----webfonts---->
		<link href='http://fonts.googleapis.com/css?family=Raleway:400,100,300,500,600,200,700,800,900' rel='stylesheet' type='text/css'>
		<!----//webfonts---->
<script>
//로그인 폼 검사
function formCheck() {
	var id = document.getElementById('id');
	var password = document.getElementById('password');
	
	if (id.value == '' || password.value == '') {
		alert('ID와 비밀번호를 입력하세요.');
		return false;
	}
	alert('ID 비번 입력 성공');
	return true;
}
</script>
</head>
<body>
	
<h2>[ 로그인 ]</h2>

<form id="loginForm" action="login" method="post" onSubmit="return formCheck();">
<table>
<tr>
	<td>ID</td>
	<td><input type="text" name="id" id="id" /></td>
</tr>
<tr>
	<td>Password</td>
	<td><input type="password" name="password" id="password" /></td>
</tr>
<tr>
	<td class="white"></td>
	<td class="white">
		<div class="errorMsg">
			${errorMsg}
		</div>
	</td>
</tr>
<tr>
	<td colspan="2" class="center white">
		<input type="submit" value="Login" />
	</td>
</tr>
</table>
</form>

</body>
</html>