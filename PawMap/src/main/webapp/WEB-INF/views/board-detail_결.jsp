<!-- UTF-8과 jstl 문법을 쓰겠다 하는 선언(태그 라이브러리) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
    
<!-- Basic -->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <title>Freshshop - Ecommerce Bootstrap 4 HTML Template</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="../css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="../css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="../css/custom.css">

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- 결 커스텀 css -->
    <link rel="stylesheet" href="../css/style-gyul.css">

<style>



  
</style>

</head>

<body>
    <!-- Start Main Top -->
 
    <!-- End Main Top -->

    <!-- Start Main Top -->
    <header class="main-header">
        <!-- Start Navigation -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
            <div class="container">
                <!-- Start Header Navigation -->
                <div class="navbar-header">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-menu" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                </button>
                    <a class="navbar-brand" href="index.html"><img src="images/logo.png" class="logo" alt=""></a>
                </div>
                <!-- End Header Navigation -->

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="navbar-menu">
                    <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                        <li class="nav-item active"><a class="nav-link" href="#">홈</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">어바웃어스</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">병원찾기</a></li>
                        <li class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle arrow" data-toggle="dropdown">커뮤니티</a>
                            <ul class="dropdown-menu">
								<li><a href="shop.html">자유게시판</a></li>
								<li><a href="shop-detail.html">공지사항</a></li>
                                <li><a href="cart.html">이벤트게시판</a></li>
                                <li><a href="checkout.html">나눔게시판</a></li>
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="#">보호소</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">마이페이지</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">로그인</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">회원가입</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    <!-- end Main Top -->


    
    <div class="board-type mt-5">
    </div>
    <h1>${board.board_type}</h1>
      
    <hr class="line-paint">

    <!-- 게시판 상세 폼 시작 -->

    <form action="getBoardDetail" method="POST">
    
    <div class="about-box-main">
        <div class="container">
            <div class="row board-info">
                <div class="col-lg-6">
                    <h2 class="noo-sh-title-top mb-5 board_title">제목 : ${BoardDetail.title}</h2>
                    <!-- <td align="left"></td><input name="title" type="text" value="${board.title }"></td> -->
                </div>
                <div class="col-lg-6" style="overflow:hidden;">
                    <h5 class="noo-sh-title-top mb-5 board_writer">작성자 : ${user.nickname}</h5>
                </div>
                <div class="col-lg-6">
                    <h5 class=" mb-5 board_regDate">작성일 : ${BoardDetail.regDate}</h5>
                </div>
                <div class="col-lg-6">
                    <h5 class=" mb-5 board_seq">게시글 번호 : ${BoardDetail.boardSeq}</h5>
                </div>
            </div>
            <img class="img-fluid" src="images/결_pet_toy_001.jpeg" alt="" />
            <div class="col-lg-6">
                <p class="mt-5"> ${BoardDetail.content}</p>
              </form>

              <!-- 임시로 넣음 :  글 수정삭제 버튼 -->
                <p class="small mb-0" style="color: #000000;">
                  <a href="updateBoard?boardSeq=${BoardDetail.boardSeq }&boardType=${BoardDetail.boardType }">수정하기</a> <- 수정하기
                  <a href="deleteBoard?boardSeq=${BoardDetail.boardSeq }&boardType=${BoardDetail.boardType }">삭제하기</a> <- 삭제하기
                </p>
              <!-- 글 수정삭제 버튼 끝 -->

              </div>
            </div>
          </div>
          

    <section style="background-color: #f7f6f6;">
        <div class="container py-5 text-dark">
          <div class="row d-flex justify-content-center">
            <div class="col-md-12 col-lg-10 col-xl-8">
              <div class="d-flex justify-content-between align-items-center mb-4">
                <h4 class="text-dark mb-0">코멘트 (3)</h4>
              </div>
      
              <div class="card mb-3">
                <div class="card-body">
                  <div class="d-flex flex-start">
                    <img
                      class="rounded-circle shadow-1-strong me-3"
                      src="https://mdbootstrap.com/img/Photos/Avatars/img%20(26).jpg"
                      alt="avatar"
                      width="40"
                      height="40"
                    />
                    <div class="w-100">
                      <div class="d-flex justify-content-between align-items-center mb-3">
                        <h6 class="text-secondary fw-bold mb-0 ml-2 writer">
                          {작성자}
                          <span class="text-dark ms-2 ml-2">Hmm, This poster looks cool</span>
                        </h6>
                        <p class="mb-0">2 days ago</p>
                      </div>
                      <div class="d-flex justify-content-between align-items-center">
                        <p class="small mb-0" style="color: #aaa;">
                          <a href="#!" class="link-grey ml-2 btn-update">수정하기</a> •
                          <a href="#!" class="link-grey ml-2 btn-delete">삭제하기</a> •
                        </p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="card mb-3">
                <div class="card-body">
                  <div class="d-flex flex-start">
                    <img
                      class="rounded-circle shadow-1-strong me-3"
                      src="https://mdbootstrap.com/img/Photos/Avatars/img%20(26).jpg"
                      alt="avatar"
                      width="40"
                      height="40"
                    />
                    <div class="w-100">
                      <div class="d-flex justify-content-between align-items-center mb-3">
                        <h6 class="text-secondary fw-bold mb-0 ml-2 writer">
                          {작성자}
                          <span class="text-dark ms-2 ml-2">Hmm, This poster looks cool</span>
                        </h6>
                        <p class="mb-0">2 days ago</p>
                      </div>
                      <div class="d-flex justify-content-between align-items-center">
                        <p class="small mb-0" style="color: #aaa;">
                          <a href="#!" class="link-grey ml-2 btn-update">수정하기</a> •
                          <a href="#!" class="link-grey ml-2 btn-delete">삭제하기</a> •
                        </p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              
              <div class="card mb-3">
                <div class="card-body">
                  <div class="d-flex flex-start">
                    <img
                      class="rounded-circle shadow-1-strong me-3"
                      src="https://mdbootstrap.com/img/Photos/Avatars/img%20(26).jpg"
                      alt="avatar"
                      width="40"
                      height="40"
                    />
                    <div class="w-100">
                      <div class="d-flex justify-content-between align-items-center mb-3">
                        <h6 class="text-secondary fw-bold mb-0 ml-2 writer">
                          {작성자}
                          <span class="text-dark ms-2 ml-2">Hmm, This poster looks cool</span>
                        </h6>
                        <p class="mb-0">2 days ago</p>
                      </div>
                      <div class="d-flex justify-content-between align-items-center">
                        <p class="small mb-0" style="color: #aaa;">
                          <a href="#!" class="link-grey ml-2 btn-update">수정하기</a> •
                          <a href="#!" class="link-grey ml-2 btn-delete">삭제하기</a> •
                        </p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <!-- 댓글 다는곳 시작 -->

              <div class="card mb-3">
                <div class="card-body" style="padding: 1px;">
                    <div class="d-flex flex-start">
                        <form action="" style="width: 750px;">
                            <div class="card-body p-4">
                                <div class="mb-2">
                                    <h5 style="color:rgba(204, 156, 22, 0.8) ;">닉네임 : 고결</h5>
                                </div>
                                <div class="d-flex flex-start w-100">
                                    <img
                                        class="rounded-circle shadow-1-strong  mr-5"
                                        src="https://mdbootstrap.com/img/Photos/Avatars/img%20(21).jpg"
                                        alt="avatar"
                                        width="65"
                                        height="65"
                                    />
                                    <div class="w-100">
                                        <div class="form-outline">
                                            <textarea class="form-control" id="textAreaExample" rows="4" cols="10"></textarea>
                                        </div>
                                        <div class="d-flex justify-content-between mt-3">
                                            <button type="button" class="btn btn-success">등록하기</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
              </div>

            <!-- 댓글 다는곳 종료 -->

            </div>
          </div>
        </div>
    </section> 

