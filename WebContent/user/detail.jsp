<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kr">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <title>My Challenge</title>
        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
        <link href="https://fonts.googleapis.com/css?family=Calistoga&display=swap" rel="stylesheet">
       <link href="https://fonts.googleapis.com/css?family=Carrois+Gothic+SC&display=swap" rel="stylesheet">
         <link href="https://fonts.googleapis.com/css?family=Righteous&display=swap" rel="stylesheet">
          <link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Bangers|Coming+Soon|Gloria+Hallelujah|Handlee|Rock+Salt&display=swap" rel="stylesheet">
        <style>
        /* 을지로체 */
@font-face { font-family: 'BMEULJIRO'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/BMEULJIRO.woff') format('woff'); font-weight: normal; font-style: normal; }
            /* 양진체 */
@font-face { font-family: '양진체'; src: url('https://cdn.jsdelivr.net/gh/supernovice-lab/font@0.9/yangjin.woff') format('woff'); font-weight: normal; font-style: normal; }
            body{
                margin:0px;
                padding:0px;
               
            }
            .lastbar{
                margin:0px;
                overflow: hidden;
                padding:0px;
            }
            .navi{
                position:absolute;
                top:0px;
                margin:0px;
                overflow: hidden;
                padding:0px;
                width:60%;
                left: 20%;              
                background-color: white;
                font-family:fantasy;
                font-size: 20px;
            }
            .title{
                margin:0px;
                padding:0px;

                width:50%;
            }
            .itemList{
                position: absolute;
                margin:0px;
                padding:0px;
                right: 0px;
                width:50%;
                text-align: right;
                font-family: '양진체';
            }
            .navi-title{
                list-style-type: none;
                width:50%;
                line-height:72px;
                float:left;
                text-align: center;
                
            }
            .navi-item{
                list-style-type: none;
                width:30%;
                line-height:72px;
                float:left;
                text-align: center;
                color:black;
                font-weight: bold;
            }
            .navi-item2{
                list-style-type: none;
                width:25%;
                line-height:30px;
                float:left;
                text-align: center;
                color:black;
            }
            .navi-item3{
                list-style-type: none;
                width:25%;
                line-height:72px;
                float:left;
                text-align: center;
                color:black;
            }
            .navi-item>a{
                text-decoration: none;
                color:black;
                width:100%;
                height:100%;
                display: block;
            }
            .navi-item2>a{
                text-decoration: none;
                color:black;
                width:100%;
                height:100%;
                display: block;
            }
            .navi-item3>a{
                text-decoration: none;
                color:black;
                width:100%;
                height:100%;
                display: block;
                font-weight: bold;
            }
            .navi-title>a{
                text-decoration: none;
                color:black;
                width:100%;
                height:100%;
                display: block;
            }
            
            .container{
                background-color: white;
                width:60%;
                margin:auto;
                margin-top:0px;
            }
            .onefloor{
                border-bottom: 3px solid black;
                border-top: 3px solid black;
                border-radius: 3px;
            }
            .topfloor{
                border-bottom: 3px solid black;
                border-radius: 3px;

            }
            .rfloor{
                position: relative;
                top:150px;
                border: 3px solid black;
                text-align: center;
                height: 700px;
            }
            
            .fourthfloor{
                position: relative;
                top:300px;
            }

            .fifthfloor{
                border-top: 3px solid black;
                border-radius: 3px;
                width: 100%;
                background-color: white;
            }
            .progress{
                display: inline-block;
                width: 90%;
                height: 10%;
            }
            .category{
                position: fixed;
                top: 80px;
                right: 3%;
                width: 16%;
                height: 500px;
                border: 3px solid black;
                background-color: white;
            }
            #enjoybtn{
                font-size: 22px;
                background-color: black;
                color: white;
                width: 90%;
                height: 50px;
                border: 1px solid black;
				font-family: '양진체';
				border-radius: 10px;
            }
            
            .submenu{
                font-family: 'Calistoga', cursive;
                color:black;
            }
            .sidebar{
                height: 51px;
                font-family: 'Calistoga', cursive;
                text-align: center;
            }
            .sidebar>a{
                height: 100%;
                color:#FFFFFF;
            }
            .menubtn{
                width: 24%;
                height: 100%;
                font-size: 20px;
                background: none;
                padding: 0;
                margin: 0;
                border: 0px solid black;
            }
            .onefloor{
            	height : 400px;
            	width: 100%;
            	margin: auto;
            }
            .twofloor{
            	height: 60px;
            	width: 100%;
            	font-size: 30px;
            	text-align: left;
            	
            }
            .threefloor{
            	height: 50px;
            	text-align: left;
            	font-size: 20px;
            	border-bottom: 3px solid black;
            }
            .fourfloor{
            	height: 60px;
            	font-size: 40px;
            	text-align: center;
            	border-bottom: 3px solid black;
            }
            .fivefloor{
            	font-size: 20px;
            	height: 500px;
            }
            .fourthfloor{
                height: 500px;
            }
            .fifthfloor{
                height: 500px;
            }
            .wrapper{
            	text-align: center;
            	height: 100%;
            	border: 1px solid black;
            }
            #method{
            	font-weight: bold;
            	text-size: 15px;
            }
            #logout{
            	border: none;
            	background-color: white;
            	font-weight: bold;
            }
            .bonusfloor{
            	border: 3px solid black;
            	text-align: center;
            }
            
        </style>

    </head>
    <body>        
    <div>
    <img src = "${pageContext.request.contextPath}/resources/img/background-Index.png" style="width: 100%; filter: blur(4px); z-index: -500; position: fixed">
    </div>
        <div class="container">
            <br><br><br>
            <div class="topfloor">
              <div class="bd-example">
                    
                </div>
               
            </div>
            <br>
            <div class="onefloor">
             	<img style="height: 100%; width: 100%;" src="${pageContext.request.contextPath}/files/${detailpage.file_path }">
            </div>
            <br>
            <div class="fourfloor" style="font-family: 'BMEULJIRO', cursive;">
            	${detailpage.title }
            </div>
            <br>
            <div class="twofloor" style="font-family: 'BMEULJIRO', cursive;">
            ${detailpage.giveortake } 챌린지
            </div>
            <br>
            <div class="threefloor" style="font-family: 'BMEULJIRO', cursive;">
            	카테고리 : ${detailpage.category }
            </div>
            <br>
            
            <div class="fivefloor">
            	<br>
            	<div id="method">챌린지 진행 방식</div><br>
            	<div>🗓 인증 가능 요일 : ${day } </div><br>
            	<div>📋 인증 빈도 : ${frequency } </div><br>
            	<div>⏱ 인증 가능 시간 : ${time } </div><br>
            	<div>📌 하루 인증 횟수 : ${number }</div><br>
            </div>
            <div class="bonusfloor">
             <br>  <br>
              <h4>🎫목표달성을 위한 보상이 중요한 이유</h4><br>
               ✏목표설정이론의 상황요인 중 보상조건
