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
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style-login.css">
	    <!-- 몌 커스텀 css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style-mye.css">
		<!-- Bootstrap CSS -->
		<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" /> -->
		<!-- Site CSS -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />

	<style>
		body { padding: 0px; margin: 0px; }
    /* 배경영상 설정 */
		.jb-box { width: auto; height: 100%; z-index:0; overflow: hidden;margin: 0px auto; position: relative; }
		video { width: 100%; }
		.jb-text { position: absolute; top: 1%; width: 100%; height: 100%; z-index: 1; background-color: rgba(58, 58, 58, 0.26); background-size: 130%;}
	  
	 /* 헤더 스타일 */
	 header,
      nav {
        background: rgba(0, 0, 0, 0);
        height: fit-content;
		font-size: large;

      }
      #slides-shop {
        height: 100vh;
      }
	 .fixed-top {
     height: 100px;
	 }
	 .attr-nav > .liAlign >li {
		 position: relative;
		 
	 }
	 .attr-nav {
		text-align: right;
		
	 }
   
	 
	 </style>

	</head>
	<!-- Header 시작 -->
	<header id="header" class="main-header header"  style="z-index: 100; max-height: 80%;">
		<nav class="
			navbar navbar-expand-lg 
			fixed-top py-3">
			<div class="container col-lg-9">
			  <div class="navbar-header">
				<a href="/pawmap" class="navbar-brand text-uppercase font-weight-bold">PAWMAP</a>
				  <button type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler navbar-toggler-right"><i class="fa fa-bars"></i></button>
				</div>
				
		   
		  </div>
			
		  
			 <div class="attr-nav col-lg-3">
			  <ul class="liAlign">
				<li class="search" style="display: none">
				  <a href="#"><i class="fa fa-search"></i></a>
				</li>
				<sec:authorize access="isAnonymous()">
				  <li class="side-menu">
					
					</a>
				  </li>
				  <li class="side-menu">
					<a href="/pawmap/joinForm">
					  <p id="" class="nav-p-login" style="margin-right: 10px;">회원가입</p>
					</a>
				  </li>
				</sec:authorize>
			
			  </ul>
			</div>
		   
		  </div>
		 
		</nav>
	  </header>
	  <!-- Header 끝 부분 -->

	<body class="img js-fullheight" >
		<!-- style="background-image: url(../../../resources/static/images/bg.jpg);" -->
		<div class="jb-box">
			<video muted autoplay loop>
			  <source src="${pageContext.request.contextPath}/videos/Children - 77640.mp4" type="video/mp4">
			  <strong>Your browser does not support the video tag.</strong>
			</video>
		<section class="jb-text ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section"></h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-4">
					<div class="login-wrap p-0">
		      	<h3 class="mb-4 text-center"> <strong>Welcome PawMap</strong></h3>
		      	<form
				  action="/pawmap/login"
                  method="post"
                  class="px-5 pb-5 login-form signin-form"

                  onsubmit="submitLoginForm(this);return false;"
				  >
		      		<div class="form-group login-input" >
		      			<input type="text" class="form-control" name="userId" placeholder="userId" required>
		      		</div>
	            <div class="form-group login-input" ">
	              <input  id="password-field" type="password" class="form-control"  name="userPassword" placeholder="Password" required>
	              <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
	            </div>
	            <div class="form-group">
	            	<button type="submit" class="form-control btn btn-primary submit px-3">로그인</button>
	            </div>
	            <div class="form-group d-md-flex">
	            	<div class="w-50">
		            	<label class="checkbox-wrap checkbox-primary">암호기억하기
									  <input type="checkbox" checked>
									  <span class="checkmark"></span>
									</label>
								</div>
								<div class="w-50 text-md-right">
									<a href="/pawmap/searchIdPw" style="color: #fff">비밀번호찾기</a>
								</div>
	            </div>
	          </form>
	          <p class="w-100 text-center" style="padding-bottom: 15px; padding-top: 15px;">&mdash; 소셜 계정으로 이용하기  &mdash;</p>
	         
			  <div class="social d-flex text-center" style="padding-left: 70px;">
				<a href="/pawmap/oauth2/authorization/kakao" class=" circle ion-logo-kakaotalk"></a>
				<a href="/pawmap/oauth2/authorization/naver" class="circle ion-logo-naver"></a>
	          	<a href="/pawmap/oauth2/authorization/google" class=" circle ion-logo-google"></a>
	          	<a href="/pawmap/oauth2/authorization/facebook" class="circle ion-logo-facebook"></a>
	          </div>
		      </div>
				</div>
				
			</div>
		</div>
	</section>
</div>

	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/popper.js"></script>
  <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/main.js"></script>
	  <!-- 페이지 스크롤 스크립트 -->
	  <script>
		$(function () {
	  $(window).on('scroll', function () {
		  if ( $(window).scrollTop() > 10 ) {
			  $('#header').addClass('active');
		  } else if( $(window).s){
  
		  } else {
			  $('#navbar').removeClass('active');
		  }
	  });
  });
   </script>
	</body>
</html>