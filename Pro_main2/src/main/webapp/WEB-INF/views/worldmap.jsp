<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script> <!-- 이것도 넣어줘야 ajax 사용할 수 있음... -->
<script src="./resources/js/worldGraph.js"></script>
<script src="./resources/js/Chart.bundle.min.js"></script>
<script src="./resources/js/graphSetting.js"></script>

<script type="text/javascript">

function al(){
	alert("야호!");
}

</script>


</head>
<body style="background-color: black">

<h1 style="background: white;">${search}についての結果</h1>

<!-- <div onclick="pos(event)" id="world"> -->
<div id="world">
<img src="./resources/img/worldmap.png" id="worldmap" style="width: 1200px; margin-left: auto; margin-right: auto; display: block;" onclick="newweb('${search}')"/>
</div>


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

<!-- 위에 띄우는 대륙별 그래프!!!!!!!!! -->
<!-- NA -->
<div style="height: 80px; width: 80px; position: absolute; left: 280px; top: 135px; ">
<canvas id="pieChart_NA" height="10px" width="10px">This browser doesn't support canvas</canvas>
</div>
<!-- SA -->
<div style="height: 80px; width: 80px; position: absolute; left: 438px; top: 360px; ">
<canvas id="pieChart_SA" height="10px" width="10px">This browser doesn't support canvas</canvas>
</div>
<!-- Europe -->
<div style="height: 80px; width: 80px; position: absolute; left: 680px; top: 75px; ">
<canvas id="pieChart_Euro" height="10px" width="10px">This browser doesn't support canvas</canvas>
</div>
<!-- Asia -->
<div style="height: 80px; width: 80px; position: absolute; left: 877px; top: 172px; ">
<canvas id="pieChart_Asia" height="10px" width="10px">This browser doesn't support canvas</canvas>
</div>
<!-- Oceania -->
<div style="height: 80px; width: 80px; position: absolute; left: 900px; top: 407px; ">
<canvas id="pieChart_Ocea" height="10px" width="10px">This browser doesn't support canvas</canvas>
</div>
<!-- Aprica -->
<div style="height: 80px; width: 80px; position: absolute; left: 636px; top: 341px; ">
<canvas id="pieChart_Apri" height="10px" width="10px">This browser doesn't support canvas</canvas>
</div>

<style>
#apri_div{
	visibility:visible;
}
#apri_div:hover{
	visibility:hidden;
	transition-duration: 0.5s;
}
</style>

<!-- <script type="text/javascript">

$(function(){
	var imgSA = new Image();
	var ctx = document.getElementById('apri').getContext("2d");
	imgSA.src="./resources/img/Aprica.png";
	
	imgSA.addEventListener('load', eventCatImageLoaded, false);
	function eventCatImageLoaded(){
		ctx.drawImage(imgSA, 0, 0);
	}
});


</script>
 -->

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

<script>

var data_Oceania = {
	    datasets: [{
	        data: [
	        	${sentiment_Oceania},
	            100-${sentiment_Oceania}
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
var data_NA = {
	    datasets: [{
	        data: [
	        	${sentiment_NA},
	            100-${sentiment_NA}
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
var data_SA = {
	    datasets: [{
	        data: [
	        	${sentiment_SA},
	            100-${sentiment_SA}
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
var data_Europe = {
	    datasets: [{
	        data: [
	        	${sentiment_Europe},
	            100-${sentiment_Europe}
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
var data_Africa = {
	    datasets: [{
	        data: [
	        	${sentiment_Africa},
	            100-${sentiment_Africa}
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
var data_Asia = {
	    datasets: [{
	        data: [
	            (${sentiment_Asia}),
	            (100-${sentiment_Asia})
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

	var pieChartCanvas = $("#pieChart_NA");
	var pieChart = new Chart(pieChartCanvas, {
	  type: 'doughnut',
	  data: data_NA,
	  options: pieOptions
	});
	
	var pieChartCanvas = $("#pieChart_SA");
	var pieChart = new Chart(pieChartCanvas, {
	  type: 'doughnut',
	  data: data_SA,
	  options: pieOptions
	});

	var pieChartCanvas = $("#pieChart_Euro");
	var pieChart = new Chart(pieChartCanvas, {
	  type: 'doughnut',
	  data: data_Europe,
	  options: pieOptions
	});

	var pieChartCanvas = $("#pieChart_Asia");
	var pieChart = new Chart(pieChartCanvas, {
	  type: 'doughnut',
	  data: data_Asia,
	  options: pieOptions
	});

	var pieChartCanvas = $("#pieChart_Ocea");
	var pieChart = new Chart(pieChartCanvas, {
	  type: 'doughnut',
	  data: data_Oceania,
	  options: pieOptions
	});

	var pieChartCanvas = $("#pieChart_Apri");
	var pieChart = new Chart(pieChartCanvas, {
	  type: 'doughnut',
	  data: data_Africa,
	  options: pieOptions
	});

</script>

	


  <script type="text/javascript">
  
  /*  CanvasJS.addColorSet("customColorSet1",
		     [//colorSet Array
		     "#4286f4",
		     "#0f02ff",
		     "#3048ff",
		     "#a0c9ff",
		     "#003984",
		     "#344863"
		    ]); */  
  
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
<script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.min.js"></script></head>
<body>
  <div id="chartContainer" style="height: 500px; width: 50%;">
  </div>


<script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script type="text/javascript">
$(function () {
	
	
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
	<div id="out" style=" height:400px;">
		<div id="outer1"  style="width:50%; float: left;" >
				<div id="gender" style="height: 400px; width: 50%; float: left;"></div>
				<div id="age" style="height: 400px; width: 50%; float: right;"></div>
		</div>
		<div id="outer2" style="width:50%; float: right;">
			<div id="stackedColumn" style="height: auto;"></div>
		</div>
	</div>


<input type="button" value="이꼬~" onclick="newweb()">
<input type="button" value="파이어베이스 연습!" onclick="fire()">

<input type="hidden" id="sent_SA" value="${sentiment_SA}">
<input type="hidden" id="sent_NA" value="${sentiment_NA}">
<input type="hidden" id="sent_Africa" value="${sentiment_Africa}">
<input type="hidden" id="sent_Oceania" value="${sentiment_Oceania}">
<input type="hidden" id="sent_Asia" value="${sentiment_Asia}">
<input type="hidden" id="sent_Europe" value="${sentiment_Europe}">

</body>
</html>