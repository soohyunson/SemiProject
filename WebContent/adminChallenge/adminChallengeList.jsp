<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
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
	href="resources/css/MyPageStyle.css">

<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
	<div class="container">
		<br>
		<br>
		<br>



		<div class="threefloor">
			<br>
			<br>
			<div style="text-align: start; margin-left: 5%;">
				<a href="#" class="submenu">Challenge List</a>
			</div>
			<br>
			<br>
			<table border=5 align=center>
				<tr>
					<th width="1000" colspan=6 align=center><font color="blue">챌린지
							게시판</font></th>
				</tr>
				<tr>
					<td></td>
					<td width="400" align="center">Title</td>
					<td width="200" align="center">Start_Date</td>
					<td width="200" align="center">End_Date</td>
					<td width="40" align="center">End</td>
					<td width="40" align="center">total_partcipate</td>
				</tr>
				<tr>
					<td width="1000" colspan=6 align=center><c:choose>
							<c:when test="${dto == null }">
								<tr>
									<td>표시할 내용이 없습니다
								</tr>
							</c:when>
							<c:otherwise>

								<c:forEach items="${dto}" var="item">
									<tr>
										<td>${item.seq }
										<td><a
											href="${pageContext.request.contextPath}/detailview.bo?seq=${item.seq}">${item.title }</a>
										<td>${item.start_date }
										<td>${item.end_date }
										<td>${item.end }
										<td>${item.total_participate }
									</tr>
								</c:forEach>

							</c:otherwise>
						</c:choose></td>

				</tr>
				<tr>
					<td width="1000" colspan=6 align=center>${page}</td>
				</tr>
				<tr>
					<td width="1000" colspan=6 align=right><input type="button"
						id=write value="글쓰기"><input type="button" id=back2
						value="돌아가기"></td>
				</tr>
				<script>
					$("#write").on("click", function() {
						location.href = "Challenge/writeBoard.jsp";
					})
					$("#back2").on("click", function() {
						location.href = "index.jsp";
					})
				</script>

			</table>

		</div>

		<br>



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
				<a href="#"><img src="icon1.png" class="mr-3" alt="..."
					style="width: 50px; height: 50px; margin-left: 10%; margin: 0px;"></a>
				<a href="#"><img src="icon2.png" class="mr-3" alt="..."
					style="width: 50px; height: 50px; margin-left: 10%; margin: 0px;"></a>
				<a href="#"><img src="icon3.png" class="mr-3" alt="..."
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