<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/memberupdate.css">
<script type="text/javascript">
function userdelete() {
	var password = document.getElementById("id_password")
	
	if (password.value == "" || password.value == undefined) {
		alert("패스워드를 입력하세요.");
		password.focus();
		return;
	} else if (password.value.search(/\s/) != -1) {
		alert("비밀번호는 공백 없이 입력해주세요.")
		return;
	}
	
	document.delete_account.submit();
}
</script>
</head>
<body>
	<div class="width">
		<header>
			<section class="headersection1">
				<span class="middle"><a href="../board"><img class="logo"
						src="<%=request.getContextPath() + "/resources/image/khlogo.png"%>"
						alt="로고"></a></span>
			</section>

			<section class="headersection2">
				<span class="middle"><a
					href="${pageContext.request.contextPath}/account/mypage">마이페이지</a></span>
				<span class="middle"><a href="./login">로그아웃</a></span>
			</section>
		</header>
		<br>
		<section class="main">
			<c:url var="memberdelete" value="/account/memberdelete" />
			<form name="delete_account" action="${memberdelete }" method="post">
				<section class="main">
					<h2>${data.getNickname() }님 회원 탈퇴</h2>
					<input type="hidden" id="id" name="id" value="${data.getId() }">
					<section>
						<div>
							<label for="id_name">* 이름 : ${data.getName() }</label>
						</div>
						<div>
							<label for="id_nickname">* 닉네임 : ${data.getNickname() }</label>
						</div>
						<div>
							<label for="id_email">* 이메일 : ${data.getEmail() }</label>
						</div>
						<div>
							<label for="id_password">* 패스워드 : </label> <input id="id_password"
								type="password" name="pwd" required>
						</div>
						<div>
							<label style="color: red;">${error }</label>
						</div>
						<div>
							<button type="button" onclick="userdelete();">탈퇴</button>
							<button type="button" onclick="history.back();">취소</button>
						</div>
					</section>
			</form>
		</section>
	</div>
</body>
</html>