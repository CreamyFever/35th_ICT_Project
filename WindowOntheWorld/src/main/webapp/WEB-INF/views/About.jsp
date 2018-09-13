<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>About</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
	<!-- Custom Theme files -->
	<link href="resources/css/theme-style.css" rel='stylesheet' type='text/css' />
	<!-- Custom Theme files -->
</head> 
<body>		
	<!----start-about----->
		<div id="about" class="about">
			<div class="container">
			
				<a href="javascript:history.back();" class="artbtn">Back</a>
				<h2>About</h2>
				<p class="wellcome-note-head"><b>Title</b>  ${article.articlename}</p>
				<p class="wellcome-note-info" ><b>URL</b> <a href="${article.url}" class="article_url" style="color:#000"> ${article.url}</a></p>
				<!----start-about-grids----->
				<div class="about-grids">
					<b>Date</b> &nbsp;${article.articledate}
					<br><br>
					<p id="article_content">${article.articlecontent}</p>
					<div class="clearfix"> </div>
				</div>
				<!----//End-about-grids----->
			</div>
		</div>
		<!----//End-about----->


</body>
</html>