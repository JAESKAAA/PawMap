<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kor">
<!-- Basic -->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <title>PawMapAdminMainPage</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/custom.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/custom-tom.css">

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
  <!--Thomas lee started working on this page since nov 16th-->
    <div class="main-top">
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="our-link" style="float:right;">
              <ul>
                <li><a href="#">로그아웃</a></li>
              </ul>
            </div>
            <div class="our-link" style="float:right">
              <ul class="offer-box">
                <!--thomas's comment: 상기 offer-box 태그로 인해 하기 li 태그들은 Border-right에 하얀 선이 나왔고 해당 사유로 하기 태그들은 스타일을 없앴음.-->
                <li style="border-right:none; font-size:14px;">관리자페이지 입니다.</li>
                <li style="border-right:none; font-size:14px;">Admin Page</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  <!-- admin페이지의 header 시작...-->
  <header class="main-header">
    <!-- Start Navigation --> <!--하기 navbar navbar-expand-lg를 md로 교체-->
    <nav class="navbar navbar-expand-md navbar-light bg-light navbar-default bootsnav">
        <div class="container">
            <!-- Start Header Navigation -->
            <div class="navbar-header">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-menu" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fa fa-bars"></i>
            </button>
                <a class="navbar-brand" href="index.html"><img src="images/pawmaplogo.png" class="logo" alt="" width="216" height="118"></a>
            </div>
            <!-- End Header Navigation -->

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="navbar-menu">
                <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                    <li class="nav-item active"><a class="nav-link" href="adminpage2vetmange-tom.html"> 제휴병원 관리</a></li>
                    <li class="nav-item"><a class="nav-link" href="adminpage4usermanage-tom.html"> 회원정보 관리</a></li>
                    <li class="nav-item"><a class="nav-link" href="adminpage6sheltermanage-tom.html"> 보호소정보 관리</a></li>
                    <li class="nav-item"><a class="nav-link" href="adminpage9communitymanage-tom.html"> 커뮤니티 게시판 관리</a></li>
                    <li class="nav-item"><a class="nav-link" href="adminpage11counseloneonone-tom.html"> 1:1 상담 관리</a></li>
                    <li class="nav-item"><a class="nav-link" href="adminpage13donationmanage-tom.html"> 후원금 관리</a></li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
    </nav>
    <!-- End Navigation --> <!--관리자 페이지 공통 부분 완료...-->
  </header>
  <!--adminmainpage-->
  <div class="my-account-box-main">
    <div class="container">
      <div class="row">
        <div class="col-lg-4 col-md-12">
            <div class="account-box">
                <div class="service-box">
                    <div class="service-icon">
                        <a href="/pawmap/getHospitalList"> <i class="far fa-hospital"></i> </a>
                    </div>
                    <div class="service-desc">
                        <h4>제휴병원 관리</h4>
                        <p>제휴된 동물 병원 정보 관리 및 수정</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-12">
            <div class="account-box">
                <div class="service-box">
                    <div class="service-icon">
                        <a href="/pawmap/getUserList"><i class="fas fa-user-cog"></i> </a>
                    </div>
                    <div class="service-desc">
                        <h4>회원정보 관리</h4>
                        <p>회원정보 관리 및 수정</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-12">
            <div class="account-box">
                <div class="service-box">
                    <div class="service-icon">
                        <a href="adminpage6sheltermanage-tom.html"> <i class="fas fa-building"></i> </a>
                    </div>
                    <div class="service-desc">
                        <h4>보호소정보 관리</h4>
                        <p>동불 보호소 정보 관리 및 수정</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-12">
            <div class="account-box">
                <div class="service-box">
                    <div class="service-icon">
                        <a href="adminpage9communitymanage-tom.html"> <i class="fas fa-clipboard-list"></i> </a>
                    </div>
                    <div class="service-desc">
                        <h4>커뮤니티 게시판 관리</h4>
                        <p>커뮤니티 게시판 관리 및 수정</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-12">
            <div class="account-box">
                <div class="service-box">
                    <div class="service-icon">
                        <a href="adminpage11counseloneonone-tom.html"> <i class="fas fa-comments"></i> </a>
                    </div>
                    <div class="service-desc">
                        <h4>1:1 상담 관리</h4>
                        <p>1:1 상담 관리 하는 곳</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-12">
            <div class="account-box">
                <div class="service-box">
                    <div class="service-icon">
                        <a href="adminpage13donationmanage-tom.html"> <i class="fas fa-donate"></i> </a>
                    </div>
                    <div class="service-desc">
                        <h4>후원금 관리</h4>
                        <p>후원금 명단 확인</p>
                    </div>
                </div>
            </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Start showing the summary of the each section(병원관리, 유저관리, 등등)-->
  <div class="cart-box-main">
    <div class="container">
        <div class="row">
            <div class="col-sm-6 col-lg-6 mb-3">
                <div class="title-left">
                    <h3>제휴 병원 관리</h3>
                </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="firstName">병원 이름</label>
                            <div class="invalid-feedback"> Valid first name is required. </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <input type="text" class="form-control" id="lastName" placeholder="" value="" required>
                            <div class="invalid-feedback"> Valid last name is required. </div>
                        </div>
                    </div>     
            </div>
            <div class="col-sm-6 col-lg-6 mb-3">
                <div class="title-left">
                    <h3>Create New Account</h3>
                </div>
                <h5><a data-toggle="collapse" href="#formRegister" role="button" aria-expanded="false">Click here to Register</a></h5>
                <form class="mt-3 collapse review-form-box" id="formRegister">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="InputName" class="mb-0">First Name</label>
                            <input type="text" class="form-control" id="InputName" placeholder="First Name"> </div>
                        <div class="form-group col-md-6">
                            <label for="InputLastname" class="mb-0">Last Name</label>
                            <input type="text" class="form-control" id="InputLastname" placeholder="Last Name"> </div>
                        <div class="form-group col-md-6">
                            <label for="InputEmail1" class="mb-0">Email Address</label>
                            <input type="email" class="form-control" id="InputEmail1" placeholder="Enter Email"> </div>
                        <div class="form-group col-md-6">
                            <label for="InputPassword1" class="mb-0">Password</label>
                            <input type="password" class="form-control" id="InputPassword1" placeholder="Password"> </div>
                    </div>
                    <button type="submit" class="btn hvr-hover">Register</button>
                </form>
            </div>
        </div>
    </div>
  </div>




        <!-- Start Footer  -->
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
  
      <!--채팅 아이콘-->
      <!-- <button id="chat_icon" onclick="hideDisplay()"
        ><i class="far fa-comment"></i></button> -->
      <!--채팅 아이콘 끝-->
  
      <!-- 채팅 모달 추가될 자리-->
      <!-- <div class="chat_container">
        <button class="chat_close" onclick="chatHide()"><i class="fas fa-times"></i></button>
      </div> -->
      <!-- 채팅 모달 끝-->
  
      <a href="#" id="back-to-top" title="Back to top" style="display: none"
        >&uarr;</a>
   
    
  
  
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

    		<!-- jquery의 timeago 플러그인 사용 -->
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
		<script src="./js/jquery.timeago.js" type="text/javascript"></script>

		<script type="text/javascript">
			$(document).ready(function(){
				// timeago 플러그인을 미래 시각으로 동작할 수 있게 설정
				jQuery.timeago.settings.allowFuture = true;
				
				var now = new Date();
				
				$(".timeago").timeago();
				$(".page-opened").text($.timeago(now));
				$("time").timeago();
			});
		</script>

		<!-- abbr 엘리먼트는 time과 동일하지만 오래된 브라우저를 지원하기 위해서 사용한다.-->
		<p> abbr태그 이용 :  <abbr class="timeago" title="1993-08-16"></abbr> </p>
		<p> 페이지 오픈한지 : <span class="page-opened"> </p>
		<!-- 브라우저에서 time 엘리먼트 서식을 기계가 읽듯이 읽어 캘린더에 추가하는 기능을 구현할 때 사용한다. -->
		<p> time태그 이용 : <time datetime="2015-01-03 20:09-0700"></time> </p>
</body>

</html>