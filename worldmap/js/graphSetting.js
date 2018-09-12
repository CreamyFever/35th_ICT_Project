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

	var pieChartCanvas = $("#pieChart");
	var pieChart = new Chart(pieChartCanvas, {
	  type: 'doughnut',
	  data: data,
	  hidden: true,
	  options: pieOptions
	});

	var pieChartCanvas_detail = $("#pieChart_detail");
	var pieChart = new Chart(pieChartCanvas_detail, {
		type: 'doughnut',
		data: data,
		hidden: true,
		options: pieOptions
	});