<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
<noscript>
	<style>
.container, .category, .navi {
	display: none;
}

.noscriptmsg {
	text-align: center;
}
</style>
	<div class="noscriptmsg">
		이 사이트의 기능을 모두 활용하기 위해서는 자바스크립트를 활성화 시킬 필요가 있습니다. <br> <a
			href="http://www.enable-javascript.com/ko/" target="_blank">
			브라우저에서 자바스크립트를 활성화하는 방법</a>을 참고 하세요.
	</div>
</noscript>
<style>
body {
	margin: 0;
	padding: 0;
	background-color: #fff;
	box-sizing: border-box
}

.lastbar {
	margin: 0;
	overflow: hidden;
	padding: 0
}

.navi {
	position: fixed;
	top: 0;
	margin: 0;
	overflow: hidden;
	padding: 0;
	width: 60%;
	left: 20%;
	background-color: #fffFFF90;
	font-family: fantasy;
	font-size: 20px
}

.title {
	margin: 0;
	padding: 0;
	width: 50%
}

.itemList {
	position: absolute;
	margin: 0;
	padding: 0;
	right: 0;
	width: 50%
}

.navi-title {
	list-style-type: none;
	width: 50%;
	line-height: 72px;
	float: left;
	text-align: center;
	color: #1d1f21
}

.navi-item {
	list-style-type: none;
	width: 30%;
	line-height: 72px;
	float: left;
	text-align: center;
	color: #1d1f21
}

.navi-item2 {
	list-style-type: none;
	width: 25%;
	line-height: 30px;
	float: left;
	text-align: center;
	color: #1d1f21
}

.navi-item3 {
	list-style-type: none;
	width: 25%;
	line-height: 72px;
	float: left;
	text-align: center;
	color: #1d1f21
}

.navi-item>a {
	text-decoration: none;
	color: #1d1f21;
	width: 100%;
	height: 100%;
	display: block
}

.navi-item2>a {
	text-decoration: none;
	color: #1d1f21;
	width: 100%;
	height: 100%;
	display: block
}

.navi-item3>a {
	text-decoration: none;
	color: #1d1f21;
	width: 100%;
	height: 100%;
	display: block;
	font-weight: 700
}

.navi-title>a {
	text-decoration: none;
	color: #1d1f21;
	width: 100%;
	height: 100%;
	display: block
}

.navi-item>a:hover {
	background-color: orange
}

.container {
	background-color: #ededed;
	width: 60%;
	margin: auto;
	margin-top: 0
}

.onefloor {
	border-bottom: 3px solid #1d1f21;
	border-top: 3px solid #1d1f21;
	border-radius: 3px
}

.twofloor {
	border-bottom: 3px solid #1d1f21;
	border-radius: 3px;
	text-align: center
}

.threefloor {
	border-bottom: 3px solid #1d1f21;
	border-radius: 3px
}

.fivefloor {
	border-top: 3px solid #1d1f21;
	border-radius: 3px;
	width: 100%;
	background-color: #dcdcdc
}

.progress {
	display: inline-block;
	width: 90%;
	height: 10%
}

.category {
	position: fixed;
	top: 80px;
	left: 7%;
	width: 12%;
	height: 300px;
	border: 3px solid #1d1f21
}

.submenu {
	font-family: Calistoga, cursive;
	color: #1d1f21
}

.sidebar {
	height: 51px;
	font-family: Calistoga, cursive;
	text-align: center
}

.sidebar>a {
	height: 100%;
	color: #1d1f21
}

.payrow {
	height: 200%
}
</style>
<script>
	$(function() {
		$("#pointCharge").on(
				"click",
				function() {
					window.open("charge.pay", "",
							"width=510, height=800, left=200, menubar=no");
				})

		$("#pointRefunds")
				.on(
						"click",
						function() {
							window
									.open("refunds.pay", "",
											'minimizable=no,scrollbars=no,resizable=no,titlebar=no,location=no');
						})
	})
