<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="takeMain.css">
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
  	})
  </script>
</head>
<body>
	<div class="wrap">
		<div class="header">
			<div class="navi">
				<div class="naviBox">
					<span class="flex"><img
						src="${pageContext.request.contextPath }/Img/b.png"
						class="naviLogo"></span> <span class="flex challengeLogo">기부</span>
					<span class="flex naviCategory"><a href="#" class="takeBtn">테이크</a><a
						href="#" class="login">로그인</a><a href="#" class="signUp">회원가입</a></span>
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
					<img src="${pageContext.request.contextPath }/Img/exercise.png"
						class="categoryImg">
					<div class="categoryTitle">운동</div>
				</div>
				<div>
					<img src="${pageContext.request.contextPath }/Img/exercise.png"
						class="categoryImg secondCategoryImg">
					<div class="categoryTitle">습관</div>
				</div>
				<div>
					<img src="${pageContext.request.contextPath }/Img/study.png"
						class="categoryImg">
					<div class="categoryTitle">공부</div>
				</div>
				<div>
					<img src="${pageContext.request.contextPath }/Img/exercise.png"
						class="categoryImg">
					<div class="categoryTitle">건강</div>
				</div>
			</div>
			<div class="challengeContainer">
				<div class="recruitment">모집 중</div>
				<div class="challengeMainBox">
					<div class="challengeOne">
						<div class="challengeOne-div">
							<img src="${pageContext.request.contextPath }/Img/exercise.png"
								class="challengeOneImg">
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
</body>
</html>