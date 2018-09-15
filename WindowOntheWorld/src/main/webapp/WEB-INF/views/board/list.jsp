<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>

<link rel="stylesheet" type="text/css" href="../resources/css/default.css" />

<!-- 페이지 이동 스크립트  -->
<script>
function pagingFormSubmit(currentPage) {
	var form = document.getElementById('pagingForm');
	var page = document.getElementById('page');
	page.value = currentPage;
	form.submit();
}
</script>
	
</head>

<body>
<div class="centerdiv">
<h2>[ 게시판 ]</h2>

<br>
<table>
<tr>
	<td class="white">
		전체 : ${navi.totalRecordsCount}
	</td>
	<td class="white" colspan="3"></td>
	<td class="white">
		<c:if test="${loginId != null}">
		<input type="button" value="글쓰기" onClick="location.href='write';">
		</c:if>	
		<input type="button" value="나가기" onClick="location.href='returnpage';">
	</td>
	
</tr>
<tr>
	<th>번호</th>	
	<th style="width:220px">제목</th>
	<th>작성자</th>
	<th>조회수</th>
	<th>등록일</th>
	<th>항목</th>
</tr>

<!-- 반복 시작 -->
<c:forEach var="board" items="${boardlist}">
<tr>
	<td class="center">${board.boardnum}</td>
	<td>
		<a href="read?boardnum=${board.boardnum}">${board.title}</a>
	</td>
	<td class="center">${board.writer}</td>
	<td class="center">${board.hitcount}</td>
	<td>${board.regdate}</td>
	<td class="center">${board.subject}</td>
</tr>

</c:forEach>        
<!-- 반복 끝 -->
</table>
<br/><br/>

<div id="navigator">
<!-- 페이지 이동 부분 -->      

	<a href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})">◁◁ </a> &nbsp;&nbsp;
	<a href="javascript:pagingFormSubmit(${navi.currentPage - 1})">◀</a> &nbsp;&nbsp;

	<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}"> 
		<c:if test="${counter == navi.currentPage}"><b></c:if>
			<a href="javascript:pagingFormSubmit(${counter})">${counter}</a>&nbsp;
		<c:if test="${counter == navi.currentPage}"></b></c:if>
	</c:forEach>
	&nbsp;&nbsp;
	<a href="javascript:pagingFormSubmit(${navi.currentPage + 1})">▶</a> &nbsp;&nbsp;
	<a href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})">▷▷</a>

<!-- /페이지 이동 끝 -->                      

<br><br>


<!-- 검색폼 -->
<form id="pagingForm" method="get" action="list">
	<input type="hidden" name="page" id="page" />
	제목 : <input type="text"  name="searchText" value="${searchText}" />
	<input type="button" onclick="pagingFormSubmit(1)" value="검색">
</form>
<!-- /검색폼 끝--> 
</div>
</div>

<!--항목별 버튼  -->	
<form id ="subjectList" action="subjectList?" method="get">
	<input type="button" value="모든글" onClick="location.href='list';">
	<input type="submit" name="subject" value="politic">
	<input type="submit" name="subject" value="culture">
	<input type="submit" name="subject" value="social">
	<input type="submit" name="subject" value="economy">
	<input type="submit" name="subject" value="it">
	<input type="submit" name="subject" value="etc">		
</form> 
<!--항목별 버튼 끝  -->

</body>
</html>
