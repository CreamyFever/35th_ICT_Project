<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
* { 
	margin: 0; 
	padding: 0; 
	box-sizing: border-box;
}
body{
	overflow-x : hidden;
}
html.open {overflow: hidden;}
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
	margin-bottom: 20px;
}
#tb{
	position: relative;
	width: 100%;
	margin: 0px auto;
	margin-top: 50px;
	margin-bottom: 50px;
	
}
#content{
	margin: 30px auto 0px auto;
	position: static;
	margin: 0px auto;
	width: 90%;
}
.dis_no{
	width: 40px;
	text-align: center;
}
.dis_title{
	width: 150px;
	text-align: left;
}
.articlenum{
	width: 250px;
	text-align: left;
}
.dis_regdate{
	width: 150px;
	text-align: center;
}
.dis_grade{
	width: 40px;
	text-align: center;
}
.dis_enter{
	width: 50px;
	text-align: center;
}
.enter{
	width: 100%;
}
.namecursor{
	cursor: pointer;
}
.container{
	margin: 0px auto;
	position: static;
}
.nn{
	width: 80%;
	font-size: 1.5em;
	font-weight: bold;
	margin-top: 50px;
}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	var openGrade;
	$(function(){
		$('#loginId').val('${loginId}');
		/* $.ajax({
			url : "roomList",
			type: "post",
			dataType: "json",
			success: ajax_func
		}); */
	 	$('.logo').click(function(){
			window.location.href="<c:url value='/main'/>";
		});
		$('.btnn').click(function(){
			$(".profile,.page_cover,html").addClass("open");
		    window.location.hash = "#open";
		});
		$('.profileImage').css('background-image', 'url("./resources/images/wow_logo.png")'); 
	});
	function ajax_func(data){
		var def = "<tr>";
			def += "<th class='dis_no'>번호</th>";
			def += "<th class='dis_title'>제목</th>";
			def += "<th class='articlenum'>기사 제목</th>";
			def += "<th class='dis_regdate'>생성날짜</th>";
			def += "<th class='dis_grade'>평점</th>";
			def += "</tr>";			
		$('#tb > tbody:last').html(def);
		
		for(var i in data){					
			for(var j in data[i]){				
				var con = "<tr>";
				con += "<td class='dis_no'>"+data[i][j].dis_no+"</td>";
				if(data[i][j].dis_grade == -1){
					con += "<td class='dis_title'><span class='namecursor' onclick='clickenter("+data[i][j].dis_no+")'><span style='color: gray;'>[시작대기] </span> "+data[i][j].dis_title+"</span></td>";
				}
				else if(data[i][j].dis_grade == -2){
					con += "<td class='dis_title'><span class='namecursor' onclick='clickenter("+data[i][j].dis_no+")'><span style='color: gray;'>[진행중] </span> "+data[i][j].dis_title+"</span></td>";
				}
				else{
					con += "<td class='dis_title'><span class='namecursor' onclick='clickenter("+data[i][j].dis_no+")'><span style='color: gray;'>[완료] </span>"+data[i][j].dis_title+"</span></td>";
				}
				
				con += "<td class='articlenum'>"+ j +"</td>";		
				
				con += "<td class='dis_regdate'>"+data[i][j].dis_regdate+"</td>";
				if(data[i][j].dis_grade == -1){
					con += "<td class='dis_grade'>-</td>";
				}
				else if(data[i][j].dis_grade == -2){
					con += "<td class='dis_grade'>-</td>";
				}
				else{
					con += "<td class='dis_grade'>"+data[i][j].dis_grade+"</td>";				
				}			
				con += "</tr>";
				$('#tb > tbody:last').append(con);
			}
		}
	}
	function clickenter(roomnum){
		$('#room_state').val('enter');	
		$('#roomnum').val(roomnum);
		
		$.ajax({
			url : "member_state",
			type: "post",
			data: {
				"idno" : "${sessionScope.loginIdno}",
				"roomnum" : roomnum
			},
			headers: {
				Accept: 'application/text; charset=UTF-8'
			},
			success: function(data){
				var state = data;
				var grade;
				$.ajax({
					url : "room_grade",
					type: "post",
					data: {"roomnum" : roomnum},
					success : function(data2){
						grade = data2;;
						if(state == '' && (grade == -1 || grade == -2)){
							openGrade = window.open("discussionMemberState", '_blank', 'toolbar=no, location=no, status=no, menubar=no, scrollbars=auto, resizable=no, directories=no, width=450, height=270, top=100, left=100');
						}
						else{
							$('#insertroomForm').submit();
						}
					}
				});				
			}
		});
	} 
	function clicknew(){
		$('#room_state').val('new');	
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
	
	<div class="container">
		
		<form id="insertroomForm" action="insertroom" method="post">
			<input type="hidden" id="loginId" name="loginId">
			<input type="hidden" id="room_state" name="room_state" value="new">
			<input type="hidden" id="roomnum" name="roomnum">
			<input type="hidden" id="userState" name="userState">
			<div id="content">	
				<div class="nn">토론방 목록</div>
				<table class="table table-hover" id="tb">
					<tr>
						<th class='dis_no'>번호</th>
						<th class='dis_title'>제목</th>
						<th class='articlenum'>기사 제목</th>
						<th class='dis_regdate'>생성날짜</th>
						<th class='dis_grade'>평점</th>	
					</tr>
					
<!-- 					
					
					
					con += "";
				if(data[i][j].dis_grade == -1){
					con += "";
				}
				else if(data[i][j].dis_grade == -2){
					con += "<td class='dis_title'><span class='namecursor' onclick='clickenter("+data[i][j].dis_no+")'><span style='color: gray;'>[] </span> "+data[i][j].dis_title+"</span></td>";
				}
				else{
					con += "<td class='dis_title'><span class='namecursor' onclick='clickenter("+data[i][j].dis_no+")'><span style='color: gray;'>[완료] </span>"+data[i][j].dis_title+"</span></td>";
				}
				
						
				
				con += ";
				if(data[i][j].dis_grade == -1){
					con += "";
				}
				else if(data[i][j].dis_grade == -2){
					con += "<td class='dis_grade'>-</td>";
				}
				else{
					con += "";	 -->
					
					
					
					
					
					
					
					
					<c:forEach var="roomList" items="${roomList}" >
						<tr>
							<td class='dis_no'>${roomList.dis_no}</td>
							<c:choose>							 
							    <c:when test="${roomList.dis_grade == -1}">
							       	<td class='dis_title'><span class='namecursor' onclick='clickenter(${roomList.dis_no})'><span style='color: gray;'>[시작대기] </span>${roomList.dis_title}</span></td>
							    </c:when>							 
							    <c:when test="${roomList.dis_grade == -2}">
							       	<td class='dis_title'><span class='namecursor' onclick='clickenter(${roomList.dis_no})'><span style='color: gray;'>[진행중] </span>${roomList.dis_title}</span></td>
							    </c:when>							 
							    <c:otherwise>
							       	<td class='dis_title'><span class='namecursor' onclick='clickenter(${roomList.dis_no})'><span style='color: gray;'>[완료] </span>${roomList.dis_title}</span></td>
							    </c:otherwise>							 
							</c:choose>
							<td class='articlenum'>${roomList.articlename}</td>
							<td class='dis_regdate'>${roomList.dis_regdate}</td>
							<c:choose>							 
							    <c:when test="${roomList.dis_grade == -1}">
							       	<td class='dis_grade'>-</td>
							    </c:when>							 
							    <c:when test="${roomList.dis_grade == -2}">
							       	<td class='dis_grade'>-</td>
							    </c:when>							 
							    <c:otherwise>
							       	<td class='dis_grade'>${roomList.dis_grade}</td>
							    </c:otherwise>							 
							</c:choose>
						</tr>						
					</c:forEach>
				</table>
				<div class="text-center">
					<ul class="pagination">
						<li><a href="roomList?page=1&searchText=${searchText}">≪</a></li>
						<li><a href="roomList?page=${navi.currentPage-1}&searchText=${search}">＜</a></li>
						<c:if test="${navi.endPageGroup == 0}">
							<c:if test="${search != null}">
								<li><a href="roomList?page=1&searchText=${search}">1</a></li>								
							</c:if>
							<c:if test="${search == null}">
								<li><a href="roomList?page=1">1</a></li>								
							</c:if>
						</c:if>
						<c:if test="${navi.endPageGroup != 0}">
							<c:forEach var="i" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
								<c:if test="${i == navi.currentPage}">
									<li><a href="roomList?page=${i}&searchText=${search}"><b>${i}</b></a></li>
								</c:if>
								<c:if test="${i != navi.currentPage}">
									<li><a href="roomList?page=${i}&searchText=${search}">${i}</a></li>									
								</c:if>
							</c:forEach>
						</c:if> 
						<li><a href="roomList?page=${navi.currentPage+1}&searchText=${search}">＞</a></li>
						<li><a href="roomList?page=${navi.totalPageCount}&searchText=${search}">≫</a></li>
					</ul>
				</div>
				<input type="submit" class="btn btn-default" id="new" onclick="clicknew()" value="새로 만들기"><br/>
			</div>		
		</form>
	</div>
</body>
</html>