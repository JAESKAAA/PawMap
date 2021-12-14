<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


    <%@ include file="layout/header.jsp" %>


        <!--============================
            수의사 정보 리스트 시작
        ============================-->
     
        <!-- Start 수의사 관리 타이틀 영역 -->
            <div class="petInfoContainer" style="margin-top:150px; margin-left:10%;">
                <div class="row">
                    <div class="col-lg-12 boardtitle">
                        <h2>수의사 관리</h2>
                        <hr class="titleline" style="background-color: #EFC778; height: 3px; width: 80%;">
                    </div>
                </div>
            </div>
        <!-- End 수의사 관리 타이틀 영역 -->

        <div class="petInfoContainer" style="margin: auto; margin-top: 3rem;">
            <div class="row">
                <div style="margin-top: 40px; border-style: 3px solid orange ">
                    <!-- 수의사 프로필 -->
                    <div class="petInfoContainer" style="margin-top: -5%; margin-bottom: -3%;">

                        <div class="col-md-12 petprofileList">
                            <!-- <c:forEach var="vet" items="${vetInfoFileList}"> -->

                            <!-- </c:forEach> -->
                            <c:forEach var="vet" items="${vet}" varStatus="status">
                                <div class="vetInfoList col-md-12 ">
                                    <div class=" petProfile petProfileimg col-md-6">
                                        <c:choose>
                                            <c:when test="${empty vet.originalFileName}">
                                                <div class="petimagebox">
                                                    <img class="petimage"
                                                    src="https://w.namu.la/s/af5c00561066a74035b862599500576f820565395078c098f7100850b07bc3875558b35bcb9013bb62f3a0fcfc0af2a95a4da1dfb4aacffb97ef28d0d1d9f70f1de0bb4a8c23381c4c8b91e2dbf207fff13a9eb93d29949c05de2b5a590a0fe3"
                                                    alt="">
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="petimagebox">
                                                    <img class="petimage"
                                                    src="${pageContext.request.contextPath}/upload/${vet.originalFileName}"
                                                    alt="" />
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class=" petProfile col-md-6">
                                        <div class="petProfileText">
                                            <div>${vet.vetSeq}</div>
                                            <div>${vet.vetName}</div>
                                            <div>${vet.vetMajor}</div>
                                            <div>${vet.vetIntro}</div>
                                            <div class="petProfileBtn" style="margin-top: 18%;">
                                                <button onclick="location.href='/pawmap/mypage/updateVetForm?vetSeq=${vet.vetSeq}'+ '&hospitalSeq=' + '${hospital.hospitalSeq}'+'&userId='+'${principal.user.userId}'"
                                                type="button" class="u_button-grey">수정</button>
                                                <button id="${vet.vetSeq}" type="button" class="u_button-grey"
                                                onclick="fnDeleteVetInfo(this);">삭제</button>
                                                <input type="hidden" value="${vet.vetSeq }"
                                                id="vetSeqValue${status.index }" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                            <div class="col-md-12 btn_box">
                                <!-- <div class="vet-account-box"> -->
                                    <div class="pet-service-box">
                                        <div class="pet-service-icon">
                                            <a href="/pawmap/mypage/newVetInfo?userId=${principal.user.userId}"><i
                                                    class="fas fa-paw"></i></a>
                                        </div>
                                        <div class="vet-service-desc">
                                            <h4>수의사추가</h4>
                                        </div>
                                    </div>
                                </div>
                            </div><!----> 
                        </div>
                    </div>
                </div>
            </div>


            <script>
                function fnDeleteVetInfo(obj) {
                    let value = obj.id;
                    console.log(value);
                    let vetSeq = $("#vetSeqValue").val();

                    if (confirm("삭제하시겠습니까?")) {
                        location.href = '/pawmap/mypage/deleteVetInfo?vetSeq=' + value + '&hospitalSeq=' + '${hospital.hospitalSeq}' + '&userId=' + '${principal.user.userId}';

                    } else {
                        return false;
                    }
                }

            </script>
            <%@ include file="layout/footer.jsp" %>