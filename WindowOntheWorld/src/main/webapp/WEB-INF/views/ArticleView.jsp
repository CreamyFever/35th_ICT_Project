<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Window On the World</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href='http://fonts.googleapis.com/css?family=Raleway:400,100,300,500,600,200,700,800,900' rel='stylesheet' type='text/css'>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	overflow-x: hidden;
}

html.open {
	overflow: hidden;
}
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
.profile {
	width: 350px;
	height: 100%;
	position: fixed;
	top: 0px;
	right: -352px;
	z-index: 12;
	border: 1px solid #c9c9c9;
	background-color: #f7f7f7;
	transition: All 0.2s ease;
	-webkit-transition: All 0.2s ease;
	-moz-transition: All 0.2s ease;
	-o-transition: All 0.2s ease;
	text-align: center;
}

.profile.open {
	right: 0px;
	z-index: 10;
}

.page_cover.open {
	display: block;
}

.page_cover {
	width: 100%;
	height: 100%;
	position: fixed;
	top: 0px;
	left: 0px;
	background-color: rgba(0, 0, 0, 0.4);
	z-index: 7;
	display: none;
}

.searchForm {
	margin-bottom: 20px;
}

#search {
	margin: 0px auto;
	margin-top: 120px;
	width: 80%;
	position: static;
}

.profileImage {
	background: center center no-repeat;
	border-radius: 50%;
	width: 200px;
	height: 200px;
	background-size: 200px;
	margin: 0px auto;
	margin-top: 50px;
	margin-bottom: 30px;
}

.loginName {
	color: #222730;
	font-size: 30px;
	font-weight: bold;
	margin-bottom: 40px;
}

.loginli {
	color: #222730;
	font-size: 20px;
	font-weight: bold;
}

li {
	list-style: none;
	margin: 0px auto;
	margin-bottom: 20px;
}
.contain{
	width: 80%;
	margin: 0px auto;
}
.searchKeyword{
	font-size: 2.2em;
    font-weight: 900;
    color: #506369;
    text-align: left;
    margin: 0.8em 0 0.8em;
}
#world{
	width: 1200px;
	margin: 0px auto;
	background-color: black;
	margin-top: 30px;
}
#lastOuter{
	margin-top: 30px;
}
#worldmap{
	width: 1200px; 
	margin: 0px auto;
	display: block;
}
</style>
<link rel="stylesheet" type="text/css" href="./resources/css/util.css">
<link rel="stylesheet" type="text/css" href="./resources/css/main.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function(){
		var gender_m = document.getElementById("gender_m").value;
		var gender_w = document.getElementById("gender_w").value;
		
		
		$('.logo').click(function(){
			window.location.href="<c:url value='/main'/>";
		});
		$('.btnn').click(function(){
			$(".profile,.page_cover,html").addClass("open");
		    window.location.hash = "#open";
		});
		$('.profileImage').css('background-image', 'url("./resources/images/wow_logo.png")'); 
		
		var offset = $(".searchForm").offset().top;
		$('html, body').animate({scrollTop: offset}, 400);
	});
	window.onhashchange = function() {
	    if(location.hash != "#open"){
	    	$(".profile,.page_cover,html").removeClass("open");
	    }	    
	};
