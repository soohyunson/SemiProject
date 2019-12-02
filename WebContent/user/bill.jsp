<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<link
	href="https://fonts.googleapis.com/css?family=Calistoga&display=swap"
	rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Bangers|Coming+Soon|Gloria+Hallelujah|Handlee|Rock+Salt&display=swap" rel="stylesheet">
<style>
@font-face { font-family: 'BMEULJIRO'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/BMEULJIRO.woff') format('woff'); font-weight: normal; font-style: normal; }
 /* 양진체 */
@font-face { font-family: '양진체'; src: url('https://cdn.jsdelivr.net/gh/supernovice-lab/font@0.9/yangjin.woff') format('woff'); font-weight: normal; font-style: normal; }
.lastbar {
	margin: 0px;
	overflow: hidden;
	padding: 0px;
}

.navi {
	position: absolute;
	top: 0px;
	margin: 0px;
	overflow: hidden;
	padding: 0px;
	width: 60%;
	left: 20%;
	background-color: white;
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
	text-align: right;
	font-family: '양진체';
	font-weight: bold;
}

.navi-title {
	list-style-type: none;
	width: 50%;
	line-height: 72px;
	float: left;
	text-align: center;
	color: black;
}

.navi-item {
	list-style-type: none;
	width: 30%;
	line-height: 72px;
	float: left;
	text-align: right;
	color: black;
}

.navi-item2 {
	list-style-type: none;
	width: 25%;
	line-height: 30px;
	float: left;
	text-align: center;
	color: black;
}

.navi-item3 {
	list-style-type: none;
	width: 25%;
	line-height: 72px;
	float: left;
	text-align: center;
	color: black;
}

.navi-item>a {
	text-decoration: none;
	color: black;
	width: 100%;
	height: 100%;
	display: block;
}

.navi-item2>a {
	text-decoration: none;
	color: black;
	width: 100%;
	height: 100%;
	display: block;
}

.navi-item3>a {
	text-decoration: none;
	color: black;
	width: 100%;
	height: 100%;
	display: block;
	font-weight: bold;
}

.navi-title>a {
	text-decoration: none;
	color: black;
	width: 100%;
	height: 100%;
	display: block;
}

.container {
	background-color: white;
	width: 60%;
	margin: auto;
	margin-top: 0px;
}

.onefloor {
	border-bottom: 3px solid black;
	border-top: 3px solid black;
	border-radius: 3px;
}

.twofloor {
	border-bottom: 3px solid black;
	border-radius: 3px;
}

.threefloor {
	border-bottom: 3px solid black;
	border-radius: 3px;
	height: 50px;
	font-size: 30px;
	font-family: 'BMEULJIRO';
}

.fivefloor {
	border-top: 3px solid black;
	border-radius: 3px;
	width: 100%;
	background-color: white;
}

.progress {
	display: inline-block;
	width: 90%;
	height: 10%;
}

.category {
	position: fixed;
	top: 80px;
	right: 3%;
	width: 16%;
	height: 500px;
	border: 3px solid black;
}

#enjoybtn {
	width: 80%;
	height: 50px;
	font-size: 20px;
	position: relative;
	top: 430px;
}

.submenu {
	font-family: 'Calistoga', cursive;
	color: black;
}

.sidebar {
	height: 51px;
	font-family: 'Calistoga', cursive;
	text-align: center;
}

.sidebar>a {
	height: 100%;
	color: #FFFFFF;
}

.menubtn {
	width: 24%;
	height: 100%;
	font-size: 20px;
	background: none;
	padding: 0;
	margin: 0;
	border: 0px solid black;
}

#condition {
	height: 450px;
	border: 1px solid black;
	background-color: white;
	overflow-y: scroll;
	
}

.fourthfloor {
	height: 500px;
}

.fifthfloor {
	height: 150px;
	text-align: center;
}

.detailfloor, .myInfo {
	border-bottom: 2px solid black;
	border-top: 2px solid black;
	margin-top: 40px;
}
#logout{
	border: none;
	background-color: white;
	
}
#pointCharge{
	background-color: white;
	border: 1px solid black;
}
#confirm{
	background-color: white;
	border: 1px solid black;
}
</style>
<script type="text/javascript">
	$(function() {
        $("#pointCharge").on("click",function() {
    		window.open("charge.pay", "", "width=510, height=800, left=200, menubar=no");
    	})
    	
    	$("#confirm").on("click",function(){
            if($("#check").prop("checked")){
            	if($("#pp-point").html() <= $("#userPoint").html()){
                    if(confirm("진행하시겠습니까?")){
                        location.href="participation.usboard?seq=${challenge.seq }&pp_point=${challenge.pp_point }&userId=${userId.id }&userPoint=${userId.point}";
                    }
            	}else{
            		alert("포인트를 충전해주십시오")
            	}
            }else{
                alert("약관에 동의해주십시오");
            }
        })
	})
