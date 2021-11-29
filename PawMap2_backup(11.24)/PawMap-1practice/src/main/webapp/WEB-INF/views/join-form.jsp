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

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <style>
      .form-label {
        color: brown;
      }
      .left-div {
        background-color: #ffdab9;
        border-radius: 50% 20% / 10% 40%;
      }
      .column-div {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 400px;
        height: 270px;
        background-color: antiquewhite;
        border-radius: 100px;
        margin: auto;
      }

      /* =================  일반 회원 가입 태그들 관련 CSS 시작 ================  */
      .nomal-join {
        background-image: url(images/gyul_animals_img-001.jpg);
        background-repeat: no-repeat;
        background-size: 400px 300px;
        background-position: center;
      }
      .nomal-join:hover .btn-join-nomal {
        display: block;
      }
      .nomal-join:hover {
        opacity: 50%;
        transition: all 0.5s ease-in-out;
      }
      .btn-join-nomal {
        display: none;
      }
      /* =================  일반 회원 가입 태그들 관련 CSS 종료 ================  */

      /* =================  병원 회원 가입 태그들 관련 CSS ================  */
      .hospital-join {
        background-image: url(images/gyul_hospital-img-001.jpg);
        background-repeat: no-repeat;
        background-size: 300px 300px;
        background-position: center;
      }
      .hospital-join:hover .btn-join-hospital {
        display: block;
      }
      .hospital-join:hover {
        opacity: 50%;
        transition: all 0.5s ease-in-out;
      }
      .btn-join-hospital {
        display: none;
      }
      /* =================  병원 회원 가입 태그들 관련 CSS 종료 ================  */

      /* ====================== 회원 가입 태그 공통 속성 ===================  */
      .btn-join-hospital,
      .btn-join-nomal {
        font-size: 40px;
        border: 1px solid black;
        border-radius: 20%;
        box-shadow: 5px 5px 5px 5px black;
      }
      .btn-join-hospital:hover,
      .btn-join-nomal:hover {
        opacity: 90%;
        background-color: gray;
        color: black;
      }
    </style>
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

    <!---------------------------------- 회원가입 폼 -------------------------->

    <section class="vh-100" style="background-color: #eee">
      <div class="container h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
          <div class="col-lg-12 col-xl-11">
            <div class="card text-black" style="border-radius: 25px">
              <div class="card-body p-md-5">
                <div class="row justify-content-center">
                  <div
                    class="
                      col-md-10 col-lg-6 col-xl-6
                      order-2 order-lg-1
                      left-div
                    "
                  >
                    <div class="column-div hospital-join">
                      <div>
                        <a class="btn-join-hospital" href="#">병원회원 가입</a>
                      </div>
                    </div>
                  </div>
                  <div
                    class="
                      col-md-10 col-lg-6 col-xl-6
                      order-2 order-lg-1
                      left-div
                    "
                  >
                    <div class="column-div nomal-join">
                      <div>
                        <a class="btn-join-nomal" href="/pawmap/userJoinForm"
                          >일반회원 가입</a
                        >
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!---------------------------------- 회원가입 폼 종료 -------------------------->

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
