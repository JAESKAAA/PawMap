<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link rel="shortcut icon" href="../images/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="../images/apple-touch-icon.png">

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

.page-item.active .page-link{
    background-color: rgb(207, 111, 21);
    border-color: rgb(207, 111, 21);
} 
  
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
    <h1>자유게시판</h1>
</div>
<div class="container mt-5" style="width: 70%;">
    <div class="board-free" >
        <div id="slides-shop" class="cover-slides">
            <ul class="slides-container">
                <li class="text-center">
                    <img src="../images/gyul_dog_img_001.jpg" alt="">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <h2 class="m-b-20"><strong style="color: aliceblue;">글 제목</strong></h2>
                                <p><a class="btn hvr-hover" href="#" style="background: none; font-size:15px;">글 보러가기</a></p>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="text-center">
                    <img src="../images/gyul_dog_img_002.jpg" alt="">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <h2 class="m-b-20"><strong style="color: aliceblue;">글 제목</strong></h2>
                                <p><a class="btn hvr-hover" href="#" style="background: none; font-size:15px;">글 보러가기</a></p>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="text-center">
                    <img src="../images/gyul_dog_img_003.jpg" alt="">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <h2 class="m-b-20"><strong style="color: aliceblue;">글 제목</strong></h2>
                                <p><a class="btn hvr-hover" href="#" style="background: none; font-size:15px;">글 보러가기</a></p>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>  
    </div>
</div>    
<hr class="line-paint">



<!-- board list form 시작 -->

<div class="container">
  <div>
    <section>
      <!--for demo wrap-->
      
      <div class="tbl-header">
          <h1></h1>
        <!-- search 버튼 시작 -->
        <form id="listForm" action="getFreeBoardList" name="POST">
        <!-- <input type="hidden" id="hKeywordType" name="hKeywordType" value="${keywordType}">
        <input type="hidden" id="hKeyword" name="hKeyword" value="${keyword}"> -->
        <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
        <div class="main-search-input-wrap" >
            <div class="option-select">
                <select class="form-control" name="keywordType" id="keywordType">
                    <option class="optionKeywordTypeTitle"  value="title" >제목</option>
                    <option class="optionKeywordTypeContent" value="content" >내용</option>
                </select>
            </div>
          <div class="main-search-input fl-wrap" style="margin-top: 30px;">
            <div class="main-search-input-item"> 
              <input id="input-keyword" name="keyword" type="text" value="" placeholder="검색어를 입력하세요"> 
            </div> 
            <input type="submit" class="main-search-button" id="searchBtn" value="검색"/>
          </div>
        </div>
    </form>
   
        <!-- search 버튼 종료 -->  
              <table class="board-table" cellpadding="0" cellspacing="0" >
                <thead>
                  <tr>
                    <th >번호</th>
                    <th class="title">제목</th>
                    <th>작성자</th>
                    <th>등록일</th>
                  </tr>
                </thead>
              </table>
            </div>
            <div class="tbl-content">
              <table class="board-table" cellpadding="0" cellspacing="0">
                <tbody>
                  <c:forEach var="freeBoard" items="${freeBoardList }">
			          	<tr>
				        	<td>${freeBoard.boardSeq }</td>
				        	<td class="title"><a href="getFreeBoard?boardSeq=${freeBoard.boardSeq}&pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}">${freeBoard.title }</a></td>
                            <!-- <td class="title"><a href="getFreeBoard?boardSeq=${freeBoard.boardSeq}">${freeBoard.title }</a></td> -->
                            <td>${freeBoard.userId }</td>
					        <td><fmt:formatDate value="${freeBoard.regDate }" pattern="yyyy-MM-dd"/></td>
			          	</tr>
		          </c:forEach>
                </tbody>
              </table>
            </div>
            <div style="display:inline-block;">
                <a  class="nav-link" href="/pawmap/board/form">글쓰러가기</a>
            </div>
        </section>
    </div>
</div>

<!-- 페이지 네이션 시작 -->

<div class="page-div">
    <ul class="pagination justify-content-center">
        <c:if test="${pageMaker.prev }">
            <li class="page-item pagination_button">
                <a class="page-link" href="${pageMaker.startPage - 1 }" >Prev</a>
            </li>
        </c:if>
        <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage +1}">
        <li class="page-item pagination_button ${num == pageMaker.cri.pageNum? "active" : "" }" > 
            <a id="nowPage" class="page-link" href="${num }">${num }</a>
        </li>
        </c:forEach>
        <c:if test="${pageMaker.next }">
        <li class="page-item pagination_button">
            <a class="page-link" href="${pageMaker.endPage + 1 }">Next</a>
        </li>
        </c:if>
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
    <script src="../js/js-gyul.js"></script>

    <script>
        $(document).ready(function() {
            //console.log($("#hKeywordType").val());
            //console.log($("#hKeyword").val());
            var listForm = $("#listForm");

            var link = document.location.href;

            var keyword = getParameterByName('keyword');

            var keywordType = getParameterByName('keywordType');

            var optionKeywordTypeTitle = $(".optionKeywordTypeTitle");
            var optionKeywordTypeContent = $(".optionKeywordTypeContent");

            function getParameterByName(name) { name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]"); 
            var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), 
                results = regex.exec(location.search); 
                return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " ")); 
            }

            function holdKeywordType(keywordType){
                if(keywordType == "title"){
                    console.log("holdKeywordType ======= title");
                    optionKeywordTypeTitle.prop("selected",true);
                }
                if(keywordType == "content"){
                    console.log("holdKeywordType ======= content");  
                    optionKeywordTypeContent.prop("selected",true);      
                }
            }

                $(".page-link").on("click", function(e) {
                e.preventDefault();
                
                listForm.find("input[name='pageNum']").val($(this).attr("href"));
                listForm.submit();
            });
            
            document.getElementById("input-keyword").value=keyword;

            //console.log(link);
            //console.log(keyword);
            //console.log(optionKeywordTypeTitle);
            //console.log(optionKeywordTypeContent);
            holdKeywordType(keywordType);
        });
        
    </script>
    
</body>

</html>