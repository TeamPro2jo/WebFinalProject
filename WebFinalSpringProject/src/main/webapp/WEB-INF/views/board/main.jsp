<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/main.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var x = "${requestScope.typecheck }"
						var attrArray = x.split(",")
						for (var i = 0; i < attrArray.length; i++) {
							$("input[value='" + attrArray[i] + "']").prop(
									"checked", true)
							var label = $("input[value='" + attrArray[i] + "']")
									.next().clone()
							label
									.attr("style",
											"cursor:pointer; border-style: ridge; padding: 0px 5px; margin-left: 5px")
							label.text(label.text() + " x")
							$("#test").after(label)
						}

						var y = "${requestScope.areacheck }"
						var areaArray = y.split(",")
						for (var i = 0; i < areaArray.length; i++) {
							$("input[value='" + areaArray[i] + "']").prop(
									"checked", true)
							var label = $("input[value='" + areaArray[i] + "']")
									.next().clone()
							label
									.attr("style",
											"cursor:pointer; border-style: ridge; padding: 0px 5px; margin-left: 5px")
							label.text(label.text() + " x")
							$("#test").after(label)
						}

						var z = "${requestScope.statcheck }"
						var statArray = z.split(",")
						for (var i = 0; i < statArray.length; i++) {
							$("input[value='" + statArray[i] + "']").prop(
									"checked", true)
							var label = $("input[value='" + statArray[i] + "']")
									.next().clone()
							label
									.attr("style",
											"cursor:pointer; border-style: ridge; padding: 0px 5px; margin-left: 5px")
							label.text(label.text() + " x")
							$("#test").after(label)
						}

						var d = "${requestScope.dealcheck }"
						var dealArray = d.split(",")
						for (var i = 0; i < dealArray.length; i++) {
							$("input[value='" + dealArray[i] + "']").prop(
									"checked", true)
							var label = $("input[value='" + dealArray[i] + "']")
									.next().clone()
							label
									.attr("style",
											"cursor:pointer; border-style: ridge; padding: 0px 5px; margin-left: 5px")
							label.text(label.text() + " x")
							$("#test").after(label)
						}
					});

	function go() {
		$("#search_form").submit();
	}
</script>
</head>

