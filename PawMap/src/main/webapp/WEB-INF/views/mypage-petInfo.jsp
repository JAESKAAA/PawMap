<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>


<%@ include file="layout/header.jsp" %>


   <!--search button finished...-->
    <!--반려동물 정보 리스트 시작-->

    <!-- Start 반려동물 관리 타이틀 영역 -->
    <div class="pet-all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>반려동물 관리</h2>
                </div>
            </div>
        </div>
    </div>
    <!-- End 반려동물 관리 타이틀 영역 -->
    
    <div class="container">
        <div class="row">
            <div style="margin-top: 40px; border-style: 3px solid orange ">
                <input type="hidden" class="form-control" id="user_id" name="userId" value=${principal.user.userId} >
                <input type="hidden" name="boardType" id="board_type" value="p">
                <input type="hidden" name="boardSeq" id="board_seq" value="getPetSeq">

                 <!-- 반려동물 프로필 -->
                <div class="container" style="margin-top: -5%; margin-bottom: -3%;">
                  
                    <!-- <div class="profile-sidebar"> -->
                        <!-- SIDEBAR USERPIC -->
                        
                    
                        <div class="col-md-12 profileList" >
                            <!-- <c:forEach var="pet" items="${petInfoFileList}"> -->
                
                            <!-- </c:forEach> -->
                            <c:forEach var="pet" items="${pet}">
                                <div class="petInfoList col-md-12 ">
                                    <div class=" petProfile col-md-4">
                                        <div class="petProfileText">
                                            <div>${pet.petSeq}</div>
                                            <div>${pet.name}</div>
                                            <div>${pet.gender}</div>
                                            <div>${pet.age}</div>
                                            <div>${pet.petType}</div>
                                            <div>${pet.petTypeDetail}</div>
                                            <div>${pet.symptom}</div>
                                        </div>
                                    </div>
                                   <div class=" petProfile petProfileimg col-md-4" >
                                        <c:choose>
                                            <c:when test="${empty petInfoFileList}">
                                                <img class="petimage" src="https://www.treehugger.com/thmb/3ueL3X7pxChDc5bA3_C02y3NV6I=/768x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-1286194137-90a64ebdc61c4078903bdd03621f7529.jpg"  alt="" >
                                            </c:when>
                                            <c:otherwise>
                                            <c:forEach items="${petInfoFileList}" var="fileList" varStatus="i">
                                                <img class="img-fluid petimage" src="${pageContext.request.contextPath}/upload/${fileList.originalFileName}" alt="" />
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                    </div>
                                    <div class=" petProfile col-md-4">

                                        <div class="petProfileBtn"><button onclick="location.href='/pawmap/mypage/updatePetForm?petSeq=${pet.petSeq}'+ '&userId=' + '${principal.user.userId}'" type="button" class="">수정</button>
                                            <!-- <button id="delete-petInfo" type="button" class="">삭제</button> -->
                                       
                                        <button id="${pet.petSeq}" type="button" onclick="fnDeletePetInfo(this);">삭제</button> 
                                      
                                    </div>
                                    </div>
                                    
                                </div>
                               </c:forEach>

                               <!-- <div class=" col-md-12 btn_box">
                                   <button 
                                       type="button" 
                                       class="btn_image" 
                                       id="img_btn" 
                                       onclick="location.href='/pawmap/mypage/newPetInfo'"
                                   >
                                   <img style="z-index: 0; "src="https://koenig-media.raywenderlich.com/upload/2014/12/1-AddButtonFinal.png" class="btn_image" >
                                   <p style="z-index: 100;">반려동물 추가</p>
                                       </button>
                                </div> -->
                                <div class="col-md-12 btn_box">
                                    
                                    <div class="pet-account-box">
                                        <div class="pet-service-box">
                                            <div class="pet-service-icon">
                                                <a href="/pawmap/mypage/newPetInfo?userId=${principal.user.userId}"><i class="fas fa-paw"></i></a>
                                            </div>
                                            <div class="pet-service-desc">
                                                <h4>반려동물추가</h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            
                        
                            </div>
                            
                            
                            </div>
                      
             
    

            
        </div>
    </div>
    <script>
        function fnDeletePetInfo(obj) {
            if(confirm("삭제하시겠습니까?")) {
                location.href='/pawmap/mypage/deletePetInfo?petSeq=' + obj.id + '&userId=' + '${principal.user.userId}';
            } else {
                return false;
            }
        }
        
    </script>
    <%@ include file="layout/footer.jsp" %>