</script>
</head>
<body>
	<c:choose>
		<c:when test="${id ne null}">
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
					<h1 style="text-align: center; font-size: 50px;">${dto.point}</h1>
					<br> <br>
					<div
						style="width: 100%; height: 50px; background-color: darkgrey; text-align: center;">
						<div
							style="float: left; width: 50%; height: 100%; line-height: 50px;">
							<button id="pointCharge" type="button"
								class="btn btn-outline-dark">포인트 결제</button>

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
					<div class="row pt-5">
					<div class="col">
						<div class="accordion" id="accordionExample">
							<div class="card">
								<div class="card-header  bg-transparent" style="background-color: #EDEDED;" id="headingOne">
									<h5>
										<button class="btn btn-link" type="button"
											data-toggle="collapse" data-target="#collapseOne"
											aria-expanded="true" aria-controls="collapseOne">유의사항</button>
									</h5>
								</div>
								<div id="collapseOne" class="collapse hiden" data-parent="#accordionExample">
									<div class="card-body">
										<ul class="list-group list-group-flush">
											<li class="list-group-item">현금으로 포인트를 충전할 수 있습니다.</li>
											<li class="list-group-item">1000포인트 이상 1000포인트 단위로 입금이
												가능합니다.</li>
											<li class="list-group-item">365일 00:10 ~ 23:50 전환 가능
												합니다.</li>
											<li class="list-group-item">단, 시스템 정비 시간은(23:50 ~ 00:10)
												서비스 이용불가</li>
											<li class="list-group-item">개인의 실명이름 외에 법인사업자 또는 개인사업자의
												상호명, 동호회와 같은 모임명칭 등 기재사항이 등재되어 있는 계좌에 대해 입금이 제한될 수 있습니다.</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
					<c:choose>
						<c:when test="${fn:length(list) ne 0}">
							<c:forEach items="${list}" var="dto">
								<div class="row payrow border-secondary border-bottom">
									<div class="col text-center">${dto.point}원</div>
									<div class="col text-center">${dto.company}</div>
									<div class="col text-center">${dto.payment_date}</div>
									<c:choose>
										<c:when test="${dto.payment_date == today}">
											<div class="col text-center">
												<button type="button" class="btn btn-outline-danger">
													결제 취소</button>
											</div>
										</c:when>
										<c:otherwise>
											<div class="col text-center"></div>
										</c:otherwise>
									</c:choose>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<div class="row payrow border-secondary border-bottom">
								<div class="col text-center">구매한 포인트가 없습니다.</div>
							</div>
						</c:otherwise>
					</c:choose>
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
					<div class="lastbar2" style="text-align: center;">
						상호 : (주)미완성자들 | 주소 : 서울특별시 종로구 평창동 486 -20 | 사업자등록번호 :
						234-88-00720 | 대표자명 : 김세원 <br> Copyright ⓒ2019 Miwansung inc,
						ltd. All rights reserved
					</div>
					<br>
					<div class="lastbar3" style="text-align: center">
						<a href="#"><img
							src="${pageContext.request.contextPath}/resources/img/icon1.png"
							class="mr-3" alt="..."
							style="width: 50px; height: 50px; margin-left: 10%; margin: 0px;"></a>
						<a href="#"><img
							src="${pageContext.request.contextPath}/resources/img/icon2.png"
							class="mr-3" alt="..."
							style="width: 50px; height: 50px; margin-left: 10%; margin: 0px;"></a>
						<a href="#"><img
							src="${pageContext.request.contextPath}/resources/img/icon3.png"
							class="mr-3" alt="..."
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
							src="${pageContext.request.contextPath}/resources/img/reallogo.png"
							class="mr-3" alt="..."
							style="width: 135px; height: 50px; margin-left: 10%;"></a></li>
				</ul>
				<ul class="itemList">

					<li class="navi-item"><a href="#">GIVE OR TAKE</a></li>
					<li class="navi-item"><a href="#">CHALLENGE</a></li>
					<li class="navi-item"><a href="#">MYPAGE</a></li>
				</ul>
			</ul>
		</c:when>
		<c:otherwise>

		</c:otherwise>
	</c:choose>

</body>
</html>