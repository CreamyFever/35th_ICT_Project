<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
	<head>
		<title>Sidebar</title>
		<link href="resources/css/bootstrap.css" rel='stylesheet' type='text/css' />
		<style>			
			.sidenav {
			    height: 100%;
			    width: 0;
			    position: fixed;
			    z-index: 1001;
			    top: 0;
			    right: 0;
			    background-color: #111;
			    overflow-x: hidden;
			    transition: 0.5s;
			    padding-top: 60px;
			}
			
			.sidenav a {
			    padding: 8px 8px 8px 32px;
			    text-decoration: none;
			    font-size: 25px;
			    color: #818181;
			    display: block;
			    transition: 0.3s;
			}
			
			.sidenav a:hover {
			    color: #f1f1f1;
			}
			
			.sidenav .closebtn {
			    position: absolute;
			    top: 0;
			    right: 25px;
			    font-size: 36px;
			    margin-left: 50px;
			}
			
			#main {
			    transition: margin-left .5s;
			}
			
			@media screen and (max-height: 450px) {
			  .sidenav {padding-top: 15px;}
			  .sidenav a {font-size: 18px;}
			}
		</style>
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->		 
		 
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		 
		 <!---- start-smoth-scrolling---->
		<script type="text/javascript" src="resources/js/move-top.js"></script>
		<script type="text/javascript" src="resources/js/easing.js"></script>
		
		<!---- start-smoth-scrolling---->
		 <!-- Custom Theme files -->
		<link href="resources/css/theme-style.css" rel='stylesheet' type='text/css' />
   		 <!-- Custom Theme files -->
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<!----font-Awesome----->
   		<link rel="stylesheet" href="resources/fonts/css/font-awesome.min.css">
   		<!----font-Awesome----->
		<!----webfonts---->
		<link href='http://fonts.googleapis.com/css?family=Raleway:400,100,300,500,600,200,700,800,900' rel='stylesheet' type='text/css'>
		<!----//webfonts---->
		
	</head>
	<body>
		<script>
		function openNav() {
		    $("#mySidenav").css("width", "250px");
		    $("#main").css("marginRight", "250px");
		    $("body").css("backgroundColor", "rgba(0,0,0,0.4)");
		}
		
		function closeNav() {
			$("#mySidenav").css("width", "0");
		    $("#main").css("marginRight", "0");
		    $("body").css("backgroundColor", "white");
		}
		
		function sendKeyword(){
			var searchWord = $("#input_keyword").val();
			$("#searchForm").submit();
		}
		</script>
		
		<div id="mySidenav" class="sidenav">
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			<div id="myProfileImage" class="side_image">
			<img src="./resources/images/DasBoot.jpg" class="profile_image" /><br>				
				<c:if test="${loginId != null}">
				${sessionScope.loginName}(${sessionScope.loginId})님 로그인 중<br>
				</c:if>
			</div>
			<ul class="top-nav">
			<c:if test="${loginId == null}">
				<li class="active"><a href="members/login" class="scroll">로그인</a></li>
				<li class="page-scroll"><a href="members/join" class="scroll">회원가입</a></li>
			</c:if>
			
			<c:if test="${loginId != null}">
				<li class="active"><a href="members/logout" class="scroll">로그아웃</a></li>
				<li class="active"><a href="members/update" class="scroll">회원정보 수정</a></li>
			</c:if>	
				
				<li><a href="board/list">게시판</a></li>
				
				<li><a href="main">메인으로</a></li>
				
			</ul>
		</div>
	</body>
</html>