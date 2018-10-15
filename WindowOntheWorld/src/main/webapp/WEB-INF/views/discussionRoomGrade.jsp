<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="./resources/js/jquery.ddslick.js" charset="UTF-8"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#grades').ddslick();
	
	$.ajax({
		url : "sendGrade",
		type: "post",
		data: {
			"userid" : '${sessionScope.loginId}',
			"grade" : $('.dd-option-selected').find(':input').val()
		},
		success: function(data){
			$('#gradeOpener', opener.document).val(data);
		}
	});
});	
function sendGrade(){
	$.ajax({
		url : "sendGrade",
		type: "post",
		data: {"grade" : $('.dd-option-selected').find(':input').val()},
		success: function(data){
			$('#gradeOpener', opener.document).val(data);
			window.close();
		}
	});
}
</script> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
	html{
		width: 100%;
		height: 100%;
	}
	body{
		width: 80%;
		margin: 0px auto;
		margin-top: 70px;
	}
	input{
		margin-top: 20px;
	}
</style>
<title>Window On the World</title>
</head>
<body>
	<select id="grades">
		<option value="0" data-imagesrc="./resources/images/00.png" selected="selected"></option>
		<option value="1" data-imagesrc="./resources/images/10.png"></option>
		<option value="2" data-imagesrc="./resources/images/20.png"></option>
		<option value="3" data-imagesrc="./resources/images/30.png"></option>
		<option value="4" data-imagesrc="./resources/images/40.png"></option>
        <option value="5" data-imagesrc="./resources/images/50.png"></option>
    </select>
    <input type="button" id="sendGrade" class="btn btn-default" onclick="sendGrade()" value="확인">
</body>
</html>