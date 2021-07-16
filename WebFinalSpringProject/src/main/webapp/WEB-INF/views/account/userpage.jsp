<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저페이지</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/userpage.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
	
<script>

function popup(){
	var url= "/chatting/chatroom?partid=${data.getId()}";    //팝업창 페이지 URL
	var winWidth = 630;
    var winHeight = 700;
    var popupOption= "width="+winWidth+", height="+winHeight;    //팝업창 옵션(optoin)
	window.open(url,"",popupOption);
}

</script>

</head>
<body>
	<div class="width">
		<%@ include file="/WEB-INF/views/main/header.jsp" %>
		<br>
		<section class="main">
			<div>
				<h2>USER PAGE</h2><hr><br>

				<button class="chat" id="chatroom" type="button" onclick="javascript:popup();">채팅창</button>
			</div>
			<section >
				<div class="myinfo">
					<h3>${data.getNickname() }님</h3> <p>(${data.getEmail() })</p> <p>총 게시글 수 <strong>${fn:length(uwritelist)}</strong>개</p>
					
				</div>
			</section><br>
			<section>
				<div class="list">
					<div class="write">
						<span class="top">${data.getNickname() }님이 쓴 글</span><br><br>
							<table class="table">
								<thead>
									<tr>
										<th>제목</th>
										<th>작성일</th>
									</tr>
								</thead>
								<tbody>
									<c:url var="detail" value="/board/detail" />
									<c:forEach var="uwriteitem" items="${requestScope.uwritelist }" >
										<tr>
											<td><a href="${detail}?bid=${uwriteitem.getBid()}">${uwriteitem.getTitle() }</a></td>
											<td>${uwriteitem.getCdate() }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
					</div><br><br>
				</div>
			</section>
		</section><br>
		<footer class="adver">
			<p>2조 final project</p>
		</footer>
	</div>
</body>
</html>