<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>


<%@ include file="layout/header.jsp" %>


   <!--search button finished...-->
    <!--반려동물 정보 리스트 시작-->

    <!-- Start 반려동물 관리 타이틀 영역 -->
    <div class="vet-all-title-box">
        <div class="petInfoContainer">
            <div class="row">
                <div class="col-lg-12">
                    <h2>수의사 관리</h2>
                </div>
            </div>
        </div>
    </div>
    <!-- End 반려동물 관리 타이틀 영역 -->
    
    <div class="petInfoContainer">
        <div class="row">
            <div style="margin-top: 40px; border-style: 3px solid orange ">
                <input type="hidden" class="form-control" id="hospital_seq" name="hospitalSeq" value="{principal.user.userSeq}" >
                 <!-- 반려동물 프로필 -->
                <div class="petInfoContainer" style="margin-top: -5%; margin-bottom: -3%;">
                  
                    <!-- <div class="profile-sidebar"> -->
                        <!-- SIDEBAR USERPIC -->
                        
                    
                        <div class="col-md-12 profileList" >
                            <!-- <c:forEach var="vet" items="${vetInfoFileList}"> -->
                
                            <!-- </c:forEach> -->
                            <c:forEach var="vet" items="${vet}">
                                <div class="vetInfoList col-md-12 ">
                                    <div class=" vetProfile col-md-4">
                                        <div class="vetProfileText">
                                            <div>${vet.vetSeq}</div>
                                            <div>${vet.vetName}</div>
                                            <div>${vet.vetMajor}</div>
                                            <div>${vet.vetIntro}</div>
                                        </div>
                                    </div>
                                   <div class=" vetProfile vetProfileimg col-md-4">
                                        <c:choose>
                                            <c:when test="${empty vetInfoFileList}">
                                                <img class="vetimage" src="https://w.namu.la/s/af5c00561066a74035b862599500576f820565395078c098f7100850b07bc3875558b35bcb9013bb62f3a0fcfc0af2a95a4da1dfb4aacffb97ef28d0d1d9f70f1de0bb4a8c23381c4c8b91e2dbf207fff13a9eb93d29949c05de2b5a590a0fe3"  alt="" >
                                            </c:when>
                                            <c:otherwise>
                                            <c:forEach items="${vetInfoFileList}" varStatus="i">
                                                <img class="vetImg" src="${pageContext.request.contextPath}/upload/${fileList.originalFileName}" alt="" />
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>




                                    </div>
                                    <div class=" vetProfile col-md-4">

                                    <div class="vetProfileBtn"><button onclick="location.href='/pawmap/mypage/updateVetForm?vetSeq=${vet.vetSeq}'+ '&hospitalSeq=' + '${principal.user.userSeq}'" type="button" class="">수정</button>
                                        <!-- <button id="delete-vetInfo" type="button" class="">삭제</button> -->
                                        <button id="${vet.vetSeq}" type="button" onclick="fnDeleteVetInfo(this);">삭제</button>
                                    </div>
                                    </div>
                                    
                                </div>
                               </c:forEach>

                               <!-- <div class=" col-md-12 btn_box">
                                   <button 
                                       type="button" 
                                       class="btn_image" 
                                       id="img_btn" 
                                       onclick="location.href='/pawmap/mypage/newvetInfo'"
                                   >
                                   <img style="z-index: 0; "src="https://koenig-media.raywenderlich.com/upload/2014/12/1-AddButtonFinal.png" class="btn_image" >
                                   <p style="z-index: 100;">반려동물 추가</p>
                                       </button>
                                </div> -->
                                <div class="col-md-12 btn_box">
                                    
                                    <div class="vet-account-box">
                                        <div class="vet-service-box">
                                            <div class="vet-service-icon">
                                                <a href="/pawmap/mypage/newVetInfo?hospitalSeq=${principal.user.userSeq}"><i class="fas fa-paw"></i></a>
                                            </div>
                                            <div class="vet-service-desc">
                                                <h4>수의사추가</h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            
                        
                            </div>
                            
                            
                            </div>
                      
             
    

            
        </div>
    </div>
    <script>
        function fnDeleteVetInfo(obj) {
            if(confirm("삭제하시겠습니까?")) {
                location.href='/pawmap/mypage/deleteVetInfo?vetSeq=' + obj.id+ '&hospitalSeq=' + '${principal.user.userSeq}';
            } else {
                return false;
            }
        }
        
    </script>
    <%@ include file="layout/footer.jsp" %>


