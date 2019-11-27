<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<link
	href="https://fonts.googleapis.com/css?family=Calistoga&display=swap"
	rel="stylesheet">
	
	 <style>
            body{
                margin:0px;
                padding:0px;
                background-color:#FFFFFF;
            }
            .lastbar{
                margin:0px;
                overflow: hidden;
                padding:0px;
            }

            .navi{
                position:fixed;
                top:0px;
                margin:0px;

                overflow: hidden;
                padding:0px;
                width:60%;
                left: 20%;              
                background-color: #FFFFFF90;
                font-family:fantasy;
                font-size: 20px;
            }
            .title{
                margin:0px;
                padding:0px;
                width:50%;
            }
            .itemList{
                position: absolute;
                margin:0px;
                padding:0px;

                right: 0px;
                width:50%;
            }
            .navi-title{
                list-style-type: none;
                width:50%;
                line-height:72px;
                float:left;
                text-align: center;
                color:#7019FF;
            }
            .navi-item{

                list-style-type: none;
                width:30%;
                line-height:72px;
                float:left;
                text-align: center;

                color:#7019FF;
            }
            .navi-item2{
                list-style-type: none;
                width:25%;
                line-height:30px;
                float:left;
                text-align: center;
                color:#7019FF;
            }
            .navi-item3{
                list-style-type: none;
                width:25%;
                line-height:72px;
                float:left;
                text-align: center;
                color:#7019FF;
            }
            .navi-item>a{
                text-decoration: none;
                color:#7019FF;
                width:100%;
                height:100%;
                display: block;
            }
            .navi-item2>a{
                text-decoration: none;
                color:#7019FF;
                width:100%;
                height:100%;
                display: block;
            }
            .navi-item3>a{
                text-decoration: none;
                color:#7019FF;
                width:100%;
                height:100%;
                display: block;
                font-weight: bold;
            }
            .navi-title>a{
                text-decoration: none;
                color:#7019FF;
                width:100%;
                height:100%;
                display: block;
            }
            .navi-item>a:hover{
                background-color: orange;

            }
            .container{
                background-color: #ededed;
                width:60%;
                margin:auto;
                margin-top:0px;
            }
            .onefloor{
                border-bottom: 3px solid #7019FF;
                border-top: 3px solid #7019FF;
                border-radius: 3px;
            }
            .twofloor{
                border-bottom: 3px solid #7019FF;
                border-radius: 3px;

            }
            .threefloor{
                border-bottom: 3px solid #7019FF;
                border-radius: 3px;
                height: 50px;
            }

            .fivefloor{
                border-top: 3px solid #7019FF;
                border-radius: 3px;
                width: 100%;
                background-color: gainsboro;
            }
            .progress{
                display: inline-block;
                width: 90%;
                height: 10%;
            }

            .submenu{
                font-family: 'Calistoga', cursive;
                color:#7019FF;
            }
            .sidebar{
                height: 51px;

                font-family: 'Calistoga', cursive;

                text-align: center;
            }
            .sidebar>a{
                height: 100%;
                color:#FFFFFF;
            }
            .fourthfloor{
                height: 700px;
            }
            table{
                border: 2px solid #7019FF;
                margin: auto;
                position: relative;
                top: 20%;
                height: 400px;
                width: 500px;
            }
            th{
                font-size: 30px;
                text-align: center;
            }
            tr{
                height: 25px;
            }
            #btnresult{
                text-align: center;
            }
            .sub{
                text-align: right;
            }
        </style>
	
