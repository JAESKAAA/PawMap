<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>




<!DOCTYPE html>
<html lang="en">
  <!-- Basic -->

  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Site Metas -->
    <title>PawMap - 유기동물 보호소 게시판</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <!-- Site Icons -->
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <!-- Site CSS -->
    <link rel="stylesheet" href="css/style.css" />
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css" />
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/custom.css" />
    <link rel="stylesheet" href="css/custom-jaeseok.css" />

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


<style>
  header,
      nav {
        background:rgb(239 198 120);
        height: fit-content;
        font-size:medium;
        color: rgba(235, 180, 99, 0.842);
        height: 12%;
      }
</style>


  </head>

  <body>


       <!-- Header 시작 -->
   <header id="header" class="main-header header" style="z-index: 100;">
    <nav class="
        navbar navbar-expand-lg 
        fixed-top py-3">
        <div class="container col-lg-9">
          <div class="navbar-header">
            <a href="/pawmap" class="navbar-brand text-uppercase font-weight-bold">PAWMAP</a>
              <button type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler navbar-toggler-right"><i class="fa fa-bars"></i></button>
            </div>
            <div id="navbarSupportedContent" 
                class="collapse navbar-collapse">
                <ul class="nav navbar-nav ml-auto"
                    data-in="fadeInDown"
                    data-out="fadeOutUp">
                    <li class="nav-item active">
                      <!-- a태그 스타일이 안먹어 -->
                      <a href="/pawmap" id="nav-a" class="nav-link text-uppercase font-weight-bold" >Home </a></li>
                    <li class="nav-item">
                      <a href="/pawmap/about" id="nav-a" class="nav-link text-uppercase font-weight-bold">회사소개</a></li>
                    <li class="nav-item">
                      <a href="/pawmap/search" id="nav-a" class="nav-link text-uppercase font-weight-bold">병원찾기</a></li>
                    <li class="nav-item">
                      <a href="/pawmap/shelter" id="nav-a" class="nav-link text-uppercase font-weight-bold">보호소 정보</a></li>
                    <li class="dropdown"color: rgb(255, 255, 255);">
                        <a
                          href="#"
                          class="nav-link dropdown-toggle arrow"
                          data-toggle="dropdown"
                          >커뮤니티</a
                        >
                        <!-- style inline으로 -->
                        <ul class="dropdown-menu"  style="background-color:rgba(0, 0, 0, 0.089);" >
                          <li style="padding: 3%;"><a href="/pawmap/board/getFreeBoardList"  style="color: #fff; size: 0.8em;">자유게시판</a></li>
                          <li style="padding: 3%;"><a href="/pawmap/board/getNanumBoardList"  style="color: #fff; size: 0.8em;">나눔게시판</a></li>
                        </ul>
                    </li>
                  </ul>
            </div>
       
      </div>
        
      
         <div class="attr-nav col-lg-3">
          <ul>
            <li class="search" style="display: none">
              <a href="#"><i class="fa fa-search"></i></a>
            </li>
            <sec:authorize access="isAnonymous()">
              <li class="side-menu">
                <a href="/pawmap/loginForm">
                  <p id="attr-nav-p">로그인</p>
                </a>
              </li>
              <li class="side-menu">
                <a href="/pawmap/joinForm">
                  <p id="attr-nav-p">회원가입</p>
                </a>
              </li>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
              <li class="side-menu">
                <a href="/pawmap/mypage">
                  <p id="attr-nav-i">마이페이지 ${principal.user.userNickname} 님 환영합니다.</p>
                </a>
              </li>
              <li class="side-menu">
                <a href="/pawmap/logout">
                  <p id="attr-nav-i">로그아웃</p>
                </a>
              </li>
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
              <li class="side-menu">
                <a href="/pawmap/admin">
                  <p id="attr-nav-p">관리자 페이지</p>
                </a>
              </li>
            </sec:authorize>
          </ul>
        </div>
       
      </div>
     
    </nav>
  </header>
  <!-- Header 끝 부분 -->



    <!-- 유기동물 보호소 문구  -->
    <div class="products-box" style="margin-top:5rem;">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="title-all text-center">
              <h1>유기 동물 보호소</h1>
              <hr />
            </div>
          </div>
        </div>
      </div>
    </div>



    <!--컨텍 정보 부분-->
    <c:forEach items="${shelterPic}" var="shelterPic" varStatus="i">
	      <!-- 사진목록 끝-->
	      <!-- 보호센터 정보 부분-->
      <div id="abandon_detail_box" onclick="location.href='/pawmap/shelter_detail?shelterSeq=${shelterPic.shelterSeq }'" style="cursor:pointer;">
	      	<div class="abandon_detail_box_inner_img">
              <img class="img-fluid" src="${pageContext.request.contextPath}/upload/${shelterPic.originalFileName}" alt=""/>
	        </div>
            <div class="container">
              <div class="row abandon_detail_box_inner">
                <div>
                  <div class="contact-info-left">
                    <h2 style="margin-bottom: -2%">${shelterPic.shelterName }</h2>
                    <br />
                    <ul>
                      <li>
                        <p>
                          <i class="fas fa-map-marker-alt"></i>
                          <span class="contact_font">Address. </span><br />
                          ${shelterPic.shelterAddress }<br />
                        </p>
                      </li>
                      <li>
                        <p>
                          <i class="fas fa-phone-square"></i
                          ><span class="contact_font">Phone.</span><br />
                          <a href="tel:+1-888705770">${shelterPic.shelterTel }</a>
                        </p>
                      </li>
                      <li>
                        <p>
                          <i class="fas fa-paw"></i>
                          <span class="contact_font">Availability.</span> <br />
                          ${shelterPic.content}<br />
                        </p>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
	    </div>
    </c:forEach>
    

    <%@ include file="layout/footer.jsp" %>



    <a href="#" id="back-to-top" title="Back to top" style="display: none"
      >&uarr;</a
    >

    <!-- ALL JS FILES -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- ALL PLUGINS -->
    <script src="js/jquery.superslides.min.js"></script>
    <script src="js/bootstrap-select.js"></script>
    <script src="js/inewsticker.js"></script>
    <script src="js/bootsnav.js."></script>
    <script src="js/images-loded.min.js"></script>
    <script src="js/isotope.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/baguetteBox.min.js"></script>
    <script src="js/form-validator.min.js"></script>
    <script src="js/contact-form-script.js"></script>
    <script src="js/custom.js"></script>
    <!-- FontAwesome 용 JS 파일-->
    <script
      src="https://kit.fontawesome.com/f0999a1ca0.js"
      crossorigin="anonymous"
    ></script>
    <!--Tawk 위젯 부분-->
    <script type="text/javascript">
      var Tawk_API = Tawk_API || {},
        Tawk_LoadStart = new Date();
      (function () {
        var s1 = document.createElement("script"),
          s0 = document.getElementsByTagName("script")[0];
        s1.async = true;
        s1.src = "https://embed.tawk.to/619377006bb0760a4942cf7b/1fkk0hmc9";
        s1.charset = "UTF-8";
        s1.setAttribute("crossorigin", "*");
        s0.parentNode.insertBefore(s1, s0);
      })();
    </script>
    <!--Tawk 위젯 끝-->
  </body>
</html>
