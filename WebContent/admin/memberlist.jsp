<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
       <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
        <link href="https://fonts.googleapis.com/css?family=Calistoga&display=swap" rel="stylesheet"> 
        <link href="https://fonts.googleapis.com/css?family=Bangers|Coming+Soon|Gloria+Hallelujah|Handlee|Rock+Salt&display=swap" rel="stylesheet">
	   <style>
@font-face { font-family: '양진체'; src: url('https://cdn.jsdelivr.net/gh/supernovice-lab/font@0.9/yangjin.woff') format('woff'); font-weight: normal; font-style: normal; }
@font-face { font-family: 'BMEULJIRO'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/BMEULJIRO.woff') format('woff'); font-weight: normal; font-style: normal; }
</style>
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
                    position:fixed;
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

                    right: -250px;
                    width:50%;
                }
                .navi-title{
                    list-style-type: none;
                    width:50%;
                    line-height:72px;
                    float:left;
                    text-align: center;

                    color:#1D1F21;
                }
                .navi-item{
                    list-style-type: none;
                    width:30%;
                    line-height:72px;
                    float:left;
                    text-align: center;
                    color:#1D1F21;
                }
                
                .navi-item2{
                    list-style-type: none;
                    width:25%;
                    line-height:30px;
                    float:left;
                    text-align: center;
                    color:#1D1F21;
                }
                .navi-item3{
                    list-style-type: none;
                    width:25%;
                    line-height:72px;
                    float:left;
                    text-align: center;
                    color:#1D1F21;
                }
                .navi-item>a{
                    text-decoration: none;
                    color:#1D1F21;
                    width:100%;
                    height:100%;
                    display: block;
                }
                .navi-item2>a{
                    text-decoration: none;
                    color:#1D1F21;
                    width:100%;
                    height:100%;
                    display: block;
                }
                .navi-item3>a{
                    text-decoration: none;
                    color:#1D1F21;
                    width:100%;
                    height:100%;
                    display: block;
                    font-weight: bold;
                }
                .navi-title>a{
                    text-decoration: none;
                    color:#1D1F21;
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
                    border-bottom: 3px solid #1D1F21;;
                    border-top: 3px solid #1D1F21;
                    border-radius: 3px;
                }
                .twofloor{
                    border-top: 3px solid #1D1F21;
                    
                    border-radius: 3px;
                    height: 40px;
                    font-size: 20px;
                }
                .threefloor{
                    border-bottom: 3px solid #1D1F21;
                    border-radius: 3px;
                    height: 50px;
                     font-size: 20px;
                }

                .fivefloor{
                    border-top: 3px solid #1D1F21;
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
                    left: 5%;
                    width: 13%;
                    height: 150px;
                    
                   	background-color: white;
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
                .fourthfloor{
                    height: 500px;
                }
                #listboard{
                    border-top: 1px solid black;
                    border-bottom: 1px solid black;
                    margin: auto;
                    width: 80%;
                }
                #title{
                    font-size: 20px;
                    text-align: center;
                    border : 1px solid black;
                }
                td{
                	border : 1px solid black;
           
                }
                th{
                	border : 1px solid black;
                }
            </style>
