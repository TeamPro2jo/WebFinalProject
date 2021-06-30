<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
	<div>
		<ul>
			<c:url var="all" value="/board" />
			<li><a href="${all }">전체</a></li>
		</ul>
	</div>
	<div>
		<div>
			<c:url var="add" value="board/add" />
			<button type="button" onclick="location.href='${add }'">글쓰기</button>
		</div>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>카테고리</th>
					<th>지역</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:url var="detail" value="/board/detail" />
				<c:forEach var="item" items="${requestScope.boardlist }" >
					<tr>
						<td>${item.getBid() }</td>
						<td>${item.getCategory() }</td>
						<td>${item.getLocation() }</td>
						<td><a href="${detail}?bid=${item.getBid() }">${item.getTitle() }</a></td>
						<td>${item.getAname() }</td>
						<fmt:formatDate var="cdate" value="${item.getCdate() }" pattern="yyyy/MM/dd" />
						<td>${cdate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>