<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- jstl 함수사용을 위한 설정 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>

<!DOCTYPE html>
<html lang="en">
    
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
                      <a href="/pawmap/about" id="nav-a" class="nav-link text-uppercase font-weight-bold">회사소개</a></li>
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
                          <li style="padding: 3%;"><a href="/pawmap/board/getNanumBoardList"  style="color: #fff; size: 0.8em;">나눔게시판</a></li>
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
                  <p id="attr-nav-i">마이페이지 ${principal.user.userNickname} 님 환영합니다.</p>
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

<style>

header,
      nav {
        background:rgb(239 198 120);
        height: fit-content;
        font-size:medium;
        color: rgba(235, 180, 99, 0.842);
        height: 12%;
      }



.line-paint{
        border: thin solid rgb(209, 154, 34);
        margin-top: 50px;
        margin-bottom: 70px;
        width: 80%;
    }
.board-type{
        display: inline-block;
        margin-left: 10%;
    }
.board-type > h1 {
        color: rgb(209, 154, 34);
        font-size: 40px;
    }    

/* 페이지 관련 소스 */
    
    ::-webkit-scrollbar {
        width: 6px;
    } 
    /* ::-webkit-scrollbar-track {
        -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
    } 
    ::-webkit-scrollbar-thumb {
        -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
    } */
    .page-div{
        margin: 4%;
    }
    .page-link{
      background-color: rgba(204, 156, 22, 0.8);
      color: white;
    }

/* 페이지 관련 소스 끝 */




.main-search-input-item input {

    width: 100%;
    height: 50px;
    padding-left: 20px
}

.main-search-button {
    background: #e0a1187a
}

.main-search-button {
    position: absolute;
    right: 0px;
    height: 50px;
    width: 120px;
    color: rgb(255, 255, 255);
    top: 0;
    border: none;
    border-top-right-radius: 0px;
    border-bottom-right-radius: 0px;
    cursor: pointer
}
.main-search-button:hover {
  background: #665d087a;
  cursor: pointer;
}
.main-search-input-wrap {
    width: 500px;
    margin: 20px auto;
    position: relative
}
:focus {
    outline: 0
}

@media only screen and (max-width: 768px) {
    .main-search-input {
        background: rgba(255, 255, 255, 0.2);
        padding: 14px 20px 10px;
        border-radius: 10px;
        box-shadow: 0px 0px 0px 10px rgba(255, 255, 255, 0.0)
    }

    .main-search-input-item {
        width: 100%;
        border: 1px solid #eee;
        height: 50px;
        border: none;
        margin-bottom: 10px
    }

    .main-search-input-item input {
        border-radius: 6px !important;
        background: #fff
    }

    .main-search-button {
        position: relative;
        float: left;
        width: 100%;
        border-radius: 6px
    }

/* 서치바 관련 스타일 종료 */

}
  
</style>

</head>

<body>
    <!-- Start Main Top -->
    <!-- End Main Top -->
    
    <!-- Start Main Top -->
    
    
    <div class="board-type mt-5" >
        <h1 style="margin-top: 3em;">나눔게시판</h1>
    </div>

    <hr class="line-paint">

    <!-- 나눔 게시판 시작 -->

    
        <!-- search 버튼 시작 -->
        <form id="listForm" action="getNanumBoardList" name="POST">
            <!-- <input type="hidden" id="hKeywordType" name="hKeywordType" value="${keywordType}">
            <input type="hidden" id="hKeyword" name="hKeyword" value="${keyword}"> -->
            <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
            <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
            <div class="main-search-input-wrap" >
                <div class="option-select" style="width: 300px;">
                    <select class="form-control" name="keywordType" id="keywordType">
                        <option class="optionKeywordTypeTitle"  value="title"  >제목</option>
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
        

        
        
        <div class="container">
            <div class="row">
                <c:forEach var="nanumBoardList" items="${NanumBoardList }">
                <div class="col-md-6 col-lg-4 col-xl-4">
                    <div class="blog-box">
                        <!-- <div class="blog-img">
                            <img class="img-fluid" src="${pageContext.request.contextPath}/upload/${nanumBoardFileList.originalFileName}" alt="" />
                        </div> -->
                        <div class="blog-content">
                            <div class="title-blog">
                                <h3><a href="getNanumBoard?boardSeq=${nanumBoardList.boardSeq }&boardType=${nanumBoardList.boardType }">제목 : ${nanumBoardList.title}</a></h3>
                                <p>내용 : ${nanumBoardList.content}</p>
                            </div>
                        </div>
                        <div class="blog-content">
                            <div class="title-blog pt-1">
                                <h3>닉네임 : ${nanumBoardList.userId} </h3>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>

            </div>

        <c:choose>
            <c:when test="${empty principal}">
                <div style="display:inline-block;">
                    <a  class="nav-link" href='#' onclick="noLoginUserCantWrite(); return false">글쓰러가기</a>
                </div>
            </c:when>
            <c:otherwise>
                <div style="display:inline-block;">
                    <a  class="nav-link" href="/pawmap/board/form">글쓰러가기</a>
                </div>
            </c:otherwise>
        </c:choose>

        </div>
    </div>
</div>
<!-- 나눔 게시판 종료 -->    

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
    
    
    <script>
        
        function noLoginUserCantWrite(){
        alert("로그인이 필요합니다.");
        
    }
    
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