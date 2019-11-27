<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>
		<!-- 업로드용 파일 -->
		<button id="next">넘어가기</button>
		
		<script>
			$("#next").on("click",function(){
				$(location).attr("href","detail.adboard");
			})
		</script>
	
</body>
</html>