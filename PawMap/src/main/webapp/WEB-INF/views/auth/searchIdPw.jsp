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
        background: rgba(177, 155, 115, 0.603);
        height: fit-content;
        font-size: large;

      }
      /* 아이디 비번찾기 블럭 */
  	/* searchI , searchP {
		  padding-left: 8%;
	
	  } */
	  .searchForm {
		padding-top: 100px;
		padding-left: 10%;padding-right: 10%;
	}
      /* 모달 스타일 */
    .modal { 
    position: absolute; 
    display:none ;

    width: 80%; 
    height: 28%; 
    background-color: rgb(255, 255, 255);
    border-radius: 2%;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    box-shadow : rgba(104, 91, 72, 0.74) 0 0 0 9999px, rgba(104, 91, 72,0.3) 1px 1px 2px 2px;
    z-index : 100;
    overflow: hidden;
    animation-name: modalopen;
    animation-duration: var(--modal-duration);
    margin: 10%;
    border-style: none;

    vertical-align: middle;
    } 

    .close {
      position: absolute;
      top: 10px;
      right: 10px;
      
    
    }


    .fixed-top {
      height: 100px;
    }

    .samsam {
      padding: 10%;
      
    }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

  </head>

  <body>

    
   <!-- Header 시작 -->
   <header id="header" class="main-header header"  style="z-index: 100;">
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
                      <a href="/pawmap/shelter" id="nav-a" class="nav-link text-uppercase font-weight-bold">보호소 정보</a></li>
                    <li class="dropdown"color: rgb(255, 255, 255);">
                        <a
                          href="#"
                          class="nav-link dropdown-toggle arrow"
                          data-toggle="dropdown"
                          >커뮤니티</a
                        >
                        <!-- style inline으로 -->
                        <ul class="dropdown-menu"  style="background-color:rgba(0, 0, 0, 0.089);" >
                          <li style="padding: 3%;"><a href="shop-detail.html"  style="color: #fff; size: 0.8em;">자유게시판</a></li>
                          <li style="padding: 3%;"><a href="cart.html"  style="color: #fff; size: 0.8em;">나눔게시판</a></li>
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
                  <p id="attr-nav-p">마이페이지 ${principal.user.userNickname} 님 환영합니다.</p>
                </a>
              </li>
              <li class="side-menu">
                <a href="/pawmap/logout">
                  <p id="attr-nav-p">로그아웃</p>
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

  

    <!---------------------------------- 비밀번호 찾기 폼 시작 -------------------------->
    
    <div class="container-fluid searchForm">
      <div class="row justify-content-center ">
        <div class="col-12 col-sm-10 col-md-12 col-lg-11 col-xl-10">
          <div class="card-loginForm d-flex mx-auto my-5">
            <div class="row">
              <div class="col-md-5 col-sm-12 col-xs-12 c1-loginForm p-5">
                <div class="searchImg">
                </div>
                <div class="row justify-content-center">
                  <div
                  class="
                  w-75
                  mx-md-5 mx-1 mx-sm-2
                  mb-5
                  mt-4
                  px-sm-5 px-md-2 px-xl-1 px-2
                  "
                  >
                    <h3 class="wlcm">Welcome PawMap</h3>
                  </div>
                </div>
              </div>
              <div class="col-md-7 col-sm-12 col-xs-12 c2 px-5 pt-5">
                
                
                
                <div style="margin-bottom: 10px;"
                class="custom-control custom-radio custom-control-inline">
                <input type="radio" class="custom-control-input" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
                <label class="custom-control-label font-weight-bold text-black"	for="search_1">아이디 찾기</label>
              </div>
              <div class="custom-control custom-radio custom-control-inline">
                <input type="radio" class="custom-control-input" id="search_2" name="search_total" onclick="search_check(2)"> 
                <label class="custom-control-label font-weight-bold text-black" for="search_2">비밀번호 찾기</label>
              </div>
              
              
              
                              <!-- 아이디 표출 모달-->
                              <div id="modal"  class="modal" role="dialog">

                                <div class="samsam">
                                <div class="modal_header">
                                    <span class="close" style="color: #555;">&times;</span>
                                   <br>
                                  </div>
                                    <div class="modal_contents">
                                      <h2 id="id_value"></h2>
                                    <br>
                                  </div>
                                </div>  
                                  <div class="modal-back"></div>
                                </div>
                              
                            




                  <div  id="searchI" method="POST">
                    <!-- action="searchIdPw"  name="forgotId"-->
                    <div class="form-group" >
                      <label class="font-weight-bold " for="userName">이름</label>
                      <div>
                        <input type="text" class="form-control searchBox" id="userName" name="userName" required="required" autofocus="autofocus" placeholder="ex) 은혜">
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="font-weight-bold " for="userTelNum">전화번호</label>
                      <div>
                        <input type="text" class="form-control searchBox" id="userTelNum"	name="userTelNum" required="required" placeholder="ex) 010-1111-1111">
                      </div>
                    </div>
                    <div class="form-group">
                     
                      <button id="searchBtn" type="button" onclick="idSearch_click()" class="btn form-control searchIPBtn">확인</button>
                      <a class="btn form-control searchCcBtn" onclick="history.back();" style="color: red;" >취소</a>
                  </div>
                </div>







               
                <form action="searchPw" id="searchP" style="display: none;"  name="forgotPw" method="POST">
                  <div class="form-group" >
                    <label class="font-weight-bold " for="userId">아이디</label>
                    <div>
                      <input type="text" class="form-control searchBox" id="userId" name="userId" required="required" autofocus="autofocus" placeholder="ex) ampawmap">
                    </div>
                  </div>
                  <div class="form-group" >
                    <label class="font-weight-bold " for="userName">이름</label>
                    <div>
                      <input type="text" class="form-control searchBox" id="userName" name="userName" required="required" autofocus="autofocus" placeholder="ex) 고결">
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="font-weight-bold " for="userEmail">이메일</label>
                    <div>
                      <input type="email" class="form-control searchBox" id="userEmail"	name="userEmail" type="email" placeholder="ex) ampawmap@gmail.com">
                    </div>
                  </div>
                  <div class="form-group">
                    <button id="searchBtn2" type="submit" class="btn form-control searchIPBtn">확인</button>
                  <a class="btn  form-control searchCcBtn"	onclick="history.back();">취소</a>
                </div>
                </form>
              

        </div>
    </div>
