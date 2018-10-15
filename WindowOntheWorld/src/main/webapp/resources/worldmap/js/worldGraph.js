

//SA
//유럽 세군데



function newweb(search)	{
	console.log(search);
	var continent = $("#continent_input").val();
	console.log(continent);
	window.open("goToDetail?keyword="+search+"&continent="+continent,"","width=800, height=600");
}
function fire()	{
	window.open("goToDetail","","width=400, height=300");
}

var countries = [];
var x;
var y;

var Euro01 = {x:693, y:142, path:"./resources/worldmap/img/europe_full.png", country:"Europe"};
var Euro02 = {x:621, y:126, path:"./resources/worldmap/img/europe_full.png", country:"Europe"};
var Euro03 = {x:645, y:177, path:"./resources/worldmap/img/europe_full.png", country:"Europe"};
var Euro04 = {x:583, y:181, path:"./resources/worldmap/img/europe_full.png", country:"Europe"};
var Euro05 = {x:621, y:212, path:"./resources/worldmap/img/europe_full.png", country:"Europe"};
var Euro06 = {x:682, y:170, path:"./resources/worldmap/img/europe_full.png", country:"Europe"};
var Euro07 = {x:674, y:191, path:"./resources/worldmap/img/europe_full.png", country:"Europe"};
var Euro08 = {x:706, y:168, path:"./resources/worldmap/img/europe_full.png", country:"Europe"};
var Euro09 = {x:716, y:99, path:"./resources/worldmap/img/europe_full.png", country:"Europe"};
var Euro10 = {x:709, y:131, path:"./resources/worldmap/img/europe_full.png", country:"Europe"};

var Afri01 = {x:578, y:249, path:"./resources/worldmap/img/africa_full.png", country:"Africa"};
var Afri02 = {x:629, y:264, path:"./resources/worldmap/img/africa_full.png", country:"Africa"};
var Afri03 = {x:610, y:324, path:"./resources/worldmap/img/africa_full.png", country:"Africa"};
var Afri04 = {x:633, y:375, path:"./resources/worldmap/img/africa_full.png", country:"Africa"};
var Afri05 = {x:639, y:243, path:"./resources/worldmap/img/africa_full.png", country:"Africa"};

var Asia01 = {x:972, y:131, path:"./resources/worldmap/img/asia_full.png", country:"Asia"};
var Asia02 = {x:783, y:127, path:"./resources/worldmap/img/asia_full.png", country:"Asia"};
var Asia03 = {x:810, y:191, path:"./resources/worldmap/img/asia_full.png", country:"Asia"};
var Asia04 = {x:683, y:251, path:"./resources/worldmap/img/asia_full.png", country:"Asia"};
var Asia05 = {x:828, y:273, path:"./resources/worldmap/img/asia_full.png", country:"Asia"};
var Asia06 = {x:864, y:325, path:"./resources/worldmap/img/asia_full.png", country:"Asia"};
var Asia07 = {x:677, y:281, path:"./resources/worldmap/img/asia_full.png", country:"Asia"};
var Asia08 = {x:687, y:180, path:"./resources/worldmap/img/asia_full.png", country:"Asia"};
var Asia09 = {x:721, y:147, path:"./resources/worldmap/img/asia_full.png", country:"Asia"};
var Asia10 = {x:717, y:179, path:"./resources/worldmap/img/asia_full.png", country:"Asia"};
var Asia11 = {x:645, y:214, path:"./resources/worldmap/img/asia_full.png", country:"Asia"};

var Ocea01 = {x:940, y:354, path:"./resources/worldmap/img/oceania_full.png", country:"Oceania"};
var Ocea02 = {x:884, y:405, path:"./resources/worldmap/img/oceania_full.png", country:"Oceania"};
var Ocea03 = {x:985, y:447, path:"./resources/worldmap/img/oceania_full.png", country:"Oceania"};

var SA01 = {x:433, y:342, path:"./resources/worldmap/img/south_america_full.png", country:"South_America"};
var SA02 = {x:413, y:424, path:"./resources/worldmap/img/south_america_full.png", country:"South_America"};
var SA03 = {x:442, y:355, path:"./resources/worldmap/img/south_america_full.png", country:"South_America"};
var SA04 = {x:364, y:302, path:"./resources/worldmap/img/south_america_full.png", country:"South_America"};

var NA01 = {x:444, y:98, path:"./resources/worldmap/img/north_america_full.png", country:"North_America"};
var NA02 = {x:206, y:141, path:"./resources/worldmap/img/north_america_full.png", country:"North_America"};
var NA03 = {x:315, y:209, path:"./resources/worldmap/img/north_america_full.png", country:"North_America"};
var NA04 = {x:373, y:259, path:"./resources/worldmap/img/north_america_full.png", country:"North_America"};

countries.push(Euro01);countries.push(Euro02);
countries.push(Euro03);countries.push(Euro04);
countries.push(Euro05);countries.push(Euro06);
countries.push(Euro07);countries.push(Euro08);
countries.push(Euro09);countries.push(Euro10);

countries.push(Afri01);countries.push(Afri02);
countries.push(Afri03);countries.push(Afri04);
countries.push(Afri05);

countries.push(Asia01);countries.push(Asia02);
countries.push(Asia03);countries.push(Asia04);
countries.push(Asia05);countries.push(Asia06);
countries.push(Asia07);countries.push(Asia08);
countries.push(Asia09);countries.push(Asia10);
countries.push(Asia11);

countries.push(Ocea01);countries.push(Ocea02);
countries.push(Ocea03);

countries.push(SA01);countries.push(SA02);
countries.push(SA03);countries.push(SA04);

countries.push(NA01);countries.push(NA02);
countries.push(NA03);countries.push(NA04);


var com=15000;
var xqua;
var yqua;
var zqua;
var target;





$(function(){
	$("#world").hover(function(e){

            for(var nn in countries){
               xqua=Math.abs(event.offsetX-countries[nn].x);
               yqua=Math.abs(event.offsetY-countries[nn].y);
               zqua=xqua*xqua+yqua*yqua;
               
               if(com>zqua){
                  com=zqua;
                  target=countries[nn];
               }   
            }
            com=15000;
            $("#worldmap").attr("src",target.path);
            $("#continent_input").val(target.country);
            //$("#worldmap").attr("value",target.country);
	}, function(){
		$("#worldmap").attr("src","./resources/worldmap/img/worldmap.png");
	});
});
	

/*
$(function(){
	   $("#world").click(
	         function(e){

	            for(var nn in countries){
	               xqua=Math.abs(event.offsetX-countries[nn].x);
	               yqua=Math.abs(event.offsetY-countries[nn].y);
	               zqua=xqua*xqua+yqua*yqua;
	               if(com>zqua){
	                  com=zqua;
	                  target=countries[nn];
	               }   
	            }
	            com=15000;
	            $("#worldmap").attr("src",target.path);
	         });
});
*/