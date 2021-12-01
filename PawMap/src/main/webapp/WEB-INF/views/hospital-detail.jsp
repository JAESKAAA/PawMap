<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<spring:eval expression="@environment.getProperty('kakao.app.key')" var="kakaoAppKey"/>
<!DOCTYPE html>
<html lang="ko">
<!-- Basic -->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <title>PawMap - 동물병원 정보</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">

    <!-- Bootstrap (부트스트랩) CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Site (사이트) CSS -->
    <link rel="stylesheet" href="css/style.css">
    <!-- Responsive (반응형) CSS -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- hospital-search CSS (검색페이지 1) -->
    <link rel="stylesheet" href="css/hospital-search.css">
    <!-- 테이블 부분 css -->
    <link rel="stylesheet" href="css/footable.bootstrap.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/custom.css">

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

  <style>

    .container {
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
  </style>

</head>

<body>


  
      <!-- Start About Page  -->
      <div class="about-box-main">
        <div class="container">
          <div class="row">
            <img class="swing-in-top-fwd" src="images/cat01.jpg" style="width: 1200px; height: auto; -webkit-box-align: center;">
            <div class="col-lg-6">
              <div class="banner-frame">
              			<h2></h2>
                      <h2 class="noo-sh-title-top">${hospital.hospitalName }</h2>
					<c:if test="${hospital.hospitalType == 'H'}">  
                      <a href="#"class="btn btn-warning"><i class="glyphicon glyphicon-bell"></i> 예약하기</a>
                     </c:if>
                    </div>
                </div>
                <div class="col-lg-6">
                    <p class="noo-p">
                      <div class="card-body">
                        <div class="media mb-3">
                          <div class="mr-2">
                            <i class="fas fa-map-marker-alt fa-2x"></i>
                          </div>
                          <div class="media-body">
                            <p>${hospital.hospitalAddress }</p>
                          </div>
                        </div>
                        <div class="media mb-3">
                          <div class="mr-2"> 
                            <i class="fas fa-home fa-2x"></i>
                          </div>
                          <div class="media-body">
                            <p>준비중입니다.</p>
                          </div>
                        </div>
                        <div class="media mb-3">
                          <div class="mr-2"> 
                            <i class="fas fa-phone-volume fa-2x"></i>
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
	               <a href="#menu1" style="color: black;"><h3 class="h3">병원 정보</h3>
	                 <div class="service-block-inner-a"></a>
	                 </div>
	             </div>
	             <div class="col-4">
	               <a href="#menu2" style="color: black;"><h3 class="h3">수의사(3)</h3>
	                 <div class="service-block-inner-b"></a>
	                 </div>
	             </div>
	             <div class="col-4">
	               <a href="#menu3" style="color: black;"><h3 class="h3">리뷰(5)</h3>
	                 <div class="service-block-inner-b"></a>
	                 </div>
	             </div>
	      	 </div>
    		  <!-- 이동부분 끝 -->
            <hr>
			</c:if>
            <!-- 하단 위치 진료시간 부분 -->
            <div class="row my-5">
                <div class="col-sm-8 col-lg-6">
                    <div class="service-block-inner">
                        <h3 style="margin-bottom: 3%;">위치</h3>
                        <div id="map" style="max-width: 100%; 
                        height: 500px; "></div>
                    </div>
                </div>
                <div class="col-sm-8 col-lg-6">
                    <div class="service-block-inner">
                        <h3 style="margin-bottom: 3%;">진료시간</h3>
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
            </div>
              <c:if test="${hospital.hospitalType == 'H'}">
                <!-- 기타 수의사 정보 시작 -->
			  <div class="container" id="menu2">
			    <div class="row my-5">
			      <div class="col-sm-6 col-lg-4">
			          <div class="service-block-inner">
			              <h3>수의사(3)</h3>
			          </div>
			      </div>
			      <!-- 수의사 프로필 부분 -->
			      <div class="container" style="margin-top: -5%; margin-bottom: -3%;">
			        <div class="row profile" >
			        <div class="col-md-4" >
			          <div class="profile-sidebar">
			            <!-- SIDEBAR USERPIC -->
			            <div class="profile-userpic">
			              <img src="images/01.jpg" class="img-responsive" alt="">
			            </div>
			            <!-- END SIDEBAR USERPIC -->
			            <!-- SIDEBAR USER TITLE -->
			            <div class="profile-usertitle">
			              <div class="profile-usertitle-name">
			                최재석
			              </div>
			              <div class="profile-usertitle-job">
			                관절전문
			              </div>
			            </div>
			            <!-- END SIDEBAR USER TITLE -->
			            <!-- SIDEBAR BUTTONS -->
			            <div class="profile-userbuttons">
			              <button type="button" class="btn btn-primary btn-rounded btn-sm" data-mdb-ripple-color="#ffffff" style="background-color: #e4b407">
			                약력보기
			              </button>
			              <button type="button" class="btn btn-primary btn-rounded btn-sm" data-mdb-ripple-color="#ffffff" style="background-color: #e4b407">
			              이 의사 리뷰보기
			              </button>
			            </div>
			          </div>
			        </div>
			      </div> 
			    </div>
			  </div>
			 
		        <!--리뷰 시작-->
		      <div class="container" id="menu3">
		        <div class="row my-5">
		          <div class="col-sm-6 col-lg-4" style="margin-bottom: -5%; margin-top: -5%;" >
		            <div class="service-block-inner">
		              <h3>리뷰(5)</h3>
		            </div>
		          </div>
		        </div>
		              <!-- 리뷰 표출부분 -->
		        <div class="card-body" style="width: 500px; position: absolute; left: 50%; transform: translateX(-50%);">
		          <div class="media mb-3">
		            <div class="mr-2"> 
		              <img class="rounded-circle border p-1" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2264%22%20height%3D%2264%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2064%2064%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_160c142c97c%20text%20%7B%20fill%3Argba(255%2C255%2C255%2C.75)%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A10pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_160c142c97c%22%3E%3Crect%20width%3D%2264%22%20height%3D%2264%22%20fill%3D%22%23777%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2213.5546875%22%20y%3D%2236.5%22%3E64x64%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" alt="Generic placeholder image">
		            </div>
		            <div class="media-body">
		              <p>코딩이 맛있고 강사님이 친절해요</p>
		              <small class="text-muted">받은 치료 : 코딩</small>
		            </div>
		          </div>
		          <hr>
		          <div class="media mb-3">
		            <div class="mr-2"> 
		              <img class="rounded-circle border p-1" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2264%22%20height%3D%2264%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2064%2064%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_160c142c97c%20text%20%7B%20fill%3Argba(255%2C255%2C255%2C.75)%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A10pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_160c142c97c%22%3E%3Crect%20width%3D%2264%22%20height%3D%2264%22%20fill%3D%22%23777%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2213.5546875%22%20y%3D%2236.5%22%3E64x64%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" alt="Generic placeholder image">
		            </div>
		            <div class="media-body">
		              <p>코딩이 맛있고 강사님이 친절해요</p>
		              <small class="text-muted">받은 치료 : 코딩</small>
		            </div>
		          </div>
		            <hr>
		            <div class="media mb-3">
		              <div class="mr-2"> 
		                <img class="rounded-circle border p-1" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2264%22%20height%3D%2264%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2064%2064%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_160c142c97c%20text%20%7B%20fill%3Argba(255%2C255%2C255%2C.75)%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A10pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_160c142c97c%22%3E%3Crect%20width%3D%2264%22%20height%3D%2264%22%20fill%3D%22%23777%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2213.5546875%22%20y%3D%2236.5%22%3E64x64%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" alt="Generic placeholder image">
		              </div>
		              <div class="media-body">
		                <p>코딩이 맛있고 강사님이 친절해요</p>
		                <small class="text-muted">받은 치료 : 코딩</small>
		              </div>
		            </div>
		        </div>
		      </div>
		      <br><br><br>
		      <!-- 리뷰 끝 -->
            </c:if>

 
    <!-- 페이지 끝 -->



    


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