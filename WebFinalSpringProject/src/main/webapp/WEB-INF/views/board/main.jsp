<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/mypage.css">
</head>
<body>
	<header>
			<section class="headersection1">
				<span class="middle"><a href="${pageContext.request.contextPath}/board"><img class="logo" src="<%=request.getContextPath() + "/resources/image/khlogo.png" %>" alt="로고"></a></span>
			</section>
		
			<section class="headersection2">
	             <span class="middle"><a href="${pageContext.request.contextPath}/account/mypage">마이페이지</a></span>
	             <span class="middle"><a href="./login">로그아웃</a></span>
	        </section>
	</header>
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
		<div>
			<c:url var="search" value="/board" />
			<form id="search_form" action="${search }" method="get">
				<input type="hidden" name="boardtype" value="${typeCheck }">
				<select name="searchtype">
					<option value="a">작성자</option>
					<option value="t">제목</option>
				</select>
				<input type="text" name="search">
				<button type="submit">검색</button>
			</form>
		</div>
		<table>
			<thead>
				<tr>
					<th>번호</th>
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