</script>
</head>
<body>
	<div id="main">
		<div class="profile">
			<div class="profileImage"></div>
			<ul>
				<c:if test="${loginId != null}">
					<div class="loginName">${sessionScope.loginName}</div>
					<li><a class="loginli" href="members/update">회원정보수정</a></li>
					<li><a class="loginli" href="members/logout">로그아웃</a></li>
				</c:if>
				<c:if test="${loginId == null}">
					<li><a class="loginli" href="login">로그인</a></li>
					<li><a class="loginli" href="join">회원가입</a></li>
				</c:if>
			</ul>
		</div>
		<!----start-container------>
		<!----start-header---->
		<div class="bar">
			<div class="logo"></div>
			<div class="btnn"></div>
		</div>
		<div onclick="history.back();" class="page_cover"></div>
		<div class="profile">
			<div class="profileImage"></div>
			<c:if test="${loginId != null}">
				<div class="loginName">${sessionScope.loginName}</div>
				<ul>
					<li><a class="loginli" href="board/list">게시판</a></li>
					<li><a class="loginli" href="members/update">회원정보수정</a></li>
					<li><a class="loginli" href="members/logout">로그아웃</a></li>
					<li><a class="loginli" href="main">메인으로</a></li>
				</ul>
			</c:if>
			<c:if test="${loginId == null}">
				<ul>
					<li><a class="loginli" href="members/login">로그인</a></li>
					<li><a class="loginli" href="members/join">회원가입</a></li>
				</ul>
			</c:if>
		</div>
		<!----start-search_bar----->
		<form id="searchForm" class="searchForm" action="goToWorldMap" method="get">
			<div class="wrap-input100" id="search">
				<input class="input100" type="text" name="search" id="input_keyword" placeholder="Enter a keyword!" value="${search}">
				<span class="focus-input100"></span>
			</div>
		</form>
		<!----//End-search_bar----->
		
		<div class="contain">
			<span class="searchKeyword">Searched for "${search}"</span>
			<div id="world" onclick="newweb('${search}')"> <!-- newweb('${search}') pos(event) -->
				<img src="./resources/worldmap/img/worldmap.png" id="worldmap" onclick="" />
			</div>	
			<input type="hidden" id="continent_input" value="">	
			<!-- 위에 띄우는 대륙별 그래프!!!!!!!!! -->
			<!-- NA -->
			<div style="height: 80px; width: 80px; position: absolute; left: 280px; top: 465px;">
				<canvas id="pieChart_NA" height="10px" width="10px">This browser doesn't support canvas</canvas>
			</div>
			<!-- SA -->
			<div style="height: 80px; width: 80px; position: absolute; left: 438px; top: 660px;">
				<canvas id="pieChart_SA" height="10px" width="10px">This browser doesn't support canvas</canvas>
			</div>
			<!-- Europe -->
			<div style="height: 80px; width: 80px; position: absolute; left: 680px; top: 435px;">
				<canvas id="pieChart_Euro" height="10px" width="10px">This browser doesn't support canvas</canvas>
			</div>
			<!-- Asia -->
			<div style="height: 80px; width: 80px; position: absolute; left: 877px; top: 472px;">
				<canvas id="pieChart_Asia" height="10px" width="10px">This browser doesn't support canvas</canvas>
			</div>
			<!-- Oceania -->
			<div style="height: 80px; width: 80px; position: absolute; left: 900px; top: 707px;">
				<canvas id="pieChart_Ocea" height="10px" width="10px">This browser doesn't support canvas</canvas>
			</div>
			<!-- Aprica -->
			<div style="height: 80px; width: 80px; position: absolute; left: 636px; top: 641px;">
				<canvas id="pieChart_Apri" height="10px" width="10px">This browser doesn't support canvas</canvas>
			</div>
	
			<!-- Aprica click! -->
			<div id="apri_div_out">
				<div id="apri_div" style="height: 300px; width: 300px; position: absolute; left: 635px; top: 232px;">
					<img src="" width="170px">
				</div>
			</div>
			<!-- Oceania click! -->
			<div id="ocea_div_out">
				<div id="ocea_div" style="height: 300px; width: 300px; position: absolute; left: 930px; top: 337px;">
					<img src="" width="174px">
				</div>
			</div>
			<!-- SA click! -->
			<div id="SA_div_out">
				<div id="ocea_div" style="height: 300px; width: 300px; position: absolute; left: 930px; top: 337px;">
					<img src="" width="174px">
				</div>
			</div>
			<div id="result" style="color: white;"></div>
	
			<div id="lastOuter">
				<div id="chartContainer" style="height: 500px; width: 50%; float: left;"></div>
	
				<div id="out" style="height: 500px; width: 50%; float: right;">
					<div id="outer1" style="width: 50%; float: left;">
						<div id="gender" style="height: 500px; width: 50%; float: left;"></div>
						<div id="age" style="height: 500px; width: 50%; float: right;"></div>
					</div>
					<div id="outer2" style="width: 50%; height: 500px; float: right;">
						<div id="stackedColumn" style="height: 500px;"></div>
					</div>
				</div>
			</div>
	
			<!-- 여기 다시 고치기★★★★★★★★★★★★★★★★★★★★★★★★★★ -->	
				
				 <input type="hidden" id="sent_Africa" value="${sentimentList[0]}">
		         <input type="hidden" id="sent_Asia" value="${sentimentList[1]}">
		         <input type="hidden" id="sent_SA" value="${sentimentList[2]}">
		         <input type="hidden" id="sent_NA" value="${sentimentList[3]}">
		         <input type="hidden" id="sent_Oceania" value="${sentimentList[4]}">
		         <input type="hidden" id="sent_Europe" value="${sentimentList[5]}">
			
		         <input type="hidden" id="gender_w" value="${genderList[0]}">
		         <input type="hidden" id="gender_m" value="${genderList[1]}">
		
		         <input type="hidden" id="age_under19" value="${ageList_m[0]+ageList_w[0]}">
		         <input type="hidden" id="age_up20under29" value="${ageList_m[1]+ageList_w[1]}">
		         <input type="hidden" id="age_up30under39" value="${ageList_m[2]+ageList_w[2]}">
		         <input type="hidden" id="age_up40under49" value="${ageList_m[3]+ageList_w[3]}">
		         <input type="hidden" id="age_up50" value="${ageList_m[4]+ageList_w[4]}">
		         
		         <input type="hidden" id="age_under19_w" value="${ageList_w[0]}">
               	 <input type="hidden" id="age_up20under29_w" value="${ageList_w[1]}">
               	 <input type="hidden" id="age_up30under39_w" value="${ageList_w[2]}">
               	 <input type="hidden" id="age_up40under49_w" value="${ageList_w[3]}">
               	 <input type="hidden" id="age_up50_w" value="${ageList_w[4]}">
               	 <input type="hidden" id="age_under19_m" value="${ageList_m[0]}">
               	 <input type="hidden" id="age_up20under29_m" value="${ageList_m[1]}">
               	 <input type="hidden" id="age_up30under39_m" value="${ageList_m[2]}">
               	 <input type="hidden" id="age_up40under49_m" value="${ageList_m[3]}">
               	 <input type="hidden" id="age_up50_m" value="${ageList_m[4]}">
		         
		         <input type="hidden" id="userSentiment_Africa" value="${userSentiment[0]}">
		         <input type="hidden" id="userSentiment_Europe" value="${userSentiment[1]}">
		         <input type="hidden" id="userSentiment_Oceania" value="${userSentiment[2]}">
		         <input type="hidden" id="userSentiment_NA" value="${userSentiment[3]}">
		         <input type="hidden" id="userSentiment_SA" value="${userSentiment[4]}">
		         <input type="hidden" id="userSentiment_Asia" value="${userSentiment[5]}">
		         
		         <input type="hidden" id="bubValue_Africa" value="${bubValue[0]}">
		         <input type="hidden" id="bubValue_Asia" value="${bubValue[1]}">
		         <input type="hidden" id="bubValue_SA" value="${bubValue[2]}">
		         <input type="hidden" id="bubValue_NA" value="${bubValue[3]}">
		         <input type="hidden" id="bubValue_Oceania" value="${bubValue[4]}">
		         <input type="hidden" id="bubValue_Europe" value="${bubValue[5]}">
			<!----//End-container------>
		</div>		
	</div>
	
	<div id="result">좌표가 나올 부분</div>
