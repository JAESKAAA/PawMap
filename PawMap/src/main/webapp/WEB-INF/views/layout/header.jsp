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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style-gyul.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom-silbia.css">
      <!-- 테이블 부분 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footable.bootstrap.css" />

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
                      <a href="about.html" id="nav-a" class="nav-link text-uppercase font-weight-bold">회사소개</a></li>
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
                          <li style="padding: 3%;"><a href="cart.html"  style="color: #fff; size: 0.8em;">나눔게시판</a></li>
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
                <p id="attr-nav-p">마이페이지 ${principal.user.userNickname} 님 환영합니다.</p>
              </a>
            </li>
            <li class="side-menu">
              <a href="/pawmap/logout">
                <p id="attr-nav-p">로그아웃</p>
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