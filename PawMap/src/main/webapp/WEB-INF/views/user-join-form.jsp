<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ include file="layout/header.jsp" %>

    <!---------------------------------- 회원가입 폼 -------------------------->
    <!-- <section class="vh-100" >
      <div class="container h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
          <div class="col-lg-8 col-xl-8">
            <div class="card text-black" style="border-radius: 25px">
              <div class="card-body p-md-7">
                <div class="row justify-content-center">
                  <div class="col-lg-10 col-xl-10">
                    <p class="text-center h3 fw-bold mb-5 mx-1 mx-md-4 mt-4" style="font-size: 25px;">
                      일반회원 가입
                    </p>
                    <form class="mx-1 mx-md-4" action="/pawmap/join" method="post" name="joinForm" id="joinForm"
                    onsubmit="submitJoinForm(this); return false;">
                      <div class="join-form">
                      <div class="d-flex flex-row align-items-center mb-4">
                        <div class="form-outline flex-fill mb-0">
                          <div class="user-column-div">
                            <div>
                              <label class="user-form-label mt-2" for="user_id"
                                >회원 아이디*</label
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
                          />(4자~12자)
                        </div>
                        <button type="button" onclick="fn_idcheck()">중복체크</button>
                        <p class="result"><span class="msg1">아이디를 확인해주세요.</span></p>
                      </div>
                      <div class="d-flex flex-row align-items-center mb-4">
                        <div class="form-outline flex-fill mb-0">
                          <div class="user-column-div">
                            <div>
                              <label class="user-form-label mt-2" for="user_password"
                                >비밀번호*</label
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
                                >이름*</label
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
                                >이메일*</label
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
                                >전화번호*</label
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
                        <div>
                          <label class="user-form-label mt-2" for="user_tel_num">주소</label>
                        </div>
                        <div class="address_input_1_wrap">
                          <div class="address_input_1_box">
                            <input class="address_input_1" name="postNum" readonly="readonly">
                          </div>
                            <button type="button" class="address_button" onclick="execution_daum_address()">주소찾기</button>
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
                                >닉네임*</label
                              >
                            </div>
                          </div>
                          <input
                            type="text"
                            name="userNickname"
                            id="user_nickname"
                            class="form-control"
                            placeholder="닉네임"
                            required
                          />
                          <button type="button" onclick="fn_nickcheck()">중복체크</button>
                          <p class="result"><span class="msg2">닉네임을 확인해주세요.</span></p>
                        </div>
                      </div>
                      <div
                        class="d-flex justify-content-center mx-4 mb-3 mb-lg-4"
                      >
                        <button
                          type="button"
                          class="btn btn-primary btn-lg user-join-btn"
                          id="btnJoin"
                          onclick="join();"
                        >
                          회원가입
                        </button>
                      </div>
                    </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section> -->

    <section class="vh-100" >
    <form class="mx-1 mx-md-4" action="/pawmap/join" method="post" name="joinForm" id="joinForm"
    onsubmit="submitJoinForm(this); return false;">
    <div class="u_container">
      <div class="col-lg-12 col-xl-12">
      <h3 class="u_top-title">일반회원 가입</h3>
          <div class="u_join-box ">
              <table class="u_join-table">
                  <tbody>
                      <tr>
                          <th> 아이디 <span>*</span></th>
                          <td>
                              <div class="u_input-box-tel3">
                                  <input name="userId" required="required" type="text" name="userId"
                                  id="user_id" placeholder="4~1자리 영문,숫자" class="input w130">
                                  <button type="button" class="button u_button-grey"
                                      style="margin-left: 8px; white-space: nowrap;" onclick="fn_idcheck()">
                                      <span style="color: white;">중복확인</span>
                                  </button>
                                  <br>
                                  <p class="result"><span class="msg1">아이디 중복확인을 해주세요.</span></p>
                              </div>
                          </td>
                      </tr>
                      <tr>
                          <th> 비밀번호 <span>*</span></th>
                          <td><input required="required" type="password"
                            name="userPassword" id="userPassword" placeholder="8~20자리 영문,숫자,특수문자" 
                            class="input w130"></td>
                      </tr>
                      <tr>
                          <th> 이름 <span>*</span></th>
                          <td>
                              <div class="u_input-button">
                                  <input required="required" type="text" maxlength="320" 
                                  name="userName" id="user_name" class="input w220">
                              </div>
                          </td>
                      </tr>
                      <tr>
                          <th> 이메일 <span>*</span></th>
                          <td>
                              <div class="u_input-button">
                                  <input required="required" type="email" maxlength="320" 
                                  name="userEmail" id="user_email" class="input w220" placeholder="ex) abc@mail.com">
                              </div>
                          </td>
                      </tr>
                      <tr>
                        <th> 전화번호 <span>*</span></th>
                        <td>
                            <div class="u_input-button">
                                <input required="required" name="userTelNum" id="user_tel_num" 
                                type="tel" maxlength="320" class="input w220" placeholder="'-' 를 빼고 입력해 주세요">
                            </div>
                        </td>
                    </tr>
                      <tr>
                          <th>주소</th>
                          <td>
                            <div class="u_input-box-address">
                              <div class="address_input_1_wrap">
                                <div class="address_input_1_box">
                                  <input class="address_input_1 input w40" name="postNum" readonly="readonly" maxlength="5" placeholder="우편번호">
                                </div>
                                  <button type="button" class="address_button u_button-grey" onclick="execution_daum_address()">
                                    <span style="color: white;">검색</span></button>
                                <div class="clearfix"></div>
                              </div>
                              <div class ="address_input_2_wrap">
                                <div class="address_input_2_box">
                                  <input class="address_input_2" name="address" maxlength="80" readonly="readonly" placeholder="기본주소">
                                </div>
                              </div>
                              <div class ="address_input_3_wrap">
                                <div class="address_input_3_box">
                                  <input class="address_input_3" name="addressDetail" maxlength="80" readonly="readonly" placeholder="상세주소">
                                </div>
                              </div>
                            </div>
                          </td>
                      </tr>
                      <tr>
                        <th> 닉네임 <span>*</span></th>
                        <td>
                            <div class="u_input-button"><input name="userNickname" id="user_nickname" 
                              placeholder="닉네임" type="text" class="input w220">
                                <button type="button" class="button u_button-grey" onclick="fn_nickcheck()">
                                    <span style="color: white;" >중복확인</span>
                                </button>
                                <br>
                                <p class="result"><span class="msg2">닉네임 중복확인을 해주세요.</span></p>
                            </div>
                        </td>
                    </tr>
                  </tbody>
              </table>
              <!-- <div class="u_join_input_cont">
                  <table width="100%" border="0" cellpadding="0" cellspacing="0"></table>
              </div> -->
              <div class="u_bottom-button"><a class="u_button u_button-grey"><span>취소</span></a>
                  <button id="btnJoin" type="submit" class="u_button u_button-point">
                     <span> 가입하기</span>
                  </button>
              </div>	
          </div>
        </div>
      </div>
    </form>
    </section>
    <!-- End Main Top -->

  <%@ include file="layout/footer.jsp" %>