</div>
</div>
</div>
</div>

<script>


  $(document).ready(function() {
  /////////모///달///기///능///////////
  // 1. 모달창 히든 불러오기
  $('#searchBtn').click(function() {
   $('#modal').show();
  });
  // 2. 모달창 닫기 버튼
  $('.close').on('click', function() {
    $('#modal').hide();
  });
  // 3. 모달창 위도우 클릭 시 닫기
  $(window).on('click', function() {
    if (event.target == $('#modal').get(0)) {
            $('#modal').hide();
         }
  });
});
  // 아이디찾기 화면, 비밀번호 찾기화면 선택하는 스크립트 
  //체크 버튼에 따라 아이디/비밀번호 기능이 달라진다
    function search_check(num) {
      if (num == '1') {
        document.getElementById("searchP").style.display = "none";
        document.getElementById("searchI").style.display = "";	
      } else {
        document.getElementById("searchI").style.display = "none";
        document.getElementById("searchP").style.display = "";
      }
    }
    


  // 아이디 & 스토어 값 저장하기 위한 변수
	var idV = "";
	// 아이디 값 받고 출력하는 ajax
	var idSearch_click = function(){
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/pawmap/searchIdPw?userName="
					+$('#userName').val()+"&userTelNum="+$('#userTelNum').val(),
			success:function(data){
				if(data == 0){
					$('#id_value').text("회원 정보를 확인해주세요!");	
				} else {
					$('#id_value').text("아이디는 " +data+" 입니다");
					// 아이디값 별도로 저장
					idV = data;
				}
			}
		});
	}



 
</script>
<%@ include file="../layout/footer.jsp" %>

