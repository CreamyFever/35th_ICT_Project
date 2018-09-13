<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DETAIL</title>

<script type="text/javascript">
var continent = document.getElementById("continent").value;
var sentiment = document.getElementById("sentiment").value;

var data = {
	    datasets: [{
	        data: [
	        	sentiment,
	            100-sentiment
	        ],
	        backgroundColor: [
	            "#E7E9ED",
	            "#36A2EB"
	        ],
	        label: 'My dataset' // for legend
	    }],
	    labels: [
	        "Grey",
	        "Blue"
	    ]
	};


var pieChartCanvas = $("#pieChart_detail");
var pieChart = new Chart(pieChartCanvas, {
  type: 'doughnut',
  data: data,
  options: pieOptions
});

</script>


	</head> 
	<body>
	<input type="hidden" id="continent" value="${continent}">
	<input type="hidden" id="sentiment" value="${sentiment}">
	
	<div style="height: 1px; width: 1px;">
	<canvas id="canvas1" height="400" width="400"></canvas> 
	</div>
	<div style="width: 100%">
		<div style="width: 40%">
			<div style="height: 200px; width: 200px;">
				<canvas id="pieChart_detail" height="10px" width="10px">This browser doesn't support canvas</canvas>
			</div>
		</div>
		<div>
			<h1>${continent}대륙, ${keyword}에 대한 통계값</h1>
		</div>
	</div>
	
	<hr color="skyblue" size="5px">
	<h1>해시태그 들어갈 자리</h1>	
	<hr color="skyblue" size="5px">
	<h1>기사 목록 들어갈 자리</h1>	
			<div id="right_down">
			<table>
				<tr>
					<c:forEach items="${articleList}" var="item" begin="0" end="4">
					<td>${item.articletitle}</td>
					<td>${item.articledate}</td>
					<td>${item.articlecontent}</td>
					</c:forEach>			
				</tr>
			</table>
		</div>
	
	
	<hr color="skyblue" size="5px"><br>
	
<!-- 	<div id="whisker" style="width:100%">
		<div id="boxAndWhisker" style="height: 300px; width: 100%;"></div>
	</div>
	 -->

<script src="./resources/worldmap/js/Chart.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script src="./resources/worldmap/js/canvasjs.min.js"></script>
<script src="./resources/worldmap/js/jquery.canvasjs.min.js"></script>
<!-- pieOptions와 각 대륙별 데이터 뽑아오기 -->
<!-- 각 대륙별 차트 생성-->
<script type="text/javascript"  src="./resources/worldmap/js/continent_chart.js">
</script>


</body>
</html>