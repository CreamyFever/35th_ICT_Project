<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.creamyfever.wow.vo.Members" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
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
  width: 70%;
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



/*테스트 배경색 */
.red{
background-color: red;
}

.yellow{
background-color: yellow;
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

/*리플 평점 css  */
.numberCircle {
    border-radius: 50%;
    behavior: url(PIE.htc); /* remove if you don't care about IE8 */
    width: 36px;
    height: 36px;
    padding: 8px;
    background: #fff;
    border: 2px solid black;
    color: black;
    text-align: center;
    font: 32px Arial, sans-serif;
    display: inline-block;
}
/*댓글 css  */
table.type09 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;

}
table.type09 thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
}
table.type09 tbody th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
}
table.type09 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}

/*댓글 css 끝  */


</style>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
<!-- 	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/> -->
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./resources/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./resources/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="./resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="./resources/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./resources/css/util.css">
	<link rel="stylesheet" type="text/css" href="./resources/css/main.css">
<!--===============================================================================================-->
<style type="text/css">
</style>
<meta charset="UTF-8">
<title>ID중복확인</title>
<script type="text/javascript">
//ID 중복 검색폼 확인
function formCheck() {
	if (document.getElementById('searchId').value.length < 3) {
		alert('검색할 ID를 3자 이상 입력하세요.');
		alert('입력실패');
		return false;
	}
	/* alert('기입성공'); */
	return true;
}

//검색한 ID를 가입폼에 입력하고 현재 창 닫기
function idSelect(id) {
	opener.document.getElementById('id').value = id;
	alert('입력성공');
	this.close();
}
</script>
</head>
<body>

<div class="container-fluid">
<div class="outer">
<div class="inner">
<div class="centered">
<div class="centerdiv">
<br>
<form id="idcheck" method="post" action="idcheck" onsubmit="return formCheck();" class="flex container form-control">
	<span class="glyphicon glyphicon-search"></span>  
	&nbsp;&nbsp;
	<input class="form-control mr-sm-2" type="hidden" name="page" id="page" />
	<input type="text" checked="checked" class="flex form-control mr-sm-2" id="searchId" name="searchId"  placeholder="검색할 ID 입력" value="${searchId}"  />
	<span class="glyphicon glyphicon-search">
	<input  class="btn btn-info my-2 my-sm-0 " type="submit" style="width: 150px;" value="검색"> 
	</span>
</form>	


<!-- 검색 후에만 출력 -->
	<div>
	<c:if test="${search}">
	<!-- 검색된 결과가 없는 경우 -->
	<c:if test="${searchResult == null}">
		<p><strong style="color: blue;">${searchId} : 사용할 수 있는 ID입니다.</strong></p>
		<br><p><input type="button" style="width: 150px;" class="flex btn btn-info" value="ID 사용하기" onclick="idSelect('${searchId}')"></p>
	</c:if>
	<!-- 검색된 결과가 있는 경우 -->
	
	<c:if test="${searchResult != null}">
		<p><strong style="color: red;">${searchId} : 이미 사용중인 ID입니다.</strong></p>
	</c:if>	
</c:if>
	</div>
</div>
</div>
</div>
</div>
</div>

<!--===============================================================================================-->
	<script src="./resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="./resources/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="./resources/vendor/bootstrap/js/popper.js"></script>
	<script src="./resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="./resources/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="./resources/vendor/daterangepicker/moment.min.js"></script>
	<script src="./resources/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="./resources/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="./resources/js/main.js"></script>
</body>
</html>



