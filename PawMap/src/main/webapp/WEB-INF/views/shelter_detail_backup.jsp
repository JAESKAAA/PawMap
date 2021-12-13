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




  </head>

  <body>


    <!-- Start All Title Box -->
    <div class="all-title-box">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <h2>유기 / 파양 동물 보호소</h2>
          </div>
        </div>
      </div>
    </div>
    <!-- End All Title Box -->

    <!-- 유기동물 보호소 문구  -->
    <div class="products-box">
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
    <div id="abandon_detail_box">
      <div class="abandon_detail_box_inner_img">
        <img class="img-fluid" src="${pageContext.request.contextPath}/upload/${shelterPic.originalFileName}" alt="" />
      
      </div>
      <!-- 사진목록 끝-->
      <!-- 보호센터 정보 부분-->
      <div class="container">
        <div class="row abandon_detail_box_inner">
          <div>
            <div class="contact-info-left">
              <h2>${shelterPic.shelterName }</h2>
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
    
    <!-- 유기동물 보호소 문구  -->
    <div class="products-box">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="title-all text-center">
              <h1>다른 보호소 정보</h1>
              <hr />
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Start Instagram Feed  -->
    <div class="instagram-box">
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
