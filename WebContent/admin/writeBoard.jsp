<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Calistoga&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Indie+Flower&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Arapey|Russo+One&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="../resources/css/MyPageStyle.css">
</head>
<body>
	<div class="container">
		<br> <br> <br>



		<div class="twofloor">
			<br> <br>
			<div style="text-align: start; margin-left: 5%;">
				<a href="#" class="submenu">Make Challenge </a>
			</div>
			<br> <br>
			<form action="../write.adboard" enctype="multipart/form-data"
				method="post">
				<table border=1 align=center>

					<tr>

						<td><input type=text name=title placeholder="제목을 입력하세요."><input
							type=file name=file1>
					</tr>
					<tr>
						<td><textarea name="content" rows="30" cols="70"></textarea>
					</tr>
					<tr>
						<td><br>
							<div style="text-align: center">
								Give or Take : <input type="text" name="giveortake">
									
							</div> <br>
					</tr>
					<tr>
						<td><br>
							<div style="text-align: center">
								Category : <input type="text" name="category">
							</div> <br>
					</tr>
					<tr>
						<td><br>
							<div style="text-align: center">
								Start Date : <input type="text" name="startdate"
									id="startDatepicker">
							</div> <br>
					</tr>

					<tr>

						<td><br>
							<div style="text-align: center">
								End Date : <input type="text" name="enddate" id="endDatepicker">
							</div> <br>
					</tr>
					<tr>
						<td align=right>

							<button id=write>작성완료</button>
							<button type=button id=cancel>돌아가기</button>
					</tr>
				</table>



			</form>

			<br> <br>
		</div>



		<br>


		<div class="fourfloor">
			<br> <br>


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
				상호 : (주)미완성자들 | 주소 : 서울특별시 종로구 평창동 486 -20 | 사업자등록번호 : 234-88-00720
				| 대표자명 : 김세원<br> Copyright ⓒ2019 Miwansung inc, ltd. All rights
				reserved
			</div>
			<br>
			<div class="lastbar3" style="text-align: center">
				<a href="#"><img src="../icon1.png" class="mr-3" alt="..."
					style="width: 50px; height: 50px; margin-left: 10%; margin: 0px;"></a>
				<a href="#"><img src="../icon2.png" class="mr-3" alt="..."
					style="width: 50px; height: 50px; margin-left: 10%; margin: 0px;"></a>
				<a href="#"><img src="../icon3.png" class="mr-3" alt="..."
					style="width: 50px; height: 50px; margin-left: 10%; margin: 0px;"></a>
			</div>
			<br>
		</div>

	</div>

	<ul class="navi">
		<ul class="title">
			<li class="navi-title"><a href="#">Don't Give Up</a></li>
		</ul>
		<ul class="itemList">

			<li class="navi-item"><a href="#">HOME</a></li>
			<li class="navi-item"><a href="#">ADMIN PAGE</a></li>
		</ul>
	</ul>

	<script>
		$("#startDatepicker").datepicker({
			dateFormat : 'yy-mm-dd'
		})
		$("#endDatepicker").datepicker({
			dateFormat : 'yy-mm-dd'
		})

		$("#cancel").on("click", function() {
			location.href = "../list.adboard";
			//history.back();
			//history.go(-2);
		})
	</script>

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