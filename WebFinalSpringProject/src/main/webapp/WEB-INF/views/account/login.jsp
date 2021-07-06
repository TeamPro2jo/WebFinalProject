<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/login.css">
</head>
<body>
	<c:url var="login" value="/account/login" />
	<div class="width">
		<form action="${login }" method="post">
			<section>
				<div>
					<a href="./login"><img class="logo" src="<%=request.getContextPath() + "/resources/image/khlogo.png" %>" alt="로고" ></a>
					<p class="bold">kh중고에 오신것을 환영합니다</p><br>
					<c:url var="join" value="/account/join" />
					<button class="join" type="button" onclick="location.href='${join }'">회원가입</button>
				</div>
				<div>
					<input class="text" id="id_email" type="text" name="email" placeholder="이메일" required>
				</div>
				<div>
					<input class="text" id="id_pwd" type="password" name="pwd" placeholder="비밀번호" required>
				</div>
				<div>
					<label style="color: red;">${error }</label>
				</div>
				<div>
					<button class="ok" type="submit">로그인</button>
				</div>
			</section>
		</form>
	</div>
</body>
</html>