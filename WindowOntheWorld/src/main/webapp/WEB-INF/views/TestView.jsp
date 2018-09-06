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
		 <script src="resources/js/jquery.min.js"></script>
		 <!---- start-smoth-scrolling---->
		<script type="text/javascript" src="resources/js/move-top.js"></script>
		<script type="text/javascript" src="resources/js/easing.js"></script>
		<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
				});
			});
		</script>
		<!---- start-smoth-scrolling---->
		 <!-- Custom Theme files -->
		<link href="resources/css/theme-style.css" rel='stylesheet' type='text/css' />
   		 <!-- Custom Theme files -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script type="application/x-javascript">
			addEventListener("load", function() { 
				setTimeout(hideURLbar, 0); 
				showArticleByContinent('Asia');
			}, false);
			
			function hideURLbar(){
				window.scrollTo(0,1);
			}
		</script>

		<!----font-Awesome----->
   		<link rel="stylesheet" href="resources/fonts/css/font-awesome.min.css">
   		<!----font-Awesome----->
		<!----webfonts---->
		<link href='http://fonts.googleapis.com/css?family=Raleway:400,100,300,500,600,200,700,800,900' rel='stylesheet' type='text/css'>
		<!----//webfonts---->
		<!----start-top-nav-script---->
		<script>
			$(function() {
				var pull 		= $('#pull');
					menu 		= $('nav ul');
					menuHeight	= menu.height();
				$(pull).on('click', function(e) {
					e.preventDefault();
					menu.slideToggle();
				});
				$(window).resize(function(){
	        		var w = $(window).width();
	        		if(w > 320 && menu.is(':hidden')) {
	        			menu.removeAttr('style');
	        		}
	    		});
				
				$("#asia").on('click', function(){
					$("#articles").hide(1000,function(){
						showArticleByContinent('Asia');		// Parameter에 해당하는 대륙의 기사만 출력.
						$(this).show(1000);
					});
				});
				$("#europe").on('click', function(){
					$("#articles").hide(1000,function(){
						showArticleByContinent('Europe');
						$(this).show(1000);
					});
				});
				$("#africa").on('click', function(){
					$("#articles").hide(1000,function(){
						showArticleByContinent('Africa');
						$(this).show(1000);
					});
				});
				$("#north_america").on('click', function(){
					$("#articles").hide(1000,function(){
						showArticleByContinent('North_America');
						$(this).show(1000);
					});
				});
				$("#south_america").on('click', function(){
					$("#articles").hide(1000,function(){
						showArticleByContinent('South_America');
						$(this).show(1000);
					});
				});
				$("#oceania").on('click', function(){
					$("#articles").hide(1000,function(){
						showArticleByContinent('Oceania');
						$(this).show(1000);
					});
				});
			});
			
			function showArticleByContinent(continent){
				$.ajax({
					url: "showArticleByContinent",
					method: "POST",
					data:{
						"continent":continent
					},
					success: output,
					error: function(){
						alert("error");
					}
				});
			}
			
			function output(resp){
				var s = "";
				resp_date = convertDateForm(resp[0].articledate);
				s += '<div class="col-md-4 articles-grid-row frist-row">';
				s += '<a class="post-pic" href="#"><img src="resources/images/post-pic.jpg" title="pic-name" /></a>';
				
				s += '<div class="artical-info">';
				s += '	<div class="post-head">';
				s += '		<div class="post-head-left">';
				s += '			<h4><a href="#">' +resp[0].articlename + '</a></h4>';
				s += '			<p class="author">By <a href="#"> '+ resp[0].presscompany +'</a></p>';
				s += '		</div>';
				s += '		<div class="post-head-right">';
				s += '			<span>'+ resp_date[0] +'</span><label>'+ resp_date[1] +' '+ resp_date[2] +'</label>';
				s += '		</div>';
				s += '		<div class="clearfix"> </div>';
				s += '	</div>';
				s += '	<p class="post-text">'+ resp[0].articlecontent.substring(0,400) +'...</p>';
				s += '	<div class="post-bottom">';
				s += '		<div class="post-bottom-left">';
				s += '			<p><a href="#">0 Comments</a> | <i class="fa fa-heart"> </i> 0</p>';
				s += '		</div>';
				s += '		<div class="post-bottom-right">';
				s += '			<a class="artbtn" href="#">Read More</a>';
				s += '		</div>';
				s += '		<div class="clearfix"> </div>';
				s += '	</div>';
				s += '</div>';
				s += '</div>';
				
				for(var i = 0; i < 2; i++){
					s += '<div class="col-md-4 artical-row2">';

					for(var j = 0; j < 2; j++){
						resp_date = convertDateForm(resp[2*i + (j+1)].articledate);
						s += '<div class="artical-info">';
						s += '<div class="post-head post-head1">';
						s += '	<div class="post-head-left">';
						s += '		<h4><a href="#">' +resp[2*i + (j+1)].articlename + '</a></h4>';
						s += '		<p class="author">By <a href="#">' +resp[2*i + (j+1)].presscompany + '</a></p>';
						s += '	</div>';
						s += '	<div class="post-head-right post-head-right-C">';
						s += '		<span>'+ resp_date[0] +'</span><label>'+ resp_date[1] +' '+ resp_date[2] +'</label>';
						s += '	</div>';
						s += '	<div class="clearfix"> </div>';
						s += '</div>';
						s += '<p class="post-text">' +resp[2*i + (j+1)].articlecontent.substring(0,300) + '...</p>';
						s += '<div class="post-bottom">';
						s += '	<div class="post-bottom-left">';
						s += '		<p><a href="#">0 Comments</a> | <i class="fa fa-heart"> </i> 0</p>';
						s += '	</div>';
						s += '	<div class="post-bottom-right">';
						s += '		<a class="artbtn artbtn1" href="#">Read More</a>';
						s += '	</div>';
						s += '	<div class="clearfix"> </div>';
						s += '</div>';
						s += '</div>';
					}
					
					s += '</div>';
				}
				
				$(".articles-grids").html(s);
				$('html,body').animate({scrollTop:$("#articles").offset().top},1000);
			}
			
			function convertDateForm(inputDate){
				year = inputDate.substring(0,4);
				month = inputDate.substring(4,6);
				day = inputDate.substring(6,8);
				
				month_res = '';
				if(month == '01'){
					month_res += 'Jan';
				} else if(month == '02'){
					month_res += 'Feb';
				} else if(month == '03'){
					month_res += 'Mar';
				} else if(month == '04'){
					month_res += 'Apr';
				} else if(month == '05'){
					month_res += 'May';
				} else if(month == '06'){
					month_res += 'Jun';
				} else if(month == '07'){
					month_res += 'Jul';
				} else if(month == '08'){
					month_res += 'Aug';
				} else if(month == '09'){
					month_res += 'Sep';
				} else if(month == '10'){
					month_res += 'Oct';
				} else if(month == '11'){
					month_res += 'Nov';
				} else if(month == '12'){
					month_res += 'Dec';
				}
				
				result = [day, month_res, year];
				
				return result;
			}
		</script>
		<!----//End-top-nav-script---->
	</head>
	<body>
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
					<ul class="top-nav">
						<li class="active"><a href="#services" class="scroll">Continents</a></li>
						<li class="page-scroll"><a href="#articles" class="scroll">Articles</a></li>
					</ul>
					<a href="#" id="pull"><img src="resources/images/nav-icon.png" title="menu" /></a>
				</nav>
				<div class="clearfix"> </div>
				<!----//End-top-nav---->
			</div>
		</div>
		
		<!----start-services---->
		<div id="services" class="services">
			<div class="container">
				<h3>Continents<label> </label></h3>
			<!----start-servicves-list---->
			<div class="services-list text-center">
				<ul class="list-unstyled list-inline">
					<li>
						<a id="asia"><span class="service-icon5"> </span><label>Asia</label></a>
					</li>
					<li>
						<a id="europe"><span class="service-icon5"> </span><label>Europe</label></a>
					</li>
					<li>
						<a id="africa"><span class="service-icon5"> </span><label>Africa</label></a>
					</li>
					<li>
						<a id="north_america"><span class="service-icon5"> </span><label>North America</label></a>
					</li>
					<li>
						<a id="south_america"><span class="service-icon5"> </span><label>South America</label></a>
					</li>
					<li>
						<a id="oceania"><span class="service-icon5"> </span><label>Oceania</label></a>
					</li>
				</ul>
			</div>
			<!----//End-servicves-list---->
			</div>
		</div>
		<!----//End-services---->
		
		<!----start-articles---->
		<div id="articles" class="articles">
			<div class="container">
				<h3>Articles<label> </label></h3>
				<div class="articles-grids"></div>
			</div>
		</div>
		<!----//End-articles---->
		
		<!----start-about----->
		<div id="about" class="about">
			<div class="container">
				<h2>About</h2>
				<p class="wellcome-note-head"><label>We are a full Services Digital Agency. </label>We Design and develop <span>Websites,</span><span>Applications,</span><span>Mobile Solutions,</span> and more</p>
				<p class="wellcome-note-info">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In luctus velit quis risus eleifend bibendum. Aenean dictum felis in eros ultrices eleifend. Phasellus ultrices congue feugiat. Vestibulum sed pretium sem, sed venenatis nibh. Phasellus nec tincidunt neque. Proin accumsan sagittis lacus ut lobortis.Proin molestie cursus tortor in eleifend. Suspendisse potenti.</p>
			<!----start-about-grids----->
			<div class="about-grids">
				<div class="col-md-3 about-grid">
					<span class="about-icon"> </span>
					<h3><a href="#"><label>Reflexion</label> idea</a></h3>
					<p>velit est, tempus in nulla sed, convallis porttitor lacus. Curabitur sed egestas eros. Donec convallis ligula eu diam elementum, quis tempor sem tincidunt.</p>
				</div>
				<div class="col-md-3 about-grid">
					<span class="about-icon1"> </span>
					<h3><a href="#"><label>Conception</label> Design</a></h3>
					<p>velit est, tempus in nulla sed, convallis porttitor lacus. Curabitur sed egestas eros. Donec convallis ligula eu diam elementum, quis tempor sem tincidunt.</p>
				</div>
				<div class="col-md-3 about-grid">
					<span class="about-icon2"> </span>
					<h3><a href="#"><label>Codage</label> Develop</a></h3>
					<p>velit est, tempus in nulla sed, convallis porttitor lacus. Curabitur sed egestas eros. Donec convallis ligula eu diam elementum, quis tempor sem tincidunt.</p>
				</div>
				<div class="col-md-3 about-grid">
					<span class="about-icon3"> </span>
					<h3><a href="#"><label>Efficacite</label> Rapidite</a></h3>
					<p>velit est, tempus in nulla sed, convallis porttitor lacus. Curabitur sed egestas eros. Donec convallis ligula eu diam elementum, quis tempor sem tincidunt.</p>
				</div>
				<div class="clearfix"> </div>
			</div>
			</div>
			<!----//End-about-grids----->
		</div>
		<!----//End-about----->
		
		
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
	</body>
</html>

