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
		<title>World News</title>
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
		 <script src="resources/js/jquery.min.js"></script>
		 <!---- start-smoth-scrolling---->
		<script type="text/javascript" src="resources/js/move-top.js"></script>
		<script type="text/javascript" src="resources/js/easing.js"></script>
		
		<!---- start-smoth-scrolling---->
		 <!-- Custom Theme files -->
		<link href="resources/css/theme-style.css" rel='stylesheet' type='text/css' />
   		 <!-- Custom Theme files -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script type="application/x-javascript">
			addEventListener("load", function() { 
				setTimeout(hideURLbar, 0);
			}, false);
			
			function hideURLbar(){
				window.scrollTo(0,1);
			}
		</script>

		<!----font-Awesome----->
   		<link rel="stylesheet" href="resources/fonts/css/font-awesome.min.css">
   		<!----font-Awesome----->
		<!----webfonts---->
		<link href='http://fonts.googleapis.com/css?family=Raleway:400,100,300,500,600,200,700,800,900' rel='stylesheet' type='text/css'>
		<!----//webfonts---->
		<!----start-top-nav-script---->
		<script>
			$(function() {
				
			});
			
			
		</script>
		<!----//End-top-nav-script---->
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
		<div id="main">
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
					
					<li><a href="board/list">게시판</a>
			
				</ul>
			</div>
			
			<!----start-container------>
			<!----start-header---->
			<div id="home" class="header scroll">
				<div class="container">
					<!---- start-logo---->
					<div class="logo">
						<a href="#"><img src="resources/images/WOWLogoS.png" title="WOW" /></a>
					</div>
					<!---- //End-logo---->
					<!----start-top-nav---->
					 <nav class="top-nav">
						<span id="hamburger" onclick="openNav()"><img src="resources/images/nav-icon.png" title="menu" /></span>
						<ul class="top-nav">
							<li class="active"><a href="#services" class="scroll">Continents</a></li>
							<li class="page-scroll"><a href="#articles" class="scroll">Articles</a></li>
							<li class="page-scroll"><a href="#about" class="scroll">About</a></li>
							<li class="page-scroll"><a href="#port" class="scroll">Protfolio</a></li>
							<li class="page-scroll"><a href="#blog" class="scroll">Blog</a></li>
							<li class="page-scroll"><a href="#team" class="scroll">Team</a></li>
							<li class="page-scroll"><a href="#contact" class="scroll">Contact</a></li>
						</ul>
					</nav>
					<div class="clearfix"> </div>
					<!----//End-top-nav---->
				</div>
			</div>
						
			<!----start-search_bar----->
			<div id="search_bar" class="search_area" style="padding-top: 150px;">
				<div class="container">
					<div id="search_keyword">
			            <form id="searchForm" action="world" method="get">
			              <input type="text" name="searchWord" value="" id="input_keyword" placeholder="Enter a keyword" class="txt_field" style="width: 90%;
	height: 100px;font-size:50px">
						  <input type="image" src="resources/images/link-ico.png" onclick="sendKeyword()" alt="Search" id="search_button" style="display: inline-block;
    vertical-align: middle; height: 85px; width: auto;">
			            </form>
			        </div>
				</div>
			</div>
			<!----//End-search_bar----->
			
			<div id="summary" class="table">
			    <div id="keywords_summary" class="cell" >
			    	<h2><span style="padding:20px 20px">Keywords</span></h2>
			    	<c:forEach var="key" items="${keywordList}">
						<h3>${key.keyword}</h3>
					</c:forEach>
			    </div>
			    <div class="cell">
			        <div class="table">
			            <div id="board_summary" class="cell">
			            	<h2><span style="padding:20px 20px">Board</span></h2>
			            	<div class="board-grids" style="padding:10px 10px">
				            	<table>
									<tr>
										<th style="width:450px">Title</th>
										<th style="width:80px">Writer</th>
										<th style="width:80px">Date</th>
										<th style="width:50px">Hits</th>
										
									</tr>
									<c:forEach begin="1" end="5" var="board" items="${boardList}">
									<tr>
										<td>
											<a href="read?boardnum=${board.boardnum}" class="article_title">${board.title}</a>
										</td>
										<td class="center">${board.writer}</td>
										<td class="center">${board.regdate}</td>
										<td class="center">${board.hitcount}</td>
									</tr>
									</c:forEach>
								</table>
								<div class="summary_bottom">
									<a id="board_list" href="listBoard">
										<img src="resources/images/more-icon.png" title="more-icon" />
									</a>
								</div>
							</div>
			            </div>
			        </div>
			        
			        <div class="table">
			            <div id="discussion_summary" class="cell">
			            	<h2><span style="padding:20px 20px">Discussion</span></h2>
			            	<div class="discussion-grids" style="padding:10px 10px">
			            		<table>
									<tr>
										<th style="width:80px">No.</th>
										<th style="width:500px">LogContent</th>
										<th style="width:80px">Date</th>
									</tr>
									<c:forEach begin="1" end="5" var="dis_log" items="${discussion_logs}">
									<tr>
										<td>
											<a href="read?dis_seq=${dis_log.log_seq}" class="article_title">${dis_log.title}</a>
										</td>
										<td class="center">${dis_log.speaker}</td>
										<td class="center">${dis_log.regdate}</td>
									</tr>
									</c:forEach>
								</table>
			            	</div>
			            	<div class="summary_bottom">
								<a id="discussion_list" href="listDiscussion">
									<img src="resources/images/more-icon.png" title="more-icon" />
								</a>
							</div>
			            </div>
			        </div>
			    </div>
			</div>
			
			
			<!----start-copy-right--->
			<div class="copy-right">
				<div class="container">
					<p>Template by <a href="#">W3layouts</a></p>
						<script type="text/javascript">
					$(document).ready(function() {
						/*
						var defaults = {
				  			containerID: 'toTop', // fading element id
							containerHoverID: 'toTopHover', // fading element hover id
							scrollSpeed: 1200,
							easingType: 'linear' 
				 		};
						*/
						
						$().UItoTop({ easingType: 'easeOutQuart' });
						
					});
				</script>
					<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
				</div>
			</div>
			<!----//End-copy-right--->
			<!----//End-container------>
		</div>
	</body>
</html>