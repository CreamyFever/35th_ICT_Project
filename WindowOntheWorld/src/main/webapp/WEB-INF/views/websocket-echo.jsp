<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
* { 
	margin: 0; 
	padding: 0; 
	box-sizing: border-box;
}
html.open {overflow: hidden;}
.chat{
	width: 80%;
	margin: 0px auto;
}
.bar {
	width: 100%;
	height: 80px;
	position: inherit;
	top: 0px;
	left: 0px;
	text-align: center;
	font-size: 20px;
	font-weight: bold;
	background-color: #222730;
	color: white;
	z-index: 5;
}
.logo {
	width: 80px;
	height: 80px;
	position: absolute;
	left: 10px;
	top: 0px;
	z-index: 1;
	background-image: url('./resources/images/wow_logo.png');
	background-size: 80%;
	background-repeat: no-repeat;
	background-position: center;
	cursor: pointer;
	margin-left: 20px;
}
.btnn {
	width: 80px;
	height: 80px;
	position: absolute;
	right: 0px;
	top: 0px;
	z-index: 10;
	background-image: url('./resources/images/menu.png');
	background-size: 50%;
	background-repeat: no-repeat;
	background-position: center;
	cursor: pointer;
	margin-right: 20px;
}
.profile{
	width: 350px;
	height: 100%;
	position: fixed;
	top: 0px;
	right: -352px;
	z-index: 10;
	border: 1px solid #c9c9c9;
	background-color: #f7f7f7;
	transition: All 0.2s ease;
	-webkit-transition: All 0.2s ease;
	-moz-transition: All 0.2s ease;
	-o-transition: All 0.2s ease;
	text-align: center;
}
.profile.open { right: 0px; }
.page_cover.open { display: block; }
.page_cover {
	width: 100%;
	height: 100%;
	position: fixed;
	top: 0px;
	left: 0px;
	background-color: rgba(0, 0, 0, 0.4);
	z-index: 4;
	display: none;
}
.searchForm{
	margin-bottom: 20px;
}
.search{
	margin: 0px auto;
	margin-top: 120px;
	width: 80%;
	position: static;
}
.profileImage{
	background: center center no-repeat;
    border-radius: 50%;
    width: 200px;
    height: 200px;
    background-size: 200px;
    margin: 0px auto;
    margin-top: 50px;
    margin-bottom: 30px;
}
.loginName{
	color: #222730;
	font-size: 30px;
	font-weight: bold;
	margin-bottom: 40px;
}
.loginli{
	color: #222730;
	font-size: 20px;
	font-weight: bold;
}
li{
	list-style: none;
	margin: 0px auto;
	margin: 0px 10px 15px 10px;
}
html, body{
	height : 100%;
}
body{
	background-color: #f8f8f8;
}
::-webkit-scrollbar{
	display: none;
}
#userList{
	width : 200px;
	height : 100%;
	overflow-y: scroll;
	overflow-x: hidden;
	-ms-overflow-style: none;
	padding : 10px;
	margin-bottom: 10px;
	display: table;
	border : 1px solid #999999;
	border-radius : 5px;
	background-color: #ffffff;
}
#timer{
	width : 150px;
	height: 100%;
	padding : 10px;
	text-align: center;
	border : 1px solid #999999;
	border-radius : 5px;
	font-weight: bold;
}
#chatLog{
	border : 1px solid #999999;
	border-radius : 5px;
	width : 100%;
	height : 450px;
	overflow-y: scroll;
	overflow-x: hidden;
	background-color: white;
}
#chatLog div{
	padding: 5px 10px;
}
#advocate {
    text-align : left;
    margin-left : 4%;
    font-size :13px;
    font-weight : bold;
    float:left;
    clear:both;
}
#advocatem {
    background : #ffec42;
    text-align : left;
    margin-left : 5%;
    border-radius : 5px;
    margin-bottom : 10px;
    display : inline-block;
    max-width : 40%;
    position:relative;
    float:left;
    clear:both;
    word-wrap:break-word;
}
 #advocatem:after, #advocatem:before {
    right:100%;
    top:50%;
    border: solid transparent;
    content:"";
    height:0;
    width:0;
    position:absolute;
}
#advocatem:after {
    border-color: rgba(255, 240, 245, 0);
    border-right-color: #ffec42;
    border-width: 7px;
    margin-top: -7px;
}
#advocatem:before {
    border-color: rgba(139, 69, 19, 0);        
    border-width: 10px;
    margin-top: -10px;
}
#dissenter {
    text-align : right;
    margin-right : 5%;
    font-size : 13px;
    font-weight : bold;
    float : right;
    clear : both;
}
#dissenterm{
	background : #ffec42;
    text-align : left;
    margin-right : 5%;
    border-radius : 5px;
    margin-bottom : 10px;
    display : inline-block;
    max-width : 40%;
    position:relative;
    float : right;
    clear : both;
    word-wrap:break-word;
}
#dissenterm:after, #dissenterm:before {
    left:100%;
    top:50%;
    border: solid transparent;
    content:"";
    height:0;
    width:0;
    position:absolute;
}
#dissenterm:after {
    border-color: rgba(255, 240, 245, 0);
    border-left-color: #ffec42;
    border-width: 7px;
    margin-top: -7px;
}
#dissenterm:before {
    border-color: rgba(139, 69, 19, 0);
    border-width: 10px;
    margin-top: -10px;
}
#chatBody{
	display: flex;
	height : 100%;
	width: 100%;
}
#leftChat{
	width: 200px;
}
#chatData{
	flex: 1;
	margin-left: 20px;
}
#chatHeader{
	width: 100%;
	height : 100px;
	display: flex;
	margin-top: 20px;
	margin-bottom: 20px;
}
.row{
	margin-left: 0px;
	margin-right: 0px;
}
#chatInput{
	width : 100%;
	margin-top : 10px;
	display: flex;
	height: 35px;
}
#message{
	flex : 1;
}
#sendBtn{
	width : 70px;
	margin-left: 5px;
	height: 35px;
}
#time{
	width : 100%;
	text-align: center;
	font-weight: bold;
	font-size: 1.5em;
}
.discussion_title{
	font-weight: bold;
	font-size: 2em;
}
.discussion_article{
	color: #9e9e9e;
}
.dis_title{
	flex: 1;
	margin-top: 20px;
}
.card-title{
	font-size: 1.3em;
	font-weight: bold;
	text-align: center;
	margin-bottom: 20px;
}
.state{
	width: 20px;
	height: 20px;
	margin-right: 10px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://cdn.sockjs.org/sockjs-0.3.4.js"></script>
<script type="text/javascript">
var openGrade;
$(function(){
	$('#message').attr("disabled", true);
	$('#sendBtn').attr("disabled", true);
	$("#sendBtn").click(function() {
		sendMessage();
		$('#message').val('');
	});

	$("#message").keydown(function(key) {
		if (key.keyCode == 13) {// 엔터
			sendMessage();
			$('#message').val('');
		}
	});
	$('.logo').click(function(){
		window.location.href="<c:url value='/main'/>";
	});
	$('.btnn').click(function(){
		$(".profile,.page_cover,html").addClass("open");
	    window.location.hash = "#open";
	});
	$('.profileImage').css('background-image', 'url("./resources/images/t3.jpg")'); 
});

// 웹소켓을 지정한 url로 연결한다.
var sock = new SockJS('<c:url value="/echo"/>');

// 서버로부터 메시지를 받았을 때
sock.onmessage = function(msg){
	var data = msg.data;
	
	if(data.indexOf('{"userList":') != -1){
		var obj = eval('('+ msg.data +')');		 		
		
		$('#userList .card-body #card-text').html('');
		for(var i=0 ; i<obj.userList.length ; i++){
			if(obj.userList[i][2] == '찬성'){
				if(obj.userList[i][1] == '${sessionScope.loginName}'){
					$('#userList .card-body #card-text').append('<li class="card-body"><img class="state" src="./resources/images/good.png"><b>[찬성] '+ obj.userList[i][1] +'</b></li>');
				}
				else{
					$('#userList .card-body #card-text').append('<li class="card-body"><img class="state" src="./resources/images/good.png">[찬성] '+ obj.userList[i][1] +'</li>');
				}
			}
			else if(obj.userList[i][2] == '반대'){
				if(obj.userList[i][1] == '${sessionScope.loginName}'){
					$('#userList .card-body #card-text').append('<li class="card-body"><img class="state" src="./resources/images/bad.png"><b>[반대] '+ obj.userList[i][1] +'</b></li>');
				}
				else{
					$('#userList .card-body #card-text').append('<li class="card-body"><img class="state" src="./resources/images/bad.png">[반대] '+ obj.userList[i][1] +'</li>');
				}
			}
			else{
				if(obj.userList[i][1] == '${sessionScope.loginName}'){
					$('#userList .card-body #card-text').append('<li class="card-body"><img class="state" src="./resources/images/observe.png"><b>[관전] '+ obj.userList[i][1] +'</b></li>');
				}
				else{
					$('#userList .card-body #card-text').append('<li class="card-body"><img class="state" src="./resources/images/observe.png">[관전] '+ obj.userList[i][1] +'</li>');
				}
			}
		}
	}
	else if(data.indexOf('Timer!@#$') != -1){
		var dataArr = data.split('!@#$');
		if(dataArr[2] == 'ready'){
			if('${sessionScope.userState}' != '관전'){
				$('#message').attr("disabled", false);
				$('#sendBtn').attr("disabled", false);
			}	
			$('#time').html(dataArr[1]);
		}
		else if(dataArr[2] == 'first'){				
			if('${sessionScope.userState}' != '찬성'){
				$('#message').attr("disabled", true);
				$('#sendBtn').attr("disabled", true);
			}else{
				$('#message').attr("disabled", false);
				$('#sendBtn').attr("disabled", false);
			}
			$('#time').html(dataArr[1]);
		}
		else if(dataArr[2] == 'second'){
			if('${sessionScope.userState}' != '반대'){
				$('#message').attr("disabled", true);
				$('#sendBtn').attr("disabled", true);
			}else{
				$('#message').attr("disabled", false);
				$('#sendBtn').attr("disabled", false);
			}
			$('#time').html(dataArr[1]);
		}
		else if(dataArr[2] == 'third'){
			if('${sessionScope.userState}' != '찬성'){
				$('#message').attr("disabled", true);
				$('#sendBtn').attr("disabled", true);
			}else{
				$('#message').attr("disabled", false);
				$('#sendBtn').attr("disabled", false);
			}
			$('#time').html(dataArr[1]);
		}
		else if(dataArr[2] == 'fourth'){
			if('${sessionScope.userState}' != '반대'){
				$('#message').attr("disabled", true);
				$('#sendBtn').attr("disabled", true);
			}else{
				$('#message').attr("disabled", false);
				$('#sendBtn').attr("disabled", false);
			}
			$('#time').html(dataArr[1]);
		}
		else if(dataArr[2] == 'grade'){
			$('#message').attr("disabled", true);
			$('#sendBtn').attr("disabled", true);
			
			if('${sessionScope.userState}' == '관전'){
				openGrade = window.open("discussionRoomGrade", '_blank', 'toolbar=no, location=no, status=no, menubar=no, scrollbars=auto, resizable=no, directories=no, width=380, height=250, top=100, left=100');
			}
		}
		else if(dataArr[2] == 'gradetime'){
			$('#time').html(dataArr[1]);
		}
		else{
			//end
			if(openGrade != null){
				var go = $('#gradeOpener').val();
				if(go !=''){
					sock.send($('#gradeOpener').val()+'!@#${sessionScope.loginId}');
				}
				openGrade.close();
			}
			$('#time').html(dataArr[1]);
		}
	}
	else{
		var dataArr = data.split('!@#$');
		if(dataArr[1] == '찬성'){
			$("#chatLog").append("<div id='advocate'>" + dataArr[2] + "</div>");
			$("#chatLog").append("<div id='advocatem'>" + dataArr[0] + "</div>");
		}
		else if(dataArr[1] == '반대'){
			$("#chatLog").append("<div id='dissenter'>" + dataArr[2] + "</div>");
			$("#chatLog").append("<div id='dissenterm'>" + dataArr[0] + "</div>");
		}
		$('#chatLog').scrollTop($('#chatLog')[0].scrollHeight);
	}		
};

// 메시지 전송
function sendMessage() {	
	var data = $("#message").val();	
	if(data != ''){
		sock.send($("#message").val());
	}
}
window.onhashchange = function() {
    if(location.hash != "#open"){
    	$(".profile,.page_cover,html").removeClass("open");
    }	    
};
</script>
</head>
<body>	
	<div class="bar"><div class="logo"></div><div class="btnn"></div></div>	
	<div onclick="history.back();" class="page_cover"></div>
	<div class="profile">
		<div class="profileImage"></div>
		<c:if test="${loginId != null}">
			<div class="loginName">${sessionScope.loginName}</div>
			<ul>
				<li><a class="loginli" href="members/update">회원정보수정</a></li>
				<li><a class="loginli" href="members/logout">로그아웃</a></li>
			</ul>
		</c:if>
		<c:if test="${loginId == null}">
			<ul>
				<li><a class="loginli" href="members/login">로그인</a></li>
				<li><a class="loginli" href="members/join">회원가입</a></li>
			</ul>
		</c:if>
	</div>
	<div class="chat">
		<div id="chatHeader" class="row">
			<div class="col dis_title">
				<div class="discussion_title">${discussion_room.dis_title}</div>
				<div class="discussion_article"><a href="read?articleid=${article.articleid}&articlenum=${article.articlenum}">${article.articlename}</a></div>
			</div>			
			<div class="col card text-white" id="timer">시간<div id="time"></div></div>
		</div>
		<div id="chatBody">
			<input type="hidden" id="gradeOpener">
			<div id="leftChat">
				<div id="userList" class="card">
					<div class="card-body">
						<h5 class="card-title">접속자 리스트</h5>
						<ul id="card-text"></ul>	
					</div>
				</div>
			</div>
			<div id="chatData">
				<div id="chatLog"></div>
				<div id="chatInput">
					<input type="text" id="message"/>
					<input type="button" class="btn btn-default" id="sendBtn" value="전송"/>
				</div>			
			</div>
		</div>	
	</div>
</body>
</html>