<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>댓글</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/reply.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

  <script type="text/javascript"></script>
</head>


<body>
	<div class="commentBox"><h3>댓글</h3></div>
    <c:if test="${fn:length(list)>0}">
     <c:forEach var="item" items="${list}">
     <div class="comment">
     	<div class="comment_img">
     		<img src="<%=request.getContextPath() + "/resources/image/comment.png"%>" width="36" height="36"/>
     	</div>
     	<div class="comment_area">
     	<div class="comment_name"><strong>${item.getAname()}</strong></div>
		<div class="comment_text">
			<p class="comment_view">
				<span class="text_comment">${item.getRecontents()}</span>
			</p>
		</div>
		<div class="comment_date">
			<span class="date_comment">${item.getCdate()}</span>
		</div>
		</div>
  	</div>
     </c:forEach>
</c:if>
</body>
</html>
