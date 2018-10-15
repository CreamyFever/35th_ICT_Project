$(document).ready(function()
{
	$.ajax({
		url: "getTopKeywords",
		type: "POST",
		success: outputKeywords
	});
	
	
	
});

function outputKeywords(resp){
	var keywords = [];
	var count = 0;
	for(var i in resp){
		if(count > 20)
			break;
		
		var keyword = {
				word: resp[i].keyword,
				weight: resp[i].count
		}
		keywords.push(keyword);
		count += 1;
	}
	
	$("#wordCloud").jQWCloud({
		words: keywords,
		//cloud_color: 'yellow',		
		minFont: 10,
		maxFont: 50,
		//fontOffset: 5,
		//cloud_font_family: 'Owned',
		//verticalEnabled: false,
		padding_left: 1,
		//showSpaceDIV: true,
		//spaceDIVColor: 'white',
		word_common_classes: 'WordClass',		
		word_mouseEnter :function(){
			$(this).css("text-decoration","underline");
		},
		word_mouseOut :function(){
			$(this).css("text-decoration","none");	
		},
		word_click: function(){
			location.href = "goToWorldMap?search=" + $(this).text();
		},		              
		beforeCloudRender: function(){
		       date1=new Date();
	 	},
	 	afterCloudRender: function(){
				var date2=new Date();
				console.log("Cloud Completed in "+(date2.getTime()-date1.getTime()) +" milliseconds");
			}
	});
}
