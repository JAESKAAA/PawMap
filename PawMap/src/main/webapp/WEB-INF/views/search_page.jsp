<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<spring:eval expression="@environment.getProperty('kakao.app.key')" var="kakaoAppKey"/>

<!DOCTYPE html>
<html lang="ko">
  <!-- Basic -->

  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Site Metas -->
    <title>PawMap - 동물 병원 찾기</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <!-- Site Icons -->
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png" />

    <!-- Bootstrap (부트스트랩) CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <!-- Site (사이트) CSS -->
    <link rel="stylesheet" href="css/style.css" />
    <!-- Responsive (반응형) CSS -->
    <link rel="stylesheet" href="css/responsive.css" />
    <!-- hospital-search CSS (검색페이지 1) -->
    <link rel="stylesheet" href="css/hospital-search.css" />
    <!-- 테이블 부분 css -->
    <link rel="stylesheet" href="css/footable.bootstrap.css" />
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/custom.css" />

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
    <!-- 동물병원 search부분 시작 -->
    <div class="search-container" style="margin-top: 10%">
      <h1>동물병원 찾기</h1>
      <div class="search-box">
        <div class="search-icon"><i class="fa fa-search search-icon"></i></div>
        <form action="/pawmap/searchDetail" method="get" class="search-form">
          <input
            type="text"
            placeholder="내용을 입력해주세요."
            id="search"
            name="value"
            autocomplete="off"
          />
        </form>
        <svg
          class="search-border"
          version="1.1"
          xmlns="http://www.w3.org/2000/svg"
          xmlns:xlink="http://www.w3.org/1999/xlink"
          xmlns:a="http://ns.adobe.com/AdobeSVGViewerExtensions/3.0/"
          x="0px"
          y="0px"
          viewBox="0 0 671 111"
          ;
          xml:space="preserve"
        >
          <path
            class="border"
            d="M335.5,108.5h-280c-29.3,0-53-23.7-53-53v0c0-29.3,23.7-53,53-53h280"
          />
          <path
            class="border"
            d="M335.5,108.5h280c29.3,0,53-23.7,53-53v0c0-29.3-23.7-53-53-53h-280"
          />
        </svg>
        <div class="go-icon"><i class="fa fa-arrow-right"></i></div>
      </div>
    </div>

    <!-- 동물병원 search부분 끝 -->


	
    <!-- kakaomap 표출 부분 700x400 (서버 올린 후 확인가능, localhost:8080으로 디폴트 지정해 놓았음. 자세한건 맨 밑 주석참조) -->
    <div id="map"></div>
    <!-- kakaomap 표출부분 끝 -->




    <!-- 테이블 부분 (쇼케이스 버전이므로 데이터 불러올때는 링크를 참조하길) -->
    <table class="table" style="width: 75%; margin: auto; margin-bottom: 10%; margin-top: 3%;">
      <thead>
        <tr>
          <th data-breakpoints="xs sm md">병원 이름</th>
          <th data-breakpoints="xs">위치</th>
          <th data-breakpoints="xs">진료 시간</th>
          <th data-breakpoints="xs">자세히</th>
        </tr>
      </thead>
      <tbody>
      
      <!-- 페이지네이션 부분 시작-->
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
		<!-- 페이지네이션 부분 시작-->
      <c:forEach var="hospital" items="${hospitalList }">
        <tr data-expanded="true">
          <td>${hospital.hospitalName}</td>
          <td>${hospital.hospitalAddress}</td>
          <td>오전 9:00 ~ 오후 18:00</td>
          <td>
            <a
            	href="/pawmap/detailHospital?hospitalSeq=${hospital.hospitalSeq }"
              class="btn btn-primary btn-rounded btn-sm"
              data-mdb-ripple-color="#ffffff"
              style="background-color: #e4b407"
            >
              자세히
            </a>
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
    <form id="frm">
    </form>
    <!-- 쇼케이스 버전 테이블 끝 -->

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


	<script>
		
	</script>


    <!-- kakaomap api test -->
    <script
      type="text/javascript"
      src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=${kakaoAppKey}&libraries=services,clusterer,drawing"
    ></script>
   <script>
   var nameList =[];
   var addressList =[];
   	<c:forEach var="hospital" items="${hospitalList}" varStatus="status">
   		nameList.push("${hospital.hospitalName}");
   		addressList.push("${hospital.hospitalAddress}")
   	</c:forEach>
   	
   	console.log(nameList);
   	console.log(nameList[0]);
   	console.log(nameList.length);
   	console.log(addressList);
	
	var mapContainer = document.getElementById('map'); // 지도를 표시할 div  
	   mapOption = { 
	       center: new kakao.maps.LatLng(37.56623853482794, 126.97853923627761), // 지도의 중심좌표
	       level: 6 // 지도의 확대 레벨
	   };

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
		var coords=[];
		let addressValue = "";
		// 주소로 좌표를 검색합니다
		for(let i=0; i<addressList.length; i++){
			
		geocoder.addressSearch(addressList[i], function(result, status) {
			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {
				addressValue = new kakao.maps.LatLng(result[0].y, result[0].x);
				coords[i] = addressValue;
				console.log("좌표값 : "+coords[i]+" "+i);
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
		       title : nameList[i], // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		       image : markerImage, // 마커 이미지 
		   		clickable : true
		 	  });
		   var iwContent = '<div style="padding:5px;">'+nameList[i]+'</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			var iwPosition = new kakao.maps.LatLng(33.450701, 126.570667);
			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
			    content : iwContent
			});
			
			console.log("iwContent"+iwContent);
			console.log("infowindow"+infowindow);
			

			// 마커에 마우스오버/아웃 이벤트를 등록합니다
			kakao.maps.event.addListener(marker, 'mouseover', function() {
			    infowindow.open(map, marker);
				});
			// 마커에 마우스오버 이벤트를 등록합니다
			kakao.maps.event.addListener(marker, 'mouseout', function() {
			  // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
			    infowindow.close();
				});
		   
			});
		}
		
		 //지도 위치를 처음 검색된 곳으로 이동시켜줌
	      geocoder.addressSearch(addressList[1], function(result, status) {
	         // 정상적으로 검색이 완료됐으면 
	         if (status === kakao.maps.services.Status.OK) {
	            addressValue = new kakao.maps.LatLng(result[0].y, result[0].x);
	            coords[1] = addressValue;   
	            }
	         //전체 리스트 표출되면 적용안되도록 제한
	         if(nameList.length < 800){
	         map.setCenter(addressValue);
	         }
	      });
		
    </script>
  </body>
</html>
