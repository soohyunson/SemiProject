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
body {
	margin: 0px;
	padding: 0px;
	background-color: #FFFFFF;
}

.lastbar {
	margin: 0px;
	overflow: hidden;
	padding: 0px;
}

.navi {
	position: fixed;
	top: 0px;
	margin: 0px;
	overflow: hidden;
	padding: 0px;
	width: 60%;
	left: 20%;
	background-color: #FFFFFF90;
	font-family: fantasy;
	font-size: 20px;
}

.title {
	margin: 0px;
	padding: 0px;
	width: 50%;
}

.itemList {
	position: absolute;
	margin: 0px;
	padding: 0px;
	right: 0px;
	width: 50%;
}

.navi-title {
	list-style-type: none;
	width: 50%;
	line-height: 72px;
	float: left;
	text-align: center;
	color: #1D1F21;
}

.navi-item {
	list-style-type: none;
	width: 30%;
	line-height: 72px;
	float: left;
	text-align: center;
	color: #1D1F21;
}

.navi-item2 {
	list-style-type: none;
	width: 25%;
	line-height: 30px;
	float: left;
	text-align: center;
	color: #1D1F21;
}

.navi-item3 {
	list-style-type: none;
	width: 25%;
	line-height: 72px;
	float: left;
	text-align: center;
	color: #1D1F21;
}

.navi-item>a {
	text-decoration: none;
	color: #1D1F21;
	width: 100%;
	height: 100%;
	display: block;
}

.navi-item2>a {
	text-decoration: none;
	color: #1D1F21;
	width: 100%;
	height: 100%;
	display: block;
}

.navi-item3>a {
	text-decoration: none;
	color: #1D1F21;
	width: 100%;
	height: 100%;
	display: block;
	font-weight: bold;
}

.navi-title>a {
	text-decoration: none;
	color:#1D1F21;
	width: 100%;
	height: 100%;
	display: block;
}

.navi-item>a:hover {
	background-color: orange;
}

.container {
	background-color: #ededed;
	width: 60%;
	margin: auto;
	margin-top: 0px;
}

.onefloor {
	border-bottom: 3px solid #1D1F21;
	border-top: 3px solid #1D1F21;
	border-radius: 3px;
}

.twofloor {
	border-bottom: 3px solid #1D1F21;
	border-radius: 3px;
}

.threefloor {
	border-bottom: 3px solid #1D1F21;
	border-radius: 3px;
	height: 50px;
}

.fivefloor {
	border-top: 3px solid #1D1F21;
	border-radius: 3px;
	width: 100%;
	background-color: gainsboro;
}

.progress {
	display: inline-block;
	width: 90%;
	height: 10%;
}

.submenu {
	font-family: 'Calistoga', cursive;
	color: #7019FF;
}

.sidebar {
	height: 51px;
	font-family: 'Calistoga', cursive;
	text-align: center;
}

.sidebar>a {
	height: 100%;
	color: #FFFFFF;
}

.fourthfloor {
	height: 700px;
}

table {
	border: 1px solid #1D1F21;
	width: 300px;
	height: 200px;
	position: relative;
	margin: auto;
    text-align: center;
	top: 200px;
}
.bottom {
	border: 1px solid black;
	height: 300px;
}
th{
	font-size: 25px;
	}
</style>
</head>
<body>
	<div class="container">
		<br> <br> <br>
		<div class="twofloor"></div>
		<div class="fourthfloor">
			<form action="login.mem" method="post" id="loginfrm">
				<table class="loginbox">
					<tr>
						<th>Login
					</tr>
					<tr>
						<td>Don't Give Up!
					</tr>
					<tr>
						<td><input type="text" placeholder="Input your ID" name="id">
					</tr>
					<tr>
						<td><input type="password" placeholder="Input your PASSWORD"
							name="pw">
					</tr>
					<tr>
						<td><input type="button" value="login" id="login">
						<input type="button" id="signupbtn" value="Sign Up">
					</tr>
					<tr>
						<td><input type="checkbox">Remember My ID
					</tr>
					<tr>
					</tr>
				</table>
			</form>
		</div>
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
			type : 'line',

			// The data for our dataset
			data : {
				labels : [ 'January', 'February', 'March', 'April', 'May',
						'June', 'July' ],
				datasets : [ {
					label : 'My First dataset',
					backgroundColor : 'rgb(255, 99, 132)',
					borderColor : 'rgb(255, 99, 132)',
					data : [ 0, 10, 5, 2, 20, 30, 45 ]
				} ]
			},

			// Configuration options go here
			options : {}
		});//#<div class="conpt>
	</script>
	<script>
		$("#signupbtn").on("click", function() {
			location.href = "signup.jsp"
		})
		
		$("#login").on("click", function(){
			$("#loginfrm").submit();
		})
	</script>

</body>
</html>