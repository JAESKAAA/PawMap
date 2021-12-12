<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<spring:eval expression="@environment.getProperty('kakao.app.key')" var="kakaoAppKey"/>

<%@ include file="layout/header.jsp" %>

  <style>

    .container_hospital_detail {
      padding: 0;
      width: 1200px;
      max-width: 100%; 
      height: auto;
      object-fit: cover;

      padding-right: 15px;
      padding-left: 15px;
      margin-right: auto;
      margin-left: auto;
    }
    img { 
      max-width: 100%; 
      height: auto; 
    }
    .h3 {
      font-size: large;
      text-align: center;
    }

    .a {
      color: black;
    }
    .main-header{
    	position:relative;
    }
    .service-block-inner::before{
          background: rgb(239 199 120);
    }
  </style>

</head>

  
      <!-- Start About Page  -->
      <div class="about-box-main" style="margin-top:3rem;">
        <div class="container_hospital_detail">
          <div class="row">
            <img class="swing-in-top-fwd" src="images/cat01.jpg" style="width: 1200px; height: auto; -webkit-box-align: center;">
            <div class="col-lg-6">
              <div class="banner-frame">
                <h2></h2>
                <h2 class="noo-sh-title-top">${hospital.hospitalName }</h2>
                <c:if test="${hospital.hospitalType == 'H'}">  
                  <c:choose>
                    <c:when test="${empty principal}">
                      <div style="display:inline-block;">
                        <!-- <a  class="nav-link" href='#' onclick="noLoginUserCantWrite(); return false">글쓰러가기</a> -->
                        <a href="#"class="btn btn-warning" onclick="noLoginUserCantWrite(); return false"><i class="glyphicon glyphicon-bell"></i> 예약하기</a>
                      </div>
                    </c:when>
                    <c:otherwise>
                      <div style="display:inline-block;">
                        <!-- <a  class="nav-link" href="/pawmap/board/form">글쓰러가기</a> -->
                        <a href="/pawmap/reservation/choose?comNum=${hospital.hospitalComNum}&hospitalSeq=${hospital.hospitalSeq }"class="btn btn-warning"><i class="glyphicon glyphicon-bell"></i> 예약하기</a>
                      </div>
                    </c:otherwise>
                  </c:choose>
                </c:if>
              </div>
            </div>
            <div class="col-lg-6">
              <p class="noo-p">
              <div class="card-body">
                <div class="media mb-3">
                  <div class="mr-2 iconbox">
                    <i class="hdicon fas fa-map-marker-alt fa-2x"></i>
                  </div>
                  <div class="media-body">
                    <p>${hospital.hospitalAddress }</p>
                  </div>
                </div>
                <div class="media mb-3">
                  <div class="mr-2 iconbox"> 
                    <i class="hdicon fas fa-home fa-2x"></i>
                  </div>
                  <div class="media-body">
                    <p>준비중입니다.</p>
                  </div>
                </div>
                <div class="media mb-3">
                  <div class="mr-2 iconbox"> 
                    <i class="hdicon fas fa-phone-volume fa-2x"></i>
                  </div>
                  <div class="media-body">
                    <p>${hospital.hospitalTelNum }</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        
              <!-- 이동부분  -->
          <c:if test="${hospital.hospitalType == 'H'}">
            <div class="row" style="margin-top: 5%; margin-bottom: 2%;">
              <div class="col-4" style="float: none; margin:0 auto;">
                <a href="#menu1" style="color: #555;"><h3 class="h3">병원 정보</h3></a>
                  <div class="service-block-inner-a"></div>
              </div>
              <div class="col-4">
                <a href="#menu2" style="color: #555;"><h3 class="h3">수의사(${fn:length(vetList) })</h3></a>
                  <div class="service-block-inner-b"></div>
              </div>
              <div class="col-4">
                <a href="#review-start" style="color: #555;"><h3 class="h3">리뷰(${reviewSize})</h3></a>
                  <div class="service-block-inner-b"></div>
              </div>
            </div>
	     	  </c:if>
    		  <!-- 이동부분 끝 -->
            <hr>
            <!-- 하단 위치 진료시간 부분 -->
            <div class="row my-5">
                <div class="col-sm-8 col-lg-6">
                  <div class="service-block-inner">
                      <h3 class="hosdeh3" style="">위치</h3>
                      <div id="map" style="max-width: 100%; 
                      height: 500px; "></div>
                  </div>
                </div>
                <div class="col-sm-8 col-lg-6">
                  <div class="service-block-inner">
                      <h3 class="hosdeh3" >진료시간</h3>
                      <p>월 : 09:00 ~ 17 : 00</p>
                      <p>화 : 09:00 ~ 17 : 00</p>
                      <p>수 : 09:00 ~ 17 : 00</p>
                      <p>목 : 09:00 ~ 17 : 00</p>
                      <p>금 : 09:00 ~ 17 : 00</p>
                      <p>토 : 휴무</p>
                      <p>일 : 휴무</p>
                      <p>공휴일 : 휴무</p>
                  </div>
                </div>
            </div>
            <c:if test="${hospital.hospitalType == 'H'}">
              <!-- 기타 수의사 정보 시작 -->
              <div class="container_hospital_detail" id="menu2">
                <div class="row my-5">
                  <div class="col-sm-6 col-lg-4">
                      <div class="service-block-inner">
                          <h3>수의사(${fn:length(vetList) })</h3>
                      </div>
                  </div>
                  <!-- 수의사 프로필 부분 -->
                    <div class="container_hospital_detail" style="margin-top: -5%; margin-bottom: -3%;">
                      <div class="row profile" >
						<c:forEach items="${vetList }" var="vet">
	                        <div class="col-md-4" >
	                          <div class="profile-sidebar">
	                            <!-- SIDEBAR USERPIC -->
	                            <div class="profile-userpic">
	                            	<c:choose>
	                            		<c:when test="${empty vet.originalFileName}">
	                           		   		<img src="images/dogDoctor.jpg" class="img-responsive" style="width: 70%" alt="">
	                           			</c:when>
	                           			<c:otherwise>
	                           			    <img src="${pageContext.request.contextPath}/upload/${vet.originalFileName}" class="img-responsive" style="width: 70%" alt="">
	                           			</c:otherwise>
	                            	</c:choose>
	                            </div>
	                            <!-- END SIDEBAR USERPIC -->
	                            <!-- SIDEBAR USER TITLE -->
	                            <div class="profile-usertitle">
	                              <div class="profile-usertitle-name">
	                                ${vet.vetName }
	                              </div>
	                              <div class="profile-usertitle-job">
	                                ${vet.vetMajor }
	                              </div>
	                              <div class="profile-usertitle-info">
	                                "${vet.vetIntro }"
	                              </div>
	                            </div>
	                          </div>
	                        </div>
                        </c:forEach>
                      </div> 
                    </div>
                </div>
              </div>

              <!--리뷰 시작-->
              <section style="background-color: #f7f6f6;">
                <div class="container py-5 text-dark">
                  <div class="row d-flex justify-content-center">
                    <div class="col-md-12 col-lg-10 col-xl-8">
                      <div class="d-flex justify-content-between align-items-center mb-4">
                        <h4 class="text-dark mb-0" id="review-start">리뷰 수 ( ${reviewSize} )</h4>
                      </div>
              
                      <!-- 댓글 다는곳 시작 -->
                      <c:choose>
                        <c:when test="${empty principal}">
                          
                        </c:when>
                        <c:otherwise>
                          <div class="card mb-3">
                            <div class="card-body" style="padding: 1px;">
                                <div class="d-flex flex-start">
                                    <form action="insertHospitalReview" method="post" style="width: 750px;">
                                      <input type="hidden" name="hospitalSeq"  value="${hospital.hospitalSeq}">
                                      <input type="hidden" name="comNum"  value="${hospital.hospitalComNum}">
                                      <input type="hidden" name="userId"  value="${principal.user.userId}">
                                      <input type="hidden" name="userNickname"  value="${principal.user.userNickname}">
                                        <div class="card-body p-4">
                                            <div class="mb-2">
                                                <h5>닉네임</h5>
                                                <input style="color:rgba(204, 156, 22, 0.8) ;"  value="${principal.user.userNickname}" placeholder="${principal.user.userNickname}"  readonly> 
                                            </div>
                                            <div class="d-flex flex-start w-100">
                                              <c:choose>
                                                <c:when test="${empty principal.user.userProfile || empty principal}">
                                                  <img
                                                    class="rounded-circle shadow-1-strong me-3"
                                                    src="${pageContext.request.contextPath}/upload/noprofileuser.jpg"
                                                    alt="img"
                                                    width="40"
                                                    height="40"
                                                  />   
                                                </c:when>
                                                <c:otherwise>
                                                  <img
                                                      class="rounded-circle shadow-1-strong  mr-5"
                                                      src="${pageContext.request.contextPath}/upload/${principal.user.userProfile}"
                                                      alt="avatar"
                                                      width="65"
                                                      height="65"
                                                  />
                                                </c:otherwise>
                                              </c:choose>
                                                <div class="w-100">
                                                    <c:choose>
                                                      <c:when test="${empty myResList}">
                                                        <div class="form-outline">
            
                                                          <textarea name="content" class="form-control" id="review-content" rows="4" cols="10" readonly>병원을 이용한 고객만 등록 가능합니다.</textarea>
              
                                                      </div>
                                                      </c:when>
                                                      <c:otherwise>
                                                        <div class="form-outline">
            
                                                          <textarea name="content" class="form-control" id="review-content" rows="4" cols="10"></textarea>
              
                                                      </div>
                                                        <div class="d-flex justify-content-between mt-3">
                                                            <button id="btn-review-save" type="submit" class="btn btn-success">등록하기</button>
                                                        </div>
                                                      </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                          </div>
                        </c:otherwise>
                      </c:choose>
                      
        
                    <!-- 댓글 다는곳 종료 -->
        
                    <!-- ===============댓글 리스트 출력 시작================== -->
                      <c:forEach var="review" items="${hospitalReviewList}" varStatus="i" >
                        <div class="card mb-3">
                          <div class="card-body">
                            <div class="d-flex flex-start">
                              <c:choose>
                                <c:when  test="${empty review.user_profile}">
                                  <img
                                  class="rounded-circle shadow-1-strong me-3"
                                  src="${pageContext.request.contextPath}/upload/noprofileuser.jpg"
                                  alt="img"
                                  width="40"
                                  height="40"
                                  />
                                </c:when>
                                <c:otherwise>
                                  <img
                                  class="rounded-circle shadow-1-strong me-3"
                                  src="${pageContext.request.contextPath}/upload/${review.user_profile}"
                                  alt="img"
                                  width="40"
                                  height="40"
                                  />
                                </c:otherwise>
                              </c:choose>
                              <div class="w-100">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                  <h6 class="text-secondary fw-bold mb-0 ml-2 writer">
                                    ${review.user_nickname}
                                    <div class="mt-3">
                                      <span class="text-dark ms-2 ml-2">${review.content}</span>
                                    </div>
                                  </h6>
                                  <p class="mb-5"><fmt:formatDate value="${review.regDate }" pattern="yyyy-MM-dd"/></p>
                                </div>
                                <div class="d-flex justify-content-between align-items-center">
                                  <p class="small mb-0" style="color: #aaa;">
                                    
                                    <c:if test="${review.user_id == principal.user.userId}">
                                        <form action="deleteHospitalReview" method="POST">
                                          <input type="hidden"  name="reviewSeq" value="${review.review_seq}"/>
                                          <input type="hidden"  name="comNum" value="${review.com_num}"/>
                                          <input type="hidden"  name="userId" value="${principal.user.userId}"/>
                                          <input type="hidden"  name="hospitalSeq" value="${hospital.hospitalSeq}"/>
                                          <button type="button" class="link-grey ml-2 btn-update btn-comment-update" data-toggle='modal' data-target='.modifyModal${i.index}'>수정하기</button> 
                                          <button onclick="if(!confirm('삭제 하시겠습니까?')){return false}" class="link-grey ml-2 btn-delete">삭제하기</button> 
                                        </form>
                                        
                                      <form action="updateHospitalReview" method="POST" >
                                        <div class="modal fade modifyModal${i.index}"  role="dialog">
                                          <div class="modal-dialog">
                                            <div class="modal-content">
                                              <div class="modal-header">
                                                <button type="button"  data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title">댓글 수정</h4>
                                              </div>
                                              <div class="modal-body">
                                                <div class="">
                                                  <label for="reviewText">댓글 내용</label>
                                                  <input type="text" class="form-control"  name="content" value="${review.content}">
                                                </div>
                                                <div class="">
                                                  <label for="reviewWriter">댓글 작성자</label>
                                                  <input class="form-control" id="reviewWriter" placeholder="${principal.user.userNickname}" readonly>
                                                  <input type="hidden" name="userId" value="${principal.user.userId}">
                                                  <input type="hidden" name="reviewSeq" value="${review.review_seq}">
                                                  <input type="hidden"  name="comNum" value="${review.com_num}"/>
                                                  <input type="hidden"  name="hospitalSeq" value="${hospital.hospitalSeq}"/>
                                                </div>
                                              </div>
                                              <div class="modal-footer">
                                                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
                                                <button type="submit" class="btn btn-success modalModBtn">수정</button>
                                              </div>
                                            </div>
                                          </div>
                                        </div>
                                      </form>
        
                                      
                                              
                                    </c:if>
                                  </p>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </c:forEach>
        
        
                      <!-- ===============댓글 리스트 출력 종료================== -->
        
        
                    </div>
                  </div>
                </div>
            </section> 
              <!-- 리뷰 끝 -->
            </c:if>
        </div>
      </div>
    <!-- 페이지 끝 -->

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


    


   <!-- ALL JS FILES -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>


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
	   <script
      src="https://kit.fontawesome.com/f0999a1ca0.js"
      crossorigin="anonymous"
    ></script>
  <!-- kakaomap api test -->
  	<script
      type="text/javascript"
      src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=${kakaoAppKey}&libraries=services,clusterer,drawing"
    ></script>
     <script>
     
     var name = "${hospital.hospitalName}";
     var address = "${hospital.hospitalAddress}";
     	
     
     var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
     mapOption = {
         center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
         level: 6 // 지도의 확대 레벨
     };  

    function noLoginUserCantWrite(){
      alert("로그인이 필요합니다.");
    } 

	 // 지도를 생성합니다    
	 var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	 // 주소-좌표 변환 객체를 생성합니다
	 var geocoder = new kakao.maps.services.Geocoder();
	
	 // 주소로 좌표를 검색합니다
	 geocoder.addressSearch(address, function(result, status) {
	console.log(address);
	     // 정상적으로 검색이 완료됐으면 
	      if (status === kakao.maps.services.Status.OK) {
	
	         var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	         // 결과값으로 받은 위치를 마커로 표시합니다
	         var marker = new kakao.maps.Marker({
	             map: map,
	             position: coords
	         });
	
	         // 인포윈도우로 장소에 대한 설명을 표시합니다
	         var infowindow = new kakao.maps.InfoWindow({
	             content: '<div style="width:150px;text-align:center;padding:6px 0;">'+ name+'</div>'
	         });
	         infowindow.open(map, marker);
	
	         // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	         map.setCenter(coords);
	     } 
	 });    
	</script>
</body>
</html>