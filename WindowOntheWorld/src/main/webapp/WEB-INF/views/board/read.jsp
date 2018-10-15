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
	
	//글삭제시 확인 스크립트
	function deleteCheck(boardnum){
		if(confirm("정말 삭제하시겠습니까?")){
			location.href = 'delete?boardnum=' + boardnum;
		}
	}

	//리플 쓰기 폼 체크
	function replyFormCheck() {
		var content = document.getElementById('content');
		if (content.value.length < 5) {
			alert('리플 내용을 입력하세요.');
			content.focus();
			content.select();
			return false;
		}
		return true;			
	}

	//리플 수정
	function replyEditForm(replynum, boardnum, content) {
		//해당 리플번호를 붙여 생성한 <div>태그에 접근
		var div = document.getElementById("div"+replynum);
		
		var str = '<label for="editform" style="float:left;">수정내용 &nbsp;</label><form name="editForm' + replynum + '" style="float:left;" action="replyEdit" method="post" >';
		str += '<input type="hidden" name="replynum" value="'+replynum+'">';
		str += '<input type="hidden" name="boardnum" value="'+boardnum+'">';
		str += '&nbsp;';
		str += '<input class="form-control" type="text" name="content" value="' + content + '" style="width:650px;float:left;">';
		str += '&nbsp;';
		str += '<div class ="form-inline">';
		str += '<a class="btn btn-info glyphicon glyphicon-remove" style ="float:right; margin-top:10px;" href="javascript:replyEditCancle(document.getElementById(\'div' + replynum + '\'))">[취소]</a>';
		str += '<a class="btn btn-info glyphicon glyphicon-edit  " style ="float:right; margin-top:10px;" href="javascript:replyEdit(document.editForm' + replynum + ')">[저장]</a>';
		str += '</div>';
		str += '&nbsp;';
		str += '</form>';
		div.innerHTML = str;
	}

	//리플 수정 취소
	function replyEditCancle(div) {
		div.innerHTML = '';
	}

	//리플 수정 정보 저장
	function replyEdit(form) {
		if (confirm('수정된 내용을 저장하시겠습니까?')) {
			form.submit();
		}
	}

	//리플 삭제
	function replyDelete(replynum, boardnum) {
		if (confirm('리플을 삭제하시겠습니까?')) {
			location.href='replyDelete?replynum=' + replynum + '&boardnum=' + boardnum;
		}
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
	
	
<!-- ============================게시판 시작=========================  -->
	
<body>
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
        <h2 class="text-center">게시판</h2><p></p>
    
            <div class="table table-responsive">
            <table class="table table-striped type09" style="">
         
        
            <tr>
                <th style="text-align:center;">작성자</th>
                <td class="" >${board.writer}</td>
            </tr>
        	
        	<tr>
        		<th style="text-align:center;">작성일 </th> 
				<td class="">${board.regdate}</td>
            </tr>
             
            <tr>
				<th style="text-align:center;">조회수 </th>
				<td class="">${board.hitcount}</td>
			</tr>
			<tr>
				<th style="text-align:center;">제목 </th>
			<td class="form-control" style="min-width:550px">${board.title}</td>
			</tr>
			<tr>
			<th style="text-align:center;">내용 </th> 
			<td class="form-control" style="min-height: 200px; min-width:550px; text-align: left;" > ${board.content}</td>
			</tr>	
             
         </table>
         
         
         	<div>
        		<c:if test="${loginIdno == board.idno}">
                    <a type="button" class="btn btn-info btn-lg" href="javascript:deleteCheck(${board.boardnum})">
       				<span class="glyphicon glyphicon-trash btn-info" ></span> 삭제
     				</a>
         			<a type="button" class="btn btn-info btn-lg" href="edit?boardnum=${board.boardnum}" >
        			<span class="glyphicon glyphicon-edit btn-info"></span> 수정
      				</a>
      			</c:if>	
      				<a type="button" class="btn btn-info btn-lg" onclick="location.href='list'" >
        			<span class="glyphicon glyphicon-share btn-info"></span> 전체글보기
      				</a>
      			</div>
     
            </div>
      	  <br>
          </div>
       </div>
       <br>
       <footer class="table table-bodered" style="border: thin;background-color:;">
    <div class="flex-container ">
<!-- 리플 작성 폼 시작 -->
<form id="replyform" action="replyWrite" method="post" onSubmit="return replyFormCheck();" class="flex-container ">

	<input type="hidden" name="boardnum" value="${board.boardnum}" />&nbsp;
	<label for="content" style="float: left; text-align: center; background-color: ;height:35px; "class="type09">&nbsp;&nbsp;&nbsp;댓글입력:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>&nbsp;
	<input class="form-control" style="float: left; width:690px;" type="text" name="content" id="content" />
<c:if test="${loginIdno != null}">
<div class="form-inline " style="float: right;margin:0 auto;">	
	
  <div class="form-inline btn-group" style="margin:0 auto;">
  <button type="button" class="btn btn-info dropdown-toggle glyphicon glyphicon-star type09"  style="margin:0 auto;"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">&nbsp;평점</button>
  <div class="centered dropdown-menu" style="margin:0 auto;" >
    <label for="1">★☆☆☆☆</label>
	<input type="radio"   name="stars"  value="1" />
	<label for="2">★★☆☆☆</label>	
	<input type="radio" name="stars"  value="2" />
    <label for="3">★★★☆☆</label>
	<input type="radio" name="stars"  value="3" />
	<label for="4">★★★★☆</label>
	<input type="radio" name="stars"  value="4" />
	<label for="5">★★★★★</label>
	<input type="radio" name="stars"  value="5" />
	 </div>
</div>
	<!--style="width:100px;float: right;"  -->
	<!--style="float: right; width:105px;"  -->
	 <button type="submit" class="	" style="margin: 0 auto;" >
     <span class=" btn btn-info glyphicon glyphicon-pencil " >&nbsp;작성</span> 
     </button>
	
</div>
</c:if>
</form>

<!-- /리플 작성 폼 끝 -->
<br>
<!-- 리플 목록 출력 시작 -->
 <div class="flex-container ">
<table class="type09" >
<c:forEach var="reply" items="${replylist}">
	<tr>
		
		<td class=""  style="float: left; width: 100px;border-bottom: thin;border-left-style: solid;">
			작성자 : &nbsp;	<b>${reply.idno}</b>
		</td>
		<td class="form-control" style="float: left;width:690px; ">
			${reply.content}
		</td>
		
		<td class="btn-group">
		<c:if test="${loginIdno == reply.idno}">
		<td class="form-inline group" align="center" style="margin-top: 5px; top: 50px; border: none;">	
			<a  class="btn btn-info glyphicon glyphicon-edit" style="float:right; align-content: center;"  href="javascript:replyEditForm(${reply.replynum}, ${reply.boardnum}, '${reply.content}')">&nbsp;수정</a>
		</td>	
		</c:if>
	
		<c:if test="${loginIdno == reply.idno}">
		<td class="form-inline group" align="center"  style="margin-top: 5px; top: 50px; border: none;">
			<a class="btn btn-info glyphicon glyphicon-trash" style="float:right; align-content: center;"  href="javascript:replyDelete(${reply.replynum}, ${reply.boardnum })" >&nbsp;삭제</a>
		</td>
		</c:if>
		</td>
	</tr>	
	
	
	<tr>
		<!-- 리플 수정 폼이 나타날 위치 -->
		<td class="table" colspan="4" style="float: left; width:800px;"><div id="div${reply.replynum}"></div></td>
	</tr>
		 
</c:forEach>
</table>
</div>
<!-- /리플 목록 출력 끝 -->

<br><br><br>
</div>
</footer>


</div>
</div>
</div>
</div>
</div>

	
	
</body>
</html>