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
        <style>
            body{
                margin:0px;
                padding:0px;
                background-color:#FFFFFF;
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
                background-color: #FFFFFF90;
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
            }
            .navi-title{
                list-style-type: none;
                width:50%;
                line-height:72px;
                float:left;
                text-align: center;

                color:#7019FF;
            }
            .navi-item{

                list-style-type: none;
                width:30%;
                line-height:72px;
                float:left;
                text-align: center;
                color:black;
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
                color:#7019FF;
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
            .navi-item>a:hover{
                background-color: orange;

            }
            .container{
                background-color: #ededed;
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
                background-color: #edceed;
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
                background-color: gainsboro;
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
            }
            #enjoybtn{
                font-size: 20px;

            }
            .submenu{
                font-family: 'Calistoga', cursive;
                color:#7019FF;
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
            	border: 1px solid black;
            	margin: auto;
            }
            .twofloor{
            	border: 1px solid black;
            	height: 60px;
            	width: 100%;
            	font-size: 30px;
            	text-align: center;
            }
            .threefloor{
            	border: 1px solid black;
            	height: 50px;
            	text-align: center;
            	font-size: 20px;
            }
            .fourfloor{
            	border: 1px solid black;
            	height: 60px;
            	font-size: 40px;
            	text-align: center;
            }
            .fivefloor{
            	border: 1px solid black;
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
            
        </style>

    </head>
    <body>        
        <div class="container">
            <br><br><br>
            <div class="topfloor">
              <div class="bd-example">
                    <img src = "${detailpage.file_path}">
                </div>
               
            </div>
            <br>
            <div class="onefloor">
             	<img style="height: 100%; width: 100%;" src="${pageContext.request.contextPath}/files/${detailpage.file_path }">
            </div>
            <br>
            <div class="twofloor">
            "${detailpage.giveortake }" 챌린지
            </div>
            <br>
            <div class="threefloor">
            	${detailpage.category }
            </div>
            <br>
            <div class="fourfloor">
            	${detailpage.title }
            </div>
            <br>
            <div class="fivefloor">
            	${detailpage.content }
            </div>
            <div class="rfloor">
             <br>  <br>  <br> <br>
              <h1>레드카드발급 관련 공통 안내사항</h1><br><br><br>
               1. 인증규정과 무관한 이미지로 인증을 대체하려 한 경우<br>
               2. 신체의 일부가 나와야 할 때 본인이 아닌 경우<br>
               3. 한번의 행위로 2회 인증하는 경우(예. 자정전과 후로 한 챌린지를 2회 인증하는 경우)<br>
               4. 미리 해놓고 다음에는 사진만 찍는 경우<br>
               5. 한 번의 행위로 두 개의 서로 다른 챌린지에 인증하는 경우<br>
               (예. 닭가슴살 샐러드를 먹으며, 닭가슴살 먹기 챌린지와 샐러드 먹기 챌린지에 둘 다 인증하는 경우)<br>
               6. 미리 해놓고 인증샷은 나중에 찍는 경우 <br>
               (예. 한 주 할 일을 모두 계획 후 미리 써두고, 밤에는 사진만 찍는 경우)<br>
               7. 다수의 회원들로부터 수행여부를 의심받았는데, 회사가 그 의심이 납득 가능하다고 판단한 경우<br>
               8. 고의적으로 인증규정만 맞췄을 뿐 인증규정의 빈틈을 노렸다고 회사가 판단하는 경우<br>
               9. 한 사람이 두 계정으로 인증하거나, 지인이 인증할 때를 이용해 본인도 인증하는 경우<br>
               (예. 아메리카노 한 잔을 두고, 두 사람이 카페에서 아메리카노 주문하기 챌린지에 인증한 경우)<br>
                 <br>  <br>  <br>
               
            </div>
            
            
            <div class="fourthfloor">
                
            </div>
            
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
                <a href="#"><img src="icon1.png" class="mr-3" alt="..." style="width:50px; height:50px; margin-left: 10%; margin: 0px;"></a>
                <a href="#"><img src="icon2.png" class="mr-3" alt="..." style="width:50px; height:50px; margin-left: 10%; margin: 0px;"></a>
                <a href="#"><img src="icon3.png" class="mr-3" alt="..." style="width:50px; height:50px; margin-left: 10%; margin: 0px;"></a></div>
            <br>
        </div>
    <div class="category">
        <div class="wrapper">
        	<div style="height:30%" style="font-size: 18px;">
        	${detailpage.title } 챌린지
        	</div>
        	<div style="height:15%">${detailpage.start_date } </div>
        	<div style="height:15%">${detailpage.end_date }</div>
        	<div style="height:20%">${detailpage.giveortake }</div>
        	<div style="height:20%"><button id="enjoybtn">enjoy</button></div>
        </div>
    </div>
    <ul class="navi">
        <ul class="title">
            <li class="navi-title"><a href="#"><img src="reallogo.png" class="mr-3" alt="..." style="width:135px; height:50px; margin-left: 10%;"></a></li>
        </ul>
        <ul class="itemList">
            <li class="navi-item"><a href="#">GIVE OR TAKE</a></li>
            <li class="navi-item"><a href="#">CHALLENGE</a></li>
            <li class="navi-item"><a href="#">MYPAGE</a></li>
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
    </script>
    </body>
</html>