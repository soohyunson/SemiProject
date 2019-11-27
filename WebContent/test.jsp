<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>
td {
	border: 1px solid black;
	width: 50px;
	height: 50px;
}
</style>
</head>
<body>

	<div>제목 ${dto.title}</div>
	<div>내용${dto.content}</div>


	<form action="succesCheck.adboard" id="frm">
		<input type="hidden" name="seq" value="${dto.seq}">
		<c:forEach items="${recordList}" var="record">
			<input type="checkbox" class="succesCheck" name="succesCheck" value="${record.member_id}"> ${record.member_id}
		<table>

				<tr>
					<td><img></td>
					<td><img></td>
					<td><img></td>
					<td><img></td>
					<td><img></td>
				</tr>
				<tr>
					<td><img></td>
					<td><img></td>
					<td><img></td>
					<td><img></td>
					<td><img></td>
				</tr>
			</table>
		</c:forEach>
	</form>
	<input type="button" value="성공" id="succesBtn">

	<script>
		$("#succesBtn").on("click",function(){
			var result = confirm("값을 넘길거...?");
			
			if(result){
				$("#frm").submit();
			}
		})
	</script>


</body>
</html>