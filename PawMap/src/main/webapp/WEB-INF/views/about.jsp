<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>


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
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
    <!-- Site CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css" />
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom-jaeseok.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style-gyul.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom-silbia.css">
        <!-- 테이블 부분 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/footable.bootstrap.css" />
    <!-- 몌 커스텀 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style-mye.css" />
        <!-- 결 커스텀 css -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
        <![endif]-->
       
       
        <!-- <link rel="stylesheet"  href="../../../resources/static/css/aos.css" />
        <link  rel="stylesheet" href="../../../resources/static/css/bootstrap-icons.css" />
        <link rel="stylesheet" href="../../../resources/static/css/boxicons.min.css"  />
        <link rel="stylesheet" href="../../../resources/static/css/glightbox.min.css" /> -->
        <!-- <link rel="stylesheet" href="../../../resources/static/css/swiper-bundle.min.css" /> -->
    <style>
      header,
      nav {
        background: rgba(0, 0, 0, 0.1);
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
		.jb-video { position: relative; top: 1%;}
       video {width:100%}
		/* .jb-text p { margin-top: -24px; text-align: center; font-size: 48px; color: #ffffff; } */
	  </style>
  </head>

  <body>
    <!-- Header 시작 -->
    <header class="main-header">
      <!-- Start Navigation -->
      <nav
        class="
          navbar navbar-expand-lg navbar-light
          bg-light
          navbar-default
          bootsnav
        "
      >
        <div class="container">
          <!-- Start Header Navigation -->
          <div class="navbar-header">
            <button
              class="navbar-toggler"
              type="button"
              data-toggle="collapse"
              data-target="#navbar-menu"
              aria-controls="navbars-rs-food"
              aria-expanded="false"
              aria-label="Toggle navigation"
            >
              <i class="fa fa-bars"></i>
            </button>
            <!--사이트 로고 부분-->
            <a class="navbar-brand" href="/pawmap">
              <div class="main_logo_box"></div>
            </a>
          </div>
          <!-- End Header Navigation -->

          <!-- Collect the nav links, forms, and other content for toggling -->
          <div class="collapse navbar-collapse" id="navbar-menu">
            <ul
              class="nav navbar-nav ml-auto"
              data-in="fadeInDown"
              data-out="fadeOutUp"
            >
              <li class="nav-item active">
                <a class="nav-link" href="/pawmap">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/pawmap/about">회사소개</a>
              </li>
              <li class="nav-item">
                <a class="nav-link"  id="findHospital" href="/pawmap/search">병원찾기</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="contact-us.html">보호소 정보</a>
              </li>
              <li class="dropdown">
                <a
                  href="#"
                  class="nav-link dropdown-toggle arrow"
                  data-toggle="dropdown"
                  >커뮤니티</a
                >
                <ul class="dropdown-menu">
                  <li><a href="/pawmap/board/getFreeBoardList">자유게시판</a></li>
                  <li><a href="cart.html">나눔게시판</a></li>
                </ul>
              </li>
            </ul>
          </div>
          <!-- /.navbar-collapse -->

          <!-- Start Atribute Navigation -->
          <div class="attr-nav">
            <ul>
              <li class="search" style="display: none">
                <a href="#"><i class="fa fa-search"></i></a>
              </li>
              <sec:authorize access="isAnonymous()">
                <li class="side-menu">
                  <a href="/pawmap/loginForm">
                    <p>로그인</p>
                  </a>
                </li>
                <li class="side-menu">
                  <a href="/pawmap/joinForm">
                    <p>회원가입</p>
                  </a>
                </li>
              </sec:authorize>
              <sec:authorize access="isAuthenticated()">
                <li class="side-menu">
                  <a href="/pawmap/mypage">
                    <p>마이페이지 ${principal.user.userNickname} 님 환영합니다.</p>
                  </a>
                </li>
                <li class="side-menu">
                  <a href="/pawmap/logout">
                    <p>로그아웃</p>
                  </a>
                </li>
              </sec:authorize>
              <sec:authorize access="hasRole('ROLE_ADMIN')">
                <li class="side-menu">
                  <a href="/pawmap/admin">
                    <p>관리자 페이지</p>
                  </a>
                </li>
              </sec:authorize>
            </ul>
          </div>
          <!-- End Atribute Navigation -->
        </div>
      </nav>
      <!-- End Navigation -->
    </header>
    <!-- Header 끝 부분 -->
               

    <!-- Start Top Search -->
    <div class="top-search">
        <div class="container">
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-search"></i></span>
                <input type="text" class="form-control" placeholder="Search">
                <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
            </div>
        </div>
    </div>
    <!-- End Top Search -->

    <!-- Start All Title Box -->
     <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>PAWMAP</h2>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->

    <!-- Start About Page  -->
    <div class="about-box-main">
        <div class="container" style="margin-top: 5rem;">
            <div class="row">
				<div class="col-lg-6 jb-video">
                    <video muted autoplay loop>
                        <source src="${pageContext.request.contextPath}/videos/Cat - 85464.mp4" type="video/mp4">
                        <strong>Your browser does not support the video tag.</strong>
                      </video>
                </div>
                <div class="col-lg-6">
                    <h2 class="noo-sh-title-top"><span>PAWMAP</span></h2>
                    <p>포맵은 반려인들이 모여서 만든 동물병원 연결 서비스입니다. 이용하는 방법을 소개해드릴게요. 우선 회원가입 후 포맵의 전문 수의사에게 아이의 증상을 상담받을 수 있습니다. 
                        그리고 우리동네 병원찾기를 통해 어디에 있든 주변 병원을 찾고 이용자들의 후기를 확인하세요. 
                        병원을 찾았다면 동물병원의 수의사 정보와 함께 어떤 동물,치료를 전문으로 하는지 확인할 수 있습니다. 그리고 맘에 든다면 영화예약하듯 예약할 수 있습니다. 
                        병원에 다녀오고 포맵에 들어오시면 병원에서 업로드한 진단서를 확인하실 수 있습니다.
                        정기검진을 받으면 기록해야할 내용이 많은데 포맵에서 데이터를 관리해보세요.
                        같이 산책할 동네 강아지를 찾거나, 작아진 옷을 팔 때는 포맵 커뮤니티를 이용해보세요.
                        마지막으로 포맵에서 소개하는 유기동물 보호소 페이지에서는 후원을 할 수 있습니다.
                         </p>
                    <!-- <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
					<a class="btn hvr-hover" href="#">Read More</a> -->
                </div>
            </div>
            <div class="row my-5">
                <div class="col-sm-6 col-lg-4">
                    <div class="service-block-inner">
                        <h3>우리동네 동물병원 찾기</h3>
                        <p>검색한 위치를 기반으로 주변 동물병원을 찾아드립니다. 병원에 대한 상세한 정보와 사람들의 후기를 확인해보세요!</p>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-4">
                    <div class="service-block-inner">
                        <h3>병원예약과 진료기록관리</h3>
                        <p>포맵의 제휴병원은 검색 후 바로 예약을 할 수 있습니다. 포맵에서 병원을 예약하고 병원 기록과 진단서관리를 시작하세요! </p>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-4">
                    <div class="service-block-inner">
                        <h3>반려인들을 위한 커뮤니티</h3>
                        <p>반려동물 키우는 이야기를 나눌 수 있는 자유게시판과 반려동물 관련 중고물건 나눔장터가 열려있습니다! </p>
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
                </section><!-- End Our Skills Section -->

            <div class="row my-4">
                <div class="col-12">
                    <h2 class="noo-sh-title">포맵을 만든 사람들</h2>
                </div>
                <div class="col-sm-4 col-lg-2">
                    <div class="hover-team">
                        <div class="our-team">  <div class="our-team-img"><img src="${pageContext.request.contextPath}/images/ourteam1.jpg" alt="" /></div>
                            <div class="team-content">
                                <h3 class="title">Jaeskaaa</h3> <span class="post">Developer</span> </div>
                            <ul class="social">
                            
                                <li>
                                    <a href="https://github.com/JAESKAAA" class="fab fa-github"></a>
                                </li>
                          
                            </ul>
                            <div class="icon"> <i class="fa fa-plus" aria-hidden="true"></i> </div>
                        </div>
                        <div class="team-description">
                            <!-- <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent urna diam, maximus ut ullamcorper quis, placerat id eros. Duis semper justo sed condimentum rutrum. Nunc tristique purus turpis. Maecenas vulputate. </p> -->
                        </div>
                        <hr class="my-0"> </div>
                </div>
                <div class="col-sm-4 col-lg-2">
                    <div class="hover-team">
                        <div class="our-team"> <div class="our-team-img"><img src="${pageContext.request.contextPath}/images/ourteam2.jpg" alt="" /></div>
                            <div class="team-content">
                                <h3 class="title">Bibi</h3> <span class="post">Developer</span> </div>
                            <ul class="social">
                              
                                <li>
                                    <a href="https://github.com/BIBI-CHOI" class="fab fa-github"></a>
                                </li>
                           
                            </ul>
                            <div class="icon"> <i class="fa fa-plus" aria-hidden="true"></i> </div>
                        </div>
                        <div class="team-description">
                            <!-- <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent urna diam, maximus ut ullamcorper quis, placerat id eros. Duis semper justo sed condimentum rutrum. Nunc tristique purus turpis. Maecenas vulputate. </p> -->
                        </div>
                        <hr class="my-0"> </div>
                </div>
                <div class="col-sm-4 col-lg-2">
                    <div class="hover-team">
                        <div class="our-team"><div class="our-team-img"><img src="${pageContext.request.contextPath}/images/ourteam3.jpg" alt="" /></div> 
                            <div class="team-content">
                                <h3 class="title">Thom</h3> <span class="post">Developer</span> </div>
                            <ul class="social">
                            
                                <li>
                                    <a href="https://github.com/leeyou31" class="fab fa-github"></a>
                                </li>
                          
                            </ul>
                            <div class="icon"> <i class="fa fa-plus" aria-hidden="true"></i> </div>
                        </div>
                        <div class="team-description">
                            <!-- <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent urna diam, maximus ut ullamcorper quis, placerat id eros. Duis semper justo sed condimentum rutrum. Nunc tristique purus turpis. Maecenas vulputate. </p> -->
                        </div>
                        <hr class="my-0"> </div>
                </div>
                
                <div class="col-sm-4 col-lg-2">
                    <div class="hover-team">
                        <div class="our-team"> <div class="our-team-img"><img src="${pageContext.request.contextPath}/images/our-team5.jpg" alt="" /></div>
                            <div class="team-content">
                                <h3 class="title">Unene</h3> <span class="post">Developer</span> </div>
                            <ul class="social">

                                <li>
                                    <a href="https://github.com/help-Extinguisher" class="fab fa-github"></a>
                                </li>
                          
                            </ul>
                            <div class="icon"> <i class="fa fa-plus" aria-hidden="true"></i> </div>
                        </div>
                        <div class="team-description">
                            <!-- <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent urna diam, maximus ut ullamcorper quis, placerat id eros. Duis semper justo sed condimentum rutrum. Nunc tristique purus turpis. Maecenas vulputate. </p> -->
                        </div>
                        <hr class="my-0"> </div>
                </div>
                <div class="col-sm-4 col-lg-2">
                  <div class="hover-team">
                      <div class="our-team"><div class="our-team-img"> <img src="${pageContext.request.contextPath}/images/ourteam4.jpg" alt="" /></div>
                          <div class="team-content">
                              <h3 class="title">Gogo</h3> <span class="post">Developer</span> </div>
                          <ul class="social">
                           
                              <li>
                                  <a href="https://github.com/GoGyul" class="fab fa-github"></a>
                              </li>
                         
                          </ul>
                          <div class="icon"> <i class="fa fa-plus" aria-hidden="true"></i> </div>
                      </div>
                      <div class="team-description">
                          <!-- <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent urna diam, maximus ut ullamcorper quis, placerat id eros. Duis semper justo sed condimentum rutrum. Nunc tristique purus turpis. Maecenas vulputate. </p> -->
                      </div>
                      <hr class="my-0"> </div>
              </div>
                <div class="col-sm-4 col-lg-2">
                    <div class="hover-team">
                        <div class="our-team"> <div class="our-team-img"><img src="${pageContext.request.contextPath}/images/ourteam6.jpg" alt="" /></div>
                            <div class="team-content">
                                <h3 class="title">Myezi</h3> <span class="post">Developer</span> </div>
                            <ul class="social">
                                <li>
                                    <a href="https://github.com/beetrootfarmer" class="fab fa-github"></a>
                                </li>
                          
                            </ul>
                            <div class="icon"> <i class="fa fa-plus" aria-hidden="true"></i> </div>
                        </div>
                        <div class="team-description">
                            <!-- <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent urna diam, maximus ut ullamcorper quis, placerat id eros. Duis semper justo sed condimentum rutrum. Nunc tristique purus turpis. Maecenas vulputate. </p> -->
                        </div>
                        <hr class="my-0"> </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End About Page -->



    <a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

    <!-- ALL JS FILES -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <!-- ALL PLUGINS -->
    <script src="${pageContext.request.contextPath}/js/jquery.superslides.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-select.js"></script>
    <script src="${pageContext.request.contextPath}/js/inewsticker.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootsnav.js."></script>
    <script src="${pageContext.request.contextPath}/js/images-loded.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/isotope.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/baguetteBox.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/form-validator.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/contact-form-script.js"></script>
    <script src="${pageContext.request.contextPath}/js/custom.js"></script>

  <!-- FontAwesome 용 JS 파일-->
    <script
      src="https://kit.fontawesome.com/f0999a1ca0.js"
      crossorigin="anonymous"
    ></script>
    
  <!-- Vendor JS Files -->
  <script src="${pageContext.request.contextPath}/js/purecounter.js"></script>
  <!-- <script src="../../../resources/static/js/aos.js"></script>
  <script src="../../../resources/static/js/bootstrap.bundle.min.js"></script>
  <script src="../../../resources/static/js/glightbox.min.js"></script> -->
  <script src="${pageContext.request.contextPath}/js/isotope.pkgd.min.js"></script>
  <!-- <script src="../../../resources/static/js/swiper-bundle.min.js"></script> -->
  <script src="${pageContext.request.contextPath}/js/noframework.waypoints.js"></script>

  <!-- Template Main JS File -->
  <script src="${pageContext.request.contextPath}/js/about.js"></script>
</body>

</html>
