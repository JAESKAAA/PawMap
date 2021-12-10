<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ include file="layout/header.jsp" %>

    <!-- Start 마이페이지 타이틀 영역 -->
    <div class="pet-all-title-box" style="padding-top: 200px;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>마이페이지</h2>
                </div>
            </div>
        </div>
    </div>
    <!-- End 마이페이지 타이틀 영역 -->

    <!-- Start 마이페이지 영역  -->
    <div class="my_account-box-main">
        <div class="container">
            <div class="my_account-page">
                <div class="row">
                    <!--회원정보카드-->
                    <div class="col-lg-3 col-md-6">
                        <div class="pet-account-box">
                            <div class="pet-service-box">
                                <div class="pet-service-icon">
                                    <a href="/pawmap/mypage/userInfo?userId=${principal.user.userId}"><i class="fas fa-user-cog"></i></a>
                                </div>
                                <div class="pet-service-desc">
                                    <h4>회원정보수정</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                    
            
                    <c:if test="${principal.user.userType == 'N'}" >
                            <div class="col-lg-3 col-md-6">
                                <div class="pet-account-box">
                                    <div class="pet-service-box">
                                        
                                    <!--반려동물정보카드-->
                                        <div class="pet-service-icon">
                                            <a href="/pawmap/mypage/petInfo?userId=${principal.user.userId}"><i class="fas fa-paw"></i></a>
                                         
                                        </div>
                                        <div class="pet-service-desc">
                                            <h4>반려동물정보</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                       
                            <c:if test="${principal.user.userType == 'H'}">
                            <div class="col-lg-3 col-md-6">
                                <div class="pet-account-box">
                                    <div class="pet-service-box">
                                        
                                    <!--반려동물정보카드-->
                                        <div class="pet-service-icon">
                                            <a href="/pawmap/mypage/vetInfo?hospitalSeq=${principal.user.userSeq}"><i class="fas fa-paw"></i></a>
                                         
                                        </div>
                                        <div class="pet-service-desc">
                                            <h4>수의사정보</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </c:if>
                    <!--예약정보카드-->
                    <c:choose>
                        <c:when test="${empty principal.user.comNum}">
                            <div class="col-lg-3 col-md-6">
                                <div class="pet-account-box">
                                    <div class="pet-service-box">
                                        <div class="pet-service-icon">
                                            <a href="/pawmap/mypage/reservationList?userId=${principal.user.userId}"><i class="fas fa-newspaper"></i></a>
                                        </div>
                                        <div class="pet-service-desc">
                                            <h4>예약확인</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </c:when>
                        <c:otherwise>
                            <div class="col-lg-3 col-md-6">
                                <div class="pet-account-box">
                                    <div class="pet-service-box">
                                        <div class="pet-service-icon">
                                            <a href="/pawmap/reservation/form?comNum=${principal.user.comNum}"><i class="fas fa-newspaper"></i></a>
                                        </div>
                                        <div class="pet-service-desc">
                                            <h4>예약 및 스케쥴 관리</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
    <!-- End 마이페이지 영역 -->
<%@ include file="layout/footer.jsp" %>


</html>