<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 추가</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<c:url var="ck5_editor" value="/resources" />
<script src="${ck5_editor }/ck5/ckeditor.js"></script>
</head>
<script type="text/javascript">
function fileCheck() {
	alert("업로드 파일 수 : " + $("#id_file1").get(0).files.length);
	alert("업로드 파일 수 : " + $("#id_file1").get(0).files[0].name);
	alert("업로드 파일 수 : " + $("#id_file1").get(0).files[0].size);
}

function addFile() {
	var count = $("input[name=file]").length;
	var upload_form = $("#fileupload");
	var label = $("<label></label>").attr("for", "id_file" + (count + 1));
	label.text("파일업로드" + (count + 1));
	upload_form.append(label);
	var file =  $("<input>").attr("type", "file");
	file.attr("name", "file");
	file.attr("id", "id_file" + (count + 1));
	upload_form.append(file);
	upload_form.append($("<br>"))
}
</script>
<body>
	<c:url var="add" value="/board/add" />
	<form id="add_form" action="${add }" method="post" enctype="multipart/form-data">
		<div>
			<label for="id_title">제목</label>
			<input id="id_title" type="text" name="title" required>
		</div>
		<div>
			<label for="id_btype">게시판 구분</label>
			<select id="id_btype" name="btype">
				<c:forEach var="data" items="${requestScope.boardtypes }" >
					<option value="${data.id }">${data.name }</option>
				</c:forEach>
			</select>
		</div>
		<div>
			<label for="id_contents">내용</label>
			<textarea id="id_contents" name="contents" cols="80" rows="20"></textarea>
		</div>
		<div>
			<label for="id_nodel">삭제금지</label>
			<input id="id_nodel" type="checkbox" name="nodel">
		</div>
		<div id="fileupload">
			<label for="id_file1">파일업로드1</label>
			<input type="file" id="id_file1" name="file" multiple><br>
			<!-- label for="id_file2">파일업로드2</label>
			<input type="file" id="id_file2" name="file"><br>
			<label for="id_file3">파일업로드3</label>
			<input type="file" id="id_file3" name="file"><br>
			<label for="id_file4">파일업로드4</label>
			<input type="file" id="id_file4" name="file"><br>
			<label for="id_file5">파일업로드5</label>
			<input type="file" id="id_file5" name="file" -->
		</div>
		<div>
			<button type="button" onclick="addFile();">업로드 추가</button>
		    <button type="button" onclick="fileCheck();">파일검사</button>
		</div>
		<div>
			<button type="submit">저장</button>
			<button type="button" onclick="history.back();">취소</button>
		</div>
	</form>
</body>
<script type="text/javascript">
	ClassicEditor
		.create(document.querySelector('#id_contents'))
		.catch(error => {
			console.error(error);
		});
	
	var websocket;

    websocket = new WebSocket("ws://localhost/hyun/alert");
    
    // 연결되었을 때 동작 할 기능 정의
    websocket.onopen = function() {
    	console.log("웹소켓 연결되었습니다.")
    }

    // 연결이 종료되었을 때 동작 할 기능 정의 
    websocket.onclose = function() {
    	console.log("웹소켓 연결이 종료되었습니다.")
    }

    // 서버로 부터 메시지를 받았을 때 동작 할 기능 정의
    websocket.onmessage = function(message) {
    	alert(message.data)
    }
</script>
</html>