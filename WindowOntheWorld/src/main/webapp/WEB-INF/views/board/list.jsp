<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
<head>
<title>Window On the World</title>
<link rel="stylesheet" type="text/css" href="../resources/css/util.css">
<link rel="stylesheet" type="text/css" href="../resources/css/main.css">
<style>		
* { 
	margin: 0; 
	padding: 0; 
	box-sizing: border-box;
}
body{
	overflow-x: hidden;
	
}
html.open {overflow: hidden;}
.bar {
	width: 100%;
	height: 80px;
	position: fixed;
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
	position: fixed;
	left: 10px;
	top: 0px;
	z-index: 1;
	background-image: url('../resources/images/wow_logo.png');
	background-size: 80%;
	background-repeat: no-repeat;
	background-position: center;
	cursor: pointer;
	margin-left: 20px;
}
.btnn {
	width: 80px;
	height: 80px;
	position: fixed;
	right: 0px;
	top: 0px;
	z-index: 10;
	background-image: url('../resources/images/menu.png');
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
.contain{
	margin : 0px auto;
	width: 80%;
	height: 100%;
	display: flex;
}
.leftmain{
	flex: 1;
}
.rightmain{
	flex: 1;
}
.boardList{
	width: 100%;
	height: 300px;
	margin-bottom: 30px;
	padding: 5px;
}
.discussionList{
	width: 100%;
	height: 300px;
	padding: 5px;
}
table{
	width: 100%;
	heigth: 70%;
	margin-top: 15px;
}
.title{
	width: 100%;
}
.table_title{
	width: 85%;
}
.table_hitcount, .table_grade{
	width: 15%;
	text-align: center;
}
.moreList{
	float: right;
}
.table_title{
	font-weight: bold;
}
.title{
	font-size: 1.3em;
	font-weight: bold;
}
#wordCloud{
    height: 300px;
    width: 500px;
	background-color: #FFF;
}
/*레이아웃 가운데 정렬  */
.container {
  width: 80%;
  height: 70%;
  margin: 30px auto;

}
.outer {
  display: table;
  width: 100%;
  height: 100%;
}
.inner {
  display: table-cell;
  vertical-align: middle;
  text-align: center;
}
.centered {
  position: relative;
  display: inline-block;
 
  width: 70%;
  padding: 1em;

 
}
.center-children {
  text-align: center;
}



/*테스트 배경색 (빨강) */
.red{
background-color: red;
}

.blue{
background-color: blue;
}

/*ul,li 수평정렬  */
/* ul {
    list-style:none;
    margin:0;
    padding:0;
}

li {
    margin: 0 0 0 0;
    padding: 0 0 0 0;
    border : 0;
    float: left;
} */


/*ul,li mylist 버튼 테두리 애니메이션 */
ul.mylist, ol.mylist {
    list-style: none;
    margin: 0px;
    padding: 0px;
  
    max-width: 900px;
    width: 100%;
}
  
ul.mylist li, ol.mylist li {
    display: inline-block;
    padding: 10px;
    margin-bottom: 5px;
    border: 1px solid #efefef;
    font-size: 12px;
    cursor: pointer;
}


ul.mylist li,
ol.mylist li {
    -webkit-transition: background-color 0.3s linear;
    -moz-transition: background-color 0.3s linear;
    -ms-transition: background-color 0.3s linear;
    -o-transition: background-color 0.3s linear;
    transition: background-color 0.3s linear;
}

  
ul.mylist li:hover,
ol.mylist li:hover {
    background-color: #01A9DB;
}

.hoverremove:hover {

/*플렉스 컨테이너 div 중앙 정렬  */
.flex-container {
  display: flex;
  height: 500px;
  justify-content: center;
  align-items: center;
  position: relative;
}

opacity:1.0;

box-shadow:none;

}


</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="../resources/tagcloud/lib/jQWCloudv3.1.js?ver=0.1"></script>
<script type="text/javascript" src="../resources/tagcloud/index.js?ver=0.11"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('.logo').click(function(){
			window.location.href="<c:url value='/main'/>";
		});
		$('.btnn').click(function(){
			$(".profile,.page_cover,html").addClass("open");
		    window.location.hash = "#open";
		});
		$('.profileImage').css('background-image', 'url("../resources/images/wow_logo.png")'); 
	});
	window.onhashchange = function() {
	    if(location.hash != "#open"){
	    	$(".profile,.page_cover,html").removeClass("open");
	    }	    
	};
	
	function pagingFormSubmit(currentPage) {
		var form = document.getElementById('pagingForm');
		var page = document.getElementById('page');
		page.value = currentPage;
		form.submit();
	}	
