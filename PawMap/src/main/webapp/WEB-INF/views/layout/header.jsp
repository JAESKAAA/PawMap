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


<%-- <%=request.getContextPath() %> --%>
    <!-- Site Icons -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico" type="image/x-icon" />
    <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/images/apple-touch-icon.png" />
    <!-- Fontawesome CSS-->
    <link
      href="https://use.fontawesome.com/releases/v5.0.6/css/all.css"
      rel="stylesheet"
    />
  
    <%-- ${pageContext.request.contextPath} --%>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style-mye.css">
        <!-- 결 커스텀 css -->
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