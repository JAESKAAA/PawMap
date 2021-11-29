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
    <link rel="shortcut icon" href="<%=request.getContextPath() %>/images/favicon.ico" type="image/x-icon" />
    <link rel="apple-touch-icon" href="<%=request.getContextPath() %>/images/apple-touch-icon.png" />
    <!-- Fontawesome CSS-->
    <link
      href="https://use.fontawesome.com/releases/v5.0.6/css/all.css"
      rel="stylesheet"
    />
    
    <%-- <%=request.getContextPath() %> --%>
    <!--  ${request.getContextPath } -->
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css" />
    <!-- Site CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css" />
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/responsive.css" />
    <!-- Custom CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/custom.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/custom-jaeseok.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style-gyul.css">
    
        <!-- 결 커스텀 css -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

        <!-- 항목별 공백 확인 alert창 스크립트-->
        <script>
          function submitJoinForm(form) {
            form.userId.value = form.userId.value.trim();
            if (form.userId.value.length == 0) {
              alert('로그인 아이디를 입력해주세요.');
              form.userId.focus();
              return false;
            }
            form.userPassword.value = form.userPassword.value.trim();
            if (form.userPassword.value.length == 0) {
              alert('로그인 비밀번호를 입력해주세요.');
              form.userPassword.focus();
              return false;
            }
            
            form.userName.value = form.userName.value.trim();
            if (form.userName.value.length == 0) {
              alert('이름을 입력해주세요.');
              form.userName.focus();
              return false;
            }
            form.userEmail.value = form.userEmail.value.trim();
            if (form.userEmail.value.length == 0) {
              alert('이메일을 입력해주세요.');
              form.email.focus();
              return false;
            }
            form.submit();
          }

        </script>

        <!--주소검색-->
        <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

        <!--다음 주소 연동-->
        <script>
          /* 다음 주소 연동 */
          function execution_daum_address() {
            new daum.Postcode({
              oncomplete: function (data) {
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                  addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                  addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if (data.userSelectedType === 'R') {
                  // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                  // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                  if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraAddr += data.bname;
                  }
                  // 건물명이 있고, 공동주택일 경우 추가한다.
                  if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                  }
                  // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                  if (extraAddr !== '') {
                    extraAddr = ' (' + extraAddr + ')';
                  }
                  // 주소변수 문자열과 참고항목 문자열 합치기
                  addr += extraAddr;
                } else {
                  addr += ' ';
                }
                $(".address_input_1").val(data.zonecode);
                $(".address_input_2").val(addr);
                $(".address_input_3").attr("readonly",false);
                $(".address_input_3").focus();
              }
            }).open();
          }
        </script>
        

    <style>
      .form-label {
        color: #e1a963;
      }
      .join-btn {
        background: gray;
        border-color: antiquewhite;
      }
      .left-div {
        background-color: #ffdab9;
        border-radius: 50% 20% / 10% 40%;
      }
      .column-div {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 80px;
        height: 50px;
        background-color: antiquewhite;
        border-radius: 100px;
        margin: auto;
      }
    </style>
  </head>

  <body>
    <!-- Header 시작 -->
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
            <!--사이트 로고 부분-->
            <a class="navbar-brand" href="/pawmap">
              <div class="main_logo_box"></div>
            </a>
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
                <a class="nav-link" href="index.html">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="about.html">회사소개</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="gallery.html">병원찾기</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="contact-us.html">보호소 정보</a>
              </li>
              <li class="dropdown">
                <a
                  href="#"
                  class="nav-link dropdown-toggle arrow"
                  data-toggle="dropdown"
                  >커뮤니티</a
                >
                <ul class="dropdown-menu">
                  <li><a href="shop.html">공지사항</a></li>
                  <li><a href="shop-detail.html">자유게시판</a></li>
                  <li><a href="cart.html">나눔게시판</a></li>
                </ul>
              </li>
            </ul>
          </div>
          <!-- /.navbar-collapse -->

          <!-- Start Atribute Navigation -->
          <div class="attr-nav">
            <ul>
              <li class="search" style="display: none">
                <a href="#"><i class="fa fa-search"></i></a>
              </li>
             <sec:authorize access="isAnonymous()">
              <li class="side-menu">
                <a href="/pawmap/loginForm">
                  <p>로그인</p>
                </a>
              </li>
              <li class="side-menu">
                <a href="/pawmap/joinForm">
                  <p>회원가입</p>
                </a>
              </li>
			 </sec:authorize>
			<sec:authorize access="isAuthenticated()">
			 <li class="side-menu">
                <a href="/pawmap/loginForm">
                  <p>마이페이지 ${principal.user.userId} 님 환영합니다.</p>
                </a>
              </li>
			 <li class="side-menu">
                <a href="/pawmap/logout">
                  <p>로그아웃</p>
                </a>
              </li>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<li class="side-menu">
                  <a href="/pawmap/admin">
                    <p>관리자 페이지</p>
                  </a>
                  </li>
			</sec:authorize>
            </ul>
          </div>
          <!-- End Atribute Navigation -->
        </div>
        <!-- Start Side Menu -->
        <div class="side">
          <a href="#" class="close-side"><i class="fa fa-times"></i></a>
          <li class="cart-box">
            <ul class="cart-list">
              <li>
                <a href="#" class="photo"
                  ><img src="images/img-pro-01.jpg" class="cart-thumb" alt=""
                /></a>
                <h6><a href="#">Delica omtantur </a></h6>
                <p>1x - <span class="price">$80.00</span></p>
              </li>
              <li>
                <a href="#" class="photo"
                  ><img src="images/img-pro-02.jpg" class="cart-thumb" alt=""
                /></a>
                <h6><a href="#">Omnes ocurreret</a></h6>
                <p>1x - <span class="price">$60.00</span></p>
              </li>
              <li>
                <a href="#" class="photo"
                  ><img src="images/img-pro-03.jpg" class="cart-thumb" alt=""
                /></a>
                <h6><a href="#">Agam facilisis</a></h6>
                <p>1x - <span class="price">$40.00</span></p>
              </li>
              <li class="total">
                <a href="#" class="btn btn-default hvr-hover btn-cart"
                  >VIEW CART</a
                >
                <span class="float-right"><strong>Total</strong>: $180.00</span>
              </li>
            </ul>
          </li>
        </div>
        <!-- End Side Menu -->
      </nav>
      <!-- End Navigation -->
    </header>
    <!-- Header 끝 부분 -->


    <!---------------------------------- 회원가입 폼 -------------------------->

    <section class="vh-100" style="background-color: #eee">
      <div class="container h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
          <div class="col-lg-12 col-xl-11">
            <div class="card text-black" style="border-radius: 25px">
              <div class="card-body p-md-5">
                <div class="row justify-content-center">
                  <div
                    class="
                      col-md-10 col-lg-6 col-xl-5
                      order-2 order-lg-1
                      left-div
                    "
                  >
                    <p class="text-center h3 fw-bold mb-5 mx-1 mx-md-4 mt-4">
                      유저 회원가입
                    </p>

                    <form
                      class="mx-1 mx-md-4"
                      action="/pawmap/join"
                      method="post"

                      name="joinForm"
                      onsubmit="submitJoinForm(this); return false;"                      >

                      <div class="d-flex flex-row align-items-center mb-4">
                        <div class="form-outline flex-fill mb-0">
                          <div class="column-div">
                            <div>
                              <label class="form-label mt-2" for="user_id"
                                >회원 아이디</label
                              >
                            </div>
                          </div>
                          <input
                            type="text"
                            name="userId"
                            id="user_id"
                            class="form-control"
                            placeholder="아이디"
                            required
                          />
                        </div>
                      </div>
                      <div class="d-flex flex-row align-items-center mb-4">
                        <div class="form-outline flex-fill mb-0">
                          <div class="column-div">
                            <div>
                              <label class="form-label mt-2" for="user_password"
                                >비밀번호</label
                              >
                            </div>
                          </div>
                          <input
                            type="password"
                            name="userPassword"
                            id="userPassword"
                            class="form-control"
                            placeholder="비밀번호"
                            required
                          />
                        </div>
                      </div>
                      <div class="d-flex flex-row align-items-center mb-4">
                        <div class="form-outline flex-fill mb-0">
                          <div class="column-div">
                            <div>
                              <label class="form-label mt-2" for="user_name"
                                >이름</label
                              >
                            </div>
                          </div>
                          <input
                            type="text"
                            name="userName"
                            id="user_name"
                            class="form-control"
                            placeholder="이름"
                            required
                          />
                        </div>
                      </div>
                      <div class="d-flex flex-row align-items-center mb-4">
                        <div class="form-outline flex-fill mb-0">
                          <div class="column-div">
                            <div>
                              <label class="form-label mt-2" for="user_email"
                                >이메일</label
                              >
                            </div>
                          </div>
                          <input
                            type="email"
                            name="userEmail"
                            id="user_email"
                            class="form-control"
                            placeholder="이메일"
                            required
                          />
                        </div>
                      </div>
                      <div class="d-flex flex-row align-items-center mb-4">
                        <div class="form-outline flex-fill mb-0">
                          <div class="column-div">
                            <div>
                              <label class="form-label mt-2" for="user_tel_num"
                                >전화번호</label
                              >
                            </div>
                          </div>
                          <input
                            type="tel"
                            name="userTelNum"
                            id="user_tel_num"
                            class="form-control"
                            placeholder="'-' 를 빼고 입력해 주세요"
                            required
                          />
                        </div>
                      </div>
                      <!---------------기존 주소 form----------------->
                      <!-- <div class="d-flex flex-row align-items-center mb-4">
                        <div class="form-outline flex-fill mb-0">
                          <div class="column-div">
                            <div>
                              <label class="form-label mt-2" for="user_address"
                                >주소</label>
                            </div>
                          </div>
                          <input type="text" name="address" id="user_address" class="form-control" placeholder="주소" required/>
                        </div>
                      </div> -->

                      <!-----------------start 주소찾기 구현 => db에 저장되게 변수명 바꿔주기 11.25 오후 8시------------------------->
                      <div class="address_wrap">
                        <div class="address_name">주소</div>
                        <div class="address_input_1_wrap">
                          <div class="address_input_1_box">
                            <input class="address_input_1" name="address1" readonly="readonly">
                          </div>
                            <button class="address_button" onclick="execution_daum_address()">주소찾기</button>
                          <div class="clearfix"></div>
                        </div>
                        <div class ="address_input_2_wrap">
                          <div class="address_input_2_box">
                            <input class="address_input_2" name="address2" readonly="readonly">
                          </div>
                        </div>
                        <div class ="address_input_3_wrap">
                          <div class="address_input_3_box">
                            <input class="address_input_3" name="address3" readonly="readonly">
                          </div>
                        </div>
                      </div>
                      <!-----------------end 주소찾기 구현 => db에 저장되게 변수명 바꿔주기 11.25 오후 8시------------------------->

                      <div class="d-flex flex-row align-items-center mb-4">
                        <div class="form-outline flex-fill mb-0">
                          <div class="column-div">
                            <div>
                              <label class="form-label mt-2" for="user_nickname"
                                >닉네임</label
                              >
                            </div>
                          </div>
                          <input
                            type="tel"
                            name="userNickname"
                            id="user_nickname"
                            class="form-control"
                            placeholder="닉네임"
                            required
                          />
                        </div>
                      </div>
                      <div
                        class="d-flex justify-content-center mx-4 mb-3 mb-lg-4"
                      >
                        <button
                          type="submit"
                          class="btn btn-primary btn-lg join-btn"
                        >
                          회원가입
                        </button>
                      </div>
                    </form>
                  </div>
                  <div
                    class="
                      col-md-10 col-lg-6 col-xl-7
                      d-flex
                      align-items-center
                      order-1 order-lg-2
                    "
                  >
                    <img
                      src="images/gyul_animals_img-001.jpg"
                      class="img-fluid"
                      alt="Sample image"
                    />
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- End Main Top -->

  <%@ include file="layout/footer.jsp" %>