</head>
<body>
<div>
<img src="${pageContext.request.contextPath }/resources/img/backgroundMain.jpg" class="back" style="position:fixed; z-index:-500; filter: blur(4px);">
</div>
<div class="container">
                <br><br><br>
                <div class="twofloor">
                   
                </div>
                <div class="threefloor" style="font-family: 'Calistoga', cursive;">
                    Member List
                </div>

                <div class="fourthfloor">
                    <br>
                    <table id="listboard">
                        <tr>
                            <th colspan=2 id="title" style="font-family: 'BMEULJIRO'; font-weight:50;">회원목록
                        </tr>
                        <tr>
                            <th width="20%" style="text-align: center; font-family: 'BMEULJIRO'; font-weight:50;">회원ID
                            <th width="80%" style="text-align: center; font-family: 'BMEULJIRO'; font-weight:50;">회원명
                        </tr>
                        <c:choose>
                        <c:when test="${dto == null }">
                        <c:choose>
                        	<c:when test="${list.size() == 0 }">
                                <tr>
                                    <td colspan=2>표시할 내용이 없습니다.
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${list }" var="dto">
                                    <tr>
                                        <td width="20%" style="text-align: center">${dto.id }
                                        <td width="80%" style="text-align: center"><a href="${pageContext.request.contextPath}/memberlist.adboard?id=${dto.id}">${dto.name }</a>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                            </c:choose>
                        </c:when>
                        <c:otherwise>
                        	<c:forEach items="${dto }" var="item">
                        	<tr>
                        		<td>${item.id }
                        		<td><a href="${pageContext.request.contextPath}/memberlist.adboard?id=${item.id}">${item.name }</a>
                        	</tr>
                        	
                        	</c:forEach>
                        </c:otherwise>
                            
                        </c:choose>
                        <tr>
                        
                        </tr>
                        <tr>
               				<tr>
                        	<td colspan=2 style="text-align: center">${navi }
                     		</tr>
                        </tr>
                        <tr>
                        <td colspan=2 style="text-align: right">
                        <form action="search.mem" method="post" id="searchfrm">
                        	<input type=text placeholder="아이디로 검색하기" name="search" style=" font-family: 'BMEULJIRO';">
                        	<input type="button" value="검색" id="searchbtn" style="background-color:black; border-radius:4px; color:white; font-family: 'BMEULJIRO';">
                        	</form>
                        </tr>
                        <tr>
                        <td colspan=2 style="text-align: right"><input type="button" id="back" value="돌아가기" style="background-color:black; border-radius:4px; color:white; font-family: 'BMEULJIRO';">
                        </tr>
                    </table>
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
                    <a href="#"><img src="${pageContext.request.contextPath }/resources/img/icon1.png" class="mr-3" alt="..." style="width:50px; height:50px; margin-left: 10%; margin: 0px;"></a>
                    <a href="#"><img src="${pageContext.request.contextPath }/resources/img/icon2.png" class="mr-3" alt="..." style="width:50px; height:50px; margin-left: 10%; margin: 0px;"></a>
                    <a href="#"><img src="${pageContext.request.contextPath }/resources/img/icon3.png" class="mr-3" alt="..." style="width:50px; height:50px; margin-left: 10%; margin: 0px;"></a></div>
                <br>
            </div>
            </div>            
            <div class="category">
		<div class="wrapper" style="background-color: white; border: 3px solid black; ">
			<br>
			<div class="sidebar">
				<img src="https://cdns.iconmonstr.com/wp-content/assets/preview/2018/240/iconmonstr-marketing-29.png" style="widht:30px;height:30px;">
			</div>
			<div class="sidebar">
			<a href="#" style="font-family: 양진체; color: black; font-weight:bold;">Member List</a>
			</div>
			<div class="sidebar">
				<img src="https://iconmonstr.com/wp-content/g/gd/makefg.php?i=../assets/preview/2018/png/iconmonstr-task-thin.png&r=0&g=0&b=0" style="widht:30px;height:30px;">
				
			</div>
			<div class="sidebar">
				<a href="../list.adboard" style="font-family: 양진체; color: black; font-weight:bold; color: black">Board List</a>
			</div>
			<div class="sidebar">
				<img src="https://cdns.iconmonstr.com/wp-content/assets/preview/2018/240/iconmonstr-pencil-thin.png" style="widht:30px;height:30px;">
			</div>
			<div class="sidebar">
				<a href="writeBoard.jsp" style="font-family: 양진체; font-weight:bold; color: black;">write Board</a>
			</div>
		</div>
	</div>
            
            <ul class="navi" style="position:absolute">
                <ul class="title">
                    <li class="navi-title"><a href="${uri }" style="font-family: 'Rock Salt', cursive; font-size:20px;">
                    Don't Give Up
                   
                    </a></li>
                </ul>
                <ul class="itemList">

                  <li class="navi-item"><a href="adminMyPage.jsp"  style="font-family: 양진체; font-weight:bold;">ADMIN PAGE</a></li>
            <li class="navi-item"><button id="logoutbtn" style="font-family: 양진체; font-weight:bold; border: none; background-color: white">LOGOUT</button></li>
                </ul>
            </ul>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
            
            <script>
            	$("#searchbtn").on("click", function(){
            		$("#searchfrm").submit();
            	})
            	
            	$("#back").on("click", function(){
            		location.href="adminMyPage.jsp";
            	})
            	
            	$("#logoutbtn").on("click",function(){
        		var result = confirm("로그아웃 하시겠습니까?");
        		if(result){
        			location.href="logout.mem";
        		}
        		})
            </script>
</body>
</html>