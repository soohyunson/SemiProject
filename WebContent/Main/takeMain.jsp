<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="takeMain.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" type="text/css" href="slick/slick.css">
<link rel="stylesheet" type="text/css" href="slick/slick-theme.css">
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="slick/slick.min.js"></script>
<script>
    $(function () {
      $(".challengeOne").on("click", function () {
        location.href = "index.jsp";
      })
      $(".challengeTwo-1").on("click", function () {
        location.href = "good.jsp";
      })
      $(".challengeTwo-2").on("click", function () {
        location.href = "yes.jsp";
      })
      $(".challengeTwo-3").on("click", function () {
        location.href = "sd.jsp";
      })
      $('.slideShow').slick({
        infinite: true,
        slidesToShow: 3,
        slidesToScroll: 3
      });
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
      $("#logout").on("click", function(){
  			var result = confirm("로그아웃 하시겠습니까?");
  			if(result){
  				location.href="logout.mem";
  			}
  		})
  		$("#mypage").on("click", function(){
  			location.href="${pageContext.request.contextPath }/jsp/userMyPage.jsp";
  		})
    })
  </script>
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
					<span class="flex"><img
						src="${pageContext.request.contextPath }/Img/b.png"
						class="naviLogo"></span> <span class="flex challengeLogo">기부</span>
					<span class="flex naviCategory"><a href="#" class="takeBtn">테이크</a>
					<c:choose>
						<c:when test="${loginResult == null }">
							<a href="${pageContext.request.contextPath }/login/login.jsp" class="login">로그인</a>
							<a href="${pageContext.request.contextPath }/login/signup.jsp" class="signUp">회원가입</a></span>
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
					<img src="${pageContext.request.contextPath }/Img/exercise.png"
						class="categoryImg">
					<div class="categoryTitle" id="exerciseCategory">운동</div>
				</div>
				<div>
					<img src="${pageContext.request.contextPath }/Img/exercise.png"
						class="categoryImg secondCategoryImg">
					<div class="categoryTitle" id="habitCategory">습관</div>
				</div>
				<div>
					<img src="${pageContext.request.contextPath }/Img/study.png"
						class="categoryImg">
					<div class="categoryTitle" id="studyCategory">공부</div>
				</div>
				<div>
					<img src="${pageContext.request.contextPath }/Img/exercise.png"
						class="categoryImg">
					<div class="categoryTitle" id="healthCategory">건강</div>
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
						<div class="challengeOne-explan">[영상편집] 전공수업보다 디테일한 '쉬운'방법으로
							'고퀄'영상 만들기 [프리미어, 파이널컷]</div>
						<div class="challengeOne-explan2">[영상편집] 전공수업보다 디테일한</div>
					</div>
					<div class="challegnSubBox">
						<div class="challengeTwo challengeTwo-1">
							<div class="challengeTwo-div">
								<img src="${pageContext.request.contextPath }/Img/exercise.png"
									class="challengeSubImg">
							</div>
							<div class="challengeTwo-explan">월 60만원 벌면서 영어회화도 할 수 있다고?
								에어비앤비 트립호스트, 하루만에 되어 보기!</div>
							<div class="challengeTwo-explan2">월 60만원 벌면서 영어회화도 할 수 있다고?</div>
						</div>
						<div class="challengeTwo challengeTwo-2">
							<div class="challengeTwo-div">
								<img src="${pageContext.request.contextPath }/Img/exercise.png"
									class="challengeSubImg">
							</div>
							<div class="challengeTwo-explan">월 60만원 벌면서 영어회화도 할 수 있다고?
								에어비앤비 트립호스트, 하루만에 되어 보기!</div>
							<div class="challengeTwo-explan2">월 60만원 벌면서 영어회화도 할 수 있다고?</div>
						</div>
						<div class="challengeTwo challengeTwo-3">
							<div class="challengeTwo-div">
								<img src="${pageContext.request.contextPath }/Img/exercise.png"
									class="challengeSubImg">
							</div>
							<div class="challengeTwo-explan">월 60만원 벌면서 영어회화도 할 수 있다고?
								에어비앤비 트립호스트, 하루만에 되어 보기!</div>
							<div class="challengeTwo-explan2">월 60만원 벌면서 영어회화도 할 수 있다고?</div>
						</div>
					</div>
				</div>
				<div class="challegneMiddleContainer">
					<div class="recruitment" id="habit">습관</div>
					<div class="slideShow" align="center" style="width: 1200px;">
						<div class="slideDiv">
							<img src="b.png" class="slideImg">
							<h3 class="slideTitle">물먹기</h3 class="slideTitle">
							<h5 class="slideExplan">할수있을까?</h5>
						</div>
						<div class="slideDiv">
							<img src="b.png" class="slideImg">
							<h3 class="slideTitle">밥먹기</h3 class="slideTitle">
							<h5 class="slideExplan">할수있을까?</h5>
						</div>
						<div class="slideDiv">
							<img src="b.png" class="slideImg">
							<h3 class="slideTitle">커피먹기</h3 class="slideTitle">
							<h5 class="slideExplan">할수있을까?</h5>
						</div>
						<div class="slideDiv">
							<img src="b.png" class="slideImg">
							<h3 class="slideTitle">칼국수</h3 class="slideTitle">
							<h5 class="slideExplan">할수있을까?</h5>
						</div>
						<div class="slideDiv">
							<img src="b.png" class="slideImg">
							<h3 class="slideTitle">햄버거</h3 class="slideTitle">
							<h5 class="slideExplan">할수있을까?</h5>
						</div>
						<div class="slideDiv">
							<img src="b.png" class="slideImg">
							<h3 class="slideTitle">예스</h3 class="slideTitle">
							<h5 class="slideExplan">할수있을까?</h5>
						</div>
					</div>
					<div class="recruitment" id="study">공부</div>
					<div class="slideShow" align="center" style="width: 1200px;">
						<div class="slideDiv">
							<img src="b.png" class="slideImg">
							<h3 class="slideTitle">물먹기</h3 class="slideTitle">
							<h5 class="slideExplan">할수있을까?</h5>
						</div>
						<div class="slideDiv">
							<img src="b.png" class="slideImg">
							<h3 class="slideTitle">밥먹기</h3 class="slideTitle">
							<h5 class="slideExplan">할수있을까?</h5>
						</div>
						<div class="slideDiv">
							<img src="b.png" class="slideImg">
							<h3 class="slideTitle">커피먹기</h3 class="slideTitle">
							<h5 class="slideExplan">할수있을까?</h5>
						</div>
						<div class="slideDiv">
							<img src="b.png" class="slideImg">
							<h3 class="slideTitle">칼국수</h3 class="slideTitle">
							<h5 class="slideExplan">할수있을까?</h5>
						</div>
						<div class="slideDiv">
							<img src="b.png" class="slideImg">
							<h3 class="slideTitle">햄버거</h3 class="slideTitle">
							<h5 class="slideExplan">할수있을까?</h5>
						</div>
						<div class="slideDiv">
							<img src="b.png" class="slideImg">
							<h3 class="slideTitle">예스</h3 class="slideTitle">
							<h5 class="slideExplan">할수있을까?</h5>
						</div>
					</div>
					<div class="recruitment" id="health">건강</div>
					<div class="slideShow" align="center" style="width: 1200px;">
						<div class="slideDiv">
							<img src="b.png" class="slideImg">
							<h3 class="slideTitle">물먹기</h3 class="slideTitle">
							<h5 class="slideExplan">할수있을까?</h5>
						</div>
						<div class="slideDiv">
							<img src="b.png" class="slideImg">
							<h3 class="slideTitle">밥먹기</h3 class="slideTitle">
							<h5 class="slideExplan">할수있을까?</h5>
						</div>
						<div class="slideDiv">
							<img src="b.png" class="slideImg">
							<h3 class="slideTitle">커피먹기</h3 class="slideTitle">
							<h5 class="slideExplan">할수있을까?</h5>
						</div>
						<div class="slideDiv">
							<img src="b.png" class="slideImg">
							<h3 class="slideTitle">칼국수</h3 class="slideTitle">
							<h5 class="slideExplan">할수있을까?</h5>
						</div>
						<div class="slideDiv">
							<img src="b.png" class="slideImg">
							<h3 class="slideTitle">햄버거</h3 class="slideTitle">
							<h5 class="slideExplan">할수있을까?</h5>
						</div>
						<div class="slideDiv">
							<img src="b.png" class="slideImg">
							<h3 class="slideTitle">예스</h3 class="slideTitle">
							<h5 class="slideExplan">할수있을까?</h5>
						</div>
					</div>
					<div class="recruitment" id="exercise">운동</div>
					<div class="slideShow" align="center" style="width: 1200px;">
						<div class="slideDiv">
							<img src="b.png" class="slideImg">
							<h3 class="slideTitle">물먹기</h3 class="slideTitle">
							<h5 class="slideExplan">할수있을까?</h5>
						</div>
						<div class="slideDiv">
							<img src="b.png" class="slideImg">
							<h3 class="slideTitle">밥먹기</h3 class="slideTitle">
							<h5 class="slideExplan">할수있을까?</h5>
						</div>
						<div class="slideDiv">
							<img src="b.png" class="slideImg">
							<h3 class="slideTitle">커피먹기</h3 class="slideTitle">
							<h5 class="slideExplan">할수있을까?</h5>
						</div>
						<div class="slideDiv">
							<img src="b.png" class="slideImg">
							<h3 class="slideTitle">칼국수</h3 class="slideTitle">
							<h5 class="slideExplan">할수있을까?</h5>
						</div>
						<div class="slideDiv">
							<img src="b.png" class="slideImg">
							<h3 class="slideTitle">햄버거</h3 class="slideTitle">
							<h5 class="slideExplan">할수있을까?</h5>
						</div>
						<div class="slideDiv">
							<img src="b.png" class="slideImg">
							<h3 class="slideTitle">예스</h3 class="slideTitle">
							<h5 class="slideExplan">할수있을까?</h5>
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
					| 대표자명 : 김세원<br> Copyright ⓒ2019 Miwansung inc, ltd. All
					rights reserved
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
</body>

</html>