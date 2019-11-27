<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
	<c:choose>
		<c:when test="${loginResult == true }">
			<script>
				alert("로그인에 성공하였습니다!");
				location.href = "realmain.jsp"
			</script>
		</c:when>

		<c:otherwise>
			<script>
				alert("아이디 또는 비밀번호를 확인해주세요");
				location.href = "login.jsp";
			</script>
		</c:otherwise>
	</c:choose>

</body>
</html>