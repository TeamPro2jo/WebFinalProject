<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${requestScope.item.getTitle() }</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript">
function zzim(boardid) {
	$.ajax({
		url: "/finalproj/ajax/board/zzim",
		type: "get",
		datatype: "json",
		data: {
			boardid: boardid
		},
		success: function(data) {
			if(data.result == "delete") {
				document.getElementById("zzim").innerHTML = "♡";
			} else if(data.result == "update") {
				document.getElementById("zzim").innerHTML = "♥";
			} else if(data.res == "no_login") {
				location.href = data.redirect
			}
		}
	});
}
</script>
</head>
<body>
	<div>
		<h3>${item.getTitle() }</h3>
	</div>
	<div>
		<small>작성일 : ${item.getCdate() }</small><br>
		<small>수정일 : ${item.getUdate() }</small><br>
		<small>조회수 : ${item.getVcnt() }</small><br>
		<c:choose>
			<c:when test="${zzimcheck }">
				<a style="cursor: pointer; color: red;" onclick="zzim(${item.getBid() });"><span id="zzim">♥</span></a><br>
			</c:when>
			<c:otherwise>
				<a style="cursor: pointer; color: red;" onclick="zzim(${item.getBid() });"><span id="zzim">♡</span></a><br>
			</c:otherwise>
		</c:choose>
	</div>
	<div>
		<p>${fn:replace(item.getContents(), newline, "<br>") }</p>
	</div>
	<div>
		<c:url var="update" value="/board/update?bid=${item.getBid() }" />
		<c:url var="board" value="/board" />
		<button type="button" onclick="location.href='${update }'">수정</button>
		<button type="button" onclick="boardDelete(${item.getBid() });">삭제</button>
		<button type="button" onclick="location.href='${board }'">목록</button>
	</div>
</body>
</html>