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
		<div id="main">
			<jsp:include page="Sidebar.jsp" />
			
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
			
			<h1 style="background: white;">Searched for "${search}"</h1>
			
			<div id="world" style="background-color: black">
				<img src="./resources/worldmap/img/worldmap.png" id="worldmap" style="width: 1200px; margin-left: auto; margin-right: auto; display: block;" onclick="newweb('${search}')"/>
			</div>
			
			<input type="hidden" id="continent_input" value="">
			
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
	
	<script src="./resources/worldmap/js/worldGraph.js?ver=2"></script>
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
			     { x: 1.0, y: -1.0, z: 900, name: "South_America"},
			     { x: 2.5, y: -2.5, z: 800, name: "Norti_America"},
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
						        text: "By Gender"
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
						        text: "Top Oil Reserves"
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
								text: "Coal Reserves of Countries"
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

