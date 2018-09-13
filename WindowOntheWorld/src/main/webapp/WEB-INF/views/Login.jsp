<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign in</title>
<style type="text/css">
.cell {
    float: left;
    width: 50%;
    height: 1000px;
}

/* Clear floats after the columns */
.table:after {
    content: "";
    display: table;
    clear: both;
}

.description{
	
	line-height: 1.3; 
	padding: 4px 0px;
	
	display: inline;
	margin: 0; 
	
	position: relative;
	-webkit-box-decoration-break: clone;
	box-decoration-break: clone;
}
</style>
</head>
<body>

	<div id="summary" class="table">
	    <div class="cell" style="background-color: #00d8ff;" >
	    	<h2><span class="description">Login</span></h2>
	    		<br><a href="main">Main</a>
	    </div>
        <div class="cell" style="background-color: #e8fbff;">
        	<div style="margin-left: auto; margin-right: auto; width:90%;">
	        	<h2><span  class="description">WOW란?</span></h2>
	        	<br>
	        	<h3>
		        	<span class="description">
			        	&nbsp; Window Of the World의 준말로서, 세계와의 소통을 목적으로 하는 웹사이트입니다.<br>
						&nbsp; 사용자가 관심 있는 키워드에 대한 세계의 반응을 그래프로 표시하고, 이를 비교하여 세계의 시선이 얼마나 차이가 나는 지 한눈에 확인할 수 있습니다. 
						또한, 관심 기사에 대한 북마크, 다양한 분야별 게시판, 사용자들 간의 토론기능을 통해 견문을 넓힐 수 있습니다.
		        	</span>
	        	</h3>
	        </div>
        </div>
	</div>


</body>
</html>