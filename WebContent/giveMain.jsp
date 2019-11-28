<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="giveMain.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	$(function() {
		$(".challengeOne").on("click", function() {
			location.href = "index.jsp";
		})
		$(".challengeTwo-1").on("click", function() {
			location.href = "good.jsp";
		})
		$(".challengeTwo-2").on("click", function() {
			location.href = "yes.jsp";
		})
		$(".challengeTwo-3").on("click", function() {
			location.href = "sd.jsp";
		})
	})
</script>
</head>
<body>
	<div class="wrap">
		<div class="header">
			<div class="navi">
				<div class="naviBox">
					<span class="flex"><img src="b.png" class="naviLogo"></span>
					<span class="flex challengeLogo">테이크</span> <span
						class="flex naviCategory"><a href="#" class="giverBtn">기부</a><a
						href="#" class="login">로그인</a><a href="#" class="signUp">회원가입</a></span>
				</div>
			</div>
			<div class="headerExplan">
				<div class="firstText">test</div>
				<div class="secondText">test</div>
			</div>
		</div>
		<div class="container">
			<div class="mainCategory">
				<div>
					<img src="exercise.png" class="categoryImg">
					<div class="categoryTitle">운동</div>
				</div>
				<div>
					<img src="exercise.png" class="categoryImg secondCategoryImg">
					<div class="categoryTitle">습관</div>
				</div>
				<div>
					<img src="study.png" class="categoryImg">
					<div class="categoryTitle">공부</div>
				</div>
				<div>
					<img src="exercise.png" class="categoryImg">
					<div class="categoryTitle">건강</div>
				</div>
			</div>

			<div class="challengeContainer">
				<div class="recruitment">모집 중</div>
				<div class="challengeMainBox">
					<div class="challengeOne">
						<div class="challengeOne-div">
							<img src="exercise.png" class="challengeOneImg">
						</div>
						<div class="challengeOne-explan">${list.get(0).title }</div>
						<div class="challengeOne-explan2">${list.get(0).content}</div>
					</div>
					<div class="challegnSubBox">
						<c:forEach var="i" begin="1" end="3">
							<div class="challengeTwo challengeTwo-1">

								<div class="challengeTwo-div">
									<img src="exercise.png" class="challengeSubImg">
								</div>
								<div class="challengeTwo-explan">${list.get(i).title }</div>
								<div class="challengeTwo-explan2">${list.get(i).content }</div>
							</div>
							
						</c:forEach>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>