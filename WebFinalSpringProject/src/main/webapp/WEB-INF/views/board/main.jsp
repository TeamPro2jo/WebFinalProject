<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/main.css">
</head>
<body>
	<div class="width">
		<header>
			<section class="headersection1">
				<span class="middle"><a href="./board"><img class="logo" src="<%=request.getContextPath() + "/resources/image/khlogo.png" %>" alt="로고"></a></span>
			</section>
		
			<section class="headersection2">
	             <span class="middle"><a href="${pageContext.request.contextPath}/account/mypage">마이페이지</a></span>
	             <span class="middle"><a href="account/login">로그아웃</a></span>
	        </section>
	    </header>
		<br>
		
		<section class="main">
			<div class="category">
				<table class="context"  width="700" height="100">
						<thead>
							<tr>
								<th>지역</th>
								<th>물품</th>
								<th>물품 상태</th>
								<th>거래 방법</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<label><input type="checkbox">서울</label>
									<label><input type="checkbox">경기</label><br>
									<label><input type="checkbox">충북</label>
									<label><input type="checkbox">충남</label><br>
									<label><input type="checkbox">전북</label>
									<label><input type="checkbox">전남</label><br>
									<label><input type="checkbox">경북</label>
									<label><input type="checkbox">경남</label><br>
									<label><input type="checkbox">부산</label>
									<label><input type="checkbox">제주</label>
								</td>
							
								<td>
									<label><input type="checkbox">디지털기기</label>
									<label><input type="checkbox">생활가전</label><br>
									<label><input type="checkbox">가구/인테리어</label>
									<label><input type="checkbox">유아물품/도서</label><br>
									<label><input type="checkbox">생활/가공식품</label>
									<label><input type="checkbox">스포츠/레저</label><br>
									<label><input type="checkbox">여성잡화/의류</label>
									<label><input type="checkbox">남성패션/잡화</label><br>
									<label><input type="checkbox">게임/취미</label>
									<label><input type="checkbox">뷰티/미용</label><br>
									<label><input type="checkbox">반려동물용품</label>
									<label><input type="checkbox">도섯/티켓/음반</label><br>
									<label><input type="checkbox">식물</label>
									<label><input type="checkbox">기타</label>
								</td>
								
								<td>
									<label><input type="checkbox">최상</label><br>
									<label><input type="checkbox">상</label><br>
									<label><input type="checkbox">중</label><br>
									<label><input type="checkbox">하</label><br>
								</td>
								
								<td>
									<label><input type="checkbox">택배</label><br>
									<label><input type="checkbox">직거래</label><br>
								</td>
							</tr>
						</tbody>
					</table><br>
					<button type="button">검색</button>
				</div>
		
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
		</section>	
	</div>
</body>
</html>