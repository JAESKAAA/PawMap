<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<!-- ===========================================
            수의사 추가 입력폼 영역 시작 
=================================================-->
<div class="petAddBox">
    <!-- Start 반려동물 추가 타이틀 영역 -->
        <div class="petInfoContainer">
            <div class="row">
                <div class="col-lg-12 boardtitle">
                    <h2>수의사 추가</h2>
                </div>
                <hr class="titleline" style="background-color: #EFC778; height: 3px; width: 80%;">
            </div>
        </div>
    <!-- End 반려동물 추가 타이틀 영역 -->

    <!-- Start 반려동물 추가 영역 -->
    <form class="form"
         action="/pawmap/mypage/insertVetInfo" 
         method="post" 
         id="insertVetInfo"
         enctype="multipart/form-data">
            <div class="container bootstrap snippet" style="padding: 50px;">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="text-center">
                            <img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail"
                                alt="avatar" />
                            <input type="file" class="form-control text-center center-block file-upload" name="uploadFiles" multiple="multiple" />
                        </div>
                        </hr><br>
                    </div>
                    <!-- 사용자 아이디 히든으로 넣어주기  -->
                    <!-- <div class="form-group ml-5 ">
                        <div class="col-sm-10">
                            <input type="hidden" class="form-control" id="user_id" name="userId" value="${user.userId}" >
                        </div>
                    </div> -->

                    <!-- 반려동물 정보 입력 폼 -->
                    
                    <div class="col-m-12">
                        <div class="tab-content">
                            <div class="tab-pane active">
                                <div class="form-group">
                                    <div class="col-lg-12">
                                        <label for="name">이름</label>
                                        <input type="text" class="petaddinput" name="vetName" id="name">
                                        <input type="hidden" class="petaddinput" id="hospital_seq" name="userId" value="${principal.user.userId}" >
                                    </div>
                                </div>
                                <br>
                                <div class="form-group">
                                    <div class="col-xs-6">
                                        <label for="kind">전공</label>
                                        <input type="text" class="petaddinput" name="vetMajor" id="kind">
                                    </div>
                                </div>
                                <br>
                                <div class="form-group">
                                    <div class="col-xs-6">
                                        <label for="age">소개</label>
                                        <input type="text" class="petaddinput" name="vetIntro" id="age">
                                    </div>
                                </div>
                                <br>
                                
                                <br>
                                <!-- 저장 및 재작성 버튼-->
                                <div class="button-group" style="padding: 5px;">
                                    <div class="col-xs-12">
                                        <br>
                                        <button class="btnsave" type="submit">저장</button>
                                        <button class="btnrewrite" type="reset">다시작성</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </form>
</div>
    
    <!-- End 반려동물 추가 영역 -->

    <!-- Start footer 영역-->
    <%@ include file="../layout/footer.jsp" %>
    <!-- End footer 영역-->

    <!--스크롤 업 버튼-->
    <a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>
   
</body>
</html>

   