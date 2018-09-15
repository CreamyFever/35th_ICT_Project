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
	<div class="filebox">
        <input type="file" name="cma_file" id="cma_file" accept="image/*" capture="camera" onchange="getThumbnailPrivew(this,$('#cma_image'))" />
        <br /><br />
        <div id="cma_image"></div>
    </div>
	


	<tr>
		<th>ID</th>
		<td>${result.id}</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td>${result.password}</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>${result.email}</td>
	</tr>
	<tr>
		<th>닉네임</th>
		<td>${result.nickname}</td>
	</tr>
	<tr>
		<th>성별</th>
		<td>
			<c:if test="${result.gender =='male'}">male</c:if>
			<c:if test="${result.gender =='female'}">female</c:if>
		</td>
	</tr>
	<tr>
		<th>나이</th>
		<td>${result.age}</td>
	</tr>
	<tr>
		<th>국적</th>
		<td style="width:300px;">${result.nationality}</td>
	</tr>
</table>

<p><a href="../">메인화면으로 이동</a></p>

</div>
</body>
</html>