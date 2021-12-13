<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ include file="layout/header.jsp" %>

  <!-- Start 회원정보 타이틀 영역 -->
  <div class="u_container" style="margin-top: 150px;">
    <div class="col-lg-12">
      <h2 class="u_top-title">회원 정보 수정</h2>
      <!-- End 회원정보 타이틀 영역 -->
      <!-- Start 회원정보 영역-->
      <div class="container" style="margin-top: 5%; width: 50%">
        <div class="input-form-backgroud row">
          <div class="input-form col-md-12 mx-auto u_join-box">
            <form class="validation-form" method="post" action="/pawmap/mypage/updateUser" novalidate
              enctype="multipart/form-data">
              <div class="mb-3">
                <label for="name">이름</label>
                <input type="text" class="uptxtbox" id="name" name="userName" value="${principal.user.userName }"
                  disabled />
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
            <div class="mb-4">
              <button class="btn" id="upbtnN" style="width: 90%;" onclick="deleteUserCheck()" 
                >회원탈퇴
                </button>
          </div>
        </form>
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

    <%@ include file="layout/footer.jsp" %>