</script>
</head>
<body>
	<div class="bar"><div class="logo"></div><div class="btnn"></div></div>	
	<div onclick="history.back();" class="page_cover"></div>
	<div class="profile">
		<div class="profileImage"></div>
		<c:if test="${loginId != null}">
			<div class="loginName">${sessionScope.loginName}</div>
			<ul style="clear: none;">
				<li><a class="loginli" href="update">회원정보수정</a></li>
				<li><a class="loginli" href="logout">로그아웃</a></li>
			</ul>
		</c:if>
		<c:if test="${loginId == null}">
			<ul>
				<li><a class="loginli" href="../login">로그인</a></li>
				<li><a class="loginli" href="../join">회원가입</a></li>
			</ul>
		</c:if>
	</div>	
	<!--=====================게시판 시작=========================  -->
	<h2 style="align-content: center;">[ 게시판 ]</h2>
<body>
<div class="container-fluid">
<div class="outer">
<div class="inner">
<div class="centered">

<div class="flex-container">
<form id ="subjectList" action="subjectList?"  method="get" class="flex-container"  style="top: 60px; background-image:linear-gradient(-90deg, #00FFFF,#045FB4) ; ">
<ul class="mylist btn-group" style="justify-content: center; align-content: center;align-items: center;" >
  <li role="presentation" class="mylist" style="border: none;" ><input type="button"  style="width:100px; float: left; display: inline-block; background-color: #045FB4; " value="모든글" onClick="location.href='list';" class="btn btn-info btn-lg"></li>
  <li role="presentation" class="mylist" style="border: none;"><input type="submit" style="width:100px;float: left; display: inline-block; background-color: #045FB4;"  name="subject" value="politic"  class="btn btn-info btn-lg"></li>
  <li role="presentation" class="mylist" style="border: none;"><input type="submit" style="width:100px;float: left; display: inline-block; background-color: #045FB4;"  name="subject" value="culture"  class="btn btn-info btn-lg"></li>
  <li role="presentation" class="mylist" style="border: none;"><input type="submit" style="width:100px;float: left; display: inline-block; background-color:#045FB4;"  name="subject" value="social"   class="btn btn-info btn-lg"></li>	
  <li role="presentation" class="mylist" style="border: none;"><input type="submit" style="width:100px;float: left; display: inline-block; background-color: #045FB4;"  name="subject" value="economy"  class="btn btn-info btn-lg"></li>
  <li role="presentation" class="mylist" style="border: none;"><input type="submit" style="width:100px;float: left; display: inline-block; background-color: #045FB4;"  name="subject" value="it"       class="btn btn-info btn-lg"></li>
  <li role="presentation" class="mylist" style="border: none;"><input type="submit" style="width:100px;float: left; display: inline-block; background-color: #045FB4"  name="subject" value="etc"      class="btn btn-info btn-lg"></li>
</ul>
</form> 	
</div>	

<!-- <div class="btn-group" role="group" aria-label="...">
<form id ="subjectList" action="subjectList?" method="get" >
	<input type="button" value="모든글" onClick="location.href='list';" class="btn btn-info">
	<input type="submit" name="subject" value="politic"  class="btn btn-info">
	<input type="submit" name="subject" value="culture"  class="btn btn-info">
	<input type="submit" name="subject" value="social"  class="btn btn-info">
	<input type="submit" name="subject" value="economy"  class="btn btn-info">
	<input type="submit" name="subject" value="it"  class="btn btn-info">
	<input type="submit" name="subject" value="etc"  class="btn btn-info">		
</form> 
</div> -->
<!--항목별 버튼 끝  -->
		




<br>
<table class = "table table-striped table-bordered table-hover table-condensed">
<tr>
	<td class="glyphicon glyphicon-option-vertical" style="border: none;"></td>
	
	<!-- <td class="white" colspan="3"></td> -->
	<td class="glyphicon glyphicon-time-vertical" style="border: none;"></td>
	<td><span class="glyphicon glyphicon-list-alt"></span></td>
	<td><span class="glyphicon glyphicon-user"></span></td>
	<td><span class="glyphicon glyphicon-eye-open"></span></td>		
	<td><span class="glyphicon glyphicon-calendar"></span></td>
	<td><span class="glyphicon glyphicon-star"></span></td>	
