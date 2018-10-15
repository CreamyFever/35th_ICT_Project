<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	overflow-x: hidden;
	
}
html.open {overflow: hidden;}
.bar {
	width: 100%;
	height: 80px;
	position: fixed;
	top: 0px;
	left: 0px;
	text-align: center;
	font-size: 20px;
	font-weight: bold;
	background-color: #222730;
	color: white;
	z-index: 5;
}
.logo {
	width: 80px;
	height: 80px;
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
.btnn {
	width: 80px;
	height: 80px;
	position: fixed;
	right: 0px;
	top: 0px;
	z-index: 10;
	background-image: url('./resources/images/menu.png');
	background-size: 50%;
	background-repeat: no-repeat;
	background-position: center;
	cursor: pointer;
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
.contain{
	margin : 0px auto;
	width: 80%;
	height: 100%;
	display: flex;
}
.leftmain{
	flex: 1;
}
.rightmain{
	flex: 1;
}
.boardList{
	width: 100%;
	height: 300px;
	margin-bottom: 30px;
	padding: 5px;
}
.discussionList{
	width: 100%;
	height: 300px;
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
	text-align: center;
}
.moreList{
	float: right;
}
.table_title{
	font-weight: bold;
}
.title{
	font-size: 1.3em;
	font-weight: bold;
}
#wordCloud{
    height: 300px;
    width: 500px;
	background-color: #FFF;
	cursor: pointer;
}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/slider.css?ver=0.1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="./resources/tagcloud/lib/jQWCloudv3.1.js?ver=0.1"></script>
<script type="text/javascript" src="./resources/tagcloud/index.js?ver=0.12"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('.logo').click(function(){
			window.location.href="<c:url value='/main'/>";
		});
		$('.btnn').click(function(){
			$(".profile,.page_cover,html").addClass("open");
		    window.location.hash = "#open";
		});
		$('.profileImage').css('background-image', 'url("./resources/images/wow_logo.png")'); 
	});
	window.onhashchange = function() {
	    if(location.hash != "#open"){
	    	$(".profile,.page_cover,html").removeClass("open");
	    }	    
	};
</script>
</head>
<body>
	<div class="bar"><div class="logo"></div><div class="btnn"></div></div>	
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
	
	<!-----start-slider---->
	<div class="slider">
		<script src="resources/js/responsiveslides.min.js?ver=0.11"></script>
		  <script>
		    // You can also use "$(window).load(function() {"
		    $(function () {
		      // Slideshow 3
		      $("#slider3").responsiveSlides({
		        manualControls: '#slider3-pager',
		      });
		    });
		  </script>
		  	<!-- Slideshow -->
		    <ul class="rslides" id="slider3">
		      <li><img src="resources/images/board_image2.png" alt="">
		      	<div class="slid-info">
		      		<h1>게시판</h1>
		      		<p>정치, 문화, 사회, 경제, IT 등...다양한 의견을 가진 사용자들이 자유롭게 게시할 수 있는 공간입니다.</p>
		      		<a class="slid-btn" href="board/list">Read More</a>
		      	</div>
		      </li>
		      <li><img src="resources/images/discussion_image2.png" alt="">
		      	<div class="slid-info">
		      		<h1>토론의 장</h1>
		      		<p>기사에 대한 찬성과 반대 의견을 제기하며 토론할 수 있는 공간입니다. 또한, 관중으로써 참여하여 투표를 할 수 있습니다.</p>
		      		<a class="slid-btn" href="discussionList">Read More</a>
		      	</div>
		      </li>
		      <li><img src="resources/images/newspaper_image2.png" alt="">
		      	<div class="slid-info">
		      		<h1>기사</h1>
		      		<p>전 세계에서 일어나는 사건, 화제거리에 대한 기사가 갱신되는 곳입니다.</p>
		      		<a class="slid-btn" href="#">Read More</a>
		      	</div>
		      </li>
		    </ul>
		    <!-- Slideshow -->
		    <ul id="slider3-pager">
		      <li><a href="#"><span> </span></a></li>
		      <li><a href="#"><span> </span></a></li>
		      <li><a href="#"><span> </span></a></li>
		    </ul>
	   </div>
	<!-----//End-slider---->
	
	
	
	
	<div class="contain">
		<div class="leftmain">
			<div class="title">인기 키워드</div>
			<br><br>
			<div id="wordCloud"></div>	
		</div>
		<div class="rightmain">
			<div class="boardList">
				<div class="title">
					<span class="table_title">인기 게시글</span>
					<a class="moreList" href="board/list">더보기</a>
				</div>
				<table class="table table-hover">
					<tr>
						<th class="table_title">제목</th>
						<th class="table_hitcount">조회수</th>
					</tr>
					<c:forEach begin="0" end="4" var="board" items="${boardList}">
					<tr>
						<td class="tablelist_title">
							<a href="board/read?boardnum=${board.boardnum}" class="article_title">${board.title}</a>
						</td>
						<td class="table_hitcount">${board.hitcount}</td>
					</tr>
					</c:forEach>
				</table>
			</div>
			<div class="discussionList">
				<div class="title">
					<span>인기 토론방</span>					
					<a class="moreList" href="discussionList">더보기</a>
				</div>				
				<table class="table table-hover" id="discussionListTable" data-toggle="table">
					<tr>
						<th class="table_title">제목</th>
						<th class="table_grade">평점</th>
					</tr>
					<c:forEach begin="0" end="4" var="discussionList" items="${discussionList}">
						<c:if test="${discussionList.dis_grade >= 0}">
							<tr>
								<td class="tablelist_title">
									<a href="insertroom?roomnum=${discussionList.dis_no}">${discussionList.dis_title}</a>
								</td>
								<td class="table_hitcount">${discussionList.dis_grade}</td>
							</tr>
						</c:if>					
					</c:forEach>
				</table>				
			</div>
		</div>
	</div>
</body>
</html>