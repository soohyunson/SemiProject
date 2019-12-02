<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>



<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<link
	href="https://fonts.googleapis.com/css?family=Calistoga&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/MyPageStyle.css">



</head>
<body>


	<div class="container">
		<br> <br> <br>

		<div class="onefloor" style="text-align: center;">
			<br>
			<div style="text-align: start; margin-left: 5%;">
				<a href="#" class="submenu">My Profile</a>
			</div>
			<br> <br>
			<div class="media">
				<img src="${pageContext.request.contextPath}/Img/profileicon.png"
					class="mr-3" alt="..."
					style="width: 100px; height: 100px; margin-left: 10%;">
				<div class="media-body">
					<br>
					<h5 class="mt-0">${id }님의마이페이지입니다.</h5>
					내일은 챌린지 성공하자!
				</div>
			</div>

		</div>

		

		<div class="threefloor">
			<br> <br>
			<div style="text-align: start; margin-left: 5%;">
				<a href="#" class="submenu">My Information</a><br><br>
				<div>회원아이디 : "${list.id }"</div><br>
				<div>회원이름 : "${list.name }</div><br>
				<div>회원번호 : "${list.phone }</div><br>
				<div>회원이메일 : "${list.email }</div>
			</div>
			
		</div>
	</div>


	<br>
	
	
	<a href = "${pageContext.request.contextPath}/infoupdate.jsp"><input type = button value = "정보수정"></a>
	<a href = "delete.mem?id=${id }"><input type = button value="회원탈퇴"></a>


	<div class="fourfloor">
		<br> <br>
		<div style="text-align: start; margin-left: 5%;">
			<a href="#" class="submenu">My Statics</a>
		</div>
		<br> <br>
		<div>
			<canvas id="myChart"></canvas>
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
			<a href="#"><img src="../Img/icon1.png" class="mr-3" alt="..."
				style="width: 50px; height: 50px; margin-left: 10%; margin: 0px;"></a>
			<a href="#"><img src="../Img/icon2.png" class="mr-3" alt="..."
				style="width: 50px; height: 50px; margin-left: 10%; margin: 0px;"></a>
			<a href="#"><img src="../Img/icon3.png" class="mr-3" alt="..."
				style="width: 50px; height: 50px; margin-left: 10%; margin: 0px;"></a>
		</div>
		<br>
	</div>
	<div class="category">
		<div class="wrapper">
			<br>
			<div class="sidebar">
				<a href="#">My Profile</a>
			</div>
			<div class="sidebar">
				<a href="myPageDetailView.mypage?id=${id }">My Information</a>
			</div>
			<div class="sidebar">
				<a href="#">My Point</a>
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
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>



</body>
</html>