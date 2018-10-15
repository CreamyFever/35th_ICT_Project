var sent_Europe = document.getElementById("sent_Europe").value;
var sent_SA = document.getElementById("sent_SA").value;
var sent_NA = document.getElementById("sent_NA").value;
var sent_Africa = document.getElementById("sent_Africa").value;
var sent_Oceania = document.getElementById("sent_Oceania").value;
var sent_Asia = document.getElementById("sent_Asia").value;





var data_Oceania = {
	    datasets: [{
	        data: [
	        	sent_Oceania,
	            100-sent_Oceania
	        ],
	        backgroundColor: [
	        	"#36A2EB",
	            "#E7E9ED"
	        ],
	        label: 'My dataset' // for legend
	    }],
	    labels: [
	    	"Blue",
	        "Grey"
	    ]
	};
var data_NA = {
	    datasets: [{
	        data: [
	        	sent_NA,
	            100-sent_NA
	        ],
	        backgroundColor: [
	        	"#36A2EB",
	            "#E7E9ED"
	        ],
	        label: 'My dataset' // for legend
	    }],
	    labels: [
	    	"Blue",
	        "Grey"
	    ]
	};
var data_SA = {
	    datasets: [{
	        data: [
	        	sent_SA,
	            100-sent_SA
	        ],
	        backgroundColor: [
	        	"#36A2EB",
	            "#E7E9ED"
	        ],
	        label: 'My dataset' // for legend
	    }],
	    labels: [
	    	"Blue",
	        "Grey"
	    ]
	};
var data_Europe = {
	    datasets: [{
	        data: [
	        	sent_Europe,
	            100-sent_Europe
	        ],
	        backgroundColor: [
	        	"#36A2EB",
	            "#E7E9ED"
	        ],
	        label: 'My dataset' // for legend
	    }],
	    labels: [
	    	"Blue",
	        "Grey"
	    ]
	};
var data_Africa = {
	    datasets: [{
	        data: [
	        	sent_Africa,
	            100-sent_Africa
	        ],
	        backgroundColor: [
	        	"#36A2EB",
	            "#E7E9ED"
	        ],
	        label: 'My dataset' // for legend
	    }],
	    labels: [
	    	"Blue",
	        "Grey"
	    ]
	};
var data_Asia = {
	    datasets: [{
	        data: [
	        	sent_Asia,
	            100-sent_Asia
	        ],
	        backgroundColor: [
	        	"#36A2EB",
	            "#E7E9ED"
	        ],
	        label: 'My dataset' // for legend
	    }],
	    labels: [
	    	"Blue",
	        "Grey"
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
	