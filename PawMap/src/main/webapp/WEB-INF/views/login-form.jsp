<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <!-- Basic -->

  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Site Metas -->
    <title>Freshshop - Ecommerce Bootstrap 4 HTML Template</title>
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

    <!-- 결 커스텀 css -->
    <link rel="stylesheet" href="css/style-gyul.css" />

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- 아이디 비밀번호 공백확인 alert창 -->
    <script>
      function makeTestData() {
        var form = document.loginForm;
        form.userId.value = 'user1';
        form.loginPasswd.value = 'user1';
      }
      function submitLoginForm(form) {
        form.userId.value = form.userId.value.trim();
        if (form.userId.value.length == 0) {
          alert('로그인 아이디를 입력해주세요.');
          form.userId.focus();
          return false;
        }
        form.loginPasswd.value = form.loginPasswd.value.trim();
        if (form.loginPasswd.value.length == 0) {
          alert('로그인 비밀번호를 입력해주세요.');
          form.loginPasswd.focus();
          return false;
        }
    
        form.submit();
      }
    </script>
    <style></style>
  </head>

  <body>
    <!-- Start Main Top -->

    <!-- End Main Top -->

    <!-- Start Main Top -->
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
            <a class="navbar-brand" href="index.html"
              ><img src="images/logo.png" class="logo" alt=""
            /></a>
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
                <a class="nav-link" href="#">홈</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">어바웃어스</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">병원찾기</a>
              </li>
              <li class="dropdown">
                <a
                  href="#"
                  class="nav-link dropdown-toggle arrow"
                  data-toggle="dropdown"
                  >커뮤니티</a
                >
                <ul class="dropdown-menu">
                  <li><a href="shop.html">자유게시판</a></li>
                  <li><a href="shop-detail.html">공지사항</a></li>
                  <li><a href="cart.html">이벤트게시판</a></li>
                  <li><a href="checkout.html">나눔게시판</a></li>
                </ul>
              </li>
              <li class="nav-item"><a class="nav-link" href="#">보호소</a></li>
              <li class="nav-item">
                <a class="nav-link" href="#">마이페이지</a>
              </li>
              <li class="nav-item"><a class="nav-link" href="#">로그인</a></li>
              <li class="nav-item">
                <a class="nav-link" href="#">회원가입</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </header>

    <!---------------------------------- 로그인 폼 시작 -------------------------->

    <div class="container-fluid">
      <div class="row justify-content-center">
        <div class="col-12 col-sm-10 col-md-12 col-lg-11 col-xl-10">
          <div class="card-loginForm d-flex mx-auto my-5">
            <div class="row">
              <div class="col-md-5 col-sm-12 col-xs-12 c1-loginForm p-5">
                <div class="row mb-5 m-3">
                  <img src="" width="70vw" height="55vh" alt="" />
                </div>
                <img
                  src="images/gyul_animals_img-001.jpg"
                  width="250vw"
                  height="120vh"
                  class="mx-auto d-flex"
                  style="border-radius: 30px"
                />
                <div class="row justify-content-center">
                  <div
                    class="
                      w-75
                      mx-md-5 mx-1 mx-sm-2
                      mb-5
                      mt-4
                      px-sm-5 px-md-2 px-xl-1 px-2
                    "
                  >
                    <h1 class="wlcm">Welcome PawMap</h1>
                  </div>
                </div>
              </div>
              <div class="col-md-7 col-sm-12 col-xs-12 c2 px-5 pt-5">
               
               
               
                <!-- submitLoginForm : 아이디 공백 확인을 위한 메소드   -->
                <form
                  action="/pawmap/login"
                  method="post"
                  class="px-5 pb-5 login-form"
                  onsubmit="submitLoginForm(this);return false;"
                >
                  <div class="d-flex">
                    <img
                      src="images/gyul_cat_img_001.jpg"
                      height="22px"
                      width="22px"
                      alt=""
                      class="mr-3 mt-2"
                      style="border-radius: 25px"
                    />
                    <h3 class="font-weight-bold">Log in</h3>
                  </div>

                  <span>아이디</span>
                  <input
                    class="login-input"
                    type="text"
                    name="userId"
                    placeholder="User"
                    required="required" autofocus="autofocus" maxlength="30"
                  />
                  <span> 비밀번호 </span>
                  <input
                    class="login-input"
                    name="userPassword"
                    placeholder="Password"
                    required="required" maxlength="30"
                  />
                  <button
                    type="submit"
                    class="login-btn text-white text-weight-bold"
                  >
                    로그인
                  </button>
                  <a
                    href="/pawmap/oauth2/authorization/google"
                    class="login-btn text-white text-weight-bold"
                  >
                    <i class="fab fa-google"></i> 구글 로그인
                  </a>
                  <div>
                    <a href="/pawmap/forgotPw" class="btn-other" id="forgot">
                      비밀번호를 잊어버렸습니까?</a
                    >
                  </div>
                  <div>
                    <a href="/pawmap/joinForm" class="btn-other" id="register"
                      >회원가입</a>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!---------------------------------- 로그인 폼 종료 -------------------------->

    <!-- Start Footer  -->
    <footer>
      <div class="footer-main">
        <div class="container">
          <div class="row">
            <div class="col-lg-4 col-md-12 col-sm-12">
              <div class="footer-top-box">
                <h3>Business Time</h3>
                <ul class="list-time">
                  <li>Monday - Friday: 08.00am to 05.00pm</li>
                  <li>Saturday: 10.00am to 08.00pm</li>
                  <li>Sunday: <span>Closed</span></li>
                </ul>
              </div>
            </div>
            <div class="col-lg-4 col-md-12 col-sm-12">
              <div class="footer-top-box">
                <h3>Newsletter</h3>
                <form class="newsletter-box">
                  <div class="form-group">
                    <input
                      class=""
                      type="email"
                      name="Email"
                      placeholder="Email Address*"
                    />
                    <i class="fa fa-envelope"></i>
                  </div>
                  <button class="btn hvr-hover" type="submit">Submit</button>
                </form>
              </div>
            </div>
            <div class="col-lg-4 col-md-12 col-sm-12">
              <div class="footer-top-box">
                <h3>Social Media</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                <ul>
                  <li>
                    <a href="#"
                      ><i class="fab fa-facebook" aria-hidden="true"></i
                    ></a>
                  </li>
                  <li>
                    <a href="#"
                      ><i class="fab fa-twitter" aria-hidden="true"></i
                    ></a>
                  </li>
                  <li>
                    <a href="#"
                      ><i class="fab fa-linkedin" aria-hidden="true"></i
                    ></a>
                  </li>
                  <li>
                    <a href="#"
                      ><i class="fab fa-google-plus" aria-hidden="true"></i
                    ></a>
                  </li>
                  <li>
                    <a href="#"><i class="fa fa-rss" aria-hidden="true"></i></a>
                  </li>
                  <li>
                    <a href="#"
                      ><i class="fab fa-pinterest-p" aria-hidden="true"></i
                    ></a>
                  </li>
                  <li>
                    <a href="#"
                      ><i class="fab fa-whatsapp" aria-hidden="true"></i
                    ></a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
          <hr />
          <div class="row">
            <div class="col-lg-4 col-md-12 col-sm-12">
              <div class="footer-widget">
                <h4>About Freshshop</h4>
                <p>
                  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
                  do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                  Ut enim ad minim veniam, quis nostrud exercitation ullamco
                  laboris nisi ut aliquip ex ea commodo consequat.
                </p>
                <p>
                  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
                  do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                </p>
              </div>
            </div>
            <div class="col-lg-4 col-md-12 col-sm-12">
              <div class="footer-link">
                <h4>Information</h4>
                <ul>
                  <li><a href="#">About Us</a></li>
                  <li><a href="#">Customer Service</a></li>
                  <li><a href="#">Our Sitemap</a></li>
                  <li><a href="#">Terms &amp; Conditions</a></li>
                  <li><a href="#">Privacy Policy</a></li>
                  <li><a href="#">Delivery Information</a></li>
                </ul>
              </div>
            </div>
            <div class="col-lg-4 col-md-12 col-sm-12">
              <div class="footer-link-contact">
                <h4>Contact Us</h4>
                <ul>
                  <li>
                    <p>
                      <i class="fas fa-map-marker-alt"></i>Address: Michael I.
                      Days 3756 <br />Preston Street Wichita,<br />
                      KS 67213
                    </p>
                  </li>
                  <li>
                    <p>
                      <i class="fas fa-phone-square"></i>Phone:
                      <a href="tel:+1-888705770">+1-888 705 770</a>
                    </p>
                  </li>
                  <li>
                    <p>
                      <i class="fas fa-envelope"></i>Email:
                      <a href="mailto:contactinfo@gmail.com"
                        >contactinfo@gmail.com</a
                      >
                    </p>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </footer>
    <!-- End Footer  -->

    <!-- Start copyright  -->
    <div class="footer-copyright">
      <p class="footer-company">
        All Rights Reserved. &copy; 2018 <a href="#">ThewayShop</a> Design By :
        <a href="https://html.design/">html design</a>
      </p>
    </div>
    <!-- End copyright  -->

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
  </body>
</html>
