<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 비밀번호 찾기</title>
<script>
	function makeTestData() {
		var form = document.findLoginPasswdForm;
		form.userId.value = 'user1';
		form.userName.value = '홍길동';
		form.userEmail.value = 'jangka512@gmail.com';
	}
	function submitFindLoginPasswdForm(form) {
		form.userId.value = form.userId.value.trim();

		if (form.userId.value.length == 0) {
			alert('로그인 아이디를 입력해주세요.');
			form.userId.focus();
			return false;
		}

		form.userName.value = form.userName.value.trim();

		if (form.userName.value.length == 0) {
			alert('이름을 입력해주세요.');
			form.userName.focus();
			return false;
		}

		form.userEmail.value = form.userEmail.value.trim();

		if (form.userEmail.value.length == 0) {
			alert('이메일을 입력해주세요.');
			form.userEmail.focus();
			return false;
		}

		form.submit();
	}
</script>
<style>
.con {
	width: 1000px;
	margin: 0 auto;
}
</style>
</head>
<body>
	<h1 class="con">로그인 비밀번호 찾기</h1>

	<div class="con">
		<button onclick="makeTestData();">테스트 데이터 채우기</button>
	</div>

	<div class="join-box con">

		<form name="findLoginPasswdForm"
			onsubmit="submitFindLoginPasswdForm(this); return false;"
			action="./doFindLoginPasswd" method="POST">
			<div>
				<span>로그인 아이디</span>
				<div>
					<input autocomplete="off" type="text" name="userId"
						required="required" autofocus="autofocus" maxlength="30"
						placeholder="로그인 아이디" />
				</div>
			</div>

			<div>
				<span>이름</span>
				<div>
					<input autocomplete="off" type="text" name="userName"
						required="required" autofocus="autofocus" maxlength="30"
						placeholder="이름" />
				</div>
			</div>
			<div>
				<span> 이메일 </span>
				<div>
					<input autocomplete="off" type="email" name="userEmail"
						required="required" maxlength="30" placeholder="이메일" />
				</div>
			</div>
			<div>
				<span>로그인 비밀번호 찾기</span>
				<div>
					<input type="submit" value="로그인 비밀번호 찾기" />
				</div>
			</div>
		</form>
	</div>
</body>
</html>