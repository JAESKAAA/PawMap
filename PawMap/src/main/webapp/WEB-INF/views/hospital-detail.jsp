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
 
    <!-- 페이지 끝 -->



    



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

    
  
</body>
</html>