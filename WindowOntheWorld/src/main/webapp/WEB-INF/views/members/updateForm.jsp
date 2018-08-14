<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>개인 정보 수정</title>

<link rel="stylesheet" type="text/css" href="../resources/css/default.css" />

<script>
//가입폼 확인
function formCheck() {
	var pw = document.getElementById('password');
	var pw2 = document.getElementById('password2');
	var Nickname = document.getElementById('nickname');
	
	if (pw.value.length < 3 || pw.value.length > 10) {
		alert("비밀번호는 3~10자로 입력하세요.");
		pw.focus();
		pw.select();
		return false;
	}
	if (pw.value != pw2.value) {
		alert("비밀번호를 정확하게 입력하세요.");
		pw.focus();
		pw.select();
		return false;
	}
	if (name.value == '') {
		alert("이름을 입력하세요.");
		name.focus();
		name.select();
		return false;
	}
	return true;
}
</script>
</head>

<body>
<div class="centerdiv">
<h1>[ 개인 정보 수정 ]</h1>

<form id="updateform" action="update"  method="post" onsubmit="return formCheck();">
<table>
	<tr>
		<th>ID</th>
		<td>${members.id}</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="password" id="password" placeholder="비밀번호 입력" /><br>
		<input type="password" id="password2" placeholder="비밀번호 다시 입력" /></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><input type="text" name="email" id="email" placeholder="이메일  입력" value="${members.email}" /></td>
	</tr>
	<tr>
		<th>닉네임</th>
		<td><input type="text" name="nickname" id="nickname" placeholder="닉네임 입력" value="${members.nickname}" /></td>
	</tr>
	<tr>
		<th>성별</th>
		<td>
			<input type="radio" name="gender" value="male" checked />male
			<input type="radio" name="gender" value="female" />female
		</td>
	</tr>
	
	<tr>
		<th>나이</th>
		<td><input type="number" name="age" min="1" max="99"  placeholder="insert your age"  value="${members.age}" /></td>
	</tr>
	<tr>
		<th>프로필 사진</th>
		<td><<input type="file" name="upload" size="30"></td>
	</tr>
	<tr>
		<th>국적</th>
		<td>
			<select name="nationality">
  			<option value="Korea" >Korea</option>
  			<option value="Japan">Japan</option>
  			<option value="USA">USA</option>
  			<option value="China">China</option>
			</select>
		</td>
	</tr>
</table>
	<br>

<input type="submit" value="수정" />
<input type="reset" value="다시 쓰기" />

</form>

</div>
</body>
</html>