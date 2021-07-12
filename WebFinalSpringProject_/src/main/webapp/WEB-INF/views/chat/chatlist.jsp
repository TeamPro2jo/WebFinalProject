<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/sockjs-0.3.4.js"></script>

</head>
<c:url var="recent" value="/ajax/chat/recent" />
<c:url var="unread" value="/ajax/chat/unread" />
<c:url var="partname" value="/ajax/chat/partname" />
<c:url var="chatroom" value="/chatting/chatroom" />
<script type="text/javascript">
var msg;
var t;
var count;
var partname;

function getRecentMsg(roomid) {
	$.ajax({
		url: "${recent }",
		type: "GET",
		datatype: "json",
		data: {
			roomid: roomid
		},
		success: function(data) {
			if(data.recent != "no message") {
				msg = data.recent;
				t = data.timestamp;
			}
		}
	});
}	

function getUnReadCount(vo) {
	$.ajax({
		url: "${unread }",
		type: "GET",
		datatype: "json",
		data: {
			vo: vo
		},
		success: function(data) {
			if(data.res != "fail") {
				count = data.count;
			}
		}
	});
}	

function getPartName(vo) {
	$.ajax({
		url: "${partname }",
		type: "GET",
		datatype: "json",
		data: {
			vo: vo
		},
		success: function(data) {
			if(data.res != "fail") {
				partname = data.nickname;
			}
		}
	});
}	


</script>


<body>

	<c:set var="account" value='<%=session.getAttribute("account")%>' />

	<div class="col-12 row justify-content-center align-items-center my-5 ">
		<a href=""><img
			src="<%=request.getContextPath() + "/resources/image/khlogo.png"%>"
			alt="Logo" width="180px" class="img-fluid" /></a>
	</div>

	<div class="col-12" style="margin-top: 40px; clear: both;">
		<div class="col-10"
			style="margin: 20px auto; text-align: center; color: white; background-color: #01D1FE; border: 1px solid #01D1FE; padding: 10px 10px; border-radius: 8px;">
			채팅방 리스트 <br>
		</div>

	</div>

	<!-- 채팅방 리스트 표시 -->
	<div class="col-12">
		<div class="col-11"
			style="margin: 0 auto; border: 1px solid #01D1FE; height: 400px; border-radius: 10px; overflow: scroll"
			id="chatArea">
			<div id="chatListArea" style="margin-top: 10px; margin-left: 10px;">

			</div>
		</div>
	</div>

	<img id="profileImg" class="img-fluid"
		src="https://png.pngtree.com/element_our/sm/20180517/sm_5afd2b1f0ced7.jpg"
		style="display: none">
	<input type="text" id="nickname" value="구매자" style="display: none">
	<input type="button" id="enterBtn" value="입장" style="display: none">
	<input type="button" id="exitBtn" value="나가기" style="display: none">

	<c:url var="chatroom" value="/chatting/chatroom" />


</body>
</html>