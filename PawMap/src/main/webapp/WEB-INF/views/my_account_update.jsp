<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="layout/header.jsp" %>

<!-- Start 회원정보 타이틀 영역 -->
<div class="pet-all-title-box">
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <h2>회원정보</h2>
      </div>
    </div>
  </div>
</div>
<!-- End 회원정보 타이틀 영역 -->

<!-- Start 회원정보 영역-->
<div class="container" style="margin-top: 5%; width: 50%">
  <div class="input-form-backgroud row">
    <div class="input-form col-md-12 mx-auto">
      <form
        class="validation-form"
        method="post"
        action="/pawmap/mypage/updateUser"
        novalidate
      >
        <div class="mb-3">
          <label for="name">이름</label>
          <input
            type="text"
            class="form-control"
            id="name"
            name="userName"
            value="${principal.user.userName }"
            placeholder="이름입력"
            readonly
          />
        </div>
        <div class="mb-3">
          <label for="customer-id">아이디</label>
          <input
            type="text"
            class="form-control"
            id="customer-id"
            name="userId"
            value="${principal.user.userId }"
            placeholder="아이디입력"
            readonly
          />
        </div>
        <div class="mb-3">
          <label for="password">비밀번호</label>
          <input
            type="password"
            class="form-control"
            id="password"
            name="userPassword"
            placeholder="패스워드입력"
            maxlength="30"
            required
          />
          <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
        </div>
        <div class="mb-3">
          <label for="password">비밀번호 확인</label>
          <input
            type="password"
            class="form-control"
            id="password"
            placeholder="비밀번호 재입력"
            maxlength="12"
            required
          />
          <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
        </div>
        <div class="mb-3">
          <label for="nickname" style="width: 100%">닉네임</label>
          <input
            type="text"
            style="display: inline-block; width: 70%"
            name="userNickname"
            class="form-control"
            id="user_nickname"
            value="${user.userNickname }"
          />
          <button type="button" onclick="fn_mnickcheck()">중복체크</button>
        </div>
        <div class="mb-3">
          <label for="phone">연락처</label>
          <input
            type="phone"
            class="form-control"
            id="phone"
            name="userTelNum"
            placeholder="연락처입력"
            value="${user.userTelNum }"
            required
          />
        </div>
        <div class="mb-3">
          <label for="email" style="width: 100%">이메일</label>
          <input
            type="email"
            style="display: inline-block; width: 70%"
            class="form-control"
            name="userEmail"
            id="user_email"
            value="${user.userEmail }"
            required
          />
          <button type="button" onclick="fn_emailcheck()">중복체크</button>
        </div>
        <div class="mb-3">
          <label for="address">주소</label>
          <input
            type="text"
            class="form-control"
            id="address"
            name="address"
            value="${user.address }"
            required
          />
        </div>
        <hr class="mb-4" />
        <div class="mb-4">
          <button class="btn btn-lg btn-success" type="submit">수정</button>
          <button
            class="btn btn-lg btn-success"
            onclick="history.go(-1);return false;"
          >
            취소
          </button>
        </div>
      </form>
      <button class="btn btn-lg btn-success mt-3" onclick="deleteUserCheck()" >
        회원탈퇴
      </button>
    </div>
  </div>
</div>

<%@ include file="layout/footer.jsp" %>