<!-- 게시판 상세 폼 시작 종료 -->


  
  

<!-- 페이지 네이션 시작 -->

<div class="page-div">
    <ul class="pagination justify-content-center">
        <li class="page-item">
            <a class="page-link" href="#" >Prev</a>
        </li>
        <li class="page-item"> 
            <a class="page-link" href="#">1</a>
        </li>
        <li class="page-item">
            <a class="page-link" href="#">Next</a>
        </li>
    </ul>
</div>

<!-- 페이지 네이션 종료 -->

<!-- board list form 종료 -->
      

    <!-- Start Footer  -->
    <footer>
        <div class="footer-main">
            <div class="container">
				<div class="row">
					<div class="col-lg-4 col-md-12 col-sm-12">
						<div class="footer-top-box">
							<h3>Business Time</h3>
							<ul class="list-time">
								<li>Monday - Friday: 08.00am to 05.00pm</li> <li>Saturday: 10.00am to 08.00pm</li> <li>Sunday: <span>Closed</span></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-4 col-md-12 col-sm-12">
						<div class="footer-top-box">
							<h3>Newsletter</h3>
							<form class="newsletter-box">
								<div class="form-group">
									<input class="" type="email" name="Email" placeholder="Email Address*" />
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
                                <li><a href="#"><i class="fab fa-facebook" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fab fa-twitter" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fab fa-linkedin" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fab fa-google-plus" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-rss" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fab fa-pinterest-p" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fab fa-whatsapp" aria-hidden="true"></i></a></li>
                            </ul>
						</div>
					</div>
				</div>
				<hr>
                <div class="row">
                    <div class="col-lg-4 col-md-12 col-sm-12">
                        <div class="footer-widget">
                            <h4>About Freshshop</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p> 
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p> 							
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
                                    <p><i class="fas fa-map-marker-alt"></i>Address: Michael I. Days 3756 <br>Preston Street Wichita,<br> KS 67213 </p>
                                </li>
                                <li>
                                    <p><i class="fas fa-phone-square"></i>Phone: <a href="tel:+1-888705770">+1-888 705 770</a></p>
                                </li>
                                <li>
                                    <p><i class="fas fa-envelope"></i>Email: <a href="mailto:contactinfo@gmail.com">contactinfo@gmail.com</a></p>
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
        <p class="footer-company">All Rights Reserved. &copy; 2018 <a href="#">ThewayShop</a> Design By :
            <a href="https://html.design/">html design</a></p>
    </div>
    <!-- End copyright  -->

    <a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

    <!-- ALL JS FILES -->
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="../js/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <!-- ALL PLUGINS -->
    <script src="../js/jquery.superslides.min.js"></script>
    <script src="../js/bootstrap-select.js"></script>
    <script src="../js/inewsticker.js"></script>
    <script src="../js/bootsnav.js."></script>
    <script src="../js/images-loded.min.js"></script>
    <script src="../js/isotope.min.js"></script>
    <script src="../js/owl.carousel.min.js"></script>
    <script src="../js/baguetteBox.min.js"></script>
    <script src="../js/form-validator.min.js"></script>
    <script src="../js/contact-form-script.js"></script>
    <script src="../js/custom.js"></script>
</body>

</html>