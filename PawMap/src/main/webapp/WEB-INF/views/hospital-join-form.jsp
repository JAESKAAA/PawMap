<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ include file="layout/header.jsp" %>


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
                      user-left-div
                    "
                  >
                    <p class="text-center h3 fw-bold mb-5 mx-1 mx-md-4 mt-4">
                      제휴 병원 회원가입
                    </p>

                    <form
                      class="mx-1 mx-md-4"
                      action="/pawmap/hospitalJoin"
                      method="post"
                      name="joinForm"
                      onsubmit="submitJoinForm(this); return false;"
                    >
                      <div class="d-flex flex-row align-items-center mb-4">
                        <div class="form-outline flex-fill mb-0">
                          <div class="user-column-div">
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
                        <button type="button" onclick="fn_idcheck()">중복체크</button>
                      </div>

                      <div class="d-flex flex-row align-items-center mb-4">
                        <div class="form-outline flex-fill mb-0">
                          <div class="user-column-div">
                            <div>
                              <label class="user-form-label mt-2" for="user_password"
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
                          <div class="user-column-div">
                            <div>
                              <label class="user-form-label mt-2" for="user_name"
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
                          <div class="user-column-div">
                            <div>
                              <label class="user-form-label mt-2" for="user_email"
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
                          <div class="user-column-div">
                            <div>
                              <label class="user-form-label mt-2" for="user_tel_num"
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
                      <div class="address_wrap">
                        <div class="address_name">주소</div>
                        <div class="address_input_1_wrap">
                          <div class="address_input_1_box">
                            <input class="address_input_1" name="postNum" readonly="readonly">
                          </div>
                            <button class="address_button" onclick="execution_daum_address()">주소찾기</button>
                          <div class="clearfix"></div>
                        </div>
                        <div class ="address_input_2_wrap">
                          <div class="address_input_2_box">
                            <input class="address_input_2" name="address" readonly="readonly">
                          </div>
                        </div>
                        <div class ="address_input_3_wrap">
                          <div class="address_input_3_box">
                            <input class="address_input_3" name="addressDetail" readonly="readonly">
                          </div>
                        </div>
                      </div>
                      <div class="d-flex flex-row align-items-center mb-4">
                        <div class="form-outline flex-fill mb-0">
                          <div class="user-column-div">
                            <div>
                              <label class="user-form-label mt-2" for="user_nickname"
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
                      <button type="button" onclick="fn_nickcheck()">중복체크</button>
                      <div class="d-flex flex-row align-items-center mb-4">
                        <div class="form-outline flex-fill mb-0">
                          <div class="user-column-div">
                            <div>
                              <label class="user-form-label mt-2" for="comNum"
                                >사업자등록번호</label
                              >
                            </div>
                          </div>
                          <input
                            type="tel"
                            name="comNum"
                            id="user_nickname"
                            class="form-control"
                            placeholder="사업자등록번호"
                            required
                          />
                        </div>
                      </div>

                      <div
                        class="d-flex justify-content-center mx-4 mb-3 mb-lg-4"
                      >
                        <button
                          type="submit"
                          class="btn btn-primary btn-lg user-join-btn"
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
