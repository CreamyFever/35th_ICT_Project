<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./resources/css/discussionMemberState.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	function clickState(){
		$.ajax({
			url : "selectState",
			type: "post",
			data: {
				"roomnum": $('#roomnum', opener.document).val(),
				"state" : $(":input:radio[name=state]:checked").val()
			},
			headers: {
				Accept: 'application/text; charset=UTF-8'
			},
			success: function(data){
				console.log(data);
				$('#userState', opener.document).val(data);
				$('#insertroomForm', opener.document).submit();
				window.close();
			}
		});
	}
</script>
<title>Window On the World</title>
</head>
<body>
	<div class="continput">
		<ul>
			<li>
				<input type="radio" id="advocate" name="state" value="찬성">
				<label>찬성</label>
				<div class="bullet">
					<div class="line zero"></div>
					<div class="line one"></div>
					<div class="line two"></div>
					<div class="line three"></div>
					<div class="line four"></div>
					<div class="line five"></div>
					<div class="line six"></div>
					<div class="line seven"></div>
				</div>
			</li>
			<li>
				<input type="radio" id="dissenter" name="state" value="반대">
				<label>반대</label>
				<div class="bullet">
					<div class="line zero"></div>
					<div class="line one"></div>
					<div class="line two"></div>
					<div class="line three"></div>
					<div class="line four"></div>
					<div class="line five"></div>
					<div class="line six"></div>
					<div class="line seven"></div>
				</div>
			</li>
			<li>
				<input checked type="radio" id="observer" name="state" value="관전">
				<label>관전</label>
				<div class="bullet">
					<div class="line zero"></div>
					<div class="line one"></div>
					<div class="line two"></div>
					<div class="line three"></div>
					<div class="line four"></div>
					<div class="line five"></div>
					<div class="line six"></div>
					<div class="line seven"></div>
				</div>
			</li>
		</ul>
		<input type="submit" class="btn fourth" onclick="clickState()" value="확인">
	</div>	
</body>
</html>