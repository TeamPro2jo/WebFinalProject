<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${requestScope.item.getTitle() }</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<c:url var="delete" value="/ajax/board/delete" />
<c:set var="account" value='<%=session.getAttribute("account")%>' />
<c:url var="userpage" value="/account/userpage" />

<script type="text/javascript">
function zzim(boardid) {
	$.ajax({
		url: "/finalproj/ajax/board/zzim",
		type: "get",
		datatype: "json",
		data: {
			boardid: boardid
		},
		success: function(data) {
			if(data.result == "delete") {
				document.getElementById("zzim").innerHTML = "♡";
			} else if(data.result == "update") {
				document.getElementById("zzim").innerHTML = "♥";
			} else if(data.res == "no_login") {
				location.href = data.redirect
			}
		}
	});
}

	function boardDelete(bid) {
		$.ajax({
			url: "${delete }",
			type: "post",
			datatype: "json",
			data: {
				bid: bid
			},
			success: function(data) {
				if(data.res == "success") {
					alert("삭제가 완료되었습니다.");
				} else {
					alert("삭제 실패.");
				}
				if(data.redirect) {
					location.href = data.redirect;
				}
			}
		});
	}	
	
	$(document).ready(function(){
		var author = "${item.getAid() }";
		var myid = "${account.getId() }";
		
		if(author != myid){
			document.getElementById('id_update').style.visibility = 'hidden';
			document.getElementById('id_delete').style.visibility = 'hidden';
			$("#userlink").attr("href", "${userpage}?aid=${item.getAid() }");
		}
		
        listReply(); 
        
        $("#btnReply").click(function(){
            var recontents=$("#recontents").val();
            var bid="${item.getBid()}"
            var param="recontents="+recontents+"&bid="+bid;
            $.ajax({                
                type: "post",
                url: "${path}/reply/insert",
                data: param,
                success: function(){
                    alert("댓글이 등록되었습니다.");
                    listReply();
                }
            });
        });
		
        function listReply(){
            $.ajax({
                type: "get",
                url: "${path}/reply/list?bid=${item.getBid()}",
                success: function(result){
                // responseText가 result에 저장됨.
                    $("#listReply").html(result);
                }
            });
        }
        
     // 날짜 변환 함수 작성
        function changeDate(date){
            date = new Date(parseInt(date));
            year = date.getFullYear();
            month = date.getMonth();
            day = date.getDate();
            hour = date.getHours();
            minute = date.getMinutes();
            second = date.getSeconds();
            strDate = year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
            return strDate;
        }
        
	});

</script>
</head>
<body>
	<div>
		<h3>${item.getTitle() }</h3>
	</div>
	<div>
		<small><a id="userlink" href ="">작성자 : ${item.getAname() }</a></small><br>
		<small>작성일 : ${item.getCdate() }</small><br> <small>수정일 :
			${item.getUdate() }</small><br> <small>조회수 : ${item.getVcnt() }</small><br>
		<c:choose>
			<c:when test="${zzimcheck }">
				<a style="cursor: pointer; color: red;"
					onclick="zzim(${item.getBid() });"><span id="zzim">♥</span></a>
				<br>
			</c:when>
			<c:otherwise>
				<a style="cursor: pointer; color: red;"
					onclick="zzim(${item.getBid() });"><span id="zzim">♡</span></a>
				<br>
			</c:otherwise>
		</c:choose>
	</div>
	<div>
		<p>${fn:replace(item.getContents(), newline, "<br>") }</p>
	</div>
	<div>
		<c:url var="update" value="/board/update?bid=${item.getBid() }" />
		<c:url var="board" value="/board" />
		<button type="button" onclick="location.href='${board }'">목록</button>
		<button type="button" id="id_update" onclick="location.href='${update }'">수정</button>
		<button type="button" id="id_delete" onclick="boardDelete(${item.getBid() });">삭제</button>
	</div>
	
	<br>
	 <div style="width:650px; text-align: center;">
        <br> 
        <textarea rows="5" cols="80" id="recontents" placeholder="댓글을 작성해주세요"></textarea>
        <br>
        <button type="button" id="btnReply">댓글 작성</button>
    </div>
	
	<!-- 댓글 목록 출력할 위치 -->
    <div id="listReply"></div>
	
</body>
</html>