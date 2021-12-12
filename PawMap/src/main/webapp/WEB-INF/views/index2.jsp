<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">
  <!-- Basic -->

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>


  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Site Metas -->
    <title>PawMap - 우리집 주변 동물병원 찾기</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta name="author" content="" />


    <!-- Site Icons -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/로고최종_수정.png" type="image/x-icon" />
    <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/images/apple-touch-icon.png" />
    <!-- Fontawesome CSS-->
    <link
      href="https://use.fontawesome.com/releases/v5.0.6/css/all.css"
      rel="stylesheet"
    />

    <!--  ${request.getContextPath } -->
    <!-- 몌 커스텀 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style-mye.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
    <!-- Site CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css" />
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom-jaeseok.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom-silbia.css">
      <!-- 테이블 부분 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footable.bootstrap.css" />
        <!-- 결 커스텀 css -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    

    
    <style>
      .hov-in {
  opacity: 0;
  background: rgba(0, 0, 0, 0.5);
  bottom: -50%;
  position: absolute;
  width: 100%;
  height: 100%;
  -webkit-transition: all 0.3s ease-out 0.5s;
  -moz-transition: all 0.3s ease-out 0.5s;
  -o-transition: all 0.3s ease-out 0.5s;
  -ms-transition: all 0.3s ease-out 0.5s;
  transition: all 0.3s ease-out 0.5s;
  text-align: center;
  display: table;
}
.hov-in a {
  display: table-cell;
  vertical-align: middle;
  height: 100%;
}

