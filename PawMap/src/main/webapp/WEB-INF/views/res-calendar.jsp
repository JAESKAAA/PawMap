<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ include file="layout/header.jsp" %>

<style>

    .res-form{
        padding: 2%;
    }
    .scriptCalendar{
        border: 2px solid brown;   
    }
    .calendar-left{
        margin-left: 0px;
        margin-right: 0px;
       
    }
    .calendar_box{
        align-items: center;
    }
    .board-type{
        margin-top: 48px;
        margin-bottom: 48px;
    }
   

</style>

<script src="${pageContext.request.contextPath}/js/calendar.js"></script>



    <!-- 캘린더   -->
    <!-- <h1>프린시펄 유저 아이디 ${principal.user.userId}</h1>
    <h1>프린시펄 유저 닉 ${principal.user.userNickname}</h1>
    <h1>병원아이디 ${scheduleList[0].userId}</h1>
    <h1>병원사업자번호 ${scheduleList[0].comNum}</h1> -->
    <div class="board-type  mt-5">
        <h1> ${hosNickname[0].user_nickname} 예약 하기  </h1>
    </div>
    <hr class="line-paint">
    <input id="hospitalComNum" type="hidden" value="${scheduleList[0].comNum}"> 
<div class="container">
    <div class="row">
        <div class="calendar_box" >
            <div class="sc col-lg-6 col-md-12 col-sm-12">
                <table  class="scriptCalendar mb-3" style="position: relative; float: left; ">
                    <thead>
                        <tr>
                            <td onClick="prevCalendar();" style="cursor:pointer;">&#60;&#60;</td>
                            <td colspan="5">
                                <span id="calYear">YYYY</span>년
                                <span id="calMonth">MM</span>월
                            </td>
                            <td onClick="nextCalendar();" style="cursor:pointer;">&#62;&#62;</td>
                        </tr>
                        <tr>
                            <td value="sun">일</td>
                            <td value="sun">월</td>
                            <td value="sun">화</td>
                            <td value="sun">수</td>
                            <td value="sun">목</td>
                            <td value="sun">금</td>
                            <td value="sun">토</td>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
                
        
        <!--button-->
            <div class="calendar-left col-lg-6 col-md-12 col-sm-12" style="position: relative; float: left; margin-top: 0px;">
                <strong  style="color: white; size: 2em; ">예약 가능한 시간</strong>
                <div class="events-time mt-5" >
                    <br/>
                    <ul class="calendartime">

                    </ul>
                </div>
                <br>
                <br>
            </div>
        </div>    
    </div>
</div>        
<!-- </form>     -->
    <!-- End 캘린더  -->

 <script>
    /**
    * @brief   날짜 선택
    * @details 사용자가 선택한 날짜에 체크표시를 남긴다.
    */
    function calendarChoiceDay(column) {

        // @param 기존 선택일이 존재하는 경우 기존 선택일의 표시형식을 초기화 한다.
        if(document.getElementsByClassName("choiceDay")[0]) {
            document.getElementsByClassName("choiceDay")[0].style.backgroundColor = "#FFFFFF";
    
            document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");

        }

        // @param 선택일 체크 표시
        column.style.backgroundColor = "#FF9999";
        
        // alert(11111);

        console.log(column.id);
        
        // @param 선택일 클래스명 변경

        column.classList.add("choiceDay");

        // 선택한 날짜를 input에 밸류값으로 넣어서 포스트태우기
        let com_num = $("#hospitalComNum").val();
        let resDate = column.id;
        console.log("comNum =======" + com_num);
        console.log("resDate====="+resDate);
        
        $.ajax({
            url: 'getScheduleList',
            data: {date: column.id,comNum:com_num},
            type: 'POST',
            success: function(obj) {
                var data = JSON.parse(obj);
                console.log(data);
                var htmlString = "";
                let overlapTime = [];
                for(var i = 0; i < data.detailScheduleList.length; i++){
                    for(var k = 0; k<data.getReservationList.length; k++){
                        if(data.detailScheduleList[i].scheduleTime == data.getReservationList[k].scheduleTime 
                        && resDate == data.getReservationList[k].reservationDate){
                            console.log("같습니다========="+data.detailScheduleList[i].scheduleTime);
                            overlapTime.push(data.detailScheduleList[i].scheduleTime);
                        }
                    }
                }
   
                    for(var i = 0; i < data.detailScheduleList.length; i++){
                    
                    htmlString += "<form class=\'res-form\' name=\'do_res\' action=\'doReservation\'' method=\'POST\'>";
                    htmlString +=       "<input type=\'hidden\' name=\'userId\' value=\'${principal.user.userId}\'>";
                    htmlString +=       "<input type=\'hidden\' name=\'hosUserId\' value=\'${scheduleList[0].userId}\'>";
                    htmlString +=       "<input type=\'hidden\' name=\'comNum\' value=\'${scheduleList[0].comNum}\'>";
                    htmlString +=       "<input class=\'hiddesResDate\' type=\'hidden\' name=\'reservationDate\' value='"+resDate+"'>";
                    //htmlString +=       "<h1>" + data.detailScheduleList[i].scheduleTime + "<h1>";
                    htmlString +=       "<input type=\'hidden\' name=\'scheduleTime\' value=\'" + data.detailScheduleList[i].scheduleTime + "\' />";
                    
                    if(overlapTime.indexOf(data.detailScheduleList[i].scheduleTime) != -1){
                        console.log("있습니다.");
                        htmlString +=       "<li>";
                        htmlString +=           "<button type=\"submit\" class='calendar-time[i]' onclick=\"confirm('예약하시겠습니까?')\" disabled>" 
                                                + data.detailScheduleList[i].scheduleTime + 
                                                "</button>";
                        htmlString +=       "</li>";
                        htmlString += "</form>";  

                    }else{
                        console.log("없습니다.");
                        htmlString +=       "<li>";
                            htmlString +=           "<button type=\"submit\" class='calendar-time[i]' onclick=\"confirm('예약하시겠습니까?')\">" 
                                                    + data.detailScheduleList[i].scheduleTime + 
                                                    "</button>";
                        htmlString +=       "</li>";
                        htmlString += "</form>";  
                    }
                    
                }
 
                console.log("overlapTime==========="+overlapTime);
                $(".events-time").html(htmlString);
                
            },
            error: function(e) {
                
            }
        });
    }

    function fillzero(month) {
        return month.length >= 2 ? month : '0' + month;
    }
 </script>

    <%@ include file="layout/footer.jsp" %>