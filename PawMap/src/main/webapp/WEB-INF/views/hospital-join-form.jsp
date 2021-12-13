<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ include file="layout/header.jsp" %>


    <!---------------------------------- 회원가입 폼 -------------------------->
    <section class="vh-100" style="margin-top: 150px;">
      <form lass="mx-1 mx-md-4" action="/pawmap/hospitalJoin" method="post" name="joinForm"
      id="joinForm" onsubmit="submitHJoinForm(this); return false;">
      <div class="u_container">
        <div class="col-lg-12 col-xl-12">
        <h3 class="u_top-title">제휴병원 가입</h3>
            <div class="u_join-box ">
                <table class="u_join-table">
                    <tbody>
                        <tr>
                            <th> 아이디 <span>*</span></th>
                            <td>
                                <div class="u_input-box-tel3">
                                    <input name="userId" required="required" type="text" name="userId"
                                    id="user_id" placeholder="4~1자리 영문,숫자" class="input w130" onkeyup="inputIdCheck();">
                                    <button type="button" class="button u_button-grey"
                                        style="margin-left: 8px; white-space: nowrap;" onclick="fn_idcheck()">
                                        <span style="color: white;">중복확인</span>
                                    </button>
                                    <input id="idDuplication" type="hidden" name="idDuplication" value="idUncheck"> 
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
                            <th> 병원이름 <span>*</span></th>
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
                                    <button type="button" class="button u_button-grey"
                                    style="margin-left: 8px; white-space: nowrap;" onclick="execution_daum_address()">
                                      <span style="color: white;">검색</span></button>
                                  </div>
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
                                placeholder="닉네임" type="text" class="input w220" onkeyup="inputNickCheck();">
                                  <button type="button" class="button u_button-grey" onclick="fn_nickcheck()">
                                      <span style="color: white;" >중복확인</span>
                                  </button>
                                  <input id="nickDuplication" type="hidden" name="nickDuplication" value="nickUncheck"> 
                                  <br>
                                  <p class="result"><span class="msg2">닉네임 중복확인을 해주세요.</span></p>
                              </div>
                          </td>
                      </tr>
                      <tr>
                        <th> 사업자등록번호 <span>*</span></th>
                        <td>
                          <div class="u_input-button"><input name="comNum" id="com_num" placeholder="사업자등록번호"
                            type="tel" class="input w220" onkeyup="inputComCheck();">
                            <button type="button" class="button u_button-grey" onclick="fn_comcheck()">
                              <span style="color: white;">중복확인</span>
                            </button>
                            <input id="comDuplication" type="hidden" name="comDuplication" value="comUncheck">
                            <br>
                            <p class="result"><span class="msg6">사업자등록번호 중복확인을 해주세요.</span></p>
                          </div>
                        </td>
                      </tr>
                    </tbody>
                </table>
                <div class="u_bottom-button"><a class="u_button u_button-grey" href="/pawmap"><span>취소</span></a>
                    <button id="btnJoin" type="submit" class="u_button u_button-point">
                        가입하기
                    </button>
                </div>   
            </div>
          </div>
        </div>
      </form>
      </section>
    <!-- End Main Top -->

    <%@ include file="layout/footer.jsp" %>