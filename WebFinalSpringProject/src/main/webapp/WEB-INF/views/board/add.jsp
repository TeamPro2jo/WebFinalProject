<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 추가</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link type="text/css" rel="stylesheet"
	  href="${pageContext.request.contextPath}/resources/CSS/main.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"
	  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	  crossorigin="anonymous"></script>
</head>
<body>
	<c:url var="add" value="/board/add" />
	<form action="${add }" method="post" enctype="multipart/form-data">

			</form>
		</div>
	
		<body>
			<c:url var="add" value="/board/add" />
			<form action="${add }" method="post" enctype="multipart/form-data">
				<div>
					<center>	<h1 class="display-1">물품을 등록하세요</h1></center>
						<hr class="my-10">
					</div>
				<div>
				<center>	<div class="container row" style="float: none; margin:100 auto;">
						<div class="col-md-3" style="float: none; margin:0 auto;">
							&nbsp;&nbsp;&nbsp;	<input type="text" class="form-control" name="title" placeholder="제목"> </div>
								<div class="col-lg-9 my-4 mb-4 border border-dark rounded-lg">
					</center>			
				</div><br>
			
					
					<div class="container">
						<div class="row">
							<div class="col-md-4"></div>
					<label for="id_category" >카테고리 <select id="id_category"
						name="category">
						<option value="디지털기기">디지털기기</option>
						<option value="생활가전">생활가전</option>
						<option value="가구/인테리어">가구/인테리어</option>
						<option value="유아용품">유아용품</option>
						<option value="생활/가공식품">생활/가공식품</option>
						<option value="스포츠/레저">스포츠/레저</option>
						<option value="여성패션/잡화">여성패션/잡화</option>
						<option value="남성패션/잡화">남성패션/잡화</option>
						<option value="게임/취미">게임/취미</option>
						<option value="뷰티/미용">뷰티/미용</option>
						<option value="반려동물용품">반려동물용품</option>
						<option value="도서/티켓/음반">도서/티켓/음반</option>
						<option value="식물">식물</option>
						<option value="기타">기타</option>
					</select>
				
					&nbsp;&nbsp;&nbsp;&nbsp;	<label for="id_price">판매가격</label>
					<input id="id_price" name="price" type="number" required/></div>
				</label>
				</div>
				<div>
					<div class="container">
						<div class="row">
							<div class="col-md-4"></div>
							<label for="id_deal">거래 방법</label>
					<input type="radio" name="deal" value="1" checked >직거래
					<input type="radio" name="deal" value="2">택배 
				
					&nbsp;&nbsp;<label for="id_location">지역</label>
					<select id="id_location" name="location">
						<option value="서울">서울</option>
						<option value="경기">경기</option>
						<option value="충북">충북</option>
						<option value="충남">충남</option>
						<option value="전북">전북</option>
						<option value="전남">전남</option>
						<option value="경북">경북</option>
						<option value="경남">경남</option>
						<option value="부산">부산</option>
						<option value="제주도">제주도</option>
					</select>
				
					&nbsp;&nbsp;&nbsp;&nbsp;	<label for="id_status">거래 방법</label>
					<input type="radio" name="status" value="최상" checked>최상
					<input type="radio" name="status" value="상">상
					<input type="radio" name="status" value="중">중
					<input type="radio" name="status" value="하">하
				</div></div>
				<div>
					<div class="container">
						<div class="row">
							<div class="col-md-5"></div>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<label for="id_contents">내용</label>
					<br>
					<div class="container">
					
						<form role="form">
						  <div class=" col-lg-3">
					
					</div>
					<div class="container">
						<div class="row">
							<div class="col-md-5">
					<textarea cols="80" rows="10"placeholder="내용을 입력하세요" name="contents"></textarea>
				</div>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-md-5">
			
			<div class="inputArea">
				<div class="container">
					<div class="row">
						<div class="col-md-4"></div>
				 
							<div class="col-md-4">		
								<div class="form-group">
									<label for="formFile" class="form-label"></label>
									<input class="form-control" type="file" name="file" id="formFile">
								  </div><img src="" /></div>
				 </div></div>
				 </div></div>
				</div>
				 
				 
				</div>
				<div class="container row" style="float: none; margin:100 auto;">
					<div class="col-md-3" style="float: none; margin:0 auto;">
				<%=request.getRealPath("/") %>
				
						<button type="submit" id=:list_btn class="btn btn-success">저장</button>
						<div class="col-md-5">	<button type="button" class="btn btn-outline-danger" onclick="history.back();">취소</button>
				</div>
				
				<input type="number" id="id_author" name="aid" value="${id }" style="display: none">
				<input type="text" id="id_authorname" name="aname" value="${nickname }" style="display: none">
			</form>
		</body>
		</html>