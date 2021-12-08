<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ include file="layout/header.jsp" %>



<style>
    table, th, td { 
        border:1px solid gray;  /* 표의 테두리 - 1px 회색 실선 */
        border-collapse:collapse;  /* 표 테두리와 셀 테두리 합치기 */

    }
    th, td {
        width:150px;  /* 셀 너비 */
        padding:5px;  /* 셀 패딩(테두리와 내용 사이의 여백) */
    }

    #test-span {
        width: 350px;
        color: #eb8f1f;
    }
    th {
        color: #eb8f1f;
    }
    .all-title-box{
        background-image: none;
    }
</style>
<!-- <script>
    var today = new Date();

    var year = today.getFullYear();
    var month = ('0' + (today.getMonth() + 1)).slice(-2);
    var day = ('0' + today.getDate()).slice(-2);

    var dateString = year + '' + month  + '' + day;
    console.log(dateString);
</script> -->


    </header>
    <!-- End Main Top -->

    <!-- Start 예약조회 타이틀 영역 -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>예약조회</h2>
                    <!-- <hr>
                    <h2>로그인 유저 아아디 ${principal.user.userId}</h2>
                    <h2>로그인 유저 닉네임 ${principal.user.userNickname}</h2>
                    <h3>조인으로 가져온 정보 ${myResList}</h3> -->
                </div>
            </div>
        </div>
    </div>
    <!-- End 예약조회 타이틀 영역 -->

    <!-- End 예약조회 영역 -->
    <div class="container" style="text-align: center; margin-top: 5%;" >
    <table style="display:inline-block; width: auto; height: auto;">
        <tr>
            <th><span style="width: 100px;">번호</span></th>
            <th><span>이름</span></th>
            <th id="test-span"><span>병원</span></th>
            <th><span>날짜</span></th>
            <th><span>시간</span></th>
            <th><span class="bb">상태</span></th>
            <th><span class="bb">예약취소</span></th>
        </tr>
        <c:set var="now" value="<%=new java.util.Date()%>" />
        <c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyyMMdd" /></c:set> 
        <c:out value="${sysYear}" />
        <c:forEach var="myResList" items="${myResList}" varStatus="status">
        <form action="cancelReservation" method="POST">
        <tr>
            <input type="hidden" name="userId" value="${principal.user.userId}">
            <input type="hidden" name="comNum" value="${myResList.com_num}">
            <input type="hidden" name="scheduleTime" value="${myResList.schedule_time}">
            <input type="hidden" name="reservationDate" value="${myResList.reservation_date}">
            <td>${myResList.reservation_seq}</td>
            <td>${principal.user.userNickname}</td>
            <td>${myResList.user_name}</td>
            <td>${myResList.reservation_date}</td>
            <td>${myResList.schedule_time}</td>
            <c:choose>
                <c:when test="${empty myResList.reservation_status }">
                    <td style="color: gray;"><button type="button" onclick='location.href="/pawmap/showMyMedicalRecord?comNum=${myResList.com_num}&reservationDate=${myResList.reservation_date}&scheduleTime=${myResList.schedule_time}&userId=${principal.user.userId}"' disabled>진단서 보기</button></td>
                </c:when>
                <c:otherwise>
                    <td style="color: gray;"><button type="button" onclick='location.href="/pawmap/showMyMedicalRecord?comNum=${myResList.com_num}&reservationDate=${myResList.reservation_date}&scheduleTime=${myResList.schedule_time}&userId=${principal.user.userId}"'>진단서 보기</button></td>
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${myResList.reservation_date <= sysYear || !empty myResList.reservation_status}">
                    <td><button disabled>예약취소</button></td>
                </c:when>
                <c:otherwise>
                    <td><button  onclick="if(!confirm('정말 취소하겠씁니까?')){return false}" >예약취소</button></td>
                </c:otherwise>
            </c:choose>
        </tr>
        </form>    
        </c:forEach>
        
        </table>

        <!-- <div class="row mt-2">
            <div class="col-12">
            <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
                <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">Next</a></li>
            </ul>
            </nav>
            </div>
        </div> -->
    </div>
    <!-- End 예약조회 영역 -->

    <!-- Start footer 영역-->

    <!-- End footer 영역-->

    <!--스크롤 업 버튼-->
    <%@ include file="layout/footer.jsp" %>
