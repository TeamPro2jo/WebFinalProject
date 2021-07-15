<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>댓글</title>
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

  <script type="text/javascript"></script>
</head>

 
<style>
#contentForm {
    width: 40%;
    margin: 0 auto;
    padding-top: 12%;
}
.table>thead>tr>th, .table>tbody>tr>th {
    background-color: #e6ecff;
    text-align: center;
}
</style>
 
 
 
<body>
 
    <c:if test="${fn:length(list)>0}">
        <h2>댓글 리스트</h2>
        <div class="input-group input-group-sm" role="group"
            style="text-align: left">
            <table class="table table-striped table-bordered" border="1"
                width="800px" align="left">
 
 
                <c:forEach var="item" items="${list}">
                    <tr>
                        <td><br></td>
                    </tr>
 
                    <tr>
                        <td> 작성자 이름 ${item.getAname()}</td>
                    </tr>
 
                    <tr>
                        <td>작성 날짜 ${item.getCdate()}</td>
                    </tr>
 
                    <tr>
                        <td>댓글 내용 :${item.getRecontents()}</td>
                    </tr>
 
                </c:forEach>
            </table>
                      </div>
                      </c:if>
</body>
</html>
