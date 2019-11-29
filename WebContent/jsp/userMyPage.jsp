<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
   integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
   crossorigin="anonymous">

<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>



<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<link
   href="https://fonts.googleapis.com/css?family=Calistoga&display=swap"
   rel="stylesheet">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/css/MyPageStyle.css">



</head>
<body>


   <div class="container">
      <br>
      <br>
      <br>

      <div class="onefloor" style="text-align: center;">
         <br>
         <div style="text-align: start; margin-left: 5%;">
            <a href="#" class="submenu">My Profile</a>
         </div>
         <br>
         <br>
         <div class="media">
            <img src="${pageContext.request.contextPath}/Img/profileicon.png" class="mr-3" alt="..."
               style="width: 100px; height: 100px; margin-left: 10%;">
            <div class="media-body">
               <br>
               <h5 class="mt-0">${id }님의마이페이지입니다.</h5>
               내일은 챌린지 성공하자!
            </div>


         </div>

         <br>
         <div class="progress">
            <label for="file">나의 경험치:</label>

            <progress id="file" max="100" value="70"
               style="width: 100%; background-color: purple;"> 70% </progress>
         </div>
         <br>
         <br>
      </div>

      <div class="twofloor">
         <br>
         <br>
         <div style="text-align: start; margin-left: 5%;">
            <a href="#" class="submenu">My Point </a>
         </div>
         <br>
         <br>
         <h1 style="margin-left: 15%;">My Point is 45,000</h1>
         <br>
         <br>
      </div>

      <div class="threefloor">
         <br>
         <br>
         <div style="text-align: start; margin-left: 5%;">
            <a href="#" class="submenu">My Challenge</a>
         </div>
         <br>
         <br>
         <c:choose>
            <c:when test="${givedetail.size() == 0 } ">
               <div style="text-align: start; margin-left: 5%;"">기부</div>
               <div class="row">
                  <div>존재하는 챌린지가 없습니다.</div>



               </div>
               <div style="text-align: start; margin-left: 5%;">테이크</div>
               <div class="row">
                  <c:set var="sizee" value="${fn:length(takedetail)-1}" />
                  <c:forEach var="j" begin="0" end="${sizee}">
                     <div class="col-4">
                        <a
                           href="${pageContext.request.contextPath}/myPageDetailView.usboard?seq=${takedetail[j].seq}&seq2=${takerecord[j].seq}">
                           <div class="card m-3">

                              <img src="${takedetail[j].file_path}" class="card-img-top">
                              <div class="card-body">
                                 <h5 class="card-title">${takedetail[j].title }</h5>
                                 <p class="card-text">참여인원 :
                                    ${takedetail[j].total_participate }</p>
                              </div>
                           </div>
                        </a>
                     </div>

                  </c:forEach>
               </div>
            </c:when>
            <c:when test="${takedetail.size() == 0 }">
               <div style="text-align: start; margin-left: 5%;">기부</div>
               <div class="row">


                  <c:set var="size" value="${fn:length(givedetail)-1}" />
                  <c:if test="${size <= 0 }">
                     <c:set var="size" value="0" />
                  </c:if>

                  <c:forEach var="i" begin="0" end="${size}">

                     <div class="col-4">
                        <a
                           href="${pageContext.request.contextPath}/myPageDetailView.usboard?challengeSeq=${givedetail.get[i].seq}&recordSeq=${giverecord[i].seq}">
                           <div class="card m-3">

                              <img src="${givedetail.get[i].file_path}" class="card-img-top">
                              <div class="card-body">
                                 <h5 class="card-title">${givedetail[i].title }</h5>
                                 <p class="card-text">참여인원 :
                                    ${givedetail[i].total_participate }</p>
                              </div>
                           </div>
                        </a>

                     </div>

                  </c:forEach>
               </div>

               <div style="text-align: start; margin-left: 5%;">테이크</div>
               <div class="row">
                  <div>존재하는 챌린지가 없습니다.</div>
               </div>
            </c:when>
            <c:otherwise>
               <div style="text-align: start; margin-left: 5%;"">기부</div>
               <div class="row">
                  <c:set var="size" value="${fn:length(givedetail)-1}" />

                  <c:if test="${size <= 0 }">
                     <c:set var="size" value="0" />
                  </c:if>

                  <c:forEach var="i" begin="0" end="${size}">
                     <c:if test="${size != 0 }">
                     <div class="col-4">
                        
                        <a
                           href="${pageContext.request.contextPath}/myPageDetailView.usboard?challengeSeq=${givedetail[i].seq}&recordSeq=${giverecord[i].seq}">
                           <div class="card m-3">
                              <img src="${givedetail[i].file_path}" class="card-img-top">
                              <div class="card-body">
                                 <h5 class="card-title">${givedetail[i].title }</h5>
                                 <p class="card-text">참여인원 :
                                    ${givedetail[i].total_participate }</p>
                              </div>
                           </div>
                        </a>
                     </div>
                     </c:if>
                  </c:forEach>
               </div>
               <div style="text-align: start; margin-left: 5%;">테이크</div>
               <div class="row">
                  <c:set var="sizee" value="${fn:length(takedetail)-1}" />
                  <c:forEach var="j" begin="0" end="${sizee}">
                     <div class="col-4">
                        <a
                           href="${pageContext.request.contextPath}/myPageDetailView.usboard?challengeSeq=${takedetail[j].seq}&recordSeq=${takerecord[j].seq}">
                           <div class="card m-3">

                              <img src="${takedetail[j].file_path}" class="card-img-top">
                              <div class="card-body">
                                 <h5 class="card-title">${takedetail[j].title }</h5>
                                 <p class="card-text">참여인원 :
                                    ${takedetail[j].total_participate }</p>
                              </div>
                           </div>
                        </a>
                     </div>

                  </c:forEach>
               </div>
            </c:otherwise>
         </c:choose>


      </div>
   </div>


   <br>
 

   <div class="fourfloor">
      <br>
      <br>
      <div style="text-align: start; margin-left: 5%;">
         <a href="#" class="submenu">My Statics</a>
      </div>
      <br>
      <br>
      <div>
         <canvas id="myChart"></canvas>
      </div>
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
         <a href="#"><img src="../Img/icon1.png" class="mr-3" alt="..."
            style="width: 50px; height: 50px; margin-left: 10%; margin: 0px;"></a>
         <a href="#"><img src="../Img/icon2.png" class="mr-3" alt="..."
            style="width: 50px; height: 50px; margin-left: 10%; margin: 0px;"></a>
         <a href="#"><img src="../Img/icon3.png" class="mr-3" alt="..."
            style="width: 50px; height: 50px; margin-left: 10%; margin: 0px;"></a>
      </div>
      <br>
   </div>
   <div class="category">
      <div class="wrapper">
         <br>
         <div class="sidebar">
            <a href="#">My Profile</a>
         </div>
         <div class="sidebar">
            <a href="#">My Information</a>
         </div>
         <div class="sidebar">
            <a href="#">My Challenge</a>
         </div>
         <div class="sidebar">
            <a href="#">My Point</a>
         </div>
         <div class="sidebar">
            <a href="#">Membership Withdrawal</a>
         </div>
      </div>
   </div>
   <ul class="navi">
      <ul class="title">
         <li class="navi-title"><a href="#"><img
               src="../Img/reallogo.png" class="mr-3" alt="..."
               style="width: 135px; height: 50px; margin-left: 10%;"></a></li>
      </ul>
      <ul class="itemList">

         <li class="navi-item"><a href="#">GIVE OR TAKE</a></li>
         <li class="navi-item"><a href="#">CHALLENGE</a></li>
         <li class="navi-item"><a href="#">MYPAGE</a></li>
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



</body>
</html>