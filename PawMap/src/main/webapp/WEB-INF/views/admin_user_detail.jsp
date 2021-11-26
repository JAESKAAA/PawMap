<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="kor">
<!-- Basic -->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <title>adminpageusermanagement</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/images/apple-touch-icon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom.css">
    <!-- Custom-tom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom-tom.css">

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
  <!--adminmainvetmanagement-->
    <div> 
        <h1 style="text-align: center; font-size:30px; margin-top:5%;">회원정보 수정</h1>
    </div>
    <div style="margin-top: 40px; border-style: 3px solid orange ">
    	<form action="/pawmap/admin/updateUser" method="post">
	        <table style="margin-left: auto; margin-right: auto; text-align: center;">
	          <tr>
	              <td>이름: </td>
	              <td><input id="username" type="text" name="userName" value="${user.userName }"></td>
	          </tr>
	          <tr>
	              <td>ID:</td>
	              <td><input id="userID" type="text" name="userId" value="${user.userId }"></td>
	          </tr>
	          <tr>
	              <td>연락처:</td>
	              <td><input id="usercontactnumber" type="text" name="userTelNum" value="${user.userTelNum }"></td>
	          </tr>
	          <tr>
	              <td>이메일:</td>
	              <td><input id="usercontactnumber" type="text" name="userEmail" value="${user.userEmail }"></td>
	          </tr>
	          <tr>
	              <td>닉네임:</td>
	              <td><input id="usercontactnumber" type="text" name="userNickname" value="${user.userNickname }"></td>
	          </tr>
	          <tr>
	            <td>주소:</td>
	            <td><input id="useraddress" type="text" name="address"  value="${user.address }"></td>
	        </tr>
	          <tr>
	            <td>사업자 등록 번호</td>
	            <td><input id="useraddress" type="text" name="comNum" value="${user.comNum }"></td>
	        </tr>
	        </table>
	        </div>
    <div style="margin-top: 40px">
      <table style="margin-left:auto; margin-right:auto; text-align: center;">
            <tr>
                <td><button style="margin-right: 30px;" type="submit">수정완료</button></td>
                <td><button style="margin-left: 30px;" type="button" onclick="location.href='adminpage4usermanage-tom.html'">회원삭제</button></td>
            </tr>
      </table>
      </div>
    	</form>
    

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

    
</body>

</html>