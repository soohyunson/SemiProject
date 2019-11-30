<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script language="javascript">
function javascript(){
	//부모창 새로고침
	opener.parent.location.reload();
     
 	//현재 창 닫기
	self.close();
}
</script>
</head>
<body onload="javascript()">
</body>
</html>


