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
    <title>PawMap - 우리집 주변 동물병원 찾기</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <!-- Site Icons -->
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png" />
    <!-- Fontawesome CSS-->
    <link
      href="https://use.fontawesome.com/releases/v5.0.6/css/all.css"
      rel="stylesheet"
    />
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
        background: rgba(0, 0, 0, 0.1);
      }
      #slides-shop {
        height: 100vh;
      }
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
            <a class="navbar-brand" href="index.html">
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
                <a class="nav-link" href="index.html">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="about.html">회사소개</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="gallery.html">병원찾기</a>
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
                  <li><a href="shop.html">공지사항</a></li>
                  <li><a href="shop-detail.html">자유게시판</a></li>
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
            </ul>
          </div>
          <!-- End Atribute Navigation -->
        </div>
        <!-- Start Side Menu -->
        <div class="side">
          <a href="#" class="close-side"><i class="fa fa-times"></i></a>
          <li class="cart-box">
            <ul class="cart-list">
              <li>
                <a href="#" class="photo"
                  ><img src="images/img-pro-01.jpg" class="cart-thumb" alt=""
                /></a>
                <h6><a href="#">Delica omtantur </a></h6>
                <p>1x - <span class="price">$80.00</span></p>
              </li>
              <li>
                <a href="#" class="photo"
                  ><img src="images/img-pro-02.jpg" class="cart-thumb" alt=""
                /></a>
                <h6><a href="#">Omnes ocurreret</a></h6>
                <p>1x - <span class="price">$60.00</span></p>
              </li>
              <li>
                <a href="#" class="photo"
                  ><img src="images/img-pro-03.jpg" class="cart-thumb" alt=""
                /></a>
                <h6><a href="#">Agam facilisis</a></h6>
                <p>1x - <span class="price">$40.00</span></p>
              </li>
              <li class="total">
                <a href="#" class="btn btn-default hvr-hover btn-cart"
                  >VIEW CART</a
                >
                <span class="float-right"><strong>Total</strong>: $180.00</span>
              </li>
            </ul>
          </li>
        </div>
        <!-- End Side Menu -->
      </nav>
      <!-- End Navigation -->
    </header>
    <!-- Header 끝 부분 -->

    <!-- Start Top Search -->
    <div class="top-search">
      <div class="container">
        <div class="input-group">
          <span class="input-group-addon"><i class="fa fa-search"></i></span>
          <input type="text" class="form-control" placeholder="Search" />
          <span class="input-group-addon close-search"
            ><i class="fa fa-times"></i
          ></span>
        </div>
      </div>
    </div>
    <!-- End Top Search -->

    <!-- Start Slider -->
    <div id="slides-shop" class="cover-slides">
      <ul class="slides-container">
        <li class="text-center">
          <img src="images/Dog1.jpg" alt="" />
          <div class="container">
            <div class="row">
              <div class="col-md-12">
                <h1 class="m-b-20">
                  <strong
                    >Welcome To <br />
                    PawMap</strong
                  >
                </h1>
                <p class="m-b-40">
                  테스트 문구
                  <br />
                  테스트 문구 테스트 테스트 테스트 테스트
                </p>
                <p><a class="btn hvr-hover" href="#">자세히 보기</a></p>
              </div>
            </div>
          </div>
        </li>
        <li class="text-center">
          <img src="images/Dog2.jpg" alt="" />
          <div class="container">
            <div class="row">
              <div class="col-md-12">
                <h1 class="m-b-20">
                  <strong
                    >PawMap <br />
                    병원 찾기 서비스</strong
                  >
                </h1>
                <p class="m-b-40">
                  반려동물을 위한 병원 찾기 서비스
                  <br />
                  여러분의 근처에 착한 동물 병원을 찾아보세요.
                </p>
                <p><a class="btn hvr-hover" href="#">자세히 보기</a></p>
              </div>
            </div>
          </div>
        </li>
        <li class="text-center">
          <img src="images/ugi.jpg" alt="" />
          <div class="container">
            <div class="row">
              <div class="col-md-12">
                <h1 class="m-b-20">
                  <strong
                    >PawMap <br />
                    보호소 찾기 서비스</strong
                  >
                </h1>
                <p class="m-b-40">
                  어려움에 처한 유기 및 파양 동물에게 작은 힘이 되어주세요.
                  <br />
                  여러분의 작은 관심이 이들에게 큰 힘이 됩니다.
                </p>
                <p><a class="btn hvr-hover" href="#">자세히 보기</a></p>
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
    <div class="container custom_margin">
      <div class="d-flex justify-content-center">
        <div class="search">
          <h3 class="text-center text-uppercase font-weight-bold">
            우리 동네 병원을 찾아보세요!
          </h3>
          <input
            class="search_input"
            type="text"
            name=""
            placeholder="search items !"
          />
          <a href="#" class="search_icon"><i class="fa fa-search"></i></a>
        </div>
      </div>
    </div>
    <!-- 검색 부분 끝-->

    <!--About Us 부분-->
    <div class="container custom_aboutUsBox">
      <div class="custom_aboutUs_textBox">
        <div class="h6 aboutUs_title">For the Animal</div>
        <br />
        <div class="custom_aboutUs_innerTextBox">
          동물을 위하는 마음으로 뭉쳤습니다.<br />
          강아지 고양이 말 소 개구리 파충류 돼지 곤충 매미 귀뚜라미 딱정벌레
        </div>
        <br />
        <button class="btn btn-primary btn-sm custom_btn" type="button">
          더보기
        </button>
      </div>
      <video
        class="index_video"
        src="images/cat_video.mp4"
        muted
        autoplay
        loop
      ></video>
    </div>
    <!--About Us 부분 끝-->

    <!--제휴 병원 소개 부분-->
    <div class="container custom_aboutUsBox">
      <div class="custom_aboutUs_img"></div>

      <div class="custom_aboutUs_textBox">
        <div class="h6 aboutUs_title">제휴 병원 안내</div>
        <br />
        <div class="custom_aboutUs_innerTextBox">
          잘하는 수의사들만 모아봤습니다.<br />
          강릉 아산병원 신림 양지병원 신촌 연세세브란스병원 <br />
          보라매공원 근처 보라매 병원 와플맛집 산책하고싶다
        </div>
        <br />
        <button class="btn btn-primary btn-sm custom_btn" type="button">
          더보기
        </button>
      </div>
    </div>
    <!--제휴 병원 소개 부분 끝-->

    <hr class="custom_hr" />

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

    <!-- 후원자 표기 부분-->
    <!-- <div class="container charity_box">
      <div class="">후원자 닉네임 : 50,000원</div>
      <div class="">후원자 닉네임 : 50,000원</div>
      <div class="">후원자 닉네임 : 50,000원</div>
      <div class="">후원자 닉네임 : 50,000원</div>
    </div> -->
    <!-- 후원자 표기 부분 끝-->

    <!-- Start Products  -->
    <!-- <div class="products-box">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="title-all text-center">
              <h1>Fruits & Vegetables</h1>
              <p>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit
                amet lacus enim.
              </p>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <div class="special-menu text-center">
              <div class="button-group filter-button-group">
                <button class="active" data-filter="*">All</button>
                <button data-filter=".top-featured">Top featured</button>
                <button data-filter=".best-seller">Best seller</button>
              </div>
            </div>
          </div>
        </div>

        <div class="row special-list">
          <div class="col-lg-3 col-md-6 special-grid best-seller">
            <div class="products-single fix">
              <div class="box-img-hover">
                <div class="type-lb">
                  <p class="sale">Sale</p>
                </div>
                <img
                  src="images/img-pro-01.jpg"
                  class="img-fluid"
                  alt="Image"
                />
                <div class="mask-icon">
                  <ul>
                    <li>
                      <a
                        href="#"
                        data-toggle="tooltip"
                        data-placement="right"
                        title="View"
                        ><i class="fas fa-eye"></i
                      ></a>
                    </li>
                    <li>
                      <a
                        href="#"
                        data-toggle="tooltip"
                        data-placement="right"
                        title="Compare"
                        ><i class="fas fa-sync-alt"></i
                      ></a>
                    </li>
                    <li>
                      <a
                        href="#"
                        data-toggle="tooltip"
                        data-placement="right"
                        title="Add to Wishlist"
                        ><i class="far fa-heart"></i
                      ></a>
                    </li>
                  </ul>
                  <a class="cart" href="#">Add to Cart</a>
                </div>
              </div>
              <div class="why-text">
                <h4>Lorem ipsum dolor sit amet</h4>
                <h5>$7.79</h5>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 special-grid top-featured">
            <div class="products-single fix">
              <div class="box-img-hover">
                <div class="type-lb">
                  <p class="new">New</p>
                </div>
                <img
                  src="images/img-pro-02.jpg"
                  class="img-fluid"
                  alt="Image"
                />
                <div class="mask-icon">
                  <ul>
                    <li>
                      <a
                        href="#"
                        data-toggle="tooltip"
                        data-placement="right"
                        title="View"
                        ><i class="fas fa-eye"></i
                      ></a>
                    </li>
                    <li>
                      <a
                        href="#"
                        data-toggle="tooltip"
                        data-placement="right"
                        title="Compare"
                        ><i class="fas fa-sync-alt"></i
                      ></a>
                    </li>
                    <li>
                      <a
                        href="#"
                        data-toggle="tooltip"
                        data-placement="right"
                        title="Add to Wishlist"
                        ><i class="far fa-heart"></i
                      ></a>
                    </li>
                  </ul>
                  <a class="cart" href="#">Add to Cart</a>
                </div>
              </div>
              <div class="why-text">
                <h4>Lorem ipsum dolor sit amet</h4>
                <h5>$9.79</h5>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 special-grid top-featured">
            <div class="products-single fix">
              <div class="box-img-hover">
                <div class="type-lb">
                  <p class="sale">Sale</p>
                </div>
                <img
                  src="images/img-pro-03.jpg"
                  class="img-fluid"
                  alt="Image"
                />
                <div class="mask-icon">
                  <ul>
                    <li>
                      <a
                        href="#"
                        data-toggle="tooltip"
                        data-placement="right"
                        title="View"
                        ><i class="fas fa-eye"></i
                      ></a>
                    </li>
                    <li>
                      <a
                        href="#"
                        data-toggle="tooltip"
                        data-placement="right"
                        title="Compare"
                        ><i class="fas fa-sync-alt"></i
                      ></a>
                    </li>
                    <li>
                      <a
                        href="#"
                        data-toggle="tooltip"
                        data-placement="right"
                        title="Add to Wishlist"
                        ><i class="far fa-heart"></i
                      ></a>
                    </li>
                  </ul>
                  <a class="cart" href="#">Add to Cart</a>
                </div>
              </div>
              <div class="why-text">
                <h4>Lorem ipsum dolor sit amet</h4>
                <h5>$10.79</h5>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 special-grid best-seller">
            <div class="products-single fix">
              <div class="box-img-hover">
                <div class="type-lb">
                  <p class="sale">Sale</p>
                </div>
                <img
                  src="images/img-pro-04.jpg"
                  class="img-fluid"
                  alt="Image"
                />
                <div class="mask-icon">
                  <ul>
                    <li>
                      <a
                        href="#"
                        data-toggle="tooltip"
                        data-placement="right"
                        title="View"
                        ><i class="fas fa-eye"></i
                      ></a>
                    </li>
                    <li>
                      <a
                        href="#"
                        data-toggle="tooltip"
                        data-placement="right"
                        title="Compare"
                        ><i class="fas fa-sync-alt"></i
                      ></a>
                    </li>
                    <li>
                      <a
                        href="#"
                        data-toggle="tooltip"
                        data-placement="right"
                        title="Add to Wishlist"
                        ><i class="far fa-heart"></i
                      ></a>
                    </li>
                  </ul>
                  <a class="cart" href="#">Add to Cart</a>
                </div>
              </div>
              <div class="why-text">
                <h4>Lorem ipsum dolor sit amet</h4>
                <h5>$15.79</h5>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div> -->
    <!-- End Products  -->

    <!-- Start Blog  -->
    <!-- <div class="latest-blog">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="title-all text-center">
              <h1>latest blog</h1>
              <p>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit
                amet lacus enim.
              </p>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6 col-lg-4 col-xl-4">
            <div class="blog-box">
              <div class="blog-img">
                <img class="img-fluid" src="images/blog-img.jpg" alt="" />
              </div>
              <div class="blog-content">
                <div class="title-blog">
                  <h3>Fusce in augue non nisi fringilla</h3>
                  <p>
                    Nulla ut urna egestas, porta libero id, suscipit orci.
                    Quisque in lectus sit amet urna dignissim feugiat. Mauris
                    molestie egestas pharetra. Ut finibus cursus nunc sed
                    mollis. Praesent laoreet lacinia elit id lobortis.
                  </p>
                </div>
                <ul class="option-blog">
                  <li>
                    <a href="#"><i class="far fa-heart"></i></a>
                  </li>
                  <li>
                    <a href="#"><i class="fas fa-eye"></i></a>
                  </li>
                  <li>
                    <a href="#"><i class="far fa-comments"></i></a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 col-xl-4">
            <div class="blog-box">
              <div class="blog-img">
                <img class="img-fluid" src="images/blog-img-01.jpg" alt="" />
              </div>
              <div class="blog-content">
                <div class="title-blog">
                  <h3>Fusce in augue non nisi fringilla</h3>
                  <p>
                    Nulla ut urna egestas, porta libero id, suscipit orci.
                    Quisque in lectus sit amet urna dignissim feugiat. Mauris
                    molestie egestas pharetra. Ut finibus cursus nunc sed
                    mollis. Praesent laoreet lacinia elit id lobortis.
                  </p>
                </div>
                <ul class="option-blog">
                  <li>
                    <a href="#"><i class="far fa-heart"></i></a>
                  </li>
                  <li>
                    <a href="#"><i class="fas fa-eye"></i></a>
                  </li>
                  <li>
                    <a href="#"><i class="far fa-comments"></i></a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 col-xl-4">
            <div class="blog-box">
              <div class="blog-img">
                <img class="img-fluid" src="images/blog-img-02.jpg" alt="" />
              </div>
              <div class="blog-content">
                <div class="title-blog">
                  <h3>Fusce in augue non nisi fringilla</h3>
                  <p>
                    Nulla ut urna egestas, porta libero id, suscipit orci.
                    Quisque in lectus sit amet urna dignissim feugiat. Mauris
                    molestie egestas pharetra. Ut finibus cursus nunc sed
                    mollis. Praesent laoreet lacinia elit id lobortis.
                  </p>
                </div>
                <ul class="option-blog">
                  <li>
                    <a href="#"><i class="far fa-heart"></i></a>
                  </li>
                  <li>
                    <a href="#"><i class="fas fa-eye"></i></a>
                  </li>
                  <li>
                    <a href="#"><i class="far fa-comments"></i></a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div> -->
    <!-- End Blog  -->

    <!-- Start Instagram Feed //이거 디자인 좋은데 활용 방안 없을지 확인해보기 -->
    <!-- <div class="instagram-box">
      <div class="main-instagram owl-carousel owl-theme">
        <div class="item">
          <div class="ins-inner-box">
            <img src="images/instagram-img-01.jpg" alt="" />
            <div class="hov-in">
              <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
          </div>
        </div>
        <div class="item">
          <div class="ins-inner-box">
            <img src="images/instagram-img-02.jpg" alt="" />
            <div class="hov-in">
              <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
          </div>
        </div>
        <div class="item">
          <div class="ins-inner-box">
            <img src="images/instagram-img-03.jpg" alt="" />
            <div class="hov-in">
              <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
          </div>
        </div>
        <div class="item">
          <div class="ins-inner-box">
            <img src="images/instagram-img-04.jpg" alt="" />
            <div class="hov-in">
              <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
          </div>
        </div>
        <div class="item">
          <div class="ins-inner-box">
            <img src="images/instagram-img-05.jpg" alt="" />
            <div class="hov-in">
              <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
          </div>
        </div>
        <div class="item">
          <div class="ins-inner-box">
            <img src="images/instagram-img-06.jpg" alt="" />
            <div class="hov-in">
              <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
          </div>
        </div>
        <div class="item">
          <div class="ins-inner-box">
            <img src="images/instagram-img-07.jpg" alt="" />
            <div class="hov-in">
              <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
          </div>
        </div>
        <div class="item">
          <div class="ins-inner-box">
            <img src="images/instagram-img-08.jpg" alt="" />
            <div class="hov-in">
              <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
          </div>
        </div>
        <div class="item">
          <div class="ins-inner-box">
            <img src="images/instagram-img-09.jpg" alt="" />
            <div class="hov-in">
              <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
          </div>
        </div>
        <div class="item">
          <div class="ins-inner-box">
            <img src="images/instagram-img-05.jpg" alt="" />
            <div class="hov-in">
              <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
          </div>
        </div>
      </div>
    </div> -->
    <!-- End Instagram Feed  -->

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
    <!-- 1:1 상담 관련 js 파일-->
    <script src="js/custom-jaeseok.js"></script>
  </body>
</html>
