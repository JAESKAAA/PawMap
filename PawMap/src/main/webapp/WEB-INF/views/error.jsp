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
      .error-container{
        margin-top: 10rem;
        margin-bottom: 3rem;
      }
      .error-msgbox{
        display: flex;
        flex-direction: column;
        justify-content: center;
      }
      .error-msgbox button{
        background-color: #e1a963;
        border: none;
        transition: all 0.3s ease-in-out;
      }
      .error-msgbox button:hover{
        background-color: tomato;
        cursor: pointer;
      }
      .attr-nav-p{
      	margin-right: 2rem !important;
      }
      .attr-nav-i{
      	margin-right: 1rem !important;
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
                      <button type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"
                        class="navbar-toggler navbar-toggler-right"><i class="fa fa-bars"></i></button>
                    </div>
                    <div id="navbarSupportedContent" class="collapse navbar-collapse">
                      <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                        <li class="nav-item active">
                          <!-- a태그 스타일이 안먹어 -->
                          <a href="/pawmap" id="nav-a" class="nav-link text-uppercase font-weight-bold">Home </a>
                        </li>
                        <li class="nav-item">
                          <a href="/pawmap/about" id="nav-a" class="nav-link text-uppercase font-weight-bold">회사소개</a>
                        </li>
                        <li class="nav-item">
                          <a href="/pawmap/search" id="nav-a" class="nav-link text-uppercase font-weight-bold">병원찾기</a>
                        </li>
                        <li class="nav-item">
                          <a href="/pawmap/shelter" id="nav-a" class="nav-link text-uppercase font-weight-bold">보호소
                            정보</a>
                        </li>
                        <li class="dropdown" color: rgb(255, 255, 255);">
                          <a href="#" class="nav-link dropdown-toggle arrow" data-toggle="dropdown">커뮤니티</a>
                          <!-- style inline으로 -->
                          <ul class="dropdown-menu"
                            style="background-color:rgba(0, 0, 0, 0.089);     border-color: transparent;">
                            <li style="padding: 3%;"><a href="/pawmap/board/getFreeBoardList"
                                style="color: #fff; size: 0.8em;">자유게시판</a></li>
                            <li style="padding: 3%;"><a href="/pawmap/board/getNanumBoardList"
                                style="color: #fff; size: 0.8em;">나눔게시판</a></li>
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
                      <sec:authorize access="isAnonymous()">
                        <li class="side-menu">
                          <a href="/pawmap/loginForm">
                            <p id="attr-nav-p" style="margin-right: 2rem;">로그인</p>
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
                            <p id="attr-nav-i" style="margin-right: 1rem;">마이페이지 ${principal.user.userNickname} 님 환영합니다.</p>
                          </a>
                        </li>

                        <li class="side-menu">
                          <a href="/pawmap/logout">
                            <p id="attr-nav-i">로그아웃</p>
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
    
    <!-- 에러 메시지 부분 -->

<c:choose>
	<c:when test="${pageContext.response.status == 404 }">
	<div class="container error-container">
	  	<div class="row">
		    <div class="col-8">
		      <img src="${pageContext.request.contextPath}/images/error-dog.jpg" style="width: 100%;" />
		    </div>
		    <div class="col-4 error-msgbox" >
		      <h2>잘못된 요청입니다.</h2><br>
		      <h2>문제 발생시, </h2>
		      <h2>하기 이메일로 연락 부탁 드립니다.</h2><br>
		      <h3><a>관리자 : pawmap@gmail.com</a></h3>
		      <button class="btn-lg btn-primary" type="button" onclick="location.href='/pawmap'">홈으로</button>
		    </div>
	 	 </div>
	</div>
	</c:when>
	<c:otherwise>
		<div class="container error-container">
		  	<div class="row">
		    <div class="col-8">
		      <img src="${pageContext.request.contextPath}/images/error-bear.jpg" style="width: 100%;" />
		    </div>
		    <div class="col-4 error-msgbox" >
		      <h2>오류가 발생하였습니다.</h2><br>
		      <h2>문제 발생시, </h2>
		      <h2>하기 이메일로 연락 부탁 드립니다.</h2><br>
		      <h3><a>관리자 : pawmap@gmail.com</a></h3>
		      <button class="btn-lg btn-primary" type="button" onclick="location.href='/pawmap'">홈으로</button>
		    </div>
		  </div>
		</div>
	</c:otherwise>
</c:choose>

  

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
    <script src="${pageContext.request.contextPath}/js/custom-silbia.js"></script>
    <!-- FontAwesome 용 JS 파일-->
    <script
      src="https://kit.fontawesome.com/f0999a1ca0.js"
      crossorigin="anonymous"
    ></script>

    <!-- 1:1 상담 관련 js 파일-->
    <script src="${pageContext.request.contextPath}/js/custom-jaeseok.js"></script>

    <!-- 커스텀 JS 파일 - 재석-->
    <script src="${pageContext.request.contextPath}/js/custom-jaeseok.js"></script>
   
    <script src="${pageContext.request.contextPath}/js/js-gyul.js"></script>


  </body>
</html>