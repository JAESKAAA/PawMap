<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
    <title>PawMap - 관리자 페이지</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/로고최종_수정.png" type="image/x-icon">
    <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/images/apple-touch-icon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom-tom.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom-jaeseok.css">
    <!-- 몌 커스텀 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style-mye.css">
    <!-- 실비아 커스텀 css -->    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom-silbia.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footable.bootstrap.css" />

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<style>
   .navbar-brand{
        font-family:'NEXON Lv1 Gothic OTF';
        font-size: 1.6em;
        font-weight: 700;
      }
      
         .logoimg{
        width:7.1em;
        overflow: hidden;
        height: 1.6rem;
        margin-left:5%;
      }
      .navbar-header{
        padding:10px;
      }
</style>

</head>

<body>
  <!--Thomas lee started working on this page since nov 16th-->
    <div class="main-top">
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="our-link" style="float:right;">
              <ul>
                <li><a href="/pawmap/logout">로그아웃</a></li>
              </ul>
            </div>
            <div class="our-link" style="float:right">
              <ul class="offer-box">
                <!--thomas's comment: 상기 offer-box 태그로 인해 하기 li 태그들은 Border-right에 하얀 선이 나왔고 해당 사유로 하기 태그들은 스타일을 없앴음.-->
                <li style="border-right:none; font-size:14px;"><a href="/pawmap/admin">관리자페이지 입니다.</a></li>
                <li style="border-right:none; font-size:14px;">Admin Page</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  <!-- admin페이지의 header 시작... style="justify-content: space-between; width: 1519px"-->
  <div> 
  <header> <!-- header class="main-header"  네브 바가 깨져서 이렇게 처리함.-->
    <!-- Start Navigation --> <!--하기 navbar navbar-expand-lg를 md로 교체-->
    <nav class="navbar navbar-expand-md navbar-light bg-light navbar-default bootsnav">
        <div class="container">
            <!-- Start Header Navigation -->
            <div class="navbar-header">
              <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-menu" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
              <i class="fa fa-bars"></i>
            </button>
                <a class="navbar-brand" href="/pawmap/"><img class="logoimg" src="${pageContext.request.contextPath}/images/logoyellow.png"></img></a>
            </div>
            <!-- End Header Navigation -->

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="navbar-menu">
              <div class="container">
                  <div class="row row-adminindex">
                      <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                          <li class="nav-item"><a class="nav-link" href="/pawmap/getHospitalList"> 제휴병원 관리</a></li>
                          <li class="nav-item"><a class="nav-link" href="/pawmap/getUserList"> 회원정보 관리</a></li>
                          <li class="nav-item"><a class="nav-link" href="/pawmap/admin/shelterList"> 보호소정보 관리</a></li>
                          <li class="nav-item"><a class="nav-link" href="/pawmap/getCommunityBoardList"> 커뮤니티 게시판 관리</a></li>
                      </ul>
                  </div>
              </div>
            </div>
            <!-- /.navbar-collapse -->
        </div>
    </nav>
    <!-- End Navigation --> <!--관리자 페이지 공통 부분 완료...-->
  </header>
</div>