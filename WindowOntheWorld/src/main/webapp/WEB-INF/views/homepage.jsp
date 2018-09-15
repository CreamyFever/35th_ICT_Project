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
<title>Window On the World</title>
<link rel="stylesheet" type="text/css" href="./resources/css/util.css">
<link rel="stylesheet" type="text/css" href="./resources/css/main.css">
<style>		
* { 
	margin: 0; 
	padding: 0; 
	box-sizing: border-box;
}
body{
	/* overflow-x: hidden; */
	overflow : hidden;
}
html.open {overflow: hidden;}
.bar {
    width : 100%;
    height : 100px;
    position : fixed;
    top : 0px;
    left : 0px;
    text-align : center;
    font-size : 20px;
    font-weight : bold;
    background-color: #222730;
    color:white;
}	
.logo{
	width: 100px;
    height: 100px;
    position: fixed;
    left: 10px;
    top: 0px;
    z-index: 1;
    background-image: url('./resources/images/wow_logo.png');
    background-size: 80%;
    background-repeat: no-repeat;
    background-position: center;
    cursor: pointer;
    margin-left: 20px;
}
.btn {
    width: 70px;
    height: 70px;
    position: fixed;
    right: 0px;
    top: 0px;
    z-index: 1;
    background-image: url('./resources/images/menu.png');
    background-size: 50%;
    background-repeat: no-repeat;
    background-position: center;
    cursor: pointer;
    margin-top: 15px;
    margin-right: 20px;
}
.profile{
	width: 350px;
	height: 100%;
	position: fixed;
	top: 0px;
	right: -352px;
	z-index: 10;
	border: 1px solid #c9c9c9;
	background-color: #f7f7f7;
	transition: All 0.2s ease;
	-webkit-transition: All 0.2s ease;
	-moz-transition: All 0.2s ease;
	-o-transition: All 0.2s ease;
	text-align: center;
}
.profile.open { right: 0px; }
.page_cover.open { display: block; }
.page_cover {
	width: 100%;
	height: 100%;
	position: fixed;
	top: 0px;
	left: 0px;
	background-color: rgba(0, 0, 0, 0.4);
	z-index: 4;
	display: none;
}
.searchForm{
	margin-bottom: 20px;
}
.search{
	margin: 0px auto;
	margin-top: 120px;
	width: 80%;
	position: static;
}
.profileImage{
	background: center center no-repeat;
    border-radius: 50%;
    width: 200px;
    height: 200px;
    background-size: 200px;
    margin: 0px auto;
    margin-top: 50px;
    margin-bottom: 30px;
}
.loginName{
	color: #222730;
	font-size: 30px;
	font-weight: bold;
	margin-bottom: 40px;
}
.loginli{
	color: #222730;
	font-size: 20px;
	font-weight: bold;
}
li{
	list-style: none;
	margin: 0px auto;
	margin-bottom: 20px;
}
.container{
	width: 100%;
	height: 100%;
	display: flex;
}
.leftmain{
	flex: 1;
	padding: 30px;
}
.rightmain{
	flex: 1;
	padding: 30px;
}
.boardList{
	width: 100%;
	height: 35%;
	margin-bottom: 30px;
	padding: 5px;
}
.discussionList{
	width: 100%;
	height: 65%;
	padding: 5px;
}
table{
	width: 100%;
	heigth: 70%;
	margin-top: 15px;
}
.title{
	width: 100%;
}
.table_title{
	width: 85%;
}
.table_hitcount, .table_grade{
	width: 15%;
}
.moreList{
	float: right;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('.logo').click(function(){
			window.location.href="<c:url value='/main'/>";
		});
		$('.btn').click(function(){
			$(".profile,.page_cover,html").addClass("open");
		    window.location.hash = "#open";
		});
		$('.profileImage').css('background-image', 'url("./resources/images/t3.jpg")'); 
	});
	window.onhashchange = function() {
	    if(location.hash != "#open"){
	    	$(".profile,.page_cover,html").removeClass("open");
	    }	    
	};
</script>
</head>
<body>
	<div class="bar"><div class="logo"></div><div class="btn"></div></div>	
	<div onclick="history.back();" class="page_cover"></div>
	<div class="profile">
		<div class="profileImage"></div>
		<c:if test="${loginId != null}">
			<div class="loginName">${sessionScope.loginName}</div>
			<ul>
				<li><a class="loginli" href="members/update">회원정보수정</a></li>
				<li><a class="loginli" href="members/logout">로그아웃</a></li>
			</ul>
		</c:if>
		<c:if test="${loginId == null}">
			<ul>
				<li><a class="loginli" href="login">로그인</a></li>
				<li><a class="loginli" href="join">회원가입</a></li>
			</ul>
		</c:if>
	</div>	
	<form id="searchForm" class="searchForm" action="goToWorldMap" method="get">
		<div class="wrap-input100 search">
			<input class="input100" type="text" name="search" id="input_keyword" placeholder="Enter a keyword!">
			<span class="focus-input100"></span>
		</div>	
	</form>
	<div class="container">
		<div class="leftmain">인기 키워드
		</div>
		<div class="rightmain">
			<div class="boardList">
				<div class="title">
					인기 게시글
					<a class="moreList" href="board/list">더보기</a>
				</div>
				<table>
					<tr>
						<th class="table_title">제목</th>
						<th class="table_hitcount">조회수</th>
					</tr>
					<c:forEach begin="1" end="5" var="board" items="${boardList}">
					<tr>
						<td>
							<a href="read?boardnum=${board.boardnum}" class="article_title">${board.title}</a>
						</td>
						<td class="center">${board.hitcount}</td>
					</tr>
					</c:forEach>
				</table>
			</div>
			<div class="discussionList">
				<div class="title">
					인기 토론방
					<a class="moreList" href="discussionList?loginId=${sessionScope.loginId}">더보기</a>
				</div>				
				<table>
					<tr>
						<th class="table_title">제목</th>
						<th class="table_grade">평점</th>
					</tr>
				</table>				
			</div>
		</div>
	</div>
</body>
</html>