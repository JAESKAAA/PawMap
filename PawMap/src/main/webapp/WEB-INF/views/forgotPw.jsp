<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<c:set var ="pageTitle" value="로그인 비밀번호 찾기"/>
<html lang="en">
  <!-- Basic -->

  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Site Metas -->
    <title>Freshshop - Ecommerce Bootstrap 4 HTML Template</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <!-- Site Icons -->
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <!-- Site CSS -->
    <link rel="stylesheet" href="css/style.css" />
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css" />
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/custom.css" />

    <!-- 결 커스텀 css -->
    <link rel="stylesheet" href="css/style-gyul.css" />

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <style></style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/"></script>
  </head>



  <body>
    <%@ include file ="/WEB-INF/views/userIdSearchModal.jsp"%>
    <!-- Start Main Top -->
    <header class="main-header">
      <!-- Start Navigation -->
      <nav
      class="
      navbar navbar-expand-lg navbar-light
      bg-light
      navbar-default
      bootsnav
      "
      >
        <div class="container">
          <!-- Start Header Navigation -->
          <div class="navbar-header">
            <button
            class="navbar-toggler"
            type="button"
            data-toggle="collapse"
            data-target="#navbar-menu"
            aria-controls="navbars-rs-food"
            aria-expanded="false"
            aria-label="Toggle navigation"
            >
              <i class="fa fa-bars"></i>
            </button>
            <a class="navbar-brand" href="index.html"
            ><img src="images/logo.png" class="logo" alt=""
            /></a>
          </div>
          <!-- End Header Navigation -->

          <!-- Collect the nav links, forms, and other content for toggling -->
          <div class="collapse navbar-collapse" id="navbar-menu">
            <ul
            class="nav navbar-nav ml-auto"
            data-in="fadeInDown"
            data-out="fadeOutUp"
            >
              <li class="nav-item active">
                <a class="nav-link" href="#">홈</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">어바웃어스</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">병원찾기</a>
              </li>
              <li class="dropdown">
                <a
                href="#"
                class="nav-link dropdown-toggle arrow"
                data-toggle="dropdown"
                >커뮤니티</a>
                <ul class="dropdown-menu">
                  <li><a href="shop.html">자유게시판</a></li>
                  <li><a href="shop-detail.html">공지사항</a></li>
                  <li><a href="cart.html">이벤트게시판</a></li>
                  <li><a href="checkout.html">나눔게시판</a></li>
                </ul>
              </li>
              <li class="nav-item"><a class="nav-link" href="#">보호소</a></li>
              <li class="nav-item">
                <a class="nav-link" href="#">마이페이지</a>
              </li>
              <li class="nav-item"><a class="nav-link" href="#">로그인</a></li>
              <li class="nav-item">
                <a class="nav-link" href="#">회원가입</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </header>

    <!---------------------------------- 비밀번호 찾기 폼 시작 -------------------------->
    <div class="container-fluid">
      <div class="row justify-content-center">
        <div class="col-12 col-sm-10 col-md-12 col-lg-11 col-xl-10">
          <div class="card-loginForm d-flex mx-auto my-5">
            <div class="row">
              <div class="col-md-5 col-sm-12 col-xs-12 c1-loginForm p-5">
                <div class="row mb-5 m-3">
                  <img src="" width="70vw" height="55vh" alt="" />
                </div>
                <img
                src="images/gyul_animals_img-001.jpg"
                width="250vw"
                height="120vh"
                class="mx-auto d-flex"
                style="border-radius: 30px"
                />
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
                    <h1 class="wlcm">Welcome PawMap</h1>
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
                
               
                  <form action="forgotId" id="searchI" style="display: none;"  name="forgotId" method="POST">
                    <div class="form-group" >
                      <label class="font-weight-bold " for="userName">이름</label>
                      <div>
                        <input type="text" class="form-control" id="userName" name="userName" required="required" autofocus="autofocus" placeholder="ex) 은혜">
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="font-weight-bold " for="userTelNum">전화번호</label>
                      <div>
                        <input type="tel" class="form-control" id="userTelNum"	name="userTelNum" type="email" placeholder="ex) ampawmap@gmail.com">
                      </div>
                    </div>
                    <div class="form-group">
                      <button id="searchBtn2" type="submit"  onclick="idSearch_click()" class="btn btn-primary btn-block">확인</button>
                    <a class="btn btn-outline-danger btn-block"	onclick="history.back();" style="color: red;" >취소</a>
                  </div>
                  </form>
               
                <form action="forgotPw" id="searchP" style="display: none;"  name="forgotPw" method="POST">
                  <div class="form-group" >
                    <label class="font-weight-bold " for="userId">아이디</label>
                    <div>
                      <input type="text" class="form-control" id="userId" name="userId" required="required" autofocus="autofocus" placeholder="ex) ampawmap">
                    </div>
                  </div>
                  <div class="form-group" >
                    <label class="font-weight-bold " for="userName">이름</label>
                    <div>
                      <input type="text" class="form-control" id="userName" name="userName" required="required" autofocus="autofocus" placeholder="ex) 고결">
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="font-weight-bold " for="userEmail">이메일</label>
                    <div>
                      <input type="email" class="form-control" id="userEmail"	name="userEmail" type="email" placeholder="ex) ampawmap@gmail.com">
                    </div>
                  </div>
                  <div class="form-group">
                    <button id="searchBtn2" type="submit" class="btn btn-primary btn-block">확인</button>
                  <a class="btn btn-outline-danger btn-block"	onclick="history.back();">취소</a>
                </div>
                </form>
              

                <!-- <div>
                <h1>비밀번호 찾기</h1>
                <form name="forgotPw" 
                action="forgotPw" method="POST" onsubmit="DoFindLoginPassword__submit(this); return false;">
                    <input type="hidden" name="loginPwReal"/>
                    <hr />
                    <div>
                        <div>아이디</div>
                        <div>
                            <input name="userId" type="text" maxlength="50" placeholder="로그인 아이디를 입력하세요"/>
                            </div>
                    </div>

                    <hr />
                    <div>
                            <span>이름</span>
                            <div>
                                <input autocomplete="off" type="text" name="userName"
                                required="required" autofocus="autofocus" maxlength="30"
                                placeholder="이름" />
                            </div>
                        </div>

                    <hr />
                    <div>
                        <div>이메일</div>
                        <div>
                            <input name="userEmail" type="email" maxlength="50" placeholder="가입시 입력한 이메일을 입력하세요"/>
                            </div>
                    </div>

                    <hr />
                    <div>
                    
                        <div>
                            <input id="send-tempPwd-msg" type="submit" value="비밀번호 찾기" />
                            <button type="button" onclick="history.back();">뒤로가기</button>
                            </div>
                    </div>
                    </form>

            </div> -->
        </div>
    </div>
