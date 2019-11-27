<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
td {
	border: 1px solid black;
	width: 200px;
	height: 200px;
}
</style>
</head>
<body>
	<div class="confirmfloor">
		<div class="confirmDiv">
			<table>
				<tr>
					<td><img class="one">
					<td><img class="two">
					<td><img class="three">
					<td><img class="four">
					<td><img class="five">
				</tr>
				<tr>
					<td><img class="six">
					<td><img class="seven">
					<td><img class="eight">
					<td><img class="nine">
					<td><img class="ten">
				</tr>
			</table>
			<input type="file" name="fileImg" id="fileImg">
			<button id="confirmBtn">인증하기</button>
		</div>
	</div>
	<script>
	
			var today = new Date();
			console.log(today);
			
			var month = today.getMonth()+1;
			console.log(month);
			
			//var day = today.getDate();
			var day = 28;
			var year =  today.getFullYear();
			console.log(year);
			
			var lastday = ( new Date(year, month, 0) ).getDate();
			console.log(lastday);
			
			var className;
			if(${month}!=month){
				if((lastday-day)+${day}==1){
					className= 'one';		
				}
			    if((lastday-day)+${day}==2){
					className= 'two';		
				}
				else if((lastday-day)+${day}==3){
					className= 'three';		
				}
				else if((lastday-day)+${day}==4){
					className= 'four';		
				}
				else if((lastday-day)+${day}==5){
					className= 'five';		
				}
				else if((lastday-day)+${day}==6){
					className= 'six';		
				}
				else if((lastday-day)+${day}==7){
					className= 'seven';		
				}
				else if((lastday-day)+${day}==8){
					className= 'eight';		
				}
				else if((lastday-day)+${day}==9){
					className= 'nine';		
				}
				else if((lastday-day)+${day}==10){
					className= 'ten';		
				}
	
			}else{
				if(day-${day}==1){
					className= 'one';		
				}
				else if(day-${day}==2){
					className= 'two';		
				}
				else if(day-${day}==3){
					className= 'three';		
				}
				else if(day-${day}==4){
					className= 'four';		
				}
				else if(day-${day}==5){
					className= 'five';		
				}
				else if(day-${day}==6){
					className= 'six';		
				}
				else if(day-${day}==7){
					className= 'seven';		
				}
				else if(day-${day}==8){
					className= 'eight';		
				}
				else if(day-${day}==9){
					className= 'nine';		
				}
				else if(day-${day}==10){
					className= 'ten';		
				}
				
			}
			console.log(className);
			
			
			
			$("#confirmBtn").on("click",function(){
				var result = comfirm("사진을 올리시겠습니까?");
				
				if(result){
					$.ajax({
						uri:"${pageContext.request.contextPath}/confirm.file",
						data:{
							file : $("#fileImg").val()
						}
					}).done(function(data){
						
					})
				}
			});
		</script>

</body>
</html>