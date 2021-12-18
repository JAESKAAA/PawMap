<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ include file="../layout/header.jsp" %>

<style>
  span{
    padding: 20px;
  }
</style>
<!-- Start 회원정보 타이틀 영역 -->
<div class="u_container" style="margin-top: 150px;">
    <div class="col-lg-12">
          <h2 class="u_top-title">회원 정보 수정</h2>
        
    
  <!-- End 회원정보 타이틀 영역 -->

  <!-- Start 회원정보 영역-->
  <div class="container" style="margin-top: 5%; width: 50%">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto u_join-box">
        <form
          class="validation-form"
          method="post"
          action="/pawmap/mypage/updateUser"
          novalidate
          enctype="multipart/form-data"
        >
          <div class="mb-3">
            <label for="name">이름</label>
            <input
              type="text"
              class="uptxtbox"
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
              class="uptxtbox"
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
              class="uptxtbox"
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
              class="uptxtbox"
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
              class="uptxtbox"
              id="user_nickname"
              value="${user.userNickname }"
            />
            <button type="button" class="btn-file-upload" onclick="fn_mnickcheck()">중복체크</button>
            <p class="result"><span class="msg3" >닉네임을 확인해주세요.</span></p>
          </div>
          <div class="mb-3">
            <label for="phone">연락처</label>
            <input
              type="phone"
              class="uptxtbox"
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
              class="uptxtbox"
              name="userEmail"
              id="user_email"
              value="${user.userEmail }"
              required
            />
            <button type="button" class="btn-file-upload" onclick="fn_emailcheck()">중복체크</button>
            <p class="result"><span class="msg4">이메일을 확인해주세요.</span></p>
          </div>
          <div class="mb-3">
            <label for="address">주소</label>
            <input
              type="text"
              class="uptxtbox"
              id="address"
              name="address"
              value="${user.address }"
              required
            />
          </div>
          <c:choose>
            <c:when test="${empty user.userProfile}">
              <div class="mb-3">
                <label for="profile">프로필 사진 등록</label>
                <div class="control-group">  
                    <div class="controls">  
                        <div class="entry input-group upload-input-group">  
                            <input type="hidden" name="userSeq" value="${principal.user.userSeq}">
                            <input type="hidden" name="userType" value="${principal.user.userType}">
                            <input class="uptxtbox btn-file-upload" name="uploadFiles" multiple="multiple" type="file">  
                        </div>  
                    </div>  
                </div>  
              </div>
            </c:when>
          </c:choose>
          <hr class="mb-4" />
          <div class="mb-4">
            <button class="btn" id="upbtnN" type="submit" 
                  style="width: 45%;"
                  >수정
                </button>
            <button
              class="btn" id="upbtnN"
              onclick="history.go(-1);return false;"
              style="width: 45%;"
                >취소
                </button>
            </div>
          </form>
          <div class="mb-4">
            <button class="btn" id="upbtnN" style="width: 90%;" onclick="deleteUserCheck()" 
              >회원탈퇴
              </button>
        </div>
        <hr class="mb-4" />
     
      <c:choose>
          <c:when test="${!empty user.userProfile}">
            <form action="deleteProfile" method="POST">  
                <label for="profile">프로필 사진 삭제</label>
                <div class="control-group" id="fields">  
                  <div class="controls">  
                    <div class="entry input-group upload-input-group">  
                      <img class="img-fluid avatar img-circle img-thumbnail" src="${pageContext.request.contextPath}/upload/${user.userProfile}" alt="">
                      <h5>${principal.user.userProfile}</h5> 
                      <input type="hidden" name="userSeq" value="${principal.user.userSeq}">
                      <input type="hidden" name="userType" value="${principal.user.userType}">
                      <input type="hidden" name="userId" value="${principal.user.userId}">
                    </div>  
                    <div class="entry input-group upload-input-group">  
                      <button type="submit" id="upbtnW" class="btn btn-outline-danger">파일삭제</button>
                   	 </div>  
                  	</div>  
                  </div>
            </form>
            </c:when>
          </c:choose>
       
        <br />
      </div>
    </div>
  </div>

    <%@ include file="../layout/footer.jsp" %>