</div>
</div>
</div>
</div>

<script>
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
          
</script>
<script>
  $(document).ready(function() {
		/////////모///달///기///능///////////
		// 1. 모달창 히든 불러오기
		$('#searchBtn').click(function() {
			$('#background_modal').show();
		});
		// 2. 모달창 닫기 버튼
		$('.close').on('click', function() {
			$('#background_modal').hide();
		});
		// 3. 모달창 위도우 클릭 시 닫기
		$(window).on('click', function() {
			if (event.target == $('#background_modal').get(0)) {
	            $('#background_modal').hide();
	         }
		});
	});
</script>
                                <!-- <script>
                                 
                            
                                    // 로그인 실패시
                                    function FindLoginPasswordForm__submit(form){
                                        if(isNoeLoading()) {
                                            alert('처리중입니다.');
                                            return;
                                        }
                                
                                        form.userId.value = form.userId.value.trim();
                                        form.userId.value = form.userId.value.replaceAll('-','');
                                        form.userId.value = form.userId.value.replaceAll('_','');
                                        form.userId.value = form.userId.value.replaceAll(' ','');
                                
                                        if(form.userId.value.length == 0) {
                                            form.userId.focus();
                                            alert('아이디를 입력해주세요.');
                                 
                                
                                            return;
                                        }
                                        
                                        form.userName.value = form.userName.value.trim();
                                
                                        if (form.userName.value.length == 0) {
                                            alert('이름을 입력해주세요.');
                                            form.userName.focus();
                                            return false;
                                        }
                                
                                
                                        form.userEmail.value = form.userEmail.value.trim();
                                        form.userEmail.value = form.userEmail.value.replaceAll(' ','');
                                
                                        if(form.userEmail.value.length == 0) {
                                            form.userEmail.focus();
                                            alert('이메일을 입력해주세요.');
                                          
                                
                                            return;
                                        }
                                        form.submit();
                                        startLoading();
                                    }
                                    </script> -->
                                
</body>
</html>