<br>주어진 목표와 관련하여 제공되는 보수나 보상 수준은 성과를 향상시키는 방법이며,
<br>보상은 개인의 목표에 대한 몰입의 정도에 영향을 미치는데,
<br>보상의 제공이 그렇지 않은 경우보다 노력을 훨씬 많이 하려는 의지를 야기시킴.
<br>즉, 목표 달성에 따른 적절한 보상이 주어졌을 때 성과를 훨씬 높일 수 있음
                 <br>  <br>
               
            </div>
            <div class="rfloor">
             <br>  <br>  <br> <br>
              <h1>📢레드카드발급 관련 공통 안내사항</h1><br><br><br>
               ✔ 인증규정과 무관한 이미지로 인증을 대체하려 한 경우<br>
               ✔ 신체의 일부가 나와야 할 때 본인이 아닌 경우<br>
               ✔ 한번의 행위로 2회 인증하는 경우(예. 자정전과 후로 한 챌린지를 2회 인증하는 경우)<br>
               ✔ 미리 해놓고 다음에는 사진만 찍는 경우<br>
               ✔ 한 번의 행위로 두 개의 서로 다른 챌린지에 인증하는 경우<br>
               (예. 닭가슴살 샐러드를 먹으며, 닭가슴살 먹기 챌린지와 샐러드 먹기 챌린지에 둘 다 인증하는 경우)<br>
               ✔ 미리 해놓고 인증샷은 나중에 찍는 경우 <br>
               (예. 한 주 할 일을 모두 계획 후 미리 써두고, 밤에는 사진만 찍는 경우)<br>
               ✔ 다수의 회원들로부터 수행여부를 의심받았는데, 회사가 그 의심이 납득 가능하다고 판단한 경우<br>
               ✔ 고의적으로 인증규정만 맞췄을 뿐 인증규정의 빈틈을 노렸다고 회사가 판단하는 경우<br>
               ✔ 한 사람이 두 계정으로 인증하거나, 지인이 인증할 때를 이용해 본인도 인증하는 경우<br>
               (예. 아메리카노 한 잔을 두고, 두 사람이 카페에서 아메리카노 주문하기 챌린지에 인증한 경우)<br>
                 <br>  <br>  <br>
               
            </div>
            
            
            <div class="fourthfloor">
                
            </div>
            
        

        <div class="fifthfloor">
            <ul class="lastbar">
                <li class="navi-item3"><a href="#">COMPANY</a></li>
                <li class="navi-item3"><a href="#">POLICIES</a></li>
                <li class="navi-item3"><a href="#">SUPPORT</a></li>
                <li class="navi-item3"><a href="#">기업교육</a></li>
                <br><br>
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
                <br><br>
            </ul>
            <div class="lastbar2" style="text-align: center;">상호 : (주)미완성자들 | 주소 : 서울특별시 종로구 평창동 486 -20 | 사업자등록번호 : 234-88-00720 | 대표자명 : 김세원<br>
                Copyright ⓒ2019 Miwansung inc, ltd. All rights reserved</div><br>
            <div class="lastbar3" style="text-align: center">
                <a href="#"><img src="${pageContext.request.contextPath }/resources/img/icon1.png" class="mr-3" alt="..." style="width:50px; height:50px; margin-left: 10%; margin: 0px;"></a>
                <a href="#"><img src="${pageContext.request.contextPath }/resources/img/icon2.png" class="mr-3" alt="..." style="width:50px; height:50px; margin-left: 10%; margin: 0px;"></a>
                <a href="#"><img src="${pageContext.request.contextPath }/resources/img/icon3.png" class="mr-3" alt="..." style="width:50px; height:50px; margin-left: 10%; margin: 0px;"></a></div>
            <br>
        </div>
        </div>
    <div class="category">
        <div class="wrapper">
        	<br>
        	<div style="height:20%; font-size: 30px; font-weight: bold; font-family: 'BMEULJIRO' ">
        	${detailpage.title }
        	</div>
        	<div style="height: 20px; font-family: 'BMEULJIRO'; font-size: 20px;"> ${detailpage.giveortake } 챌린지</div><br>
        	<div style="height:20%; font-family: 'BMEULJIRO'; font-size: 20px;">챌린지 시작일 : ${detailpage.start_date } </div>
        	<div style="height:20%; font-family: 'BMEULJIRO'; font-size: 20px;">챌린지 종료일 : ${detailpage.end_date }</div>
        	<div style="height:20%"><button id="enjoybtn">enjoy</button></div>
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
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
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
    	$("#enjoybtn").on("click",function(){
    		if(${id != null}){
    			location.href="terms.usboard?seq=${detailpage.seq }&id=${id }";
    		}else{
    			alert("로그인 페이지로 이동합니다");
    			location.href="${pageContext.request.contextPath }/user/login/login.jsp"
    		}
    	})
    	$("#logout").on("click", function(){
    		var result = confirm("로그아웃 하시겠습니까?");
			if (result) {
				location.href = "logout.mem";
			}
    	});
    </script>
</body>
</html>