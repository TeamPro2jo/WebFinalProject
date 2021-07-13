<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
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

	<c:url var="update" value="/board/update" />
	<form action="${update }" method="post" enctype="multipart/form-data">
		<input type="hidden" name="bid" value="${item.getBid() }" readonly>
		<div>
			<label for="id_title">제목</label>
			<input id="id_title" type="text" name="title" value="${item.getTitle() }" required>
		</div>
		<div>
			
			<label for="id_category">카테고리</label>
			<select id="id_category" name="category">
				<option value="디지털기기">디지털기기</option>
				<option value="생활가전" >생활가전</option>
				<option value="가구/인테리어" >가구/인테리어</option>
				<option value="유아용품" >유아용품</option>
				<option value="생활/가공식품" >생활/가공식품</option>
				<option value="스포츠/레저" >스포츠/레저</option>
				<option value="여성패션/잡화" >여성패션/잡화</option>
				<option value="남성패션/잡화" >남성패션/잡화</option>
				<option value="게임/취미" >게임/취미</option>
				<option value="뷰티/미용" >뷰티/미용</option>
				<option value="반려동물용품" >반려동물용품</option>
				<option value="도서/티켓/음반" >도서/티켓/음반</option>
				<option value="식물" >식물</option>
				<option value="기타" >기타</option>
			</select>
		</div>
		<div>
			<label for="id_deal">거래 방법</label>
			<input type="radio" id="id_deal" name="deal" value="1" >직거래
			<input type="radio" id="id_deal" name="deal" value="2" >택배 
		</div>
		<div>
			<label for="id_location">지역</label>
			<select id="id_location" name="location">
				<option value="서울" >서울</option>
				<option value="경기" >경기</option>
				<option value="충북" >충북</option>
				<option value="충남" >충남</option>
				<option value="전북" >전북</option>
				<option value="전남" >전남</option>
				<option value="경북" >경북</option>
				<option value="경남" >경남</option>
				<option value="부산" >부산</option>
				<option value="제주도" >제주도</option>
			</select>
		</div>
		<div>
			<label for="id_status">거래 방법</label>
			<input type="radio" id="id_status" name="status" value="최상" >최상
			<input type="radio" id="id_status" name="status" value="상" >상
			<input type="radio" id="id_status" name="status" value="중" >중
			<input type="radio" id="id_status" name="status" value="하" >하
		</div>
		<div>
			<label for="id_price">판매가격</label>
			<input id="id_price" name="price" type="number" value="${item.getPrice() }" required/>
			<br>
			<label for="id_contents">내용</label>
			<textarea id="id_contents" name="contents" cols="80" rows="20">${item.getContents() }</textarea>
		</div>		
		
		<div class="inputArea">
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
		 <%=request.getRealPath("/") %>
		</div>
		
		<div>
			<button type="submit">저장</button>
			<button type="button" onclick="history.back();">취소</button>
		</div>
	</form>
</body>
</html>