</script>
<noscript>
	<style>
.container, .category, .navi, .fivefloor {
	display: none;
}

.noscriptmsg {
	text-align: center;
}
.detailInfo{
	font-size: 15px;
	
}
</style>
	<div class="noscriptmsg">
		이 사이트의 기능을 모두 활용하기 위해서는 자바스크립트를 활성화 시킬 필요가 있습니다. <br> <a
			href="http://www.enable-javascript.com/ko/" target="_blank">
			브라우저에서 자바스크립트를 활성화하는 방법</a>을 참고 하세요.
	</div>
</noscript>
</head>
<body>
<div>
<img src ="${pageContext.request.contextPath}/resources/img/earth.jpg" style="z-index: -500; width: 100%; position: fixed; filter: blur(4px);">
	</div>
	<div class="container">
	
		<br> <br> <br>
		<div class="twofloor"></div>
		<div class="threefloor">챌린지도전</div>

		<div class="fourthfloor">
			<br>
			<div id="condition">
				돈기브업 통합 서비스 약관
				<br>제 1 장 환영합니다!
				<br>제 1 조 (목적 및 정의)
				<br>주식회사 돈기브업(이하 ‘회사’)가 제공하는 서비스를 이용해 주셔서 감사합니다.
				<br>회사는 여러분이 회사가 제공하는 다양한 인터넷과 모바일 서비스에 더 가깝고 편리하게 다가갈 수 있도록 ‘통합서비스약관’(이하 ‘본 약관’)을 마련하였습니다.
				<br>여러분은 본 약관에 동의함으로써 통합서비스에 가입하여 통합서비스를 이용할 수 있습니다.
				<br>본 약관은 여러분이 통합서비스를 이용하는 데 필요한 권리, 의무 및 책임사항, 이용조건 및 절차 등 기본적인 사항을 규정하고 있으므로 조금만 시간을 내서 주의 깊게 읽어주시기 바랍니다.
				<br>제 2 조 (약관의 효력 및 변경)
				<br>① 본 약관의 내용은 통합서비스의 화면에 게시하거나 기타의 방법으로 공지하고, 본 약관에 동의한 여러분 모두에게 그 효력이 발생합니다.
				<br>② 회사는 필요한 경우 관련 법령을 위배하지 않는 범위 내에서 본 약관을 변경할 수 있습니다.
				<br>③ 회사가 전 항에 따라 공지 또는 통지를 하면서 공지 또는 통지일로부터 개정약관 시행일 7일 후까지 거부의사를 표시하지 아니하면 변경된 약관을 승인한 것으로 봅니다.
				<br>④ 여러분은 변경된 약관에 대하여 거부의사를 표시함으로써 이용계약의 해지를 선택할 수 있습니다. 
				<br>⑤ 본 약관은 여러분이 본 약관에 동의한 날로부터 본 약관 제13조에 따른 이용계약의 해지 시까지 적용하는 것을 원칙으로 합니다. 단, 본 약관의 일부 조항은 이용계약의 해지 후에도 유효하게 적용될 수 있습니다
				<br>제 3 조 (약관 외 준칙)
				<br>본 약관에 규정되지 않은 사항에 대해서는 관련 법령 또는 통합서비스를 구성하는 개별 서비스의 운영정책 및 규칙의 규정에 따릅니다. 또한 본 약관과 세부지침의 내용이 충돌할 경우 세부지침에 따릅니다.
				<br>제 2 장 통합서비스 이용계약
				<br>제 4 조 (계약의 성립)
				<br>① 통합서비스에 가입하기 위해서는 계정이 필요합니다. 계정이 없으신 경우 계정을 먼저 생성하시기 바랍니다.
				<br>② 통합서비스 이용계약은 여러분이 본 약관의 내용에 동의한 후 회사가 여러분의 계정 정보 등을 확인한 후 승낙함으로써 체결됩니다.
				<br>제 5 조 (게시물의 관리)
				<br>① 여러분의 게시물이 정보통신망 이용촉진 및 정보보호 등에 관한 법률(이하 ‘정보통신망법’)및 저작권법 등 관련 법령에 위반되는 내용을 포함하는 경우,
				<br>권리자는 회사에 관련 법령이 정한 절차에 따라 해당 게시물의 게시중단 및 삭제 등을 요청할 수 있으며, 회사는 관련 법령에 따라 조치를 취합니다.
				<br>② 회사는 권리자의 요청이 없는 경우라도 권리침해가 인정될 만한 사유가 있거나 기타 회사의 정책 및 관련 법령에 위반되는 경우에는 관련 법령에 따라 해당 게시물에 대해 임시조치 등을 취할 수 있습니다.
				<br>③ 위와 관련된 세부 절차는 정보통신망법 및 저작권법이 규정한 범위 내에서 회사가 정한 권리침해 신고 절차 에 따릅니다.
				<br>제 6 조 (유료 서비스의 이용)
				<br>① 여러분이 회사가 제공하는 유료서비스를 이용하는 경우 이용대금을 납부한 후 이용하는 것을 원칙으로 합니다.
				<br>② 회사가 제공하는 유료서비스에 대한 이용요금의 결제 방법은 핸드폰결제, 신용카드결제, 일반전화결제, 계좌이체, 무통장입금, 선불전자지급수단 결제 등이 있으며 각 유료서비스마다 결제 방법의 차이가 있을 수 있습니다.
  				<br>③ 회사는 결제의 이행을 위하여 반드시 필요한 여러분의 개인정보를 추가적으로 요구할 수 있으며, 여러분은 회사가 요구하는 개인정보를 정확하게 제공하여야 합니다.
				<br>④ 본 조에서 정하지 않은 내용은 개별 서비스 내의 각 세부 하위 서비스의 유료서비스 약관에서 정하며, 본 조의 내용과 각 세부 하위 서비스의 유료서비스 약관의 내용이 충돌하는 경우 세부 하위 서비스의 유료서비스 약관의 규정에 따릅니다.
				<br>⑤ 사용자가 유료결제를 한 이후에는 단순변심에 의한 환불은 불가합니다.
			</div>
		</div>
		<div class=detailfloor>
			<div class="detailInfo">
				<br>
				<div style="font-size: 17px; font-weight: bold"> 🖍챌린지 정보 </div>
				<br> 챌린지명 : ${challenge.title }<br>
				<br> 참가포인트 : ${challenge.pp_point } <br>
				<br> 시작날짜 : ${challenge.start_date } <br>
				<br> 끝나는 날짜 : ${challenge.end_date } <br>
				<br> 카테고리 : ${challenge.category } <br><br>
			</div>
		</div>
		<div class="myInfofloor">
			<div class="myInfo"><br>
				<div style="font-size: 17px; font-weight: bold"> 🖍회원정보 </div><br>
				<div id="userId">아이디 : ${userId.id }</div>
				<br> ${userId.name }의 포인트 : ${userId.point } 원  <input type="button" id="pointCharge" value="충전"><br>
				<br>
			</div>
		</div>
		<div class="fifthfloor">
			<br><br><input type="checkbox" id="check"> 약관에 동의합니다. <br><br>
			<button id="confirm">참여하기</button>
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
			<a href="#"><img src="${pageContext.request.contextPath}/resources/img/icon1.png" class="mr-3" alt="..."
				style="width: 50px; height: 50px; margin-left: 10%; margin: 0px;"></a>
			<a href="#"><img src="${pageContext.request.contextPath}/resources/img/icon2.png" class="mr-3" alt="..."
				style="width: 50px; height: 50px; margin-left: 10%; margin: 0px;"></a>
			<a href="#"><img src="${pageContext.request.contextPath}/resources/img/icon3.png" class="mr-3" alt="..."
				style="width: 50px; height: 50px; margin-left: 10%; margin: 0px;"></a>
		</div>
		<br>
	</div>
</div>

	 <ul class="navi">
        <ul class="title">
            <li class="navi-title" style="font-family: 'Rock Salt', cursive; "><a href="${uri }">Don't Give Up</a></li>
        </ul>
        <ul class="itemList">
            <li class="navi-item"><a href="banner.usboard">MYPAGE</a></li>
            <li class="navi-item"><button id="logout">LOGOUT</button></li>
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
	<script>
        var ctx = document.getElementById('myChart').getContext('2d');
        var chart = new Chart(ctx, {
            // The type of chart we want to create
            type: 'line',

            // The data for our dataset
            data: {
                labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
                datasets: [{
                    label: 'My First dataset',
                    backgroundColor: 'rgb(255, 99, 132)',
                    borderColor: 'rgb(255, 99, 132)',
                    data: [0, 10, 5, 2, 20, 30, 45]
                }]
            },

            // Configuration options go here
            options: {}
        });
    </script>
    <script>
    	$("#logout").on("click",function(){
    		var result = confirm("정말 로그아웃 하시겠습니까?");
    		if(result){
    			location.href = "logout.mem";
    		}
    	})
    </script>
    
</body>
</html>