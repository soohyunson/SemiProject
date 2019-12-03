<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<link href="https://fonts.googleapis.com/css?family=Bangers|Coming+Soon|Gloria+Hallelujah|Handlee|Rock+Salt&display=swap" rel="stylesheet">
<style>
@font-face { font-family: '양진체'; src: url('https://cdn.jsdelivr.net/gh/supernovice-lab/font@0.9/yangjin.woff') format('woff'); font-weight: normal; font-style: normal; }
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
	position: absolute;
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
    position:absolute;
    right:0px;
	list-style-type: none;
	width: 50%;
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

	background-color: #FFFFFF;
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
	background-color: #FFFFFF;
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
	width: 300px;
	height: 200px;
	position: relative;
	margin: auto;
    text-align: center;
	top: 0px;
	
}
.bottom {
	border: 1px solid black;
	height: 300px;
}
th{
	font-size: 25px;
}
#check{
	border-bottom: 1px solid black;
}
#login{
	background-color: white;
	border: 1px solid black;
}
#signupbtn{
	background-color: white;
	border: 1px solid black;
}

</style>
</head>
<body>
<div>
<img src="${pageContext.request.contextPath }/resources/img/backgroundMain.jpg" class="back" style="position:fixed; z-index:-500;filter: blur(4px);">
</div>
	<div class="container">
	
		
		<div class="twofloor"></div>
		<div class="fourthfloor">
		<%
				String uri = request.getHeader("Referer");
				System.out.println("uri : " + uri);
				request.getSession().setAttribute("uri", uri);
			%>

				
			<form action="login.mem" method="post" id="loginfrm">
				<table class="loginbox">
					<tr>
						<th>Login
					</tr>

					<tr>
						<th style="font-size:40px;">Login
					</tr>
					
					<tr>
						<td><input type="text" placeholder="Input your ID" name="id" >
					</tr>
					<tr>
						<td><input type="password" placeholder="Input your PASSWORD"
							name="pw" >
					</tr>
					<tr>
						<td><input type="button" value="login" id="login" style="background-color:black; color:white; border-radius:4px; width:86px;">
						<input type="button" id="signupbtn" value="Sign Up" style="background-color:black; color:white; border-radius:4px; width:86px;">
					</tr>
					<tr>
						<td id="check"><input type="checkbox">Remember My ID
					</tr>
					<tr>
					</tr>
				</table>
			</form>
	
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
			<a href="#"><img src="${pageContext.request.contextPath}/resources/img/icon1.png" class="mr-3" alt="..."
				style="width: 50px; height: 50px; margin-left: 10%; margin: 0px;"></a>
			<a href="#"><img src="${pageContext.request.contextPath}/resources/img/icon2.png" class="mr-3" alt="..."
				style="width: 50px; height: 50px; margin-left: 10%; margin: 0px;"></a>
			<a href="#"><img src="${pageContext.request.contextPath}/resources/img/icon3.png" class="mr-3" alt="..."
				style="width: 50px; height: 50px; margin-left: 10%; margin: 0px;"></a>
		</div>
		<br>
	</div>
	</div>
	
	<ul class="navi">
		<ul class="title">
			<li class="navi-title"><a href="#" style="font-family: 'Rock Salt', cursive; font-size:20px;">Don't Give Up</a></li>
		</ul>
		<ul class="itemList">

			
			<li class="navi-item" style="font-family: 양진체; font-weight:bold;">당신의 오늘을 배팅하라!</li>
		</ul>
	</ul>

	
	
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