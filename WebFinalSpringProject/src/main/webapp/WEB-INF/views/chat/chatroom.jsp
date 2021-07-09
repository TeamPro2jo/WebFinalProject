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

<body>
	<div class="col-12 row justify-content-center align-items-center my-5 ">
		<a href=""><img
			src="<%=request.getContextPath() + "/resources/image/khlogo.png"%>"
			alt="Logo" width="180px" class="img-fluid" /></a>
	</div>
	<div class="col-12">
		<div class="col-2" style="float: left">
			<span> 목록 </span>
		</div>
		<div class="col-8" style="float: left; text-align: center;">
			${partaccount.getNickname() } 님과 대화
		</div>
		<div class="col-2" style="float: right">
			<span> 닫기 </span>
		</div>

	</div>
	<div class="col-12" style="margin-top: 40px; clear: both;">
		<div class="col-10"
			style="margin: 20px auto; text-align: center; color: white; background-color: #01D1FE; border: 1px solid #01D1FE; padding: 10px 10px; border-radius: 8px;">
			거래는 신중히. 계좌 비밀번호 등의 요구에는 응하지 말아주세요. <br>
		</div>

	</div>
	<!-- 채팅 내용 -->
	<div class="col-12">
		<div class="col-11"
			style="margin: 0 auto; border: 1px solid #01D1FE; height: 400px; border-radius: 10px; overflow: scroll"
			id="chatArea">

			<div id="chatMessageArea"
				style="margin-top: 10px; margin-left: 10px;"></div>

		</div>
	</div>

	<!-- 채팅 입력창 -->
	<div class="col-12" style="margin-top: 20px; margin-bottom: 15px;">
		<div class="col-12" style="float: left">
			<textarea class="form-control"
				style="border: 1px solid #01D1FE; height: 65px; float: left; width: 80%"
				placeholder="Enter ..." id="message">

				</textarea>
			<span
				style="float: right; width: 18%; height: 65px; text-align: center; background-color: #01D1FE; border-radius: 5px;">
				<a
				style="margin-top: 30px; text-align: center; color: white; font-weight: bold;"
				id="sendBtn"><br>전송</a>
			</span>
		</div>

	</div>


	<img id="profileImg" class="img-fluid"
		src="https://png.pngtree.com/element_our/sm/20180517/sm_5afd2b1f0ced7.jpg"
		style="display: none">
	<input type="text" id="nickname" value="${myaccount.getNickname() }" style="display: none">
	<input type="button" id="enterBtn" value="입장" style="display: none">
	<input type="button" id="exitBtn" value="나가기" style="display: none">


	<script type="text/javascript">
		connect();

		function connect() {
			sock = new SockJS('/chat');
			sock.onopen = function() {
				console.log('open');
			};
			sock.onmessage = function(evt) {
				var data = evt.data;
				console.log(data)
				var obj = JSON.parse(data)
				console.log(obj)
				appendMessage(obj.mcontents, obj.sender);
			};
			sock.onclose = function() {
				appendMessage("연결을 끊었습니다.");
				console.log('close');
			};
		}

		function send() {
			var msg = $("#message").val();
			if (msg != "") {
				message = {};
				message.mcontents = $("#message").val()
				message.sender = ${myaccount.getId()}
				message.receiver = ${partaccount.getId()}
			}

			sock.send(JSON.stringify(message));
			$("#message").val("");
		}

		function getTimeStamp() {
			var d = new Date();
			var s = leadingZeros(d.getFullYear(), 4) + '-'
					+ leadingZeros(d.getMonth() + 1, 2) + '-'
					+ leadingZeros(d.getDate(), 2) + ' ' +

					leadingZeros(d.getHours(), 2) + ':'
					+ leadingZeros(d.getMinutes(), 2) + ':'
					+ leadingZeros(d.getSeconds(), 2);

			return s;
		}

		function leadingZeros(n, digits) {
			var zero = '';
			n = n.toString();

			if (n.length < digits) {
				for (i = 0; i < digits - n.length; i++)
					zero += '0';
			}
			return zero + n;
		}

		function appendMessage(msg, sender) {

			if (msg == '') {
				return false;
			} else {

				var t = getTimeStamp();
				if (sender == '${myaccount.getId() }') {
					$("#chatMessageArea")
							.append(
									"<div class='col-12 row' style = 'height : auto; margin-top : 5px;'>"
											+ "<div class='col-2' style = 'float:right; padding-right:0px; padding-left : 0px;'>"
											+ "<div style='font-size:9px; clear:both;'>${myaccount.getNickname() }</div></div>"
											+ "<div class = 'col-10' style = 'overflow : y ; margin-top : 7px; float:right;'>"
											+ "<div class = 'col-12' style = ' background-color:#ACF3FF; padding : 10px 5px; float:left; border-radius:10px;'>"
											+ "<span style = 'font-size : 12px;'>"
											+ msg
											+ "</span></div><div col-12 style = 'font-size:9px; text-align:right; float:right;'><span style ='float:right; font-size:9px; text-align:right;' >"
											+ t
											+ "</span></div></div></div></br>")
				} else {
					
					$("#chatMessageArea")
					.append(
							"<div class='col-12 row' style = 'height : auto; margin-top : 5px;'>"
									+ "<div class='col-2' style = 'float:left; padding-right:0px; padding-left : 0px;'>"
									+ "<div style='font-size:9px; clear:both;'>${partaccount.getNickname() }</div></div>"
									+ "<div class = 'col-10' style = 'overflow : y ; margin-top : 7px; float:left;'>"
									+ "<div class = 'col-12' style = ' background-color:#ACF3FF; padding : 10px 5px; float:left; border-radius:10px;'>"
									+ "<span style = 'font-size : 12px;'>"
									+ msg
									+ "</span></div><div col-12 style = 'font-size:9px; text-align:right; float:left;'><span style ='float:right; font-size:9px; text-align:right;' >"
									+ t
									+ "</span></div></div></div></br>")
				}

				var chatAreaHeight = $("#chatArea").height();
				var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
				$("#chatArea").scrollTop(maxScroll);

			}
		}
		$(document).ready(function() {
			$('#message').keypress(function(event) {
				var keycode = (event.keyCode ? event.keyCode : event.which);
				if (keycode == '13') {
					send();
				}
				event.stopPropagation();
			});

			$('#sendBtn').click(function() {
				send();
			});/* $('#enterBtn').click(function() { connect(); }); $('#exitBtn').click(function() { disconnect(); }); */
		});
	</script>

</body>
</html>