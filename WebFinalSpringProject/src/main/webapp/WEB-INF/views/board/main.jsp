<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>메인페이지</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
  <style>
    
    .row.content {height: 840px}
    
    .sidenav {
      background-color: #f1f1f1;
      height: 100%;
    }
    
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height: auto;} 
    }
  </style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<div class="container-fluid">
		  <a class="navbar-brand" href="#"></a>
		  
	<div class="width">
		<header>
			<section class="headersection1">
				<span class="middle"><a href="./board"><img class="logo"
						src="<%=request.getContextPath() + "/resources/image/khlogo.png"%>"
						alt="로고"></a></span>
			</section>
			<div class="collapse navbar-collapse" id="navbarColor01">
				<ul class="nav navbar-nav navbar-right">
				  <li class="nav-item">
					<span class="glyphicon glyphicon-user"><a href="${pageContext.request.contextPath}/account/mypage">마이 페이지</a></li></span>
			<span class="glyphicon glyphicon-log-in"><a class="nav-link active" a href="account/login"> Login</a></li></span>
			</section>
		</header>
		<br>
		
		<span class="navbar-toggler-icon"></span>
		  
			
	</div>
  </div>
</nav>

<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-3 sidenav">
     
      <ul class="nav nav-pills nav-stacked">
        <li class="active"><a href="#section1">선택하세요</a></li>
		<div><br>
			<ul  style="margin-left:15px;"">
				<c:url var="all" value="/board" />
				<li><a href="${all }">전체</a></li>
			</ul>
		</div><br>
				<c:url var="search" value="/board" />
				<form id="search_form" action="${search }" method="post">
					<div>
                       
						<ul style="display: inline-block; padding: 0 15px;">
							<li>물품 종류 </li>
							<li><input type="checkbox" id="a1" name="type"
								onclick="go();" value="디지털기기"><label for="a1">디지털기기</label></li>
							<li><input type="checkbox" id="a2" name="type"
								onclick="go();" value="생활가전"><label for="a2">생활가전</label></li>
							<li><input type="checkbox" id="a3" name="type"
								onclick="go();" value="가구/인테리어"><label for="a3">가구/인테리어</label></li>
							<li><input type="checkbox" id="a4" name="type"
								onclick="go();" value="유아용품"><label for="a4">유아용품</label></li>
							<li><input type="checkbox" id="a5" name="type"
								onclick="go();" value="생활/가공식품"><label for="a5">생활/가공식품</label></li>
							<li><input type="checkbox" id="a6" name="type"
								onclick="go();" value="스포츠/레저"><label for="a6">스포츠/레저</label></li>
							<li><input type="checkbox" id="a7" name="type"
								onclick="go();" value="여성패션/잡화"><label for="a7">여성패션/잡화</label></li>
							<li><input type="checkbox" id="a8" name="type"
								onclick="go();" value="남성패션/잡화"><label for="a8">남성패션/잡화</label></li>
							<li><input type="checkbox" id="a9" name="type"
								onclick="go();" value="게임/취미"><label for="a9">게임/취미</label></li>
							<li><input type="checkbox" id="a10" name="type"
								onclick="go();" value="뷰티/미용"><label for="a10">뷰티/미용</label></li>
							<li><input type="checkbox" id="a11" name="type"
								onclick="go();" value="반려동물용품"><label for="a11">반려동물용품</label></li>
							<li><input type="checkbox" id="a12" name="type"
								onclick="go();" value="도서/티켓/음반"><label for="a12">도서/티켓/음반</label></li>
							<li><input type="checkbox" id="a13" name="type"
								onclick="go();" value="식물"><label for="a13">식물</label></li>
							<li><input type="checkbox" id="a14" name="type"
								onclick="go();" value="기타"><label for="a14">기타</label></li>
						</ul>
						<ul style="display: inline-block; padding: 0 15px;">
							<li>지역 :</li>
							<li><input type="checkbox" id="b1" name="area"
								onclick="go();" value="서울"><label for="b1">서울</label></li>
							<li><input type="checkbox" id="b2" name="area"
								onclick="go();" value="경기"><label for="b2">경기</label></li>
							<li><input type="checkbox" id="b3" name="area"
								onclick="go();" value="충북"><label for="b3">충북</label></li>
							<li><input type="checkbox" id="b4" name="area"
								onclick="go();" value="충남"><label for="b4">충남</label></li>
							<li><input type="checkbox" id="b5" name="area"
								onclick="go();" value="전북"><label for="b5">전북</label></li>
							<li><input type="checkbox" id="b6" name="area"
								onclick="go();" value="전남"><label for="b6">전남</label></li>
							<li><input type="checkbox" id="b7" name="area"
								onclick="go();" value="경북"><label for="b7">경북</label></li>
							<li><input type="checkbox" id="b8" name="area"
								onclick="go();" value="경남"><label for="b8">경남</label></li>
							<li><input type="checkbox" id="b9" name="area"
								onclick="go();" value="부산"><label for="b9">부산</label></li>
							<li><input type="checkbox" id="b10" name="area"
								onclick="go();" value="제주도"><label for="b10">제주도</label></li>
						</ul>
						<ul style="display: inline-block; padding: 0 15px;">
							<li>물품상태 :</li>
							<li><input type="checkbox" id="c1" name="stat"
								onclick="go();" value="최상"><label for="c1">최상</label></li>
							<li><input type="checkbox" id="c2" name="stat"
								onclick="go();" value="상"><label for="c2">상</label></li>
							<li><input type="checkbox" id="c3" name="stat"
								onclick="go();" value="중"><label for="c3">중</label></li>
							<li><input type="checkbox" id="c4" name="stat"
								onclick="go();" value="하"><label for="c4">하</label></li>
						</ul>
                        <br>
						<ul style="display: inline-block; padding: 0 15px;">
							<li>거래방법 :</li>
							<li><input type="checkbox" id="d1" name="deal"
								onclick="go();" value="1"><label for="d1">직거래</label></li>
							<li><input type="checkbox" id="d2" name="deal"
								onclick="go();" value="2"><label for="d2">택배</label></li>
						</ul>
					</div>
                    <br><br>
					<select name="searchType">
						<option>선택</option>
						<option value="title">제목</option>
					</select> <input type="text" class="searchbox" name="searchWord">
					<button type="submit" id="test">검색</button>
				</form>
      </ul><br> <div class="input-group">
       
        <span class="input-group-btn">
                     <span class="glyphicon glyphicon-search"></span>
          </button>
        </span>
        
      </div>
    </div>

    <div class="col-sm-9">
      <h4><small>결과 게시판</small></h4>
     
      <div class="container">
        <table class="table table-striped">

<thead>
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

</hr>
<c:url var="add" value="board/add" />
<button type="button" onclick="location.href='${add }'">글쓰기</button>

<div class="text-center">
 
    </ul>
</div>
</div>
</div>
     
</div>

<footer class="container-fluid">
  <p>Footer Text</p>
</footer>

</body>
</html>
