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
.wow{
background-color: #00FFFF;
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
	//글쓰기폼 확인
	function formCheck() {
		var title = document.getElementById('title');
		var content = document.getElementById('content');
		
		if (title.value.length < 5) {
			alert("제목을 입력하세요.");
			title.focus();
			title.select();
			return false;
		}
		if (content.value.length < 5) {
			alert("내용을 입력하세요.");
			title.focus();
			title.select();
			return false;
		}
		return true;
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
	

<div class="container-fluid">
<div class="outer">
<div class="inner">
<div class="centered">
<div class="centerdiv">
<h1>[ 글쓰기 ]</h1>
<!-- 바이너리 데이터 포함되는 폼. enctype 반드시 정확히 지정 -->


<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <h2 class="text-center">[글 수정]</h2><p></p>
    
            <div class="table table-responsive">
    	<form id="writeform" action="edit"  method="post" enctype="multipart/form-data" onsubmit="return formCheck();">
         <input type="hidden" name="boardnum" value="${board.boardnum }">
          <table class="table table-striped">
            <tr>
                <td>제목</td>
                <td><input type="text"  class="form-control" name="title" id="title" placeholder="제목" value="${board.title}"></td>
            </tr>
        
             
            <tr>
                <td>글 내용</td>
                <td><textarea rows="10" cols="50" name="content" id="content" class="form-control" placeholder="글 내용">${board.content}</textarea></td>
            </tr>
            
            <tr>  
                <td>
       				 <select name="subject" id="subject">
			            <option value="all">all</option>
  						<option value="economy" >economy</option>
  						<option value="culture">culture</option>
  						<option value="politic">politic</option>
  						<option value="social">social</option>
  						<option value="it">it</option>
  						<option value="etc">etc</option>
  			
					</select>        
					 </td>
            </tr>
            
            
            
            <tr>  
                <td colspan="2"  class="text-center">
                 
                    <button type="submit" class="btn btn-info btn-lg">
       				<span class="glyphicon glyphicon-pencil btn-info"></span> 글 수정
     				</button>
         			<button type="reset" class="btn btn-info btn-lg">
        			<span class="glyphicon glyphicon-refresh btn-info"></span> 리셋
      				</button>
      				<button type="button" class="btn btn-info btn-lg" onclick="location.href='list'" >
        			<span class="glyphicon glyphicon-share btn-info"></span> 전체글보기
      				</button>
             
                </td>
            </tr>
             
             
             
             
          </table>
         </form>
     
            </div>
      
    </div>
</div>
 


</div>









</div>
</div>
</div>
</div>
	
	
</body>
</html>