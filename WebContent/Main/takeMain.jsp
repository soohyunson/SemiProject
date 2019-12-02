<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/takeMain.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/Main/slick/slick.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/Main/slick/slick-theme.css">
<link
	href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Bangers|Coming+Soon|Gloria+Hallelujah|Handlee|Rock+Salt&display=swap"
	rel="stylesheet">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/Main/slick/slick.min.js"></script>
<script>
    $(function () {
      $(".challengeOne").on("click", function () {
        location.href = "${pageContext.request.contextPath}/fromList.usboard?seq=${list.get(0).seq}";
      })
      $(".challengeTwo-1").on("click", function () {
        location.href = "${pageContext.request.contextPath}/fromList.usboard?seq=${list.get(1).seq}";
      })
      $(".challengeTwo-2").on("click", function () {
        location.href = "${pageContext.request.contextPath}/fromList.usboard?seq=${list.get(2).seq}";
      })
      $(".challengeTwo-3").on("click", function () {
        location.href = "${pageContext.request.contextPath}/fromList.usboard?seq=${list.get(3).seq}";
      })
     $('.slideShow').slick({
        infinite: true,
        slidesToShow: 3,
        slidesToScroll: 3
      });
      //아이콘 호버
      $("#exerciseCategory").mouseenter(function(){
    	  $(".firstCategoryImg").attr("src", $(".firstCategoryImg").attr("src").replace("gym.png", "gym (1).png"));  
    	  $(".firstCategoryImg").css("transform","translateY(-10px)");
    	  $(".firstCategoryImg").css("transition-duration","0.5s");
    	  });
    	$("#exerciseCategory").mouseleave(function(){
    		$(".firstCategoryImg").attr("src", $(".firstCategoryImg").attr("src").replace("gym (1).png", "gym.png"));  
      	  $(".firstCategoryImg").css("transform","translateY(0px)");     		
    	  });
    	$("#habitCategory").mouseenter(function(){
    		$(".secondCategoryImg").attr("src", $(".secondCategoryImg").attr("src").replace("healthy.png", "healthy (1).png"));
    		$(".secondCategoryImg").css("transform","translateY(-10px)");
    		$(".secondCategoryImg").css("transition-duration","0.5s");
    	  });
    	$("#habitCategory").mouseleave(function(){
    		$(".secondCategoryImg").attr("src", $(".secondCategoryImg").attr("src").replace("healthy (1).png", "healthy.png"));   
      	  $(".secondCategoryImg").css("transform","translateY(0px)");
    	  });
    	$("#studyCategory").mouseenter(function(){
    		$(".thirdCategoryImg").attr("src", $(".thirdCategoryImg").attr("src").replace("creativity.png", "creativity (1).png"));
    		$(".thirdCategoryImg").css("transform","translateY(-10px)");
    		$(".thirdCategoryImg").css("transition-duration","0.5s");
    	  });
    	$("#studyCategory").mouseleave(function(){
    		$(".thirdCategoryImg").attr("src", $(".thirdCategoryImg").attr("src").replace("creativity (1).png", "creativity.png"));   
      	  $(".thirdCategoryImg").css("transform","translateY(0px)");
    	  });
    	$("#healthCategory").mouseenter(function(){
    		$(".fourthCategoryImg").attr("src", $(".fourthCategoryImg").attr("src").replace("care.png", "care (1).png")); 
    		$(".fourthCategoryImg").css("transform","translateY(-10px)");
    		$(".fourthCategoryImg").css("transition-duration","0.5s");
    	  });
    	$("#healthCategory").mouseleave(function(){
    		$(".fourthCategoryImg").attr("src", $(".fourthCategoryImg").attr("src").replace("care (1).png", "care.png"));  
      	  $(".fourthCategoryImg").css("transform","translateY(0px)"); 
    	  });
    //
      $("#exerciseCategory").on("click",function(){
        location.href = "#exercise";
      })
      $("#habitCategory").on("click",function(){
        location.href = "#habit";
      })
      $("#studyCategory").on("click",function(){
        location.href = "#study";
      })
      $("#healthCategory").on("click",function(){
        location.href = "#health";
      })
      $(".giveBtn").on("click",function(){
    	  location.href = "donation.challenge";
      })
      $("#logout").on("click", function(){
           var result = confirm("로그아웃 하시겠습니까?");
           if(result){
              location.href="logout.mem";
           }
        })
        $("#mypage").on("click", function(){
           location.href="${pageContext.request.contextPath }/user/userMyPage.jsp";
        })
        })
        </script>
<style>
#logout {
	background-color: white;
	border: 1px solid black;
	width: 80px;
	height: 30px;
}

