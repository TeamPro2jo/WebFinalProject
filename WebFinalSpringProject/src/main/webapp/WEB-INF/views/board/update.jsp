<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/update.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function(){
	var category = "${item.getCategory() }";
	var deal = "${item.getDeal() }";
	var location = "${item.getLocation() }";
	var status = "${item.getStatus() }";


    	$("#id_category").val(category).prop("selected", true);
    	$("input:radio[name='deal']:radio[value="+deal+"]").attr("checked",true);
    	$("#id_location").val(location).prop("selected", true);
        $("input:radio[name='status']:radio[value="+status+"]").attr("checked",true);

  });
</script>

</head>
<body>
	<div class="width">
				<%@ include file="/WEB-INF/views/main/header.jsp" %>
				<br>
				
				<section class="main">
					<div class="write">
						<c:url var="update" value="/board/update" />
							<form action="${update }" method="post" enctype="multipart/form-data">
								<input type="hidden" name="bid" value="${item.getBid() }" readonly>
							<div>
								<input id="id_title" type="text"
									name="title" value="${item.getTitle() }" maxlength="100" placeholder="제목을 입력해주세요." required>
							</div><br>
							<div>
								<select id="id_category" name="category">
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
							</div>
							<div>
								<select id="id_location" name="location">
									<option value="없음">없음</option>
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
							</div>
							
							<div>
								<input id="id_price" name="price" type="number" value="${item.getPrice() }" required><br>
							</div><br>
							<div>
								<label for="id_deal">거래 방법</label>
								<input type="radio" name="deal" value="1" checked>직거래
								<input type="radio" name="deal" value="2">택배 
							</div>
							<div>
								<label for="id_status">물품 상태</label>
								<input type="radio" name="status" value="최상" checked>최상
								<input type="radio" name="status" value="상">상
								<input type="radio" name="status" value="중">중
								<input type="radio" name="status" value="하">하
							</div>
							
							<div>
								<br>
								<textarea class="context" id="id_contents" name="contents" cols="80" rows="20" required>${item.getContents() }</textarea>
							</div>
				<br>
				<div class="inputArea" style="margin-left: -21em; margin-bottom:1em;">
				 <label for="gdsImg">이미지</label>
				 <input type="file" id="img" name="file" />
				 <div class="select_img">
				  <img src="${file.getThumb()}" />
				  <input type="hidden" name="Img" value="${file.getImg()}" />
				  <input type="hidden" name="Thumb" value="${file.getThumb()}" /> 
				 </div>
				 
				 <script>
				  $("#img").change(function(){
				   if(this.files && this.files[0]) {
				    var reader = new FileReader;
				    reader.onload = function(data) {
				     $(".select_img img").attr("src", data.target.result).width(500);        
				    }
				    reader.readAsDataURL(this.files[0]);
				   }
				  });
				 </script>
				</div>
				
				<div>
					<button class="commit" type="submit">저장</button>
					<button class="back" type="button" onclick="history.back();">취소</button>
				</div>
			</form>
			</div>
		</section>
	</div>
</body>
</html>