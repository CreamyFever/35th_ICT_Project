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
		 
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		 
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

				$("#articles").hide();
				$("#articles_list").hide();
				$("#about").hide();
				showArticleByContinent('Asia');
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
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
				});
				
				$("#asia").on('click', function(){
					$("#articles").hide(1000,function(){
						showArticleByContinent('Asia');		// Parameter에 해당하는 대륙의 기사만 출력.						
						$(this).show(1000);
					});
				});
				$("#europe").on('click', function(){
					$("#articles").hide(1000,function(){
						showArticleByContinent('Europe');
						$(this).show(1000);
					});
				});
				$("#africa").on('click', function(){
					$("#articles").hide(1000,function(){
						showArticleByContinent('Africa');
						$(this).show(1000);
					});
				});
				$("#north_america").on('click', function(){
					$("#articles").hide(1000,function(){
						showArticleByContinent('North_America');
						$(this).show(1000);
					});
				});
				$("#south_america").on('click', function(){
					$("#articles").hide(1000,function(){
						showArticleByContinent('South_America');
						$(this).show(1000);
					});
				});
				$("#oceania").on('click', function(){
					$("#articles").hide(1000,function(){
						showArticleByContinent('Oceania');
						$(this).show(1000);
					});
				});
			});
			
			function showArticleByContinent(continent){
				$("#continent_name").attr("href", "listArticle?continent=" + continent);
				
				$.ajax({
					url: "showArticleByContinent",
					method: "POST",
					data:{
						"continent":continent
					},
					success: output,
					error: function(){
						alert("error");
					}
				});
			}
			
			function output(resp){
				
				if(window.location.href.includes("continent")){	// 주소입력 창에 continent 정보가 들어있으면 기사 목록을 보이게 함.
					$("#articles_list").show(1000, function(){
						$('html,body').animate({scrollTop:$("#articles_list").offset().top},1000);
					});
				}
				
				if(window.location.href.includes("articleid")){
					$("#about").show(1000, function(){
						$('html,body').animate({scrollTop:$("#about").offset().top},1000);
					});
				}
				
				var s = "";
				resp_date = convertDateForm(resp[0].articledate);
				s += '<div class="col-md-4 articles-grid-row frist-row">';
				s += '<a class="post-pic" href="#"><img src="resources/images/post-pic.jpg" title="pic-name" /></a>';
				
				s += '<div class="artical-info">';
				s += '	<div class="post-head">';
				s += '		<div class="post-head-left">';
				s += '			<h4><a href="#">' +resp[0].articlename + '</a></h4>';
				s += '			<p class="author">By <a href="#"> '+ resp[0].presscompany +'</a></p>';
				s += '		</div>';
				s += '		<div class="post-head-right">';
				s += '			<span>'+ resp_date[0] +'</span><label>'+ resp_date[1] +' '+ resp_date[2] +'</label>';
				s += '		</div>';
				s += '		<div class="clearfix"> </div>';
				s += '	</div>';
				s += '	<p class="post-text">'+ resp[0].articlecontent.substring(0,400) +'...</p>';
				s += '	<div class="post-bottom">';
				s += '		<div class="post-bottom-left">';
				s += '			<p><a href="#">0 Comments</a> | <i class="fa fa-heart"> </i> 0</p>';
				s += '		</div>';
				s += '		<div class="post-bottom-right">';
				s += '			<a class="artbtn" href="'+ resp[0].url +'">Read More</a>';
				s += '		</div>';
				s += '		<div class="clearfix"> </div>';
				s += '	</div>';
				s += '</div>';
				s += '</div>';
				
				for(var i = 0; i < 2; i++){
					s += '<div class="col-md-4 artical-row2">';

					for(var j = 0; j < 2; j++){
						resp_date = convertDateForm(resp[2*i + (j+1)].articledate);
						s += '<div class="artical-info">';
						s += '<div class="post-head post-head1">';
						s += '	<div class="post-head-left">';
						s += '		<h4><a href="#">' +resp[2*i + (j+1)].articlename + '</a></h4>';
						s += '		<p class="author">By <a href="#">' +resp[2*i + (j+1)].presscompany + '</a></p>';
						s += '	</div>';
						s += '	<div class="post-head-right post-head-right-C">';
						s += '		<span>'+ resp_date[0] +'</span><label>'+ resp_date[1] +' '+ resp_date[2] +'</label>';
						s += '	</div>';
						s += '	<div class="clearfix"> </div>';
						s += '</div>';
						s += '<p class="post-text">' +resp[2*i + (j+1)].articlecontent.substring(0,300) + '...</p>';
						s += '<div class="post-bottom">';
						s += '	<div class="post-bottom-left">';
						s += '		<p><a href="#">0 Comments</a> | <i class="fa fa-heart"> </i> 0</p>';
						s += '	</div>';
						s += '	<div class="post-bottom-right">';
						s += '		<a class="artbtn artbtn1" href="'+ resp[2*i + (j+1)].url +'">Read More</a>';
						s += '	</div>';
						s += '	<div class="clearfix"> </div>';
						s += '</div>';
						s += '</div>';
					}
					
					s += '</div>';
				}
				
				$(".articles-grids").html(s);
				$('html,body').animate({scrollTop:$("#articles").offset().top},1000);
			}
			
			function convertDateForm(inputDate){
				year = inputDate.substring(0,4);
				month = inputDate.substring(4,6);
				day = inputDate.substring(6,8);
				
				month_res = '';
				if(month == '01'){
					month_res += 'Jan';
				} else if(month == '02'){
					month_res += 'Feb';
				} else if(month == '03'){
					month_res += 'Mar';
				} else if(month == '04'){
					month_res += 'Apr';
				} else if(month == '05'){
					month_res += 'May';
				} else if(month == '06'){
					month_res += 'Jun';
				} else if(month == '07'){
					month_res += 'Jul';
				} else if(month == '08'){
					month_res += 'Aug';
				} else if(month == '09'){
					month_res += 'Sep';
				} else if(month == '10'){
					month_res += 'Oct';
				} else if(month == '11'){
					month_res += 'Nov';
				} else if(month == '12'){
					month_res += 'Dec';
				}
				
				result = [day, month_res, year];
				
				return result;
			}
			
			
			
			function pagingFormSubmit(currentPage) {
				var form = document.getElementById('pagingForm');
				var continent = document.getElementById('continent');
				var page = document.getElementById('page');
				
				var url = window.location.href;
				var formVal = url.split('?');
				var parameters = formVal[1].split('&');
				var continent_val = (parameters[0].split('='))[1];
				
				continent.value = continent_val;
				page.value = currentPage;
				form.submit();
			}
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
			
			<h1 style="background: white;">${search}についての結果</h1>
			
			<div id="world" style="background-color: black">
				<img src="./resources/worldmap/img/worldmap.png" id="worldmap" style="width: 1200px; margin-left: auto; margin-right: auto; display: block;" onclick="newweb('${search}')"/>
			</div>
			
			<!-- 위에 띄우는 대륙별 그래프!!!!!!!!! -->
			<!-- NA -->
			<div style="height: 80px; width: 80px; position: absolute; left: 280px; top: 465px; ">
			<canvas id="pieChart_NA" height="10px" width="10px">This browser doesn't support canvas</canvas>
			</div>
			<!-- SA -->
			<div style="height: 80px; width: 80px; position: absolute; left: 438px; top: 660px; ">
			<canvas id="pieChart_SA" height="10px" width="10px">This browser doesn't support canvas</canvas>
			</div>
			<!-- Europe -->
			<div style="height: 80px; width: 80px; position: absolute; left: 680px; top: 435px; ">
			<canvas id="pieChart_Euro" height="10px" width="10px">This browser doesn't support canvas</canvas>
			</div>
			<!-- Asia -->
			<div style="height: 80px; width: 80px; position: absolute; left: 877px; top: 472px; ">
			<canvas id="pieChart_Asia" height="10px" width="10px">This browser doesn't support canvas</canvas>
			</div>
			<!-- Oceania -->
			<div style="height: 80px; width: 80px; position: absolute; left: 900px; top: 707px; ">
			<canvas id="pieChart_Ocea" height="10px" width="10px">This browser doesn't support canvas</canvas>
			</div>
			<!-- Aprica -->
			<div style="height: 80px; width: 80px; position: absolute; left: 636px; top: 641px; ">
			<canvas id="pieChart_Apri" height="10px" width="10px">This browser doesn't support canvas</canvas>
			</div>
				
			<!-- Aprica click! -->
			<div id="apri_div_out">
				<div id="apri_div" style="height: 300px;  width: 300px; position:absolute; left:635px; top:232px;">
					<img src="" width="170px">
				</div>
			</div>
			<!-- Oceania click! -->
			<div id="ocea_div_out">
				<div id="ocea_div" style="height: 300px;  width: 300px; position:absolute; left:930px; top:337px;">
					<img src="" width="174px">
				</div>
			</div>
			<!-- SA click! -->
			<div id="SA_div_out">
				<div id="ocea_div" style="height: 300px;  width: 300px; position:absolute; left:930px; top:337px;">
					<img src="" width="174px">
				</div>
			</div>
			<div id="result" style="color: white;"></div>
			
			
			<div id="lastOuter">
			  <div id="chartContainer" style="height: 500px; width: 50%; float:left;">
			  </div>
			
			   <div id="out" style=" height:500px; width: 50%; float:right;">
			      <div id="outer1"  style="width:50%; float: left;" >
			            <div id="gender" style="height: 500px; width: 50%; float: left;"></div>
			            <div id="age" style="height: 500px; width: 50%; float: right;"></div>
			      </div>
			      <div id="outer2" style="width:50%; height:500px; float: right;">
			         <div id="stackedColumn" style="height: 500px;"></div>
			      </div>
			   </div>
			</div>
			
			<input type="hidden" id="sent_SA" value="${sentiment_SA}">
			<input type="hidden" id="sent_NA" value="${sentiment_NA}">
			<input type="hidden" id="sent_Africa" value="${sentiment_Africa}">
			<input type="hidden" id="sent_Oceania" value="${sentiment_Oceania}">
			<input type="hidden" id="sent_Asia" value="${sentiment_Asia}">
			<input type="hidden" id="sent_Europe" value="${sentiment_Europe}">
			
			
			
			
			
			<!----start-services---->
			<div id="services" class="services">
				<div class="container">
					<h3>Continents<label> </label></h3>
				<!----start-services-list---->
				<div class="services-list text-center">
					<ul class="list-unstyled list-inline">
						<li>
							<a id="asia"><span class="service-icon5"> </span><label>Asia</label></a>
						</li>
						<li>
							<a id="europe"><span class="service-icon5"> </span><label>Europe</label></a>
						</li>
						<li>
							<a id="africa"><span class="service-icon5"> </span><label>Africa</label></a>
						</li>
						<li>
							<a id="north_america"><span class="service-icon5"> </span><label>North America</label></a>
						</li>
						<li>
							<a id="south_america"><span class="service-icon5"> </span><label>South America</label></a>
						</li>
						<li>
							<a id="oceania"><span class="service-icon5"> </span><label>Oceania</label></a>
						</li>
					</ul>
				</div>
				<!----//End-services-list---->
				</div>
			</div>
			<!----//End-services---->
			
			<!----start-articles---->
			<div id="articles" class="articles">
				<div class="container">
					<h3>Articles<label> </label></h3>
					<div class="articles-grids"></div>
					
					<div class="post-bottom-right">
						<a id="continent_name" href="listArticle?continent=${continent}">
							<img src="resources/images/more-icon.png" title="more-icon" />
						</a>
					</div>
				</div>
			</div>
			<!----//End-articles---->
			
			<!----start-articles_list---->
			<div id="articles_list" class="articles">
				<div class="container">
					<h3>Articles List<label> </label></h3>
					<div class="articles-list-grids">
						<br>
						<table>
							<tr>
								<td class="white">
									Total : ${navi.totalRecordsCount}
								</td>
								<td class="white" colspan="3"></td>	
							</tr>
							<tr>
								<th>No.</th>
								<th style="width:600px">Title</th>
								<th>Date</th>
							</tr>
							<c:forEach var="article" items="${articles}">
							<tr>
								<td class="center">${article.articlenum}</td>
								<td>
									<a href="read?articleid=${article.articleid}" class="article_title">${article.articlename}</a>
								</td>
								<td class="center">${article.articledate}</td>
							</tr>
							</c:forEach>
						
							</table>
							<br/><br/>
							
							<div id="navigator">
						                     
								<a class="page_link" href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})">◁◁ </a> &nbsp;&nbsp;
								<a class="page_link" href="javascript:pagingFormSubmit(${navi.currentPage - 1})">◀</a> &nbsp;&nbsp;
							
								<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
									<c:if test="${counter == navi.currentPage}"><b></c:if>
										<a class="page_link" href="javascript:pagingFormSubmit(${counter})">${counter}</a>&nbsp;
									<c:if test="${counter == navi.currentPage}"></b></c:if>
								</c:forEach>
								&nbsp;&nbsp;
								<a class="page_link" href="javascript:pagingFormSubmit(${navi.currentPage + 1})">▶</a> &nbsp;&nbsp;
								<a class="page_link" href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})">▷▷</a>
						
							<br><br>
							
							<form id="pagingForm" method="get" action="listArticle">
								<input type="hidden" name="continent" id="continent" />
								<input type="hidden" name="page" id="page" />
							</form>
						</div>
					</div>
				</div>
			</div>
			<!----//End-articles_list---->
			
			<!----start-about----->
			<div id="about" class="about">
				<div class="container">
					<h2>About</h2>
					<p class="wellcome-note-head"><b>Title</b>  ${article.articlename}</p>
					<p class="wellcome-note-info" ><b>URL</b> <a href="${article.url}" class="article_url"> ${article.url}</a></p>
					<!----start-about-grids----->
					<div class="about-grids">
						<b>Date</b> &nbsp;${article.articledate}
						<br><br>
						<p id="article_content">${article.articlecontent}</p>
						<div class="clearfix"> </div>
					</div>
					<!----//End-about-grids----->
				</div>
			</div>
			<!----//End-about----->
			
			
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
	
	<script src="./resources/worldmap/js/worldGraph.js"></script>
	<script src="./resources/worldmap/js/Chart.bundle.min.js"></script>
	
	<script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	
	<!-- pieOptions와 각 대륙별 데이터 뽑아오기 -->
			<!-- 각 대륙별 차트 생성-->
			<script type="text/javascript"  src="./resources/worldmap/js/continent_chart.js">
			</script>
			
			<!-- 버블그래프 차트 생성 -->
			<script type="text/javascript">
			  $(function () {
			    var chart = new CanvasJS.Chart("chartContainer",
			    {
			    	 legendText: "Size of Bubble Represents Population",
			         showInLegend: true,
			         theme : "dark2",
			         legendMarkerType: "circle",
			      title:{
			       text: "BUBBLE GRAPH"
			      },
			
			  	axisX: {
			  		title: "大陸",
			  		gridThickness: 0,
			  		viewportMinimum: -10,
			        viewportMaximum: 10,
			        stripLines: [
			            {
			              value: 0,
			              showOnTop: true,
			              color: "blue",
			              thickness: 2
			            }
			          ]
			        
			  	},
			  	axisY: {
			  		title: "使用者",
			  		gridThickness: 0,
			  		viewportMinimum: -10,
			        viewportMaximum: 10,
			        stripLines: [
			            {
			              value: 0,
			              showOnTop: true,
			              color: "blue",
			              thickness: 2
			            }
			          ]
			  	},
			      data: [
			      {
			        type: "bubble",
			     dataPoints: [
			     { x: 1.0, y: -1.0, z: 900, name: "SA"},
			     { x: 2.5, y: -2.5, z: 800, name: "NA"},
			     { x: 3.5, y: 9.0, z: 300, name: "Asia"},
			     { x: -5.0, y: -10.0, z: 400, name: "Oceania"},
			     { x: 6.5, y: 7.5, z: 500, name: "Europe"},
			     { x: 9.0, y: -10.5, z: 1000, name: "Africa"},
			    // { x: 64.8, y: 2.66, z:12074.4 , name: "India"},
			   //  { x: 73.1, y: 1.61, z:13313.8, name: "China"},
			     /* { x: 78.1, y: 2.00, z:306.77, name: "US"},
			     { x: 68.5, y: 2.15, z: 237.414, name: "Indonesia"},
			     { x: 72.5, y: 1.86, z: 193.24, name: "Brazil"},
			     { x: 76.5, y: 2.36, z: 112.24, name: "Mexico"},
			     { x: 50.9, y: 5.56, z: 154.48, name: "Nigeria"},
			     { x: 68.6, y: 1.54, z:141.91, name: "Russia" },
			
			     { x: 82.9, y: 1.37, z:127.55, name: "Japan" },
			     { x: 79.8, y: 1.36, z:81.90, name:"Australia" },
			     { x: 72.7, y: 2.78, z: 79.71, name: "Egypt"},
			     { x: 80.1, y: 1.94, z:61.81, name:"UK" },
			     { x: 55.8, y: 4.76, z: 39.24, name: "Kenya"},
			     { x: 81.5, y: 1.93, z:21.95, name:"Australia" },
			     { x: 68.1, y: 4.77, z: 31.09, name: "Iraq"},
			     { x: 47.9, y: 6.42, z: 33.42, name: "Afganistan"},
			     { x: 50.3, y: 5.58, z: 18.55, name: "Angola"} */
			     ]
			   }
			   ]
			 });
			
			chart.render();
			});
			</script>
			
			<!-- 좌표 구하는 함수 -->
			<script type="text/javascript">
			    function pos(event) {
			        var str = "";
			        str = "offsetX: " + (event.offsetX == undefined ? event.layerX : event.offsetX);
			        str += ", offsetY: " + (event.offsetY == undefined ? event.layerY : event.offsetY);
			        str += "<br/>screenX: " + event.screenX;
			        str += ", screenY : " + event.screenY;
			        str += "<br/>clientX : " + event.clientX;
			        str += ", clientY : " + event.clientY;
			        str += "<br/>pageX : " + event.pageX;
			        str += ", pageY : " + event.pageY;
			        document.getElementById("result").innerHTML = str;
			    }
			</script>
			
			<!-- 나이, 성별 그래프 -->
			<script type="text/javascript">
			$(function () {
				
				/*
				http://yeahvely.tistory.com/6
				차트 연습하는 사이트 목록
				*/
				
				 var chart_gender = new CanvasJS.Chart("gender",
						    {
						      title:{
						        text: "Gender"
						      },
						      data: [
			
						      {
						        dataPoints: [
						        { x: 1, y: 297571, label: "W"},
						        { x: 2, y: 267017,  label: "M" },
						        ]
						      }
						      ]
						    });
				
				 chart_gender.render();
				
				 var chart_age = new CanvasJS.Chart("age",
						    {
						      title:{
						        text: "Age"
						      },
						      data: [
			
						      {
						        dataPoints: [
						        { x: 1, y: 297571, label: "~19"},
						        { x: 2, y: 267017,  label: "20~29" },
						        { x: 3, y: 175200,  label: "30~39"},
						        { x: 4, y: 154580,  label: "40~49"},
						        { x: 5, y: 116000,  label: "50~"},
						        ]
						      }
						      ]
						    });
			
				 chart_age.render();
						    
			
			});
				
			</script>
			
			<!-- stacked age, gender -->
			<script type="text/javascript">
			
			$(function(){
				var chart = new CanvasJS.Chart("stackedColumn",
						{
							title:{
								text: "Gender + Age"
							},
							axisY:{
								title:"Coal (bn tonnes)",
								valueFormatString: "#0.#,.",
							},
							data: [
							{
								type: "stackedColumn",
								legendText: "Anthracite & Bituminous",
								showInLegend: "true",
								dataPoints: [
									{  y: 111338 , label: "USA"},
									{  y: 49088, label: "Russia" },
									{  y: 62200, label: "China" },
									{  y: 90085, label: "India" },
									{  y: 38600, label: "Australia"},
									{  y: 48750, label: "SA"}
								]
							},  {
								type: "stackedColumn",
								legendText: "SubBituminous & Lignite",
								showInLegend: "true",
								indexLabel: "#total bn",
								yValueFormatString: "#0.#,.",
								indexLabelPlacement: "outside",
								dataPoints: [
									{  y: 135305 , label: "USA"},
									{  y: 107922, label: "Russia" },
									{  y: 52300, label: "China" },
									{  y: 3360, label: "India" },
									{  y: 39900, label: "Australia"},
									{  y: 0, label: "SA"}
								]
							}
							]
						});
				chart.render();
				
			});
			</script>
	
	
</html>

