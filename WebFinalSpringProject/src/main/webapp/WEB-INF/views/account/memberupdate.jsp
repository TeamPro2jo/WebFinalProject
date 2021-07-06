<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/memberupdate.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/common.js"></script>
<c:url var="nickname_check" value="/ajax/account/nickname" />
<c:url var="expire" value="/ajax/account/expire" />
<script type="text/javascript">
	function updateInfo(){
		var nickCheck = document.getElementById("nickname_check_res").innerText;
		var nickname = document.getElementById("id_nickname").value
	
		if(nickname == "") {
			alert("닉네임을 입력하세요.")
			return;
		}
		
		// 닉네임을 변경하는 경우
		if(nickname != "${data.getNickname()}" && nickCheck == "사용 가능!!!"){
			document.update_account.submit();
		// 닉네임을 변경하지 않고 성별 및 나이만 변경하는 경우
		} else if(nickname == "${data.getNickname()}" ){
			document.update_account.submit();
		} else {
			alert("닉네임 중복 체크 먼저 진행하세요.");
			
		}
	}
	
	function expire(){
			$.ajax({
			url: "${expire }",
			type: "post",
			datatype: "json",
			data: {
				id: document.getElementById("id").value
			},
			success: function(data) {
				if(data.res == "success"){
					alert("탈퇴 처리가 완료되었습니다.")
					location.href = "${pageContext.request.contextPath }/account/login" //로그아웃페이지로 이동
				} else {
					alert("탈퇴 처리에 실패하였습니다.")
				}
			}
		});
	}
</script>
</head>
<body>
	<div class="width">
		<header>
			<section class="headersection1">
				<span class="middle"><a href="../board"><img class="logo" src="<%=request.getContextPath() + "/resources/image/khlogo.png" %>" alt="로고"></a></span>
			</section>
		
			<section class="headersection2">
	             <span class="middle"><a href="${pageContext.request.contextPath}/account/mypage">마이페이지</a></span>
	             <span class="middle"><a href="./login">로그아웃</a></span>
	        </section>
	    </header>
		<br>
		
		<section class="main">
			<c:url var="memberupdate" value="/account/memberupdate" />
			<form name="update_account" action="${memberupdate }" method="post">
				<h2>${data.getNickname() }님 정보 수정</h2>
				<div>
					<button type="button" onclick="expire();">탈퇴</button>
				</div>
				<section>
					<div>
						<label for="id_name">* 이름</label>
						<label>${data.getName() }</label>
					</div>
					<div>
						<label for="id_nickname">* 닉네임 : </label>
						<input id="id_nickname" type="text" name="nickname" value="${requestScope.data.getNickname() }" required>
						<button type="button" onclick="nicknameCheck('${nickname_check }', document.getElementById('id_nickname').value);">중복확인</button> 
						<label id="nickname_check_res"></label> 							
					</div>
					<div>
						<label for="id_email">* 이메일</label>
						<label id="email_check_res">${data.getEmail() }</label>
					</div>
					<div>
						<label for="id_password">* 패스워드</label>
						<input id="id_password" type="password" name="pwd" required>
					</div>
					<div>
						<button type="button" onclick="updateInfo();">수정</button>
						<button type="button" onclick="history.back();">취소</button>
					</div>
				</section>
			</form>
		</section>
	
	</div>
</body>
</html>