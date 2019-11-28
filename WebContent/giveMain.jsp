<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="giveMain.css">
<style>
	#logout{
		background-color: white;
		border: 1px solid black;
		width: 80px;
		height: 30px;
	}
	#mypage{
		background-color: white;
		border: 1px solid black;
		width: 90px;
		height: 30px;
	}
</style>
</head>
<body>
<div class="wrap">
		<div class="header">
			<div class="navi">
				<div class="naviBox">
					<span class="flex"><img src="b.png" class="naviLogo"></span>
					<span class="flex challengeLogo">테이크</span> <span
						class="flex naviCategory"><a href="#" class="giverBtn">기부</a>
						
						<c:choose>
						<c:when test="${loginResult == null }">
							<a href="login.jsp" class="login">로그인</a>
							<a href="signup.jsp" class="signUp">회원가입</a></span>
						</c:when>
						<c:otherwise>
							${id }님
							<button id="mypage">마이페이지</button>
							<button id="logout">로그아웃</button>
						</c:otherwise>
						</c:choose>
						
				</div>
			</div>
			<div class="headerExplan">
				<div class="firstText">122만건의 거래, 98.2%의 만족도</div>
				<div class="secondText">싸우자, 나가자, 도전하자!</div>
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
						<div class="challengeOne-explan">[영상편집] 전공수업보다 디테일한 '쉬운'방법으로
							'고퀄'영상 만들기 [프리미어, 파이널컷]</div>
						<div class="challengeOne-explan2">[영상편집] 전공수업보다 디테일한</div>
					</div>
					<div class="challegnSubBox">
						<div class="challengeTwo">
							<div class="challengeTwo-div">
								<img src="exercise.png" class="challengeSubImg">
							</div>
							<div class="challengeTwo-explan">월 60만원 벌면서 영어회화도 할 수 있다고?
								에어비앤비 트립호스트, 하루만에 되어 보기!</div>
							<div class="challengeTwo-explan2">월 60만원 벌면서 영어회화도 할 수 있다고?</div>
						</div>
						<div class="challengeTwo">
							<div class="challengeTwo-div">
								<img src="exercise.png" class="challengeSubImg">
							</div>
							<div class="challengeTwo-explan">월 60만원 벌면서 영어회화도 할 수 있다고?
								에어비앤비 트립호스트, 하루만에 되어 보기!</div>
							<div class="challengeTwo-explan2">월 60만원 벌면서 영어회화도 할 수 있다고?</div>
						</div>
						<div class="challengeTwo">
							<div class="challengeTwo-div">
								<img src="exercise.png" class="challengeSubImg">
							</div>
							<div class="challengeTwo-explan">월 60만원 벌면서 영어회화도 할 수 있다고?
								에어비앤비 트립호스트, 하루만에 되어 보기!</div>
							<div class="challengeTwo-explan2">월 60만원 벌면서 영어회화도 할 수 있다고?</div>
						</div>
					</div>
					<!-- <div class="challengeTwo">sasad</div>
          <div class="challengeThree">sasad</div> -->
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script>
  	$(function(){
  		$(".challengeOne").on("click",function(){
  			location.href = "index.jsp";
  		})
  		$(".challengeTwo-1").on("click",function(){
  			location.href = "good.jsp";
  		})  	
  		$(".challengeTwo-2").on("click",function(){
  			location.href = "yes.jsp";
  		})  	
  		$(".challengeTwo-3").on("click",function(){
  			location.href = "sd.jsp";
  		})
  		$("#logout").on("click", function(){
  			var result = confirm("로그아웃 하시겠습니까?");
  			if(result){
  				location.href="logout.mem";
  			}
  		})
  		$("#mypage").on("click", function(){
  			location.href="userMyPage.jsp";
  		})
  	})
  </script>
</body>
</html>