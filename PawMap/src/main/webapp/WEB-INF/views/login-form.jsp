<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>


<%@ include file="layout/header.jsp" %>

 

    <!---------------------------------- 로그인 폼 시작 -------------------------->

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


                
                  <!-- submitLoginForm : 아이디 공백 확인을 위한 메소드   -->

                <form
                  action="/pawmap/login"
                  method="post"
                  class="px-5 pb-5 login-form"


                  onsubmit="submitLoginForm(this);return false;"


                >
                  <div class="d-flex">
                    <img
                      src="images/gyul_cat_img_001.jpg"
                      height="22px"
                      width="22px"
                      alt=""
                      class="mr-3 mt-2"
                      style="border-radius: 25px"
                    />
                    <h3 class="font-weight-bold">Log in</h3>
                  </div>
                  <input
                    class="login-input"
                    type="text"
                    name="userId"
                    placeholder="User"
                  />
                  <input
                    class="login-input"
                    name="userPassword"
                    placeholder="Password"
                  />
                  <a
                    href="/pawmap/oauth2/authorization/google"
                    class="login-btn text-white text-weight-bold"
                  >로그인
                  </button>

                  <a
                    href="/pawmap/oauth2/authorization/google"
                    class="login-btn text-white text-weight-bold"
                  >
                    <i class="fab fa-google"></i> 구글 로그인
                  </a>
                  <a
                    href="/pawmap/oauth2/authorization/facebook"
                    class="login-btn text-white text-weight-bold"
                  >
                    <i class="fab fa-facebook"></i> 페이스북 로그인</a
                  >
                  <a
                    href="/pawmap/oauth2/authorization/naver"
                    class="login-btn text-white text-weight-bold"
                  >
                    네이버 로그인
                  </a>
                  <a
                    href="/pawmap/oauth2/authorization/kakao"
                    class="login-btn text-white text-weight-bold"
                  >
                    카카오 로그인
                  </a>
                  <div>


                    <a href="/pawmap/forgotPw" class="btn-other" id="forgot">

                      비밀번호를 잊어버렸습니까?</a
                    >
                  </div>
                  <div>
                    <a href="/pawmap/joinForm" class="btn-other" id="register"
                      >회원가입</a
                    >
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!---------------------------------- 로그인 폼 종료 -------------------------->

  <%@ include file="layout/footer.jsp" %>