#mypage {
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
		<img class="headerbackground" src="${pageContext.request.contextPath }/resources/img/MainBackground.gif">
			<div class="navi">
				<div class="naviBox">
					<span class="logoText" style="font-family: 'Rock Salt', cursive;">Don't
						Give Up</span><span class="flex challengeLogo">테이크</span> <span
						class="flex naviCategory"><a href="#" class="giveBtn">기부</a>
						<c:choose>
							<c:when test="${loginResult == null }">
								<a href="${pageContext.request.contextPath }/login/login.jsp"
									class="login">로그인</a>
								<a href="${pageContext.request.contextPath }/login/signup.jsp"
									class="signUp">회원가입</a></span>
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
				<div class="firstText"
					style="font-family: 'East Sea Dokdo', cursive;">아무것도 하지 않으면</div>
				<div class="secondText"
					style="font-family: 'East Sea Dokdo', cursive;">아무 일도 일어나지
					않는다</div>
			</div>
		</div>
		<div class="container">
			<div class="mainCategory">
				<div id="exerciseCategory">
					<img
						src="${pageContext.request.contextPath }/resources/img/gym.png"
						class="categoryImg firstCategoryImg">
					<div class="categoryTitle firstCategoryTitle">운동</div>
				</div>
				<div id="habitCategory">
					<img
						src="${pageContext.request.contextPath }/resources/img/healthy.png"
						class="categoryImg secondCategoryImg">
					<div class="categoryTitle secondCategoryTitle">생활</div>
				</div>
				<div id="studyCategory">
					<img
						src="${pageContext.request.contextPath }/resources/img/creativity.png"
						class="categoryImg thirdCategoryImg">
					<div class="categoryTitle thirdCategoryTitle">공부</div>
				</div>
				<div id="healthCategory">
					<img
						src="${pageContext.request.contextPath }/resources/img/care.png"
						class="categoryImg fourthCategoryImg">
					<div class="categoryTitle fourthCategoryTitle">건강</div>
				</div>
			</div>
			<div class="challengeContainer">
				<div class="recruitment">모집 중</div>
				<div class="challengeMainBox">
					<div class="challengeOne">
						<div class="challengeOne-div">
							<img
								src="${pageContext.request.contextPath }/resources/img/exercise.png"
								class="challengeOneImg">
						</div>
						<div class="challengeOne-explan">${list.get(0).title}</div>
						<div class="challengeOne-explan2">${list.get(0).content }</div>
					</div>
					<div class="challegnSubBox">
						<div class="challengeTwo challengeTwo-1">
							<div class="challengeTwo-div">
								<img
									src="${pageContext.request.contextPath }/resources/img/exercise.png"
									class="challengeSubImg">
							</div>
							<div class="challengeTwo-explan">${list.get(1).title}</div>
							<div class="challengeTwo-explan2">${list.get(1).content}</div>
						</div>
						<div class="challengeTwo challengeTwo-2">
							<div class="challengeTwo-div">
								<img
									src="${pageContext.request.contextPath }/resources/img/exercise.png"
									class="challengeSubImg">
							</div>
							<div class="challengeTwo-explan">${list.get(2).title}</div>
							<div class="challengeTwo-explan2">${list.get(2).content}</div>
						</div>
						<div class="challengeTwo challengeTwo-3">
							<div class="challengeTwo-div">
								<img
									src="${pageContext.request.contextPath }/resources/img/exercise.png"
									class="challengeSubImg">
							</div>
							<div class="challengeTwo-explan">${list.get(3).title}</div>
							<div class="challengeTwo-explan2">${list.get(3).content}</div>
						</div>
					</div>
				</div>
				<div class="challegneMiddleContainer">
					<div class="recruitment" id="habit">생활</div>
					<div class="slideShow" align="center" style="width: 1200px;">
						<c:forEach var="i" begin="0" end="5">
							<div class="slideDiv" onclick="clickFun(${lifelist.get(i).seq})">
								<input type="hidden" class="seq" value="${lifelist.get(i).seq}">
								<img src="b.png" class="slideImg">
								<h3 class="slideTitle">${lifelist.get(i).title}</h3>
								<h5 class="slideExplan">${lifelist.get(i).content}</h5>
							</div>
						</c:forEach>

					</div>

					<div class="recruitment" id="study">공부</div>
					<div class="slideShow" align="center" style="width: 1200px;">
						<c:forEach var="i" begin="0" end="5">
							<div class="slideDiv" onclick="clickFun(${studylist.get(i).seq})">
								<img src="b.png" class="slideImg">
								<h3 class="slideTitle">${studylist.get(i).title}</h3>
								<h5 class="slideExplan">${studylist.get(i).content}</h5>
							</div>
						</c:forEach>
					</div>
					<div class="recruitment" id="health">건강</div>
					<div class="slideShow" align="center" style="width: 1200px;">
						<c:forEach var="i" begin="0" end="5">
							<div class="slideDiv"
								onclick="clickFun(${healthlist.get(i).seq})">
								<img src="b.png" class="slideImg">
								<h3 class="slideTitle">${healthlist.get(i).title}</h3>
								<h5 class="slideExplan">${healthlist.get(i).content}</h5>
							</div>
						</c:forEach>
					</div>
					<div class="recruitment" id="exercise">운동</div>
					<div class="slideShow" align="center" style="width: 1200px;">
						<c:forEach var="i" begin="0" end="5">
							<div class="slideDiv" onclick="clickFun(${exlist.get(i).seq})">
								<img src="b.png" class="slideImg">
								<h3 class="slideTitle">${exlist.get(i).title}</h3>
								<h5 class="slideExplan">${exlist.get(i).content}</h5>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<div class=""></div>
	</div>
	<div class="footer">
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
	<div class="scrollUp">
		<img src="scrollUp.png" style="width: 50px; height: 50px;">
	</div>
	</div>
	<script>
		console.log(40);
		function clickFun(seq){
			console.log(seq);
			$(location).attr("href","${pageContext.request.contextPath}/fromList.usboard?seq="+seq);
			}
	</script>
</body>

</html>