.ins-inner-box:hover .hov-in {
  bottom: 0;
  opacity: 1;
}


      header,
      nav {
        background: rgba(0, 0, 0, 0.041);
        height: fit-content;
        font-size: large;

      }
      #slides-shop {
        height: 100vh;
      }
      section {
          visibility: visible;
      }
      .progress-bar {
          background-color: rgb(247, 203, 58);
      }
		
	 .jb-video { 
	 	position: relative; top: 1%;
	 	}
      video {
	      width:100%;
	      }

       /* index컬러 블럭만들기 */
       .about-box-main2 {
        background-color: #fdd572;
          padding: 0%;
          margin-left: 0;
          margin-right: 0;
          width: 100%;
          height: auto;
       } 
       .about-box-main {
         margin: 10%;
       }
        .cover-slides{
        border-radius: 0;
        border: 1px solid rgba(204, 156, 22, 0.8);4
    }
    
    .fa-search {
    	cursor:pointer;
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
                      <a href="contact-us.html" id="nav-a" class="nav-link text-uppercase font-weight-bold">보호소 정보</a></li>
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




    <!-- Start Slider -->
    <div id="slides-shop" class="cover-slides">
      <ul class="slides-container">
        <li class="text-center">
          <img src="${pageContext.request.contextPath}/images/crousel-main2.jpeg">
          
          <div class="container">
            <div class="row">
              <div class="col-md-12">
                <h1 class="m-b-20">
                  <strong
                    >반려동물을 위한 <br />동물 병원 
                   </strong
                  >
                </h1>
                <p class="m-b-40">
                 
                  <br />
                  여러분의 근처에 착한 병원을 찾아보세요.
                </p>
                <p><a class="btn custom_btn2" href="#">자세히 보기</a></p>
              </div>
            </div>
          </div>
        </li>
        <li class="text-center">
          <img src="${pageContext.request.contextPath}/images/crousel-community3.jpeg">

          <div class="in-text container">
            <div class="row">
              <div class="col-md-12">
                <h1 class="m-b-20">
                  <strong
                    > 반려인들을 위한 <br />
                    포맵의 커뮤니티</strong
                  >
                </h1>
                <!-- <p class="m-b-40">
                  
                  <br />
                  
                </p> -->
                <p><a class="btn custom_btn2" href="#">자세히 보기</a></p>
              </div>
            </div>
          </div>
        </li>
        <li class="text-center">
          <img src="${pageContext.request.contextPath}/images/crousel-shelter.jpeg">

          <div class=" container">
            <div class="row">
              <div class="in-text col-md-12">
                <h1 class="m-b-20">
                  <strong><span>포맵이 소개하는</span> <br />
                    동물보호소</strong
                  >
                </h1>
                <p class="m-b-40">
                  어려움에 처한 유기 및 파양 동물에게 작은 힘이 되어주세요.
                  <br />
                  여러분의 작은 관심이 이들에게 큰 힘이 됩니다.
                </p>
                <p><a class="btn custom_btn2" href="#">후원하기</a></p>
              </div>
            </div>
          </div>
        </li>
      </ul>
      <div class="slides-navigation">
        <a href="#" class="next"
          ><i class="fa fa-angle-right" aria-hidden="true"></i
        ></a>
        <a href="#" class="prev"
          ><i class="fa fa-angle-left" aria-hidden="true"></i
        ></a>
      </div>
    </div>
    <!-- End Slider -->

    <!-- 검색 부분-->
    <div class=" custom_margin">
      <form action="/pawmap/searchDetail" method="get">
	      <div id="search_bar" class="d-flex justify-content-center">
	        <div class="search">
	          <h3 id="search_hostpital" class=" text-uppercase font-weight-bold">
	            우리 동네 동물병원을 찾아보세요!
	          </h3>
            
            
	          <div id="search_box">
              <input
              class="search_input"
              type="text"
              name="value"
              placeholder="search items !"
              />
              <button type="submit"  class="search_icon"><i class="fa fa-search"></i></button>
            </div>
          </div>
	      </div>
      </form>
    </div>
    
    <!-- 검색 부분 끝-->

    <!--About Us 부분-->
   
    <div class="container custom_aboutUsBox">
      <div class="custom_aboutUs_textBox">
        <div class="h6 aboutUs_title">For the Animal</div>
        <br />
        <div class="custom_aboutUs_innerTextBox long-text">
          동물을 위하는 마음으로 뭉쳤습니다.<br />
          강아지 고양이 말 소 개구리 파충류 돼지 곤충 매미 귀뚜라미<br />
          다양한 반려동물들을 위한 우리동네 동물병원을 찾아보세요
        </div>
        <br />
        <!-- <button class="btn btn-primary btn-sm custom_btn" type="button">
          더보기
        </button> -->
      </div>
      <video
        class="index_video"
        src="${pageContext.request.contextPath}/images/cat_video.mp4"
        muted
        autoplay
        loop
        style="vertical-align: center;"
      ></video>
    </div>
    <!--About Us 부분 끝-->
    <!--제휴 병원 소개 부분-->
    <div class="container custom_aboutUsBox2">
      <div class="col-lg-6 custom_aboutUs_img">
          <img
          class="index_video"
          src="${pageContext.request.contextPath}/images/yellowdog.jpg"
          style="width: 100%;
                height: auto;
                vertical-align: center;
                padding-left: 0;
                ;"
                
        ></img>
      </div>

      <div class="col-lg-6 custom_aboutUs_textBox2">
        <div class="h6 aboutUs_title">제휴 병원 안내</div>
        <br />
        <div class="custom_aboutUs_innerTextBox long-text">
          잘하는 수의사들만 모아봤습니다.<br />
          포맵의 제휴병원을 통해 예약관리를 시작하세요
        </div>
        <br />
        <button class="btn btn-primary btn-sm custom_btn" type="button">
          더보기
        </button>
      </div>
    </div>
 
    <!--제휴 병원 소개 부분 끝-->


    <!--병원소개페이지 추가 -->
  <div class="about-box-main2">
    <div class="about-box-main">
      <div class="container">
          <div class="row">
      <div class="col-lg-6 jb-video">
                  <video muted autoplay loop>
                      <source src="${pageContext.request.contextPath}/videos/Cat - 85464.mp4" type="video/mp4">
                      <strong>Your browser does not support the video tag.</strong>
                    </video>
              </div>
              <div class="col-lg-6 long-text">
                  <h2 class="noo-sh-title-top"><span>PAWMAP</span></h2>
                  <p>포맵은 반려인들이 모여서 만든 동물병원 연결 서비스입니다. 이용하는 방법을 소개해드릴게요. 우선 회원가입 후 포맵의 전문 수의사에게 아이의 증상을 상담받을 수 있습니다. 
                      그리고 우리동네 병원찾기를 통해 어디에 있든 주변 병원을 찾고 이용자들의 후기를 확인하세요. 
                      병원을 찾았다면 동물병원의 수의사 정보와 함께 어떤 동물,치료를 전문으로 하는지 확인할 수 있습니다. 그리고 맘에 든다면 영화예약하듯 예약할 수 있습니다. 
                      병원에 다녀오고 포맵에 들어오시면 병원에서 업로드한 진단서를 확인하실 수 있습니다.
                      정기검진을 받으면 기록해야할 내용이 많은데 포맵에서 데이터를 관리해보세요.
                      같이 산책할 동네 강아지를 찾거나, 작아진 옷을 팔 때는 포맵 커뮤니티를 이용해보세요.
                      마지막으로 포맵에서 소개하는 유기동물 보호소 페이지에서는 후원을 할 수 있습니다.
                       </p>
                  <button class="btn btn-primary btn-sm custom_btn" type="button" onclick="location.href='/pawmap/about'">
                        더보기
                  </button>
                  <!-- <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
        <a class="btn hvr-hover" href="#">Read More</a> -->
              </div>
          </div>
          <div class="row my-5">
              <div class="col-sm-6 col-lg-4">
                  <div class="service-block-inner">
                      <h3>우리동네 동물병원 찾기</h3>
                      <p class="long-text">검색한 위치를 기반으로 주변 동물병원을 찾아드립니다. 병원에 대한 상세한 정보와 사람들의 후기를 확인해보세요!</p>
                  </div>
              </div>
              <div class="col-sm-6 col-lg-4">
                  <div class="service-block-inner">
                      <h3>병원예약과 진료기록관리</h3>
                      <p class="long-text">포맵의 제휴병원은 검색 후 바로 예약을 할 수 있습니다. 포맵에서 병원을 예약하고 병원 기록과 진단서관리를 시작하세요! </p>
                  </div>
              </div>
              <div class="col-sm-6 col-lg-4">
                  <div class="service-block-inner">
                      <h3>반려인들을 위한 커뮤니티</h3>
                      <p class="long-text">반려동물 키우는 이야기를 나눌 수 있는 자유게시판과 반려동물 관련 중고물건 나눔장터가 열려있습니다! </p>
                  </div>
              </div>
          </div>

          <!-- 그래프 & 통계자료 첨부  -->
                      <!-- ======= Facts Section ======= -->
              <section class="facts section-bg" data-aos="fade-up">
                  <div class="container">
          
                  <div class="row counters">
          
                      <div class="col-lg-3 col-6 text-center">
                      <span data-purecounter-start="0" data-purecounter-end="332" data-purecounter-duration="1" class="purecounter"></span>
                      <p>회원</p>
                      </div>
          
                      <div class="col-lg-3 col-6 text-center">
                      <span data-purecounter-start="0" data-purecounter-end="1483" data-purecounter-duration="1" class="purecounter"></span>
                      <p>제휴병원</p>
                      </div>
          
                      <div class="col-lg-3 col-6 text-center">
                      <span data-purecounter-start="0" data-purecounter-end="23" data-purecounter-duration="1" class="purecounter"></span>
                      <p>오늘 예약</p>
                      </div>
          
                      <div class="col-lg-3 col-6 text-center">
                      <span data-purecounter-start="0" data-purecounter-end="77" data-purecounter-duration="1" class="purecounter"></span>
                      <p>반려동물 프로필</p>
                      </div>
          
                  </div>
          
                  </div>
              </section><!-- End Facts Section -->
          
              <!-- ======= Our Skills Section ======= -->
              <section class="skills" data-aos="fade-up">
                  <div class="container">
          
                  <div class="section-title">
                      <h2>stack on PAWMAP</h2>
                      <p></p>
                  </div>
          
                  <div class="skills-content">
          
                      <div class="progress">
                      <div class="progress-bar" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">
                          <span class="skill">SpringBoot<i class="val">100%</i></span>
                      </div>
                      </div>
                      <div class="progress">
                      <div class="progress-bar" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100">
                          <span class="skill">Java <i class="val">80%</i></span>
                      </div>
                      </div>
                      <div class="progress">
                      <div class="progress-bar" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100">
                          <span class="skill"> JavaScript<i class="val">35%</i></span>
                      </div>
                      </div>
          
                      <div class="progress">
                      <div class="progress-bar" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="skill">Html <i class="val">20%</i></span>
                      </div>
                      </div>
          
                  </div>
          
                  </div>
              </section>
            </div>
          </div>
        </div>

  <!--병원소개 페이지 끝 -->


    <hr class="custom_hr" />

    <!-- Start Instagram Feed  -->
    <div class="instagram-box">
      
      <h3>유기동물 보호소를 소개합니다</h3>
      <br />
      <div class="main-instagram owl-carousel owl-theme">
        <div class="item">
          <div class="ins-inner-box">
            <img src="images/abandoned2.jpg" alt="" />
            <div class="hov-in">
              <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
          </div>
        </div>
        <div class="item">
          <div class="ins-inner-box">
            <img src="images/abandoned3.jpg" alt="" />
            <div class="hov-in">
              <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
          </div>
        </div>
        <div class="item">
          <div class="ins-inner-box">
            <img src="images/abandoned.jpg" alt="" />
            <div class="hov-in">
              <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
          </div>
        </div>
        <div class="item">
          <div class="ins-inner-box">
            <img src="images/abandoned2.jpg" alt="" />
            <div class="hov-in">
              <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
          </div>
        </div>
        <div class="item">
          <div class="ins-inner-box">
            <img src="images/abandoned7.jpg" alt="" />
            <div class="hov-in">
              <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
          </div>
        </div>
        <div class="item">
          <div class="ins-inner-box">
            <img src="images/abandoned3.jpg" alt="" />
            <div class="hov-in">
              <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
          </div>
        </div>
      </div>
 



      <!-- 보호소 정보 표출부분 (css 맞는지 확인요) -->

      <div class="instagram-box">
        <div class="main-instagram owl-carousel owl-theme">
            <c:forEach items="${shelterPic}" var="shelterPic" varStatus="i">
            <div class="item">
              <div class="ins-inner-box" 
              style="    
              width:375px;
              height:375px;
              overflow:hidden;
              margin:0 auto;">
                <!-- <img src="images/abandoned2.jpg" alt="" /> -->
                <img class="img-fluid" src="${pageContext.request.contextPath}/upload/${shelterPic.originalFileName}" alt="" /
                style="    
                width:100%;
                height:100%;
                object-fit:cover">
              <div class="hov-in">
                <a>
                  <h1 style="color: #ffffff"><strong>
                    ${shelterPic.shelterName }
                  </h1></strong>
                  <h4 style="color: #ffffff">
                    ${shelterPic.shelterAddress }
                    <br>
                    ${shelterPic.shelterTel } 
                  </h4>
  
                </a>
              </div>
            </div>
          </div>
        </c:forEach>
  
        </div>
      </div>

  </div>


   

<%@ include file="layout/footer.jsp" %>
 
