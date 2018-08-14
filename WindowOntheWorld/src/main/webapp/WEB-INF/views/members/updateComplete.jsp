<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 정보 수정 완료</title>
<link rel="stylesheet" type="text/css" href="../resources/css/default.css" />
</head>
<body>
<div class="centerdiv">
<h1>[ 개인 정보 수정 완료 ]</h1>

<table>
	<tr>
		<th>ID</th>
		<td>${members.id}</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td>${members.password}</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>${members.email}</td>
	</tr>
	<tr>
		<th>닉네임</th>
		<td>${members.nickname}</td>
	</tr>
	<tr>
		<th>성별</th>
		<td>
			<c:if test="${members.gender =='male'}">male</c:if>
			<c:if test="${members.gender =='female'}">female</c:if>
		</td>
	</tr>
	<tr>
		<th>나이</th>
		<td>${members.age}</td>
	</tr>
	<tr>
		<th>국적</th>
		<td style="width:300px;">${members.nationality}</td>
	</tr>
</table>

<p><a href="../">메인화면으로 이동</a></p>

</div>
</body>
</html>