</head>
<body>
	<div class="container">
		<br>
		<br>
		<br>
		<div class="twofloor"></div>

		<div class="fourthfloor">
			<form action="signup.mem" method="post" id="signfrm">
				<table class="signuptable">
					<tr>
						<th colspan="2">Welcome to Join
					</tr>
					<tr>
						<td class="sub">아이디</td>
						<td><input type="text" id="id" name="id">
					</tr>
					<tr>
						<td colspan="2" id="idresult"></td>
					</tr>
					<tr>
						<td class="sub">비밀번호</td>
						<td><input type="password" id="pw1" name="pw"></td>
					</tr>
					<tr>
						<td colspan="2" id="pw1result" style="text-align: center">
							(비밀번호는 영어 대소문자, 숫자 조합 8자 이상)</td>
					</tr>
					<tr>
						<td class="sub">비밀번호 확인</td>
						<td><input type="password" id="pw2"></td>
					</tr>
					<tr>
						<td colspan="2" id="pw2result"></td>
					</tr>
					<tr>
						<td class="sub">이름</td>
						<td><input type="text" id="name" name="name"></td>
					</tr>
					<tr>
						<td colspan="2" id="nameresult"></td>
					</tr>
					<tr>
						<td class="sub">휴대폰번호</td>
						<td><input type="text" id="phone" placeholder="010-1234-5678" name="phone"></td>
					</tr>
					<tr>
						<td colspan="2" id="phoneresult"></td>
					</tr>
					<tr>
						<td class="sub">이메일</td>
						<td><input type="text" id="email"
							placeholder="abc123@def.com" name="email"></td>
					</tr>
					<tr>
						<td colspan="2" id=emailresult></td>
					</tr>
					<tr>
						<td colspan="2" id="btnresult"><button>확인</button> <input
							type="reset" value="다시입력"></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="bottom"></div>
	</div>
	<div class="fivefloor">
		<ul class="lastbar">
			<li class="navi-item3"><a href="#">COMPANY</a></li>
			<li class="navi-item3"><a href="#">POLICIES</a></li>
			<li class="navi-item3"><a href="#">SUPPORT</a></li>
			<li class="navi-item3"><a href="#">기업교육</a></li>
			<br>
			<br>
		</ul>
		<ul class="lastbar">
			<li class="navi-item2"><a href="#">블로그</a></li>
			<li class="navi-item2"><a href="#">이용약관</a></li>
			<li class="navi-item2"><a href="#">FAQ</a></li>
			<li class="navi-item2"><a href="#">MIWANSUNG.BIZ</a></li>

		</ul>
		<ul class="lastbar">
			<li class="navi-item2"><a href="#">언론보도</a></li>
			<li class="navi-item2"><a href="#">개인정보취급방침</a></li>
			<li class="navi-item2"><a href="#">미완성센터</a></li>
			<li class="navi-item2"><a href="#"></a></li>
			<br>
			<br>
		</ul>
		<div class="lastbar2" style="text-align: center;">
			상호 : (주)미완성자들 | 주소 : 서울특별시 종로구 평창동 486 -20 | 사업자등록번호 : 234-88-00720 |
			대표자명 : 김세원<br> Copyright ⓒ2019 Miwansung inc, ltd. All rights
			reserved
		</div>
		<br>
		<div class="lastbar3" style="text-align: center">
			<a href="#"><img src="icon1.png" class="mr-3" alt="..."
				style="width: 50px; height: 50px; margin-left: 10%; margin: 0px;"></a>
			<a href="#"><img src="icon2.png" class="mr-3" alt="..."
				style="width: 50px; height: 50px; margin-left: 10%; margin: 0px;"></a>
			<a href="#"><img src="icon3.png" class="mr-3" alt="..."
				style="width: 50px; height: 50px; margin-left: 10%; margin: 0px;"></a>
		</div>
		<br>
	</div>
	<div class="category">
		<div class="wrapper"></div>
	</div>
	<ul class="navi">
		<ul class="title">
			<li class="navi-title"><a href="#"><img src="reallogo.png"
					class="mr-3" alt="..."
					style="width: 135px; height: 50px; margin-left: 10%;"></a></li>
		</ul>
		<ul class="itemList">

			<li class="navi-item"><a href="#">GIVE OR TAKE</a></li>
			<li class="navi-item"><a href="#">CHALLENGE</a></li>
			<li class="navi-item"><a href="#">MYPAGE</a></li>
		</ul>
	</ul>

	<script>
            var ctx = document.getElementById('myChart').getContext('2d');
            var chart = new Chart(ctx, {
                // The type of chart we want to create
                type: 'line',

                // The data for our dataset
                data: {
                    labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
                    datasets: [{
                        label: 'My First dataset',
                        backgroundColor: 'rgb(255, 99, 132)',
                        borderColor: 'rgb(255, 99, 132)',
                        data: [0, 10, 5, 2, 20, 30, 45]
                    }]
                },

                // Configuration options go here
                options: {}
            });
        </script>
	<script>
	$("#id").on("focusout", function(){
		var id = $("#id").val();
		$.ajax({
			url:"idcheck.mem",
			type:"post",
			data:{
				id : id
			},
			dataType: "json"
		}).done(function(data){
			if(data.result == true){
				$("#idresult").html("사용할 수 없는 아이디입니다.");
				$("#idresult").css("text-align","center");
				$("#idresult").css("color","red");
			}else{
				$("#idresult").html("사용가능한 아이디입니다.");
				$("#idresult").css("text-align","center");
				$("#idresult").css("color","blue");
			}
		})
	})
	
            $("#pw1").on("focusout", function(){
                var regex = /^[a-z0-9]{8,}$/;
                var data = $("#pw1").val();
                var result = regex.exec(data);
                if(result != null){
                    $("#pw1result").html("비밀번호가 올바르게 입력되었습니다");
                    $("#pw1result").css("color","blue");
                    $("#pw1result").css("text-align","center");
                }else{
                    $("#pw1result").html("비밀번호가 양식에 맞지 않습니다");
                    $("#pw1result").css("color","red");
                    $("#pw1result").css("text-align","center");
                }
            })

            $("#pw2").on("focusout", function(){
                if($("#pw1").val() == ""){
                    $("#pw1result").html("비밀번호를 입력하세요");
                    $("#pw1result").css("color","red");
                    $("#pw1result").css("text-align","center");
                }
                if($("#pw1").val() == $("#pw2").val()){
                    $("#pw2result").html("비밀번호가 일치합니다");
                    $("#pw2result").css("color","blue");
                    $("#pw2result").css("text-align","center");
                }else{
                    $("#pw2result").html("비밀번호가 일치하지 않습니다");
                    $("#pw2result").css("color","red");
                    $("#pw2result").css("text-align","center");
                }
            })

            $("#name").on("focusout", function(){
                var regex = /^[가-힇]{2,4}$/;
                var data = $("#name").val();
                var result = regex.exec(data);
                if(result != null){
                    $("#nameresult").html("이름이 올바르게 입력되었습니다");
                    $("#nameresult").css("color","blue");
                    $("#nameresult").css("text-align","center");
                }else{
                    $("#nameresult").html("이름이 양식에 맞지 않습니다");
                    $("#nameresult").css("color","red");
                    $("#nameresult").css("text-align","center");
                }
            })

            $("#phone").on("focusout", function(){
                var regex = /^01[0-1]-[0-9]{3,4}-[0-9]{4}$/;
                var data = $("#phone").val();
                var result = regex.exec(data);
                if(result != null){
                    $("#phoneresult").html("휴대폰번호가 올바르게 입력되었습니다");
                    $("#phoneresult").css("color","blue");
                    $("#phoneresult").css("text-align","center");
                }else{
                    $("#phoneresult").html("휴대폰번호가 양식에 맞지 않습니다");
                    $("#phoneresult").css("color","red");
                    $("#phoneresult").css("text-align","center");
                }
            })

            $("#email").on("focusout", function(){
                var regex = /^[a-z0-9]*@[a-z]{3,}\.[a-z]{2,4}$/;
                var data = $("#email").val();
                var result = regex.exec(data);
                if(result != null){
                    $("#emailresult").html("이메일이 올바르게 입력되었습니다");
                    $("#emailresult").css("color","blue");
                    $("#emailresult").css("text-align","center");
                }else{
                    $("#emailresult").html("이메일이 양식에 맞지 않습니다");
                    $("#emailresult").css("color","red");
                    $("#emailresult").css("text-align","center");
                }
            })
        </script>
        <script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
               
                var addr = ''; 
                var extraAddr = '';

                if (data.userSelectedType === 'R') { 
                    addr = data.roadAddress;
                } else { 
                    addr = data.jibunAddress;
                }

                if(data.userSelectedType === 'R'){
                   
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                   
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }                
                } 

                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;

                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</body>
</html>