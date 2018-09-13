<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>월드맵!</title>

<script src="./resources/js/Chart.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script> <!-- 이것도 넣어줘야 ajax 사용할 수 있음... -->
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script src="./resources/js/canvasjs.min.js"></script>
<script src="./resources/js/jquery.canvasjs.min.js"></script>

<script> 
	window.onload=function() { 
	var canvas = document.getElementById("canvas1"); 
	var context = canvas.getContext("2d"); 
	var context4 = document.getElementById("pieChart_detail").getContext("2d"); 
	var pieChartCanvas_detail = document.getElementById("pieChart_detail").getContext("2d"); 

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
			    chart_gender.render();
/*  	var myChart = new Chart(context422, {
		type: 'bar',
		data : {
	        labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
	        datasets: [{
	            label: '# of Votes',
	            data: [12, 19, 3, 5, 10, 3],
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',
	                'rgba(255, 159, 64, 0.2)'
	            ],
	            borderColor: [
	                'rgba(255,99,132,1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],
	            borderWidth: 1
	        }]
	    },
	});
 */	
	context.beginPath();
	context.stroke(); context.closePath(); 
	
	
	
	
	
	

	
	//--------------------------------------------------------------------------
	
	
	

var data = {
	    datasets: [{
	        data: [
	            3,
	            14
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

	var pieOptions = {
			legend: {
	            display: false
	         }, //범례 삭제하는 법★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
		events: false,
	  animateRotate : true,
	  animationSteps : 100,
	  animation: {
	    duration: 500,
	    easing: "easeOutQuart",
	    onComplete: function () {
	      var ctx = this.chart.ctx;
	      ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontFamily, 'normal', Chart.defaults.global.defaultFontFamily);
	      ctx.textAlign = 'center';
	      ctx.textBaseline = 'bottom';

	      this.data.datasets.forEach(function (dataset) {

	        for (var i = 0; i < dataset.data.length; i++) {
	          var model = dataset._meta[Object.keys(dataset._meta)[0]].data[i]._model,
	              total = dataset._meta[Object.keys(dataset._meta)[0]].total,
	              mid_radius = model.innerRadius + (model.outerRadius - model.innerRadius)/2,
	              start_angle = model.startAngle,
	              end_angle = model.endAngle,
	              mid_angle = start_angle + (end_angle - start_angle)/2;

	          var x = mid_radius * Math.cos(mid_angle);
	          var y = mid_radius * Math.sin(mid_angle);

	          ctx.fillStyle = '#fff';
	          if (i == 3){ // Darker text color for lighter background
	            ctx.fillStyle = '#444';
	          }
	          var percent = String(Math.round(dataset.data[i]/total*100)) + "%";
	          ctx.fillText(dataset.data[i], model.x + x, model.y + y);
	          // Display percent in another line, line break doesn't work for fillText
	          ctx.fillText(percent, model.x + x, model.y + y + 15);
	        }
	      });               
	    }
	  }
	}

	
	

	var pieChart22 = new Chart(pieChartCanvas_detail, {
	  type: 'doughnut',
	  data: data,
	  hidden: true,
	  options: pieOptions
	});
	
	

	
	//여기서 부터는 기사 따오기~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	var url = 'https://newsapi.org/v2/everything?' +
          'q=Apple&' +
          'from=2018-08-14&' +
          'sortBy=popularity&' +
          'apiKey=3d95bc3158704ebabea0f1aaec5b41b4';

	var req = new Request(url);

	fetch(req)
    	.then(function(response) {
        	console.log(response.json());
   		 })
	
	
	
}; 
	
	
	</script> 
	</head> 
	<body>
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
	
	
	
	
	<hr color="skyblue" size="5px">
	<div id="out" style=" height:400px;">
		<div id="outer1"  style="width:50%; float: left;" >
				<div id="gender" style="height: 400px; width: 50%; float: left;"></div>
				<div id="age" style="height: 400px; width: 50%; float: right;"></div>
		</div>
		<div id="outer2" style="width:50%; float: right;">
			<div id="stackedColumn" style="height: auto;"></div>
		</div>
	</div>
	<br>	
	<hr color="skyblue" size="5px">
	<div id="whisker" style="width:100%">
		<div id="boxAndWhisker" style="height: 300px; width: 100%;"></div>
	</div>
	





</body>
</html>