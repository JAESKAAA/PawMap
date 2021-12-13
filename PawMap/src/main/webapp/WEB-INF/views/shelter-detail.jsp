<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<spring:eval expression="@environment.getProperty('kakao.app.key')" var="kakaoAppKey"/>
<!DOCTYPE html>
<html lang="ko">
<!-- Basic -->

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <title>PawMap - ${shelter.shelterName }</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="images/로고최종_수정.png" type="image/x-icon" />
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png" />
 	<!-- Fontawesome CSS-->
    <link
      href="https://use.fontawesome.com/releases/v5.0.6/css/all.css"
      rel="stylesheet"
    />
    <!-- Bootstrap (부트스트랩) CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <!-- Site (사이트) CSS -->
    <link rel="stylesheet" href="css/style.css" />
    <!-- Responsive (반응형) CSS -->
    <link rel="stylesheet" href="css/responsive.css" />
    <!-- hospital-search CSS (검색페이지 1) -->
    <link rel="stylesheet" href="css/hospital-search.css" />
    <!-- 테이블 부분 css -->
    <link rel="stylesheet" href="css/footable.bootstrap.css" />
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/custom.css" />
    <!-- 헤더 푸터 효과를위한 css -->
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


    .container_hospital_detail {
      padding: 0;
      width: 1200px;
      max-width: 100%; 
      height: auto;
      object-fit: cover;

      padding-right: 15px;
      padding-left: 15px;
      margin-right: auto;
      margin-left: auto;
    }
    img { 
      max-width: 100%; 
      height: auto; 
    }
    .h3 {
      font-size: large;
      text-align: center;
    }

    .a {
      color: black;
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
  
      <!-- Start About Page  -->
      <div class="about-box-main">
        <div class="container_hospital_detail" style="margin-top: 5rem;">
          <div class="row">
	          <div style="width: 1200px; height: 20rem; overflow: hidden; -webkit-box-align: center;">
            	<img class="swing-in-top-fwd" src="${pageContext.request.contextPath}/upload/${shelter.originalFileName}">
    	      </div>
            <div class="col-lg-6">
              <div class="banner-frame">
                <h2></h2>
                <h2 class="noo-sh-title-top">${shelter.shelterName }</h2>
              </div>
            </div>
            <div class="col-lg-6">
              <p class="noo-p">
              <div class="card-body">
                <div class="media mb-3">
                  <div class="mr-2">
                    <i class="fas fa-map-marker-alt fa-2x"></i>
                  </div>
                  <div class="media-body">
                    <p>${shelter.shelterAddress }</p>
                  </div>
                </div>
                <div class="media mb-3">
                  <div class="mr-2"> 
                    <i class="fas fa-home fa-2x"></i>
                  </div>
                  <div class="media-body">
                    <p>준비중입니다.</p>
                  </div>
                </div>
                <div class="media mb-3">
                  <div class="mr-2"> 
                    <i class="fas fa-phone-volume fa-2x"></i>
                  </div>
                  <div class="media-body">
                    <p>${shelter.shelterTel }</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        
              <!-- 이동부분  -->
    		  <!-- 이동부분 끝 -->
            <hr>
            <!-- 하단 위치 진료시간 부분 -->
            <div class="row my-5">
                <div class="col-sm-8 col-lg-6">
                  <div class="service-block-inner">
                      <h3 style="margin-bottom: 3%;">위치</h3>
                      <div id="map" style="max-width: 100%; 
                      height: 500px; "></div>
                  </div>
                </div>
                <div class="col-sm-8 col-lg-6">
                  <div class="service-block-inner">
                      <h3 style="margin-bottom: 3%;">운영시간</h3>
                      <p>월 : 09:00 ~ 17 : 00</p>
                      <p>화 : 09:00 ~ 17 : 00</p>
                      <p>수 : 09:00 ~ 17 : 00</p>
                      <p>목 : 09:00 ~ 17 : 00</p>
                      <p>금 : 09:00 ~ 17 : 00</p>
                      <p>토 : 휴무</p>
                      <p>일 : 휴무</p>
                      <p>공휴일 : 휴무</p>
                  </div>
                </div>
            </div>
        </div>
      </div>
    <!-- 페이지 끝 -->

   <footer>
      <div class="footer-main">
        <div class="container">
          <div class="row">
            <!--Footer 1번 (회사정보 부분)-->
            <div class="col-lg-4 col-md-12 col-sm-12">
              <div class="footer-link-contact">
                <h4 class="text_custom">PawMap</h4>
                <ul>
                  <li>
                    <p>
                      <i class="fas fa-map-marker-alt"></i>Address: 서울시
                      강남구 강남대로 11길 13
                    </p>
                  </li>
                  <li>
                    <p>
                      <i class="fas fa-phone-square"></i>Phone:
                      <a href="tel:+1-888705770">+82-2-345-1234</a>
                    </p>
                  </li>
                  <li>
                    <p>
                      <i class="fas fa-envelope"></i>Email:
                      <a href="mailto:contactinfo@gmail.com"
                        >contactpawmap@gmail.com</a
                      >
                    </p>
                  </li>
                  <li>
                    <p>
                      <i class="fas fa-user"></i>대표자:
                      <a href="mailto:contactinfo@gmail.com">고결</a>
                    </p>
                  </li>
                </ul>
              </div>
            </div>
            <!--Footer 2번 (소셜미디어 부분)-->
            <div class="col-lg-4 col-md-12 col-sm-12">
              <div class="footer-link-contact">
                <h4>Social Media</h4>
                <div class="footer-top-box">
                  <p style="margin-left: 20px">
                    하기 링크를 통해 더 많은 소식을 받아 보세요 !
                  </p>
                  <ul>
                    <li>
                      <p>
                        <a href="#" class="inner-box"
                          ><i
                            class="fab fa-facebook inner-box-icon"
                            aria-hidden="true"
                          ></i
                        ></a>
                      </p>
                    </li>
                    <li>
                      <p>
                        <a href="#" class="inner-box"
                          ><i
                            class="fab fa-twitter inner-box-icon"
                            aria-hidden="true"
                          ></i
                        ></a>
                      </p>
                    </li>
                    <li>
                      <p>
                        <a href="#" class="inner-box"
                          ><i
                            class="fab fa-linkedin inner-box-icon"
                            aria-hidden="true"
                          ></i
                        ></a>
                      </p>
                    </li>
                    <li>
                      <p>
                        <a href="#" class="inner-box"
                          ><i
                            class="fab fa-google-plus inner-box-icon"
                            aria-hidden="true"
                          ></i
                        ></a>
                      </p>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
            <!--Footer 3번 (Information 부분)-->
            <div class="col-lg-4 col-md-12 col-sm-12">
              <div class="footer-link-contact">
                <h4>Information</h4>
                <div class="footer-link">
                  <ul>
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">개인정보 처리 방침</a></li>
                    <li><a href="#">이용 약관</a></li>
                    <li><a href="#">위치기반 서비스 이용 약관</a></li>
                    <li><a href="#">제휴 문의</a></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="footer-copyright">
        <p class="footer-company">
          All Rights Reserved. &copy; 2021 <a href="#">PawMap</a>
        </p>
      </div>
    </footer>
    <!-- End Footer  -->


    


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

  <!-- 폰트어썸아이콘용 JS -->
	   <script
      src="https://kit.fontawesome.com/f0999a1ca0.js"
      crossorigin="anonymous"
    ></script>
  <!-- kakaomap api test -->
  	<script
      type="text/javascript"
      src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=${kakaoAppKey}&libraries=services,clusterer,drawing"
    ></script>
     <script>
     
     var name = "${shelter.shelterName}";
     var address = "${shelter.shelterAddress}";
     	
     
     var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
     mapOption = {
         center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
         level: 6 // 지도의 확대 레벨
     };  

    function noLoginUserCantWrite(){
      alert("로그인이 필요합니다.");
    } 

	 // 지도를 생성합니다    
	 var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	 // 주소-좌표 변환 객체를 생성합니다
	 var geocoder = new kakao.maps.services.Geocoder();
	
	 // 주소로 좌표를 검색합니다
	 geocoder.addressSearch(address, function(result, status) {
	console.log(address);
	     // 정상적으로 검색이 완료됐으면 
	      if (status === kakao.maps.services.Status.OK) {
	
	         var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	         // 결과값으로 받은 위치를 마커로 표시합니다
	         var marker = new kakao.maps.Marker({
	             map: map,
	             position: coords
	         });
	
	         // 인포윈도우로 장소에 대한 설명을 표시합니다
	         var infowindow = new kakao.maps.InfoWindow({
	             content: '<div style="width:150px;text-align:center;padding:6px 0;">'+ name+'</div>'
	         });
	         infowindow.open(map, marker);
	
	         // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	         map.setCenter(coords);
	     } 
	 });    
	</script>
</body>
</html>