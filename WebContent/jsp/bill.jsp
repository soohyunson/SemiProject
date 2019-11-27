<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
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
                color:#7019FF;
            }
            .navi-item2{
                list-style-type: none;
                width:25%;
                line-height:30px;
                float:left;
                text-align: center;
                color:#7019FF;
            }
            .navi-item3{
                list-style-type: none;
                width:25%;
                line-height:72px;
                float:left;
                text-align: center;
                color:#7019FF;
            }
            .navi-item>a{
                text-decoration: none;
                color:#7019FF;
                width:100%;
                height:100%;
                display: block;
            }
            .navi-item2>a{
                text-decoration: none;
                color:#7019FF;
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
                color:#7019FF;
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
                border-bottom: 3px solid #7019FF;
                border-top: 3px solid #7019FF;
                border-radius: 3px;
            }
            .twofloor{
                border-bottom: 3px solid #7019FF;
                border-radius: 3px;

            }
            .threefloor{
                border-bottom: 3px solid #7019FF;
                border-radius: 3px;
                height: 50px;
            }

            .fivefloor{
                border-top: 3px solid #7019FF;
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
                border: 3px solid #7019FF;
            }
            #enjoybtn{
                width: 80%;
                height: 50px;
                font-size: 20px;
                position: relative;
                top : 430px;
                
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
            #condition{
                height: 500px;
                border: 1px solid black;
                background-color: white;
                overflow: scroll;
            }
            .fourthfloor{
                height: 500px;
            }
            .fifthfloor{
                height: 150px;
            }
        </style>
</head>
<body>
<div class="container">
            <br><br><br>
            <div class="twofloor">
            </div>
            <div class="threefloor">
               챌린지도전
            </div>
            
            <div class="fourthfloor">
               <br>
                <div id="condition">
                    제 1 조 목적
본 약관은 서비스 이용자가 주식회사 돈기브업(이하 “회사”라 합니다)가 제공하는 온라인상의 인터넷 서비스(이하 “서비스”라고 하며, 접속 가능한 유∙무선 단말기의 종류와는 상관없이 이용 가능한 “회사”가 제공하는 모든 “서비스”를 의미합니다. 이하 같습니다)에 회원으로 가입하고 이를 이용함에 있어 회사와 회원(본 약관에 동의하고 회원등록을 완료한 서비스 이용자를 말합니다. 이하 “회원”이라고 합니다)의 권리•의무 및 책임사항을 규정함을 목적으로 합니다.<br>
① 회사는 이 약관의 내용을 회원이 쉽게 알 수 있도록 서비스 초기 화면에 게시합니다.<br>
② 회사는 온라인 디지털콘텐츠산업 발전법, 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제에 관한 법률, 소비자기본법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br>
③ 회사가 약관을 개정할 경우에는 기존약관과 개정약관 및 개정약관의 적용일자와 개정사유를 명시하여 현행약관과 함께 그 적용일자 일십오(15)일 전부터 적용일 이후 상당한 기간 동안, 개정 내용이 회원에게 불리한 경우에는 그 적용일자 삼십(30)일 전부터 적용일 이후 상당한 기간 동안 각각 이를 서비스 홈페이지에 공지하고 기존 회원에게는 회사가 부여한 이메일 주소로 개정약관을 발송하여 고지합니다.<br>
④ 회사가 전항에 따라 회원에게 통지하면서 공지∙고지일로부터 개정약관 시행일 7일 후까지 거부의사를 표시하지 아니하면 승인한 것으로 본다는 뜻을 명확하게 고지하였음에도 의사표시가 없는 경우에는 변경된 약관을 승인한 것으로 봅니다. 회원이 개정약관에 동의하지 않을 경우 회원은 제17조 제1항의 규정에 따라 이용계약을 해지할 수 있습니다.<br>
① 서비스 이용은 회사의 서비스 사용승낙 직후부터 가능합니다. 다만, 유료 서비스의 경우 회사가 요금납입을 확인한 직후부터 가능하게 할 수 있습니다.
② 민법상 미성년자인 회원이 유료 서비스를 이용할 경우 미성년자인 회원은 결제 전 법정대리인의 동의를 얻어야 합니다.<br>
③ 서비스 이용시간은 회사의 업무상 또는 기술상 불가능한 경우를 제외하고는 연중무휴 1일 24시간(00:00-24:00)으로 함을 원칙으로 합니다. 다만, 서비스설비의 정기점검 등의 사유로 회사가 서비스를 특정범위로 분할하여 별도로 날짜와 시간을 정할 수 있습니다.<br>
① 회원이 납입한 요금에 대하여는 회사는 그 요금을 환불이 불가합니다.
               
                </div>
            </div>
            <div class="fifthfloor">
               <br><br>
                <input type="checkbox" id="check"> 약관에 동의합니다.
                <br>
                <button id="confirm">참여하기</button>
            </div>
          
        </div>

        <div class="fivefloor">
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
        $("#confirm").on("click",function(){
            if($("#check").prop("checked")){
                if(confirm("진행하시겠습니까?")){
                    location.href="detail2.html";
                }
            }else{
                alert("약관에 동의해주십시오");
            }
        })
            </script>
</body>
</html>