</tr>

<tr class="hoverremove" style="background-color: #01A9DB">
	<td><strong>번호</strong></td>	
	<td style="width: 400px;"><strong>제목</strong></td>
	<td><strong>작성자</strong></td>
	<td><strong>조회수</strong></td>
	<td><strong>등록일</strong></td>
	<td><strong>항목</strong></td>
</tr>

<!-- 반복 시작 -->
<c:forEach var="board" items="${boardlist}">
<tr class="table table-striped table-bordered">
	<td class="center">${board.boardnum}</td>
	<td>
		<a style="width: 500px;" href="read?boardnum=${board.boardnum}">${board.title}</a>
	</td>
	<td class="center">${board.writer}</td>
	<td class="center">${board.hitcount}</td>
	<td>${board.regdate}</td>
	<td class="center">${board.subject}</td>
</tr>

</c:forEach>        


<!-- 반복 끝 -->
</table>
<div align="right">
<span class="glyphicon glyphicon-refresh"></span> &nbsp;전체 : ${navi.totalRecordsCount}</th>
</div>

<br/>

		<div align="right" style="margin: auto;">
		<c:if test="${loginId != null}">
        <a href="write" class="btn btn-info btn-lg">
        <span class="glyphicon glyphicon-pencil"></span> 글쓰기
        </a>
        </c:if>
        <a href="returnpage" class="btn btn-info btn-lg">
        <span class="glyphicon glyphicon-home"></span> 나가기
        </a>
      	</div>



<div id="navigator">
<%-- <div class="pagination">
<!-- 페이지 이동 부분 -->      
<div class="page-item">
	<a class="page-link" href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})">◁◁ </a> &nbsp;&nbsp;
	<a class="page-link" href="javascript:pagingFormSubmit(${navi.currentPage - 1})">◀</a> &nbsp;&nbsp;

	<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}"> 
		<c:if test="${counter == navi.currentPage}"><b></c:if>
			<a class="page-link" href="javascript:pagingFormSubmit(${counter})">${counter}</a>&nbsp;
		<c:if test="${counter == navi.currentPage}"></b></c:if>
	</c:forEach>
	&nbsp;&nbsp;
	<a class="page-link"  href="javascript:pagingFormSubmit(${navi.currentPage + 1})">▶</a> &nbsp;&nbsp;
	<a  class="page-link" href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})">▷▷</a>
</div>
 --%>
<!-- /페이지 이동 끝 -->
                      
<ul class="pagination">
  <li class="page-item"><a class="page-link" href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})">◁◁</a></li> 
  <li class="page-item"><a class="page-link" href="javascript:pagingFormSubmit(${navi.currentPage - 1})">◀</a></li>
  
  <c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}"> 
 			<%-- <c:if test="${counter == navi.currentPage}"><b></c:if> --%>
			<li class="page-item"><a class="page-link" href="javascript:pagingFormSubmit(${counter})">${counter}</a></li>
			<%-- <c:if test="${counter == navi.currentPage}"></b></c:if> --%>
  </c:forEach>
  <li class="page-item"><a class="page-link" href="javascript:pagingFormSubmit(${navi.currentPage + 1})">▶</a></li>
  <li class="page-item"><a class="page-link" href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})">▷▷</a></li>
</ul>	


<!-- <form class="form-inline">
						<input class="form-control mr-sm-2" type="text" /> 
						<button class="btn btn-primary my-2 my-sm-0" type="submit">
							Search
						</button>
					</form> -->

<!-- 검색폼 -->
<form id="pagingForm" method="get" action="list" class="form-inline">
	<span class="glyphicon glyphicon-search"></span>  
	&nbsp;&nbsp;
	<input class="form-control mr-sm-2" type="hidden" name="page" id="page" />
	<input type="text" checked="checked" class="form-control mr-sm-2" name="searchText" value="${searchText}" />
	
	<input  class="btn btn-info my-2 my-sm-0" type="button" onclick="pagingFormSubmit(1)" value="검색"> 

    

</form>	
<!-- /검색폼 끝--> 
</div>
</div>
</div>
</div>
</div>
	
	
</body>
</html>