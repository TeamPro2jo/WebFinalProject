<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/mypage.css">
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
			<div>
				<h2>MY PAGE</h2>
				<br>
				<c:url var="chatlist" value="/chatting/chatroom" />
				<!--  <button class="chat" type="button" onclick="location.href='${chatlist }'">채팅창</button>-->
			</div>
			<section>
				<div>
					<c:url var="memberupdate" value="/account/memberupdate" />
					<p>
						<a href="${memberupdate }">${data.getNickname() }님</a>
					</p>
					<p>(${data.getEmail() })</p>
					<p>총 게시글 수 ${fn:length(writelist)}개</p>
					<div class="click">
						<a style="cursor: pointer;" onclick="sendRecommend('g');"> <small>추천
								<span id="good">${data.getGood() }</span>
						</small></a><br> <a style="cursor: pointer;"
							onclick="sendRecommend('b');"> <small>비추천 <span
								id="bad">${data.getBad() }</span></small></a><br>
					</div>
				</div>
			</section>
			<br>
			<section>
				<div>
					<div class="write">
						<span>내가 쓴 글</span><br>
						<table>
							<thead>
								<tr>
									<th>제목</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:url var="detail" value="/board/detail" />
								<c:forEach var="writeitem" items="${requestScope.writelist }">
									<tr>
										<td><a href="${detail }?bid=${writeitem.getBid() }">${writeitem.getTitle() }</a></td>
										<td>${writeitem.getCdate() }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<br>
					<br>
					<div class="zzim">
						<span>찜 목록</span>
						<table>
							<thead>
								<tr>
									<th>제목</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:url var="detail" value="/board/detail" />
								<c:forEach var="zzimitem" items="${requestScope.zzimlist }">
									<tr>
										<td><a href="${detail }?bid=${zzimitem.getBid() }">${zzimitem.getTitle() }</a></td>
										<td>${zzimitem.getCdate() }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</section>
		</section>
		<br>
		<footer class="adver">
			<p>2조 final project</p>
		</footer>
	</div>
</body>
</html>