<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="layout/header.jsp" %>

    <!-- Start 반려동물 추가 타이틀 영역 -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>반려동물 수정</h2>
                </div>
            </div>
        </div>
    </div>
    <!-- End 반려동물 추가 타이틀 영역 -->

    <!-- Start 반려동물 추가 영역 -->
    <div class="container bootstrap snip" style="padding: 50px;">
        <div class="row">
            <div class="col-sm-3">
                <div class="text-center">
                    <img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail"
                        alt="avatar">
                    <input type="file" class="text-center center-block file-upload">
                </div>
                </hr><br>
            </div>
            <div class="col-sm-9">
                <div class="tab-content">
                    <div class="tab-pane active">
                        <form 
                        class="form" 
                        action="/pawmap/mypage/updateVetInfo" 
                        method="post" 
                        id="updateForm"
                        >

                        <div class="form-group">
                            <div class="col-lg-12">
                                <label for="name">이름</label>
                                <input type="text" class="form-control" name="vetName" id="vetName" value="${vet.vetName}">
                                <input type="hidden" class="form-control" id="user_id" name="userId" value="${principal.user.userId}" >
                                <input type="hidden" class="form-control" id="vet_hospital_seq" name="hospitalSeq" value="${principal.user.userSeq}" >
                                <input type="hidden" class="form-control" id="vet_seq" name="vetSeq" value="${vet.vetSeq}" >

                            </div>
                        </div>
                        <br>
                        <div class="form-group">
                            <div class="col-xs-6">
                                <label for="kind">전공</label>
                                <input type="text" class="form-control" name="vetMajor" id="vetMajor" value="${vet.vetMajor}">
                            </div>
                        </div>
                        <br>
                        <div class="form-group">
                            <div class="col-xs-6">
                                <label for="age">소개</label>
                                <input type="text" class="form-control" name="vetIntro" id="vetIntro" value="${vet.vetIntro}">
                            </div>
                        </div>
                        <br>
                           

                            <!-- 저장 및 재작성 버튼-->
                            <div class="form-group" style="padding: 5px;">
                                <div class="col-xs-12">
                                    <br>
                                    <button class="btn btn-lg btn-success" type="submit"><i
                                            class="glyphicon glyphicon-ok-sign"></i> 저장</button>
                                    
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    <!-- End 반려동물 추가 영역 -->

    <!-- Start footer 영역-->

    <!-- End footer 영역-->

    <!--스크롤 업 버튼-->
    <a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>


    <!-- Start Footer  -->
    <%@ include file="layout/footer.jsp" %>

    <!-- End Footer  -->

    <!--스크롤 업 버튼-->
    <a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

    </body>
    </html>
   