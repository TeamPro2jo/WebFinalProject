<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

</head>

<body>
	<table id="replyList" style="width: 700px">
		<c:if test="${fn:length(list) > 0}">
			<c:forEach var="item" items="${list}">
				<tr>
					<td>작성자 이름 ${item.getAname()} / 작성 날짜 ${item.getCdate()}</td>
					<td>${item.getRecontents()}</td>
				</tr>
			</c:forEach>
		</c:if>

	</table>
</body>
</html>
