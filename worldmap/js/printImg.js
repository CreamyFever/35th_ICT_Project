function draw(){
	var imgSA = new Image();
	
	imgSA.addEventListener('hover',function(){
		var ctx = document.getElementById('apri').getContext("2d");
		ctx.drawImage(imgSA, 0, 0, 200, 200);
	}, false);
	
	imgSA.src="./resources/img/Aprica.png";
	
}