</body>

<script src="./resources/worldmap/js/worldGraph.js?ver=2"></script>
<script src="./resources/worldmap/js/Chart.bundle.min.js"></script>
<script src="./resources/worldmap/js/jquery.canvasjs.min.js"></script>
<!-- <script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.min.js"></script> -->
<!-- pieOptions와 각 대륙별 데이터 뽑아오기 -->
<!-- 각 대륙별 차트 생성-->
<script type="text/javascript" src="./resources/worldmap/js/continent_chart.js"></script>

<!-- 버블그래프 차트 생성 -->
<script type="text/javascript">

	CanvasJS.addColorSet("blueShades",
        [
        "#4286f4",
        "#2052a3",
        "#89bcff",
        "#2547dd",
        "#bce2ff"                
        ]);

	$(function() {
		
		var userSentiment_Africa = document.getElementById("userSentiment_Africa").value;
		var userSentiment_Europe = document.getElementById("userSentiment_Europe").value;
		var userSentiment_Oceania = document.getElementById("userSentiment_Oceania").value;
		var userSentiment_NA = document.getElementById("userSentiment_NA").value;
		var userSentiment_SA = document.getElementById("userSentiment_SA").value;
		var userSentiment_Asia = document.getElementById("userSentiment_Asia").value;
		
		var bubValue_Africa = document.getElementById("bubValue_Africa").value;
		var bubValue_Asia = document.getElementById("bubValue_Asia").value;
		var bubValue_SA = document.getElementById("bubValue_SA").value;
		var bubValue_NA = document.getElementById("bubValue_NA").value;
		var bubValue_Oceania = document.getElementById("bubValue_Oceania").value;
		var bubValue_Europe = document.getElementById("bubValue_Europe").value;
		
		
		var chart = new CanvasJS.Chart("chartContainer", {
			legendText : "Size of Bubble Represents Population",
			showInLegend : true,
			theme : "light2",
			legendMarkerType : "circle",
			colorSet : "blueShades",
			title : {
				text : "BUBBLE GRAPH"

			},
			subtitles:[
				{
					text: "100% ▶ 10 / 0% ▶ -10",
					//Uncomment properties below to see how they behave
					//fontColor: "red",
					//fontSize: 30
				}
			],

			axisX : {
				title : "Continent",
				gridThickness : 0,
				viewportMinimum : -10,
				viewportMaximum : 10,
				stripLines : [ {
					value : 0,
					showOnTop : true,
					color : "blue",
					thickness : 2
				} ]

			},
			axisY : {
				title : "User",
				gridThickness : 0,
				viewportMinimum : -10,
				viewportMaximum : 10,
				stripLines : [ {
					value : 0,
					showOnTop : true,
					color : "blue",
					thickness : 2
				} ]
			},
			data : [ {
				type : "bubble",
				toolTipContent: "<b>{name}</b><br/>대륙별 긍정도: {x} <br/> WOW사용자 긍정도: {y}<br/> 자료의 양: {z}",
				dataPoints : [ {
					name : "South_America",
					x : (sent_SA-50)*0.2,
					y : (2.5-userSentiment_SA)*4,
					z : 100*bubValue_SA
				}, {
					x : (sent_NA-50)*0.2,
					y : (2.5-userSentiment_NA)*4,
					z : 100*bubValue_NA,
					name : "North_America"
				}, {
					x : (sent_Asia-50)*0.2,
					y : (2.5-userSentiment_Asia)*4,
					z : 100*bubValue_Asia,
					name : "Asia"
				}, {
					x : (sent_Oceania-50)*0.2,
					y : (2.5-userSentiment_Oceania)*4,
					z : 100*bubValue_Oceania,
					name : "Oceania"
				}, {
					x : (sent_Europe-50)*0.2,
					y : (2.5-userSentiment_Europe)*4,
					z : 100*bubValue_Europe,
					name : "Europe"
				}, {
					x : (sent_Africa-50)*0.2,
					y : (2.5-userSentiment_Africa)*4,
					z : 100*bubValue_Africa,
					name : "Africa"
				},
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
			} ]
		});

		chart.render();
	});
</script>

<!-- 좌표 구하는 함수 -->
<script type="text/javascript">
	function pos(event) {
		var str = "";
		str = "offsetX: "
				+ (event.offsetX == undefined ? event.layerX : event.offsetX);
		str += ", offsetY: "
				+ (event.offsetY == undefined ? event.layerY : event.offsetY);
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
	
CanvasJS.addColorSet("gender",
        [//colorSet Array
        "#ffcf23",
        "#4286f4"                
        ]);
        

	
	$(function() {
		var gender_m = document.getElementById("gender_m").value;
		var gender_w = document.getElementById("gender_w").value;
		var age_under19 = document.getElementById("age_under19").value;
		var age_up20under29 = document.getElementById("age_up20under29").value;
		var age_up30under39 = document.getElementById("age_up30under39").value;
		var age_up40under49 = document.getElementById("age_up40under49").value;
		var age_up50 = document.getElementById("age_up50").value;

		/*
		http://yeahvely.tistory.com/6
		차트 연습하는 사이트 목록
		

		
		
		 */

		var chart_gender = new CanvasJS.Chart("gender", {
			colorSet : "gender",
			title : {
				text : "By Gender"
			},
			data : [

			{
				dataPoints : [ {
					x : 1,
					y : 1*gender_w, //
					label : "W"
				}, {
					x : 2,
					y : 1*gender_m,
					label : "M"
				}, ]
			} ]
		});

		chart_gender.render();

		var chart_age = new CanvasJS.Chart("age", {
			colorSet : "blueShades",
			title : {
				text : "By Age"
			},
			data : [

			{
				dataPoints : [ {
					x : 1,
					y : 1*age_under19,
					label : "~19"
				}, {
					x : 2,
					y : 1*age_up20under29,
					label : "20~29"
				}, {
					x : 3,
					y : 1*age_up30under39,
					label : "30~39"
				}, {
					x : 4,
					y : 1*age_up40under49,
					label : "40~49"
				}, {
					x : 5,
					y : 1*age_up50,
					label : "50~"
				}, ]
			} ]
		});

		chart_age.render();

	});
</script>

<!-- stacked age, gender -->
<script type="text/javascript">
	$(function() {
		
		var age_under19_w = document.getElementById("age_under19_w").value;
		var age_up20under29_w = document.getElementById("age_up20under29_w").value;
		var age_up30under39_w = document.getElementById("age_up30under39_w").value;
		var age_up40under49_w = document.getElementById("age_up40under49_w").value;
		var age_up50_w = document.getElementById("age_up50_w").value;
		var age_under19_m = document.getElementById("age_under19_m").value;
		var age_up20under29_m = document.getElementById("age_up20under29_m").value;
		var age_up30under39_m = document.getElementById("age_up30under39_m").value;
		var age_up40under49_m = document.getElementById("age_up40under49_m").value;
		var age_up50_m = document.getElementById("age_up50_m").value;
		
		
		var chart = new CanvasJS.Chart("stackedColumn", {
			colorSet : "gender",
			title : {
				text : "By Gender and Age"
			},
			axisY : {
				title : "검색 인원 수"
//				valueFormatString : "#0.#,.",
			},
			data : [ {
				type : "stackedColumn",
				legendText : "나이별 여성 회원 수",
				showInLegend : "false",
				dataPoints : [ {
					y : 1*age_under19_w,
					label : "~19"
				}, {
					y : 1*age_up20under29_w,
					label : "20~29"
				}, {
					y : 1*age_up30under39_w,
					label : "30~39"
				}, {
					y : 1*age_up40under49_w,
					label : "40~49"
				}, {
					y : 1*age_up50_w,
					label : "50~"
				} ]
			}, {
				type : "stackedColumn",
				legendText : "나이별 남성 회원 수",
				showInLegend : "true",
				indexLabel : "#total bn",
	//			yValueFormatString : "#0.#,.",
				indexLabelPlacement : "outside",
				dataPoints : [ {
					y : 1*age_under19_m,
					label : "~19"
				}, {
					y : 1*age_up20under29_m,
					label : "20~29"
				}, {
					y : 1*age_up30under39_m,
					label : "30~39"
				}, {
					y : 1*age_up40under49_m,
					label : "40~49"
				}, {
					y : 1*age_up50_m,
					label : "50~"
				} ]
			} ]
		});
		chart.render();

	});
</script>
</html>