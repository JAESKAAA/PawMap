<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


    <%@ include file="layout/header.jsp" %>


        <!--============================
            반려동물 정보 리스트 시작
        ============================-->
        <div style="margin-left:5%">
        <!-- Start 반려동물 관리 타이틀 영역 -->
        <div class="petInfoContainer petboard">
            <div class="">
                <div class="col-lg-12 boardtitle">
                    <h2>반려동물 관리</h2>
                    <hr class="titleline" style="background-color: #EFC778; height: 3px; width: 80%;">
                </div>
            </div>
        </div>
        <!-- End 반려동물 관리 타이틀 영역 -->

        <div class="petInfoContainer">
            <div class="row">
                <div style="margin-top: 70px; border-style: 3px solid orange ">
                    <input type="hidden" class="form-control" id="user_id" name="userId" value=${principal.user.userId}>
                    <input type="hidden" name="boardType" id="board_type" value="p">
                    <input type="hidden" name="boardSeq" id="board_seq" value="getPetSeq">


                    <!-- 반려동물 프로필 -->
                    <div class="petInfoContainer" style="margin-top: -5%; margin-bottom: -3%;">
                        <div class="col-md-12 petprofileList">
                            <c:forEach var="pet" items="${pet}">
                                <div class="petInfo col-md-12 ">
                                    <div class=" petProfile petProfileimg col-md-6">
                                        <c:choose>
                                            <c:when test="${empty pet.originalFileName}">
                                                <div class="petimagebox">
                                                    <img class="petimage"
                                                        src="https://www.treehugger.com/thmb/3ueL3X7pxChDc5bA3_C02y3NV6I=/768x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-1286194137-90a64ebdc61c4078903bdd03621f7529.jpg"
                                                        alt="">
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="petimagebox">
                                                    <img class="img-fluid petimage"
                                                        src="${pageContext.request.contextPath}/upload/${pet.originalFileName}"
                                                        alt="" />
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class=" petProfile col-md-6">
                                        <div class="petProfileText">
                                            <div>번호 : ${pet.petSeq}</div>
                                            <div>펫 이름 : ${pet.name}</div>
                                            <div>펫 성별 : ${pet.gender}</div>
                                            <div>펫 나이 : ${pet.age}</div>
                                            <div>나는 누구? : ${pet.petType}</div>
                                            <div>더 자세하게? :${pet.petTypeDetail}</div>
                                            <div>증상 : ${pet.symptom}</div>
                                            <div class="petProfileBtn">
                                                <button
                                                    onclick="location.href='/pawmap/mypage/updatePetForm?petSeq=${pet.petSeq}'+ '&userId=' + '${principal.user.userId}'"
                                                    type="button" class="u_button-grey">수정</button>
                                                <button id="${pet.petSeq}" type="button" class="u_button-grey"
                                                    onclick="fnDeletePetInfo(this);">삭제</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            </div>

                            <div class="col-md-12 btn_box">
                                <!-- <div class="pet-account-box"> -->
                                <div class="pet-service-box">
                                    <div class="pet-service-icon">
                                        <a href="/pawmap/mypage/newPetInfo?userId=${principal.user.userId}"><i
                                                class="fas fa-paw"></i></a>
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
                if (confirm("삭제하시겠습니까?")) {
                    location.href = '/pawmap/mypage/deletePetInfo?petSeq=' + obj.id + '&userId=' + '${principal.user.userId}';
                } else {
                    return false;
                }
            }

        </script>
        <%@ include file="layout/footer.jsp" %>