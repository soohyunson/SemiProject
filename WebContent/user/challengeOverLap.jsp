<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
	if(${giveOrTake == "give" }){
	alert("참가한 챌린지입니다.");
	location.href = "donation.challenge";
	}else{
		alert("참가한 챌린지입니다.");
		location.href= "take.challenge";
	}
	</script>
</body>
</html>