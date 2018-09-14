<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="./resources/js/jquery.ddslick.js" charset="UTF-8"></script>
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
<title>Insert title here</title>
</head>
<body>
	<select id="grades">
		<option value="0" data-imagesrc="./resources/img/00.png" selected="selected"></option>
		<option value="1" data-imagesrc="./resources/img/10.png"></option>
		<option value="2" data-imagesrc="./resources/img/20.png"></option>
		<option value="3" data-imagesrc="./resources/img/30.png"></option>
		<option value="4" data-imagesrc="./resources/img/40.png"></option>
        <option value="5" data-imagesrc="./resources/img/50.png"></option>
    </select>
    <input type="button" id="sendGrade" onclick="sendGrade()" value="확인">
</body>
</html>