<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>

<link rel="stylesheet" type="text/css" href="../resources/css/default.css" />

<script>
//가입신청 후 서버에서의 오류로 현재 페이지로 되돌아온 경우 오류 메시지를 출력
<c:if test="${errorMsg != null}">alert('${errorMsg}');</c:if>

//가입폼 확인
function formCheck() {
	var id = document.getElementById('id');
	var pw = document.getElementById('password');
	var pw2 = document.getElementById('password2');
	var nickname = document.getElementById('nickname');
	
	if (id.value.length < 3 || id.value.length > 10) {
		alert("ID는 3~10자로 입력하세요.");
		id.focus();
		id.select();
		return false;
	}
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
	if (nickname.value == '') {
		alert("닉네임을 입력하세요.");
		name.focus();
		name.select();
		return false;
	}
	return true;
}

//ID 중복확인 창 열기
function idcheckOpen() {
	window.open("idcheck","newwin","top=200,left=400,width=400,height=300,resizable=no");
}
</script>
</head>

<body>
<div class="centerdiv">
<h1>[ Join ]</h1>

<form id="joinform" action="join"  method="post" onsubmit="return formCheck();">
<table>
	<tr>
		<th>ID</th>
		<td>
			<input type="text" name="id" id="id" maxlength="10" placeholder="ID 중복체크" readonly="readonly" value="${members.id}" />
			<input type="button" value="overlap check" onclick="idcheckOpen()">
		</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="password" id="password" placeholder="비밀번호 입력" value="${members.password}" /><br>
		<input type="password" id="password2" placeholder="비밀번호 다시 입력" value="${members.password}" /></td>
	</tr>
	<tr>
	<th>이메일</th>
		<td><input type="text" name="email" id="email" placeholder="이메일  입력"  value="${members.email}" /></td>
	</tr>
	<tr>
		<th>닉네임</th>
		<td><input type="text" name="nickname" id="nickname" placeholder="닉네임 입력"  value="${members.nickname}" /></td>
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
		<td><input type="number" name="age" min="1" max="99"  placeholder="age"  value="${members.age}" /></td>
	</tr>
	<tr>
		<th>프로필 사진</th>
		<td><<input type="file" name="filename" size="30	"></td>
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

<input type="submit" value="가입" />
<input type="reset" value="다시 쓰기" />

</form>

</div>
</body>
</html>