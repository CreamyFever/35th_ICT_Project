<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>세계 기사</title>
<script src="resources/jquery-3.3.1.min.js"></script>
<script>
$(function(){
	//period = 10;
	//timer = setInterval(insertArticles, period*1000);
	
	$("#articles").on('click', function(){
		insertArticles();
	});
});

function insertArticles(){
	$.ajax({
		url: "insertArticle",
		method: "POST",
		success: output,
		error: function(){
			alert("error");
		}
	});
}

var s = "";
function output(resp){
	for(var key in resp){
		s += resp[key].articlename;
		s += "<br>";
	}
	
	$("#result").html(s);
}
</script>
</head>
<body>
	<h2><a href="showPopup?continent=Asia">Asia</a></h2>
	<h2><a href="showPopup?continent=Oceania">Oceania</a></h2>
	<h2><a href="showPopup?continent=Europe">Europe</a></h2>
	<h2><a href="showPopup?continent=Africa">Africa</a></h2>
	<h2><a href="showPopup?continent=North_America">North_America</a></h2>
	<h2><a href="showPopup?continent=South_America">South_America</a></h2>
	
	<button id="articles">Articles</button>

	<div id="result"></div>
</body>
</html>