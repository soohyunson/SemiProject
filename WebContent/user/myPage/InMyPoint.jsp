<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
		function goPoint() {
			location.href = "${pageContext.request.contextPath}/MyPoint.mypage";
		}
	
</script>
</head>
<body>
	
	<button onclick="goPoint()">goPoint</button>
</body>

</html>