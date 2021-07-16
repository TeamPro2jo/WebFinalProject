
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
		var myid = "${aid }";
		
		if(author != myid){
			document.getElementById('id_update').style.visibility = 'hidden';
			document.getElementById('id_delete').style.visibility = 'hidden';
			$("#userlink").attr("href", "${userpage}?aid=${item.getAid() }");
		}
		else {
			document.getElementById('id_chat').style.visibility = 'hidden';
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
	
	
	function popup(){
		var url= "/chatting/chatroom?partid=${item.getAid()}";    //팝업창 페이지 URL
		var winWidth = 630;
	    var winHeight = 700;
	    var popupOption= "width="+winWidth+", height="+winHeight;    //팝업창 옵션(optoin)
		window.open(url,"",popupOption);
	}

