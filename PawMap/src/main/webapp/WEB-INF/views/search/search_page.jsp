<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
          <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

            <sec:authorize access="isAuthenticated()">
              <sec:authentication property="principal" var="principal" />
            </sec:authorize>
            <spring:eval expression="@environment.getProperty('kakao.app.key')" var="kakaoAppKey" />

            <!DOCTYPE html>
            <html lang="ko">
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
              <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/로고최종_수정.png"
                type="image/x-icon" />
              <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/images/apple-touch-icon.png" />
              <!-- Fontawesome CSS-->
              <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet" />
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
              <!-- hospital-search CSS (검색페이지 1) -->
              <link rel="stylesheet" href="${pageContext.request.contextPath}/css/hospital-search.css" />
              <!-- 테이블 부분 css -->
              <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footable.bootstrap.css" />
              <!-- Custom CSS -->
              <link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom.css" />
              <!-- 헤더 푸터 효과를위한 css -->
              <link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom-jaeseok.css" />

              <style>
                .custom-footer-searchPage {
                  margin-top: 15rem;
                }

                header,
                nav {
                  background: rgb(239 198 120);
                  height: fit-content;
                  font-size: medium;
                  color: rgba(235, 180, 99, 0.842);
                  height: 12%;
                }

                .btn-search {
                  padding: 8px 17px !important;
                  color: #fff;
                  background: #f7ba61;
                  border-radius: 25px;
                  border-style: none;
                  height: 70%;
                }

                .btn-search:hover {
                  background-color: rgba(228, 188, 96, 0.363);
                  color: #fff !important;
                  border-style: solid #f7ba61;
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

        <!--============================
        동물병원 search부분 시작
        ============================-->

              <div class="search-container" style="margin-top: 7rem;">
                <div class="col-lg-12 boardtitle">
                  <h2 style="text-align:center; padding-left:0;">동물병원 찾기</h2>
                  <div class="search-box">
                    <div class="search-icon"><i class="fa fa-search search-icon"></i></div>
                    <form action="/pawmap/searchDetail" method="get" class="search-form">
                      <input type="text" placeholder="내용을 입력해주세요." id="search" name="value" autocomplete="off" />
                    </form>
                    <svg class="search-border" version="1.1" xmlns="http://www.w3.org/2000/svg"
                      xmlns:xlink="http://www.w3.org/1999/xlink"
                      xmlns:a="http://ns.adobe.com/AdobeSVGViewerExtensions/3.0/" x="0px" y="0px" viewBox="0 0 671 111"
                      ; xml:space="preserve">
                      <path class="border" d="M335.5,108.5h-280c-29.3,0-53-23.7-53-53v0c0-29.3,23.7-53,53-53h280" />
                      <path class="border" d="M335.5,108.5h280c29.3,0,53-23.7,53-53v0c0-29.3-23.7-53-53-53h-280" />
                    </svg>
                    <div class="go-icon"><i class="fa fa-arrow-right"></i></div>
                  </div>
                </div>

                <!-- 동물병원 search부분 끝 -->



                <!-- kakaomap 표출 부분 700x400 (서버 올린 후 확인가능, localhost:9000으로 디폴트 지정해 놓았음. 자세한건 맨 밑 주석참조) -->
                <div id="map"></div>
                <!-- kakaomap 표출부분 끝 -->


                <!-- 검색값이 없는 경우는 페이지네이션 출력 안하도록 설정 -->
                <c:if test="${value != null }">
                  <!-- 테이블 부분 (쇼케이스 버전이므로 데이터 불러올때는 링크를 참조하길) -->
                  <table class="table" style="   width: 88%; margin:auto; margin-bottom: 10%; margin-top: 4%;">
                    <thead>
                      <tr>
                        <th data-breakpoints="xs sm md">병원 이름</th>
                        <th data-breakpoints="xs">위치</th>
                        <th data-breakpoints="xs">진료 시간</th>
                        <th data-breakpoints="xs">자세히</th>
                        <th data-breakpoints="xs">예약 가능 여부</th>
                      </tr>
                    </thead>
                    <tbody>

                      <c:forEach var="hospital" items="${hospitalList }">
                        <tr data-expanded="true" class="tablerow">
                          <td>${hospital.hospitalName}</td>
                          <td>${hospital.hospitalAddress}</td>
                          <td>오전 9:00 ~ 오후 18:00</td>
                          <td>
                            <a href="/pawmap/detailHospital?hospitalSeq=${hospital.hospitalSeq }" class="btn-search"
                              data-mdb-ripple-color="#ffffff">
                              자세히
                            </a>
                          </td>
                          <c:if test="${hospital.hospitalType == 'H'}">
                            <td>
                              <a href="/pawmap/detailHospital?hospitalSeq=${hospital.hospitalSeq }" class="btn-search"
                                data-mdb-ripple-color="#ffffff">
                                예약가능
                              </a>
                            </td>
                          </c:if>
                        </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                  <form id="frm">
                  </form>
                  <!-- 쇼케이스 버전 테이블 끝 -->
                  <!-- 페이지네이션 부분 시작-->
                  <div class="page-div hospital_pagination_custom">
                    <ul class="pagination justify-content-center">
                      <c:if test="${pageMaker.prev }">
                        <li class="page-item pagination_button">
                          <a class="page-link" href="${pageMaker.startPage - 1 }">Prev</a>
                        </li>
                      </c:if>
                      <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage}">
                        <li class="page-item pagination_button ${num == pageMaker.cri.pageNum ? " active" : "" }"">
                          <a id="nowPage" class="page-link" href="${num }">${num }</a>
                        </li>
                      </c:forEach>
                      <c:if test="${pageMaker.next }">
                        <li class="page-item pagination_button">
                          <a class="page-link" href="${pageMaker.endPage+1}">Next</a>
                        </li>
                      </c:if>
                    </ul>
                  </div>
                  <!--  페이지네이션 끝 -->
                  <!--  페이지 처리 폼 -->
                  <c:choose>
                    <c:when test="${value == null }">
                      <form id="actionForm" action="/pawmap/search" method="get">
                        <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                        <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                      </form>
                    </c:when>
                    <c:otherwise>
                      <form id="actionForm" action="/pawmap/searchDetail" method="get">
                        <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                        <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                        <input type="hidden" name="value" value="${value }">
                      </form>
                    </c:otherwise>
                  </c:choose>
                  <!--  페이지 처리 폼 끝-->
                </c:if>

                <!-- Start Footer  -->
                <footer class="custom-footer-searchPage">
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
                                  <a href="mailto:contactinfo@gmail.com">contactpawmap@gmail.com</a>
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
                                    <a href="#" class="inner-box"><i class="fab fa-facebook inner-box-icon"
                                        aria-hidden="true"></i></a>
                                  </p>
                                </li>
                                <li>
                                  <p>
                                    <a href="#" class="inner-box"><i class="fab fa-twitter inner-box-icon"
                                        aria-hidden="true"></i></a>
                                  </p>
                                </li>
                                <li>
                                  <p>
                                    <a href="#" class="inner-box"><i class="fab fa-linkedin inner-box-icon"
                                        aria-hidden="true"></i></a>
                                  </p>
                                </li>
                                <li>
                                  <p>
                                    <a href="#" class="inner-box"><i class="fab fa-google-plus inner-box-icon"
                                        aria-hidden="true"></i></a>
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

                <!-- ALL JS FILES -->
                <script src="js/jquery-3.2.1.min.js"></script>
                <script src="js/popper.min.js"></script>
                <script src="js/bootstrap.min.js"></script>

                <!-- 검색부분 js -->
                <script src="js/search.js"></script>

                <!-- 테이블부분 js -->
                <script src="js/footable.js"></script>

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
                <!-- 폰트어썸아이콘용 JS -->
                <script src="https://kit.fontawesome.com/f0999a1ca0.js" crossorigin="anonymous"></script>
                <!-- 페이지 처리 스크립트 시작 -->
                <script>
                  $(document).ready(function () {

                    var actionForm = $("#actionForm");

                    $(".page-link").on("click", function (e) {
                      e.preventDefault();

                      var targetPage = $(this).attr("href");

                      actionForm.find("input[name='pageNum']").val(targetPage);
                      actionForm.submit();
                    });
                  });
                </script>
                <!-- 페이지 처리 스크립트 끝 -->

                <!-- 카카오 맵 시작-->
                <script type="text/javascript"
                  src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=${kakaoAppKey}&libraries=services,clusterer,drawing"></script>
                <script>
                  var nameList = [];
                  var addressList = [];
                  var idList = [];
                  var seq = [];
                  <c:forEach var="hospital" items="${hospitalList}" varStatus="status">
                    nameList.push("${hospital.hospitalName}");
                    addressList.push("${hospital.hospitalAddress}");
                    idList.push("${hospital.hospitalId}");
                    seq.push("${hospital.hospitalSeq}");
                  </c:forEach>

                  var mapContainer = document.getElementById('map'); // 지도를 표시할 div  
                  mapOption = {
                    center: new kakao.maps.LatLng(37.56623853482794, 126.97853923627761), // 지도의 중심좌표
                    level: 9 // 지도의 확대 레벨
                  };

                  var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

                  //주소-좌표 변환 객체를 생성합니다
                  var geocoder = new kakao.maps.services.Geocoder();

                  var coords = [];
                  let addressValue = "";


                  // 마커 클러스터러를 생성합니다 
                  var clusterer = new kakao.maps.MarkerClusterer({
                    map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
                    averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
                    minLevel: 8,
                    calculator: [10, 20, 30, 40, 50, 100],// 클러스터 할 최소 지도 레벨 
                    styles: [{
                      width: '30px', height: '30px',
                      background: 'linear-gradient(120deg, #d4fc79 0%, #96e6a1 100%)',
                      borderRadius: '15px',
                      color: '#000',

                      textAlign: 'center',
                      fontWeight: 'bold',
                      lineHeight: '31px',
                      opacity: '0.9'

                    },
                    {
                      width: '40px', height: '40px',
                      background: 'linear-gradient(319deg, #7ee8fa 0%, #7ee8fa 100%)',
                      borderRadius: '20px',
                      color: '#000',
                      textAlign: 'center',
                      fontWeight: 'bold',
                      lineHeight: '41px',
                      opacity: '0.9'

                    },
                    {
                      width: '50px', height: '50px',
                      background: 'linear-gradient(45deg, #ff9a9e 0%, #fad0c4 99%, #fad0c4 100%)',
                      borderRadius: '25px',
                      color: '#000',
                      textAlign: 'center',
                      fontWeight: 'bold',
                      lineHeight: '51px',
                      opacity: '0.9'

                    },
                    {
                      width: '60px', height: '60px',
                      background: 'linear-gradient(to top, #ff0844 0%, #ffb199 100%)',
                      borderRadius: '30px',
                      color: '#000',
                      textAlign: 'center',
                      fontWeight: 'bold',
                      lineHeight: '61px',
                      opacity: '0.9'
                    },
                    {
                      width: '70px', height: '70px',
                      background: 'linear-gradient(to top, #fdc830 0%, #f37335 100%)',
                      borderRadius: '35px',
                      color: '#000',
                      textAlign: 'center',
                      fontWeight: 'bold',
                      lineHeight: '71px',
                      opacity: '0.9'
                    }
                    ]

                  });

                  var markers = [];
                  // 주소로 좌표를 검색합니다
                  for (let i = 0; i < addressList.length; i++) {
                    geocoder.addressSearch(addressList[i], function (result, status) {
                      // 정상적으로 검색이 완료됐으면 
                      if (status === kakao.maps.services.Status.OK) {
                        addressValue = new kakao.maps.LatLng(result[0].y, result[0].x);
                        coords[i] = addressValue;
                        console.log("좌표값 : " + coords[i] + " " + i);
                      }
                      //마커 이미지의 이미지 주소입니다
                      var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

                      // 마커 이미지의 이미지 크기 입니다
                      var imageSize = new kakao.maps.Size(24, 35);

                      // 마커 이미지를 생성합니다    
                      var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

                      // 마커를 생성합니다
                      var marker = new kakao.maps.Marker({
                        map: map, // 마커를 표시할 지도
                        position: coords[i], // 마커를 표시할 위치
                        title: nameList[i], // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                        image: markerImage, // 마커 이미지 
                        clickable: true
                      });
                      //마커들을 markers객체에 담음
                      markers.push(marker);
                      //클러스터러에 마커배열을 다시 담아줌
                      clusterer.addMarkers(markers);

                      var iwContent = '<div style="padding:5px;">' + nameList[i] + '</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                      var iwPosition = new kakao.maps.LatLng(33.450701, 126.570667);
                      // 인포윈도우를 생성합니다
                      var infowindow = new kakao.maps.InfoWindow({
                        content: iwContent
                      });


                      // 마커에 마우스오버/아웃 이벤트를 등록합니다
                      kakao.maps.event.addListener(marker, 'mouseover', function () {
                        infowindow.open(map, marker);
                      });
                      // 마커에 마우스오버 이벤트를 등록합니다
                      kakao.maps.event.addListener(marker, 'mouseout', function () {
                        // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
                        infowindow.close();
                      });
                      // 마커에 마우스오버/아웃 이벤트를 등록합니다
                      kakao.maps.event.addListener(marker, 'click', function () {
                        window.location.href = "/pawmap/detailHospital?hospitalSeq=" + seq[i];
                      });
                    });
                  }
                  console.log(markers);
                  console.log(clusterer);
                  //지도 위치를 처음 검색된 곳으로 이동시켜줌
                  geocoder.addressSearch(addressList[0], function (result, status) {
                    // 정상적으로 검색이 완료됐으면 
                    if (status === kakao.maps.services.Status.OK) {
                      addressValue = new kakao.maps.LatLng(result[0].y, result[0].x);
                      coords[1] = addressValue;
                    }
                    //전체 리스트 표출되면 적용안되도록 제한
                    if (nameList.length < 800) {
                      map.setCenter(addressValue);
                    }
                  });
                </script>
                <!-- 카카오 맵 끝 -->
            </body>

            </html>