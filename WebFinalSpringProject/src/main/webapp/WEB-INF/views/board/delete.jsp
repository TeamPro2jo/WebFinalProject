<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function boardDelete(seq) {
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {
			location.href='delete?seq='+seq;
		}
	}	
</script>
</head>
<body>

</body>
</html>