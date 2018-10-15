<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Window on the World</title>

<style>
body {
	background-color: #ffffff;
}

div#introLogo img{
	display: block;
	margin-top: 100px;
	margin-bottom: 100px;
    margin-left: auto;
    margin-right: auto;
}
</style>
</head>
<body>
	<c:if test="${sessionScope.loginName == null}">
		<div id="introLogo">
			<a href="login"><img src="resources/images/wow_logo.png" /></a>
		</div>
	</c:if>
	<c:if test="${sessionScope.loginName != null}">
		<div id="introLogo">
			<a href="main"><img src="resources/images/wow_logo.png" /></a>
		</div>
	</c:if>

</body>
</html>