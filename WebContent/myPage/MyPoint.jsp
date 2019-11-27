<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<title>My Page</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.0.2.min.js"
	type="application/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<link
	href="https://fonts.googleapis.com/css?family=Calistoga&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
body {
	margin: 0px;
	padding: 0px;
	background-color: #FFFFFF;
	box-sizing: border-box;
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
	color: #1D1F21;
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
	text-align: center;
}

.threefloor {
	border-bottom: 3px solid #1D1F21;
	border-radius: 3px;
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

.category {
	position: fixed;
	top: 80px;
	left: 7%;
	width: 12%;
	height: 300px;
	border: 3px solid #1D1F21;
}

.submenu {
	font-family: 'Calistoga', cursive;
	color: #1D1F21;
}

.sidebar {
	height: 51px;
	font-family: 'Calistoga', cursive;
	text-align: center;
}

.sidebar>a {
	height: 100%;
	color: #1D1F21;
}

.payrow {
	height: 200%;
}
</style>
<script>
$(function () {
	$("#pointCharge").on("click", function(){
		alert("dd");
	})
})
	
</script>
</head>
<body>
	<div class="container">
		<br> <br> <br>

		<div class="onefloor" style="text-align: center;">
			<br> <br>
			<div style="text-align: start; margin-left: 5%;">
				<a href="#" class="submenu" style="font-size: 60px;">My Point</a>
			</div>
			<br> <br>
		</div>

		<div class="twofloor">
			<br> <br>
			<div style="text-align: start; margin-left: 5%;">
				<a href="#" class="submenu">Remained Point </a>
			</div>
			<br> <br>
			<h1 style="text-align: center; font-size: 50px;">45,000</h1>
			<br> <br>
			<div
				style="width: 100%; height: 50px; background-color: darkgrey; text-align: center;">
				<div
					style="float: left; width: 50%; height: 100%; line-height: 50px;">
					<button id="pointCharge" type="button" class="btn btn-outline-dark">포인트 결제</button>

				</div>
				<div
					style="float: left; width: 50%; height: 100%; line-height: 50px;">
					<!-- <button style="background-color: darkgrey; border: none; height:100%;">�ъ�명�� ��湲�</button>-->
					<button id="pointRefunds" type="button"
						class="btn btn-outline-dark">포인트 환급</button>

				</div>

			</div>
		</div>
		<div class="threefloor">
			<div class="row border-dark border-bottom">
				<div class="col text-center">금액</div>
				<div class="col text-center">결제수단</div>
				<div class="col text-center">구매일자</div>
				<div class="col text-center">기타</div>
			</div>
			<div class="row payrow border-secondary border-bottom">
				<div class="col text-center">1000 원</div>
				<div class="col text-center">페이코</div>
				<div class="col text-center">2019-07-19</div>
				<div class="col text-center">
					<button type="button" 
					class="btn btn-outline-danger" disabled>
						결제 취소</button>
				</div>
			</div>
			<div class="row payrow border-secondary border-bottom">
				<div class="col text-center">1000 원</div>
				<div class="col text-center">페이코</div>
				<div class="col text-center">2019-07-19</div>
				<div class="col text-center">
					<button type="button" 
					class="btn btn-outline-danger">
						결제 취소</button>
				</div>
			</div>
		</div>

		<div class="fourfloor"></div>
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
				<li class="navi-item2"><a href="#">개인정보 취급방침</a></li>
				<li class="navi-item2"><a href="#">미완성 센터</a></li>
				<li class="navi-item2"><a href="#"></a></li>
				<br>
				<br>
			</ul>
			<div class="lastbar2" style="text-align: center;">상호 : (주)미완성자들
				| 주소 : 서울특별시 종로구 평창동 486 -20 | 사업자등록번호 : 234-88-00720 | 대표자명 : 김세원
				<br>
				Copyright ⓒ2019 Miwansung inc, ltd. All rights reserved</div>
			<br>
			<div class="lastbar3" style="text-align: center">
				<a href="#"><img src="../Img/icon1.png" class="mr-3" alt="..."
					style="width: 50px; height: 50px; margin-left: 10%; margin: 0px;"></a>
				<a href="#"><img src="../Img/icon2.png" class="mr-3" alt="..."
					style="width: 50px; height: 50px; margin-left: 10%; margin: 0px;"></a>
				<a href="#"><img src="../Img/icon3.png" class="mr-3" alt="..."
					style="width: 50px; height: 50px; margin-left: 10%; margin: 0px;"></a>
			</div>
			<br>
		</div>

	</div>
	<div class="category">
		<div class="wrapper">
			<br>
			<div class="sidebar">
				<a href="#">My Profile</a>
			</div>
			<div class="sidebar">
				<a href="#">My Information</a>
			</div>
			<div class="sidebar">
				<a href="#">My Challenge</a>
			</div>
			<div class="sidebar">
				<a href="#">My Point</a>
			</div>
			<div class="sidebar">
				<a href="#">Membership Withdrawal</a>
			</div>
		</div>
	</div>
	<ul class="navi">
		<ul class="title">
			<li class="navi-title"><a href="#"><img
					src="../Img/reallogo.png" class="mr-3" alt="..."
					style="width: 135px; height: 50px; margin-left: 10%;"></a></li>
		</ul>
		<ul class="itemList">

			<li class="navi-item"><a href="#">GIVE OR TAKE</a></li>
			<li class="navi-item"><a href="#">CHALLENGE</a></li>
			<li class="navi-item"><a href="#">MYPAGE</a></li>
		</ul>
	</ul>

</body>
</html>