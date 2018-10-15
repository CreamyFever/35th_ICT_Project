<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>About</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
	<!-- Custom Theme files -->
	<link href="resources/css/theme-style.css?ver=0.1" rel='stylesheet' type='text/css' />
	<!-- Custom Theme files -->
</head> 
<body>		
	<!----start-about----->
		<div id="about" class="about">
			<div class="container">
			
				<a href="javascript:history.back();" class="artbtn">Back</a>
				<h2>About</h2>
				<p class="wellcome-note-head"><b>Title</b>  ${article.articlename}</p>
				<p class="wellcome-note-info" ><b>URL</b> <a href="${article.url}" class="article_url" style="color:#000"> ${article.url}</a></p>
				<!----start-about-grids----->
				<div class="about-grids">
					<b>Date</b> &nbsp;${article.articledate}
					<br><br>
					<p id="article_content">${article.articlecontent}</p>
					<div class="clearfix"> </div>
				</div>
				<!----//End-about-grids----->
			</div>
		</div>
		<!----//End-about----->

		<!-- reply -->
		
		<!-- 리플 작성 폼 시작 -->
		<form id="replyform" action="articlelReplyWrite" method="post" onSubmit="return replyFormCheck();">
		리플내용
		 	 	<input type="hidden" name="articlenum" value="${article.articlenum}" />  
				<input type="text" name="content" id="content" style="width:500px;" />
			1 <input type="radio" name="stars"  value="1" />
			2 <input type="radio" name="stars"  value="2" />
			3 <input type="radio" name="stars"  value="3" />
			4 <input type="radio" name="stars"  value="4" />
			5 <input type="radio" name="stars"  value="5" />
			<input type="submit" value="확인" />
		</form>
		<!-- /리플 작성 폼 끝 -->
<br>

<!-- 리플 목록 출력 시작 -->
<table class="reply">
<c:forEach var="reply" items="${replylist}">
	<tr>
		<td class="replyid">
			<b>${reply.idno}</b>
		</td>
		<td class="replytext">
			${reply.content}
		</td>
		<td class="replybutton">
			<c:if test="${loginIdno == reply.idno}">
				[<a href="javascript:replyEditForm(${reply.replynum}, ${reply.articlenum}, '${reply.content}')">수정</a>]
			</c:if>
		</td>
		<td class="replybutton">
			<c:if test="${loginIdno == reply.idno}">
				[<a href="javascript:replyDelete(${reply.replynum}, ${reply.articlenum })">삭제</a>]
			</c:if>
		</td>
	</tr>	
	
	
	<tr>
		<!-- 리플 수정 폼이 나타날 위치 -->
		<td class="white" colspan="4"><div id="div${reply.replynum}"></div></td>
	</tr>
		 
</c:forEach>
</table>
<!-- /리플 목록 출력 끝 -->
		
		
		
<script>
//글삭제시 확인 스크립트
function deleteCheck(articlenum){
	if(confirm("정말 삭제하시겠습니까?")){
		location.href = 'delete?articlenum=' + articlenum;
	}
}

//리플 쓰기 폼 체크
function replyFormCheck() {
	var content = document.getElementById('content');
	if (content.value.length < 2) {
		alert('리플 내용을 입력하세요.');
		content.focus();
		content.select();
		return false;
	}
	return true;			
}

//리플 수정
function replyEditForm(replynum, articlenum, content) {
	//해당 리플번호를 붙여 생성한 <div>태그에 접근
	var div = document.getElementById("div"+replynum);
	
	var str = '<form name="editForm' + replynum + '" action="articleReplyEdit" method="post">';
	str += '<input type="hidden" name="replynum" value="'+replynum+'">';
	str += '<input type="hidden" name="articlenum" value="'+articlenum+'">';
	str += '&nbsp;';
	str += '<input type="text" name="content" value="' + content + '" style="width:530px;">';
	str += '&nbsp;';
	str += '<a href="javascript:replyEdit(document.editForm' + replynum + ')">[저장]</a>';
	str += '&nbsp;';
	str += '<a href="javascript:replyEditCancle(document.getElementById(\'div' + replynum + '\'))">[취소]</a>';
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
function replyDelete(replynum, articlenum) {
	if (confirm('리플을 삭제하시겠습니까?')) {
		location.href='articleReplyDelete?replynum=' + replynum + '&articlenum=' + articlenum;
	}
}
</script>
		
</body>
</html>