<body>
	<div class="width">
		<%@ include file="/WEB-INF/views/main/header.jsp" %>
		
		<section class="main">
			<div>
				<h2>Main</h2><hr>
				<br>
			</div>
     

			<section class="main2">
			
		<div>
			<div>
				<c:url var="add" value="board/add" />
				
			</div>
			<div>
				<c:url var="search" value="/board" />
				<form id="search_form" action="${search }" method="post">
					<div>

                        <div>
                            <ul>
                                <c:url var="all" value="/board" />
                                <a href="${all }" style="font-weight:bold;text-decoration: underline;">전체</a>
                            </ul>
                        </div>
                        <div class="category">
						<ul style="display: inline-block;">
						<fieldset style="width:850px; height:90px; border:3px solid lightblue; padding-left:5px; ">
							<legend align="center" style="font-weight:bold;">카테고리 </legend>
							<div style="padding-left:7px;">
							<input type="checkbox" id="a1" name="type"
								onclick="go();" value="디지털기기"><label for="a1">디지털기기</label>
							<input type="checkbox" id="a2" name="type"
								onclick="go();" value="생활가전"><label for="a2">생활가전</label>
							<input type="checkbox" id="a3" name="type"
								onclick="go();" value="가구/인테리어"><label for="a3">가구/인테리어</label>
							<input type="checkbox" id="a4" name="type"
								onclick="go();" value="유아용품"><label for="a4">유아용품</label>
							<input type="checkbox" id="a5" name="type"
								onclick="go();" value="생활/가공식품"><label for="a5">생활/가공식품</label>
							<input type="checkbox" id="a6" name="type"
								onclick="go();" value="스포츠/레저"><label for="a6">스포츠/레저</label>
							<input type="checkbox" id="a7" name="type"
								onclick="go();" value="여성패션/잡화"><label for="a7">여성패션/잡화</label><br>
							<input type="checkbox" id="a8" name="type"
								onclick="go();" value="남성패션/잡화"><label for="a8">남성패션/잡화</label>
							<input type="checkbox" id="a9" name="type"
								onclick="go();" value="게임/취미"><label for="a9">게임/취미</label>
							<input type="checkbox" id="a10" name="type"
								onclick="go();" value="뷰티/미용"><label for="a10">뷰티/미용</label>
							<input type="checkbox" id="a11" name="type"
								onclick="go();" value="반려동물용품"><label for="a11">반려동물용품</label>
							<input type="checkbox" id="a12" name="type"
								onclick="go();" value="도서/티켓/음반"><label for="a12">도서/티켓/음반</label>
							<input type="checkbox" id="a13" name="type"
								onclick="go();" value="식물"><label for="a13">식물</label>
							<input type="checkbox" id="a14" name="type"
								onclick="go();" value="기타"><label for="a14">기타</label>
						</div>
						</ul>
						</fieldset>
						<ul style="display: inline-block;">
						<fieldset style="width:850px; height:60px; border:3px solid lightblue;">
						
							<legend align="center" style="font-weight:bold;">지역 </legend>
							<div style="padding-left:130px;">
							<input type="checkbox" id="b1" name="area"
								onclick="go();" value="서울"><label for="b1">서울</label>
							<input type="checkbox" id="b2" name="area"
								onclick="go();" value="경기"><label for="b2">경기</label>
							<input type="checkbox" id="b3" name="area"
								onclick="go();" value="충북"><label for="b3">충북</label>
							<input type="checkbox" id="b4" name="area"
								onclick="go();" value="충남"><label for="b4">충남</label>
							<input type="checkbox" id="b5" name="area"
								onclick="go();" value="전북"><label for="b5">전북</label>
							<input type="checkbox" id="b6" name="area"
								onclick="go();" value="전남"><label for="b6">전남</label>
							<input type="checkbox" id="b7" name="area"
								onclick="go();" value="경북"><label for="b7">경북</label>
							<input type="checkbox" id="b8" name="area"
								onclick="go();" value="경남"><label for="b8">경남</label>
							<input type="checkbox" id="b9" name="area"
								onclick="go();" value="부산"><label for="b9">부산</label>
							<input type="checkbox" id="b10" name="area"
								onclick="go();" value="제주도"><label for="b10">제주도</label>
						</div>
						</ul><br>
						</fieldset>
						
						<ul style="display: inline-block;">
						<fieldset style="width:850px; height:60px; border:3px solid lightblue;">
							<legend align="center" style="font-weight:bold;">물품상태 </legend>
							<div style="padding-left:350px;">
							<input type="checkbox" id="c1" name="stat"
								onclick="go();" value="최상"><label for="c1">최상</label>
							<input type="checkbox" id="c2" name="stat"
								onclick="go();" value="상"><label for="c2">상</label>
							<input type="checkbox" id="c3" name="stat"
								onclick="go();" value="중"><label for="c3">중</label>
							<input type="checkbox" id="c4" name="stat"
								onclick="go();" value="하"><label for="c4">하</label>
							</div>
						</ul><br>
						</fieldset>
						<ul style="display: inline-block;">
						<fieldset style="width:850px; height:60px; border:3px solid lightblue;">
							<legend align="center" style="font-weight:bold;">거래방법 </legend>
							<div style="padding-left:350px;">
							<input type="checkbox" id="d1" name="deal"
								onclick="go();" value="1"><label for="d1">직거래</label>
							<input type="checkbox" id="d2" name="deal"
								onclick="go();" value="2"><label for="d2">택배</label>
							</div>
						</ul>
						</fieldset>
					</div> 
					</div>
					<select name="searchType">
						<option>선택</option>
						<option value="title">제목</option>
					</select> <input type="text" class="searchbox" name="searchWord">
					<span><button class="search" type="submit" id="test">검색</button></span>
				</form>
			</div>

        </section>
			<br>
			<section>
				<div class="list">
					<div class="write">
						<span class="top"onclick="location.href='${add }'">글쓰기</span><br><br>
						<table class="table">
							<thead>
								<tr>
												<tr>
												<th>번호</th>
												<th>물품상태</th>
												<th>카테고리</th>
												<th>지역</th>
												<th>거래방법</th>
												<th>제목</th>
												<th>작성자</th>
												<th>작성일</th>
											</tr>
										</thead>
								</tr>
							</thead>
							<tbody>
								<c:url var="detail" value="/board/detail" />
								<c:forEach var="item" items="${requestScope.boardlist }">
									<tr>
										<td>${item.getBid() }</td>
										<td>${item.getStatus() }</td>
										<td>${item.getCategory() }</td>
										<td>${item.getLocation() }</td>
										<c:choose>
											<c:when test="${item.getDeal() == '1'}">
												<td>직거래</td>
											</c:when>
											<c:when test="${item.getDeal() == '2'}">
												<td>택배</td>
											</c:when>
										</c:choose>
										<td><a href="${detail}?bid=${item.getBid() }">${item.getTitle() } (${item.getRecnt() })</a></td>
										<td>${item.getAname() }</td>
										<fmt:formatDate var="cdate" value="${item.getCdate() }"
											pattern="yyyy/MM/dd" />
										<td>${cdate }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>