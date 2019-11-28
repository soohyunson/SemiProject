<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<<<<<<< HEAD

img {
	width: 100%;
	hegiht: 100%;
=======
.confirmDiv{

>>>>>>> 8210a0595e3f260c2fe1085c28d5d8b9350d3818
}
</style>
<script type="text/javascript">
	function checkFile(f) {
		var file = f.files;
		
		if(!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name)) {
			alert('gif, jpg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + file[0].name);
		}
		else return;
		f.outerHTML = f.outerHTML;
	}
</script>
</head>
<body>
	<form id="uploadfrm" method="post" enctype="multipart/form-data">
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
				<input type="file" name="fileImg" id="fileImg" accept="image/*"
					onchange="checkFile(this)">
				<button id="confirmBtn" type="button">인증하기</button>
			</div>
		</div>
		
		<input type="hidden" value="${recordNum}" id="recordNum">
	
	</form>
	<script>
	

		var today = new Date();
		var day = today.getDate();
		var month = today.getMonth()+1; //January is 0!
		var year = today.getFullYear();
		
		console.log(month);
		console.log(day);
		
		var lastday = ( new Date(year,month, 0) ).getDate();
		
		console.log(lastday);
		console.log("받아온 월: "+${month});
		console.log("오늘 일"+day);
	
		
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
            if((day-${day})==1){
               className= 'one';      
            }
            else if((day-${day})==2){
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
			if(!$("#fileImg").val()){
				alert("파일을 선택해 주세요!");
				return;
			}else{
				if(confirm("인증을 진행하시겠습니까?")){
					//var form = $("#uploadfrm")[0];
					var formData = new FormData();
					formData.append("fileImg",$("#fileImg")[0].files[0]);
					formData.append("recordNum",$("#recordNum").val());
						$.ajax({
							url:"${pageContext.request.contextPath}/confirm.file",
							enctype:"multipart/form-data",
							data:formData,
							type:"post",
							contentType:false,
							processData:false,
                            cache:false,
							//dataType:"json"
						}).done(function(data){
							console.log(data);

							$("."+className).attr("src",data);
							

						}).fail(function(){
							console.log("실패실패실패~~!!");
						});
					}
			}		
		})

	</script>

</body>
</html>