<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${requestScope.item.getTitle() }</title>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/detail.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<link href="bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/detail.js"></script>

<c:url var="delete" value="/ajax/board/delete" />
<c:set var="account" value='<%=session.getAttribute("account")%>' />
<c:url var="userpage" value="/account/userpage" />

</head>
<body>
	<div class="width">
	<%@ include file="/WEB-INF/views/main/header.jsp" %>
	<br>
		
	<div class="head">
	<div>
		<h3>${item.getTitle() }</h3>
	</div>
	<div>
		<small><a id="userlink" href ="">작성자 : ${item.getAname() }</a></small><br>
		<small>작성일 : ${item.getCdate() }</small><br> <small>수정일 :
			${item.getUdate() }</small><br> <small>조회수 : ${item.getVcnt() }</small><br>
		<c:choose>
			<c:when test="${zzimcheck }">
				<a style="cursor: pointer; color: red;"
					onclick="zzim(${item.getBid() });"><span id="zzim">♥</span></a>
				<br>
			</c:when>
			<c:otherwise>
				<a style="cursor: pointer; color: red;"
					onclick="zzim(${item.getBid() });"><span id="zzim">♡</span></a>
				<br>
			</c:otherwise>
		</c:choose>
	</div>
	</div>
	<div class="mid">
		<p>${fn:replace(item.getContents(), newline, "<br>") }</p>
		
		<c:if test="${file.getThumb() != null}">
			<div class="inputArea">
			 <label for="img">이미지</label><br>
	 			<img src="<%=request.getContextPath() %>${file.getImg()}" class="img"/>
			</div>
		</c:if>
	</div>
	<div class="list">
		<c:url var="update" value="/board/update?bid=${item.getBid() }" />
		<c:url var="board" value="/board" />
		<button type="button" onclick="location.href='${board }'">목록</button>
		<button type="button" id="id_update" onclick="location.href='${update }'">수정</button>
		<button type="button" id="id_delete" onclick="boardDelete(${item.getBid() });">삭제</button>
	</div>
	
	<br>
	 <div style="width:650px; text-align: center;">
        <br> 
        <textarea rows="5" cols="80" id="recontents" placeholder="댓글을 작성해주세요"></textarea>
        <br>
        <button type="button" id="btnReply">댓글 작성</button>
    </div>
	
	<!-- 댓글 목록 출력할 위치 -->
    <div id="listReply"></div>
	</div>
</body>
</html>