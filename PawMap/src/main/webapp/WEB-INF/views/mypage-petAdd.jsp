<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ include file="layout/header.jsp" %>

    <!-- Start 반려동물 추가 타이틀 영역 -->
    <div class="all-title-box">
        <div class="petInfoContainer">
            <div class="row">
                <div class="col-lg-12">
                    <h2>반려동물 추가</h2>
                </div>
            </div>
        </div>
    </div>
    <!-- End 반려동물 추가 타이틀 영역 -->

    <!-- Start 반려동물 추가 영역 -->
    <form class="form"
         action="/pawmap/mypage/insertPetInfo" 
         method="post" 
         id="inserPetInfo"
         enctype="multipart/form-data"
        >
    <div class="petInfoContainer bootstrap snippet" style="padding: 50px;">
        <div class="row">
            <div class="col-sm-3">
                <div class="text-center">
                    <img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail"
                        alt="avatar">
                    <input type="file" name="uploadPetFile" class="form-control text-center center-block file-upload">
                </div>
                </hr><br>
            </div>
            <!-- 사용자 아이디 히든으로 넣어주기  -->
            <div class="form-group ml-5 ">
                <div class="col-sm-10">
                    <!-- <input type="hidden" class="form-control" id="user_id" name="userId" value="${principal.user.userId}" > -->
                </div>
            </div>

            <!-- 반려동물 정보 입력 폼 -->
            
            <div class="col-m-12">
                <div class="tab-content">
                    <div class="tab-pane active">
                             <div>
                                 <input type="hidden" name="userId" value="${user.userId}">
                             </div>
                            <div class="form-group">
                                <div class="col-lg-12">
                                    <label for="name">이름</label>
                                    <h2>${user.userId}</h2>
                                    <input type="text" class="form-control" name="name" id="name">
                                  
                                </div>
                            </div>
                            <br>
                            <div class="form-group">
                                <div class="col-xs-6">
                                    <label for="kind">성별</label>
                                    <input type="text" class="form-control" name="gender" id="kind" maxlength='2'>
                                </div>
                            </div>
                            <br>
                            <div class="form-group">
                                <div class="col-xs-6">
                                    <label for="age">나이</label>
                                    <input type="text" class="form-control" name="age" id="age">
                                </div>
                            </div>
                            <br>
                            <!-- 라디오버튼 클릭시 값에 따른 드롭박스 활성화 비활성화 -->
                             <!-- 라디오버튼 클릭시 값에 따른 드롭박스 활성화 비활성화 -->
                             <div class="form-group">
                                <div class="col-m-12">
                                    <label for="kind">종</label>
                                    <div >
                                        <input type="radio" name="petType" id="r1" value="강아지" ><label for="r1">강아지</label>
                                        <input type="radio" name="petType" id="r2" value="고양이" ><label for="r2">고양이</label>
                                        <input type="radio" name="petType" id="r4" value="새" ><label for="r3">새</label>
                                        <input type="radio" name="petType" id="r5" value="곤충류" ><label for="r4">곤충류</label>
                                        <input type="radio" name="petType" id="r6" value="설치류" ><label for="r5">설치류</label>
                                        <input type="radio" name="petType" id="r7" value="파충류" ><label for="r6">파충류</label>
                                        <input type="radio" name="petType" id="r8" value="어류" ><label for="r7">어류</label>
                                        <input type="radio" name="petType" id="r9" value="직접 입력" ><label for="r8">직접 입력</label>
                                      </div>
                                </div>
                            </div>
                            <br>
                            <div class="form-group">
                                <div class="col-m-12">
                                      <label class="petTypeDetail" for="petTypeDetail" >상세 종</label>
                                      <select size="1" id="dogTypeDetail" name="petTypeDetail" >
                                          <option value="골든리트리버" selected>골든리트리버</option>
                                          <option value="그레이 하운드">그레이 하운드</option>
                                          <option value="그레이트 데인">그레이트 데인</option>
                                          <option value="닥스훈트">닥스훈트</option>
                                          <option value="달마시안">달마시안</option>
                                          <option value="도베르만">도베르만</option>
                                          <option value="동경견">동경견</option>
                                          <option value="라사 압소">라사 압소</option>
                                          <option value="라이카">라이카</option>
                                          <option value="래브라도 리트리버">래브라도 리트리버</option>
                                          <option value="말티즈">말티즈</option>
                                          <option value="믹스견">믹스견</option>
                                          <option value="보더콜리">보더콜리</option>
                                          <option value="보스턴 테리어">보스턴 테리어</option>
                                          <option value="불독">불독</option>
                                          <option value="비글">비글</option>
                                          <option value="비숑 프리제">비숑 프리제</option>
                                          <option value="사모예드">사모예드</option>
                                          <option value="삽살개">삽살개</option>
                                          <option value="샤 페이">샤 페이</option>
                                          <option value="셔틀랜드 쉽독">셔틀랜드 쉽독</option>
                                          <option value="슈나우저">슈나우저</option>
                                          <option value="스코티시 테리어">스코티시 테리어</option>
                                          <option value="시바">시바</option>
                                          <option value="시베리안 허스키">시베리안 허스키</option>
                                          <option value="시츄">시츄</option>
                                          <option value="아메리칸 코커 스패니얼">아메리칸 코커 스패니얼</option>
                                          <option value="아메리칸 핏 불 테리어">아메리칸 핏 불 테리어 </option>
                                          <option value="아프간 하운드">아프간 하운드</option>
                                          <option value="알래스칸 맬러뮤트">알래스칸 맬러뮤트</option>
                                          <option value="올드 잉글리시 쉽독">올드 잉글리시 쉽독</option>
                                          <option value="요크셔테리어">요크셔테리어</option>
                                          <option value="웨스트 하이랜드 화이트 테리어">웨스트 하이랜드 화이트 테리어</option>
                                          <option value="웰시코기">웰시코기</option>
                                          <option value="잭 러셀 테리어">잭 러셀 테리어</option>
                                          <option value="제페니스 스피츠">제페니스 스피츠</option>
                                          <option value="진돗개">진돗개</option>
                                          <option value="차우차우">차우차우</option>
                                          <option value="치와와">치와와</option>
                                          <option value="코커 스패니얼">코커 스패니얼</option>
                                          <option value="파피용">파피용</option>
                                          <option value="퍼그">퍼그</option>
                                          <option value="포메라니안">포메라니안</option>
                                          <option value="기타 갱얼지">기타 갱얼지</option>
                                     </select>

                                     <select size="1" id="catTypeDetail" name="petTypeDetail" style="display: none;">
                                        <option value="나플레옹" selected>나플레옹</option>
                                        <option value="네벨룽">네벨룽</option>
                                        <option value="노르웨이지안 포레스트 캣">노르웨이지안 포레스트 캣</option>
                                        <option value="데본 렉스">데본 렉스</option>
                                        <option value="돈스코이">돈스코이</option>
                                        <option value="라펌">라펌</option>
                                        <option value="래그돌">래그돌</option>
                                        <option value="러시안 블루">러시안 블루</option>
                                        <option value="망스">망스</option>
                                        <option value="먼치킨">먼치킨</option>
                                        <option value="믹스묘">믹스묘</option>
                                        <option value="뱅갈">뱅갈</option>
                                        <option value="버만">버만</option>
                                        <option value="버밀라">버밀라</option>
                                        <option value="봄베이">봄베이</option>
                                        <option value="브리티시">브리티시</option>
                                        <option value="샴">샴</option>
                                        <option value="세렝게티">세렝게티</option>
                                        <option value="스코티시 폴드">스코티시 폴드</option>
                                        <option value="스키프 토이 밥테일">스키프 토이 밥테일</option>
                                        <option value="스털링">스털링</option>
                                        <option value="스핑크스">스핑크스</option>
                                        <option value="시베리안">시베리안</option>
                                        <option value="싱가푸라">싱가푸라</option>
                                        <option value="아메리칸 밥테일">아메리칸 밥테일</option>
                                        <option value="아메리칸 쇼트헤어">아메리칸 쇼트헤어</option>
                                        <option value="아비시니안">아비시니안</option>
                                        <option value="윽시캣">윽시캣</option>
                                        <option value="요크 초콜렛">요크 초콜렛</option>
                                        <option value="이그저틱 쇼트헤어">이그저틱 쇼트헤어</option>
                                        <option value="이집션 마우">이집션 마우</option>
                                        <option value="자바니즈">자바니즈</option>
                                        <option value="저먼 렉스">저먼 렉스</option>
                                        <option value="제페니즈 밥테일">제페니즈 밥테일</option>
                                        <option value="친칠라">친칠라</option>
                                        <option value="카호마니">카호마니</option>
                                        <option value="코리안 숏헤어">코리안 숏헤어</option>
                                        <option value="코리안 롱헤어">코리안 롱헤어</option>
                                        <option value="터키쉬 앙고라">터키쉬 앙고라</option>
                                        <option value="페르시안">페르시안</option>
                                        <option value="기타 고먐미">기타 고먐미</option>
                                   </select>

                               <!-- option 수정할것 -->
                                <select size="1" id="birdTypeDetail" name="petTypeDetail" style="display: none;">
                                    <option value="금강 앵무"selected >금강 앵무</option>
                                    <option value="닭">닭</option>
                                    <option value="뉴기니아 앵무">뉴기니아 앵무</option>
                                    <option value="사랑 앵무">사랑 앵무</option>
                                    <option value="옐로우 코뉴어">옐로우 코뉴어</option>
                                    <option value="왕관 앵무">왕관 앵무</option>
                                    <option value="카나리아">카나리아</option>
                                    <option value="패러킷">패러킷</option>
                                    <option value="기타 새">기타 새</option>
                            </select>
                                <select size="1" id="bugsTypeDetail" name="petTypeDetail" style="display: none;">
                                    <option value="나비"selected >나비</option>
                                    <option value="딱정벌레">딱정벌레</option>
                                    <option value="무당벌레">무당벌레</option>
                                    <option value="사마귀">사마귀</option>
                                    <option value="사슴벌레">사슴벌레</option>
                                    <option value="풍뎅이">풍뎅이</option>
                                    <option value="기타 곤충류">기타 곤충류</option>
                            </select>
                            <select size="1" id="rodeTypeDetail" name="petTypeDetail" style="display: none;">
                                <option value="고슴도치" selected>고슴도치</option>
                                <option value="기니피그">기니피그</option>
                                <option value="나무늘보">나무늘보</option>
                                <option value="토끼">토끼</option>
                                <option value="프랫">프랫</option>
                                <option value="햄스터">햄스터</option>
                                <option value="하늘다람쥐">하늘다람쥐</option>
                                <option value="기타 설치류">기타 설치류</option>
                        </select>
                            <select size="1" id="reptTypeDetail" name="petTypeDetail" style="display: none;">
                                <option value="거북" selected>거북</option>
                                <option value="개구리">개구리</option>
                                <option value="도마뱀">도마뱀</option>
                                <option value="뱀">뱀</option>
                                <option value="자라">자라</option>
                                <option value="악어">악어</option>
                                <option value="기타 파충류">기타 파충류</option>
                        </select>
                            <select size="1" id="piscTypeDetail" name="petTypeDetail" style="display: none;">
                                <option value="구피" selected>구피</option>
                                <option value="금붕어">금붕어</option>
                                <option value="네온테트라">네온테트라</option>
                                <option value="라미레지">라미레지</option>
                                <option value="제브라다니오">제브라다니오</option>
                                <option value="베타">베타</option>
                                <option value="플라워혼">플라워혼</option>
                                <option value="기타 어류">기타 어류</option>
                        </select>
                            <div style="">
                                <input type="input" id="writeType"  style="display: none; width: 40%;" name="petTypeDetail" placeholder="직접입력">
                            </div>
                                </div>
                            </div>
                            <br>
                            <div class="form-group">
                                <div class="col-xs-6">
                                    <label for="kind">증상</label>
                                    <input type="input" style="width: 40%;" class="form-control" name="symptom" id="kind">
                                </div>
                            </div>
                            
                            <br>
                            <!-- 저장 및 재작성 버튼-->
                            <div class="form-group" style="padding: 5px;">
                                <div class="col-xs-12">
                                    <br>
                                    <button class="btn btn-lg btn-success" type="submit"><i
                                            class="glyphicon glyphicon-ok-sign"></i> 저장</button>
                                    <button class="btn btn-lg" type="reset"><i class="glyphicon glyphicon-repeat"></i>
                                        다시작성</button>
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

   <script>
       $(document).ready(function(){
 
    // 라디오버튼 클릭시 이벤트 발생
    $("input:radio[type=radio]").click(function(){

        console.log($("input[type=radio]:checked").val());
        if($("input[type=radio]:checked").val() == "강아지"){
        //강아지 활성화
        $("select[id=dogTypeDetail]").show();
        $("select[id=catTypeDetail]").hide();
        //고양이 비활성화
        $("select[id=birdTypeDetail]").hide();
        $("select[id=bugsTypeDetail]").hide();
        $("select[id=rodeTypeDetail]").hide();
        $("select[id=reptTypeDetail]").hide();
        $("select[id=piscTypeDetail]").hide();
        $("input[id=writeType]").hide();
        //disabled 비활성화 
        $("select[id=dogTypeDetail]").attr("disabled",false);
        $("select[id=catTypeDetail]").attr("disabled",true);
        $("select[id=birdTypeDetail]").attr("disabled",true);
        $("select[id=bugsTypeDetail]").attr("disabled",true);
        $("select[id=rodeTypeDetail]").attr("disabled",true);
        $("select[id=reptTypeDetail]").attr("disabled",true);
        $("select[id=piscTypeDetail]").attr("disabled",true);
        $("input[id=writeType]").attr("disabled",true);


    }else if($("input[type=radio]:checked").val() == "고양이"){
        //고양이 활성화
        $("select[id=catTypeDetail]").show();
        $("select[id=dogTypeDetail]").hide();
        $("select[id=birdTypeDetail]").hide();
        $("select[id=bugsTypeDetail]").hide();
        $("select[id=rodeTypeDetail]").hide();
        $("select[id=reptTypeDetail]").hide();
        $("select[id=piscTypeDetail]").hide();
        $("input[id=writeType]").hide();
        //disabled 비활성화 
        $("select[id=catTypeDetail]").attr("disabled",false);
        $("select[id=dogTypeDetail]").attr("disabled",true);
        $("select[id=birdTypeDetail]").attr("disabled",true);
        $("select[id=bugsTypeDetail]").attr("disabled",true);
        $("select[id=rodeTypeDetail]").attr("disabled",true);
        $("select[id=reptTypeDetail]").attr("disabled",true);
        $("select[id=piscTypeDetail]").attr("disabled",true);
        $("input[id=writeType]").attr("disabled",true);
        
    }else if($("input[type=radio]:checked").val() == "새"){
        //새 활성화
        $("select[id=catTypeDetail]").hide();
        $("select[id=dogTypeDetail]").hide();
        $("select[id=birdTypeDetail]").show();
        $("select[id=bugsTypeDetail]").hide();
        $("select[id=rodeTypeDetail]").hide();
        $("select[id=reptTypeDetail]").hide();
        $("select[id=piscTypeDetail]").hide();
        $("input[id=writeType]").hide();
        //disabled 비활성화 
        $("select[id=birdTypeDetail]").attr("disabled",false);
        $("select[id=dogTypeDetail]").attr("disabled",true);
        $("select[id=catTypeDetail]").attr("disabled",true);
        $("select[id=bugsTypeDetail]").attr("disabled",true);
        $("select[id=rodeTypeDetail]").attr("disabled",true);
        $("select[id=reptTypeDetail]").attr("disabled",true);
        $("select[id=piscTypeDetail]").attr("disabled",true);
        $("input[id=writeType]").attr("disabled",true);
    
    }else if($("input[type=radio]:checked").val() == "곤충류"){
        //곤충류 활성화
        $("select[id=catTypeDetail]").hide();
        $("select[id=dogTypeDetail]").hide();
        $("select[id=birdTypeDetail]").hide();
        $("select[id=bugsTypeDetail]").show();
        $("select[id=rodeTypeDetail]").hide();
        $("select[id=reptTypeDetail]").hide();
        $("select[id=piscTypeDetail]").hide();
        $("input[id=writeType]").hide();
        //disabled 비활성화 
        $("select[id=bugsTypeDetail]").attr("disabled",false);
        $("select[id=dogTypeDetail]").attr("disabled",true);
        $("select[id=catTypeDetail]").attr("disabled",true);
        $("select[id=birdTypeDetail]").attr("disabled",true);
        $("select[id=rodeTypeDetail]").attr("disabled",true);
        $("select[id=reptTypeDetail]").attr("disabled",true);
        $("select[id=piscTypeDetail]").attr("disabled",true);
        $("input[id=writeType]").attr("disabled",true);

    }else if($("input[type=radio]:checked").val() == "설치류"){
    //설치류 활성화
    $("select[id=catTypeDetail]").hide();
        $("select[id=dogTypeDetail]").hide();
        $("select[id=birdTypeDetail]").hide();
        $("select[id=bugsTypeDetail]").hide();
        $("select[id=rodeTypeDetail]").show();
        $("select[id=reptTypeDetail]").hide();
        $("select[id=piscTypeDetail]").hide();
        $("input[id=writeType]").hide();
        //disabled 비활성화 
        $("select[id=rodeTypeDetail]").attr("disabled",false);
        $("select[id=dogTypeDetail]").attr("disabled",true);
        $("select[id=catTypeDetail]").attr("disabled",true);
        $("select[id=birdTypeDetail]").attr("disabled",true);
        $("select[id=bugsTypeDetail]").attr("disabled",true);
        $("select[id=reptTypeDetail]").attr("disabled",true);
        $("select[id=piscTypeDetail]").attr("disabled",true);
        $("input[id=writeType]").attr("disabled",true);

    }else if($("input[type=radio]:checked").val() == "파충류"){
        //파충류 활성화
        $("select[id=catTypeDetail]").hide();
        $("select[id=dogTypeDetail]").hide();
        $("select[id=birdTypeDetail]").hide();
        $("select[id=bugsTypeDetail]").hide();
        $("select[id=rodeTypeDetail]").hide();
        $("select[id=reptTypeDetail]").show();
        $("select[id=piscTypeDetail]").hide();
        $("input[id=writeType]").hide(); 
        //disabled 비활성화 
        $("select[id=reptTypeDetail]").attr("disabled",false);
        $("select[id=dogTypeDetail]").attr("disabled",true);
        $("select[id=catTypeDetail]").attr("disabled",true);
        $("select[id=birdTypeDetail]").attr("disabled",true);
        $("select[id=bugsTypeDetail]").attr("disabled",true);
        $("select[id=rodeTypeDetail]").attr("disabled",true);
        $("select[id=piscTypeDetail]").attr("disabled",true);
        $("input[id=writeType]").attr("disabled",true);

    }else if($("input[type=radio]:checked").val() == "어류"){
        //어류 활성화
        $("select[id=catTypeDetail]").hide();
        $("select[id=dogTypeDetail]").hide();
        $("select[id=birdTypeDetail]").hide();
        $("select[id=bugsTypeDetail]").hide();
        $("select[id=rodeTypeDetail]").hide();
        $("select[id=reptTypeDetail]").hide();
        $("select[id=piscTypeDetail]").show();
        $("input[id=writeType]").hide(); 
        //disabled 비활성화 
        $("select[id=piscTypeDetail]").attr("disabled",false);
        $("select[id=dogTypeDetail]").attr("disabled",true);
        $("select[id=catTypeDetail]").attr("disabled",true);
        $("select[id=birdTypeDetail]").attr("disabled",true);
        $("select[id=bugsTypeDetail]").attr("disabled",true);
        $("select[id=reptTypeDetail]").attr("disabled",true);
        $("select[id=rodeTypeDetail]").attr("disabled",true);
        $("input[id=writeType]").attr("disabled",true);

    }else if($("input[type=radio]:checked").val() == "${writeType}"){
        //직접입력 박스 활성화
        $("select[id=catTypeDetail]").hide();
        $("select[id=dogTypeDetail]").hide();
        $("select[id=birdTypeDetail]").hide();
        $("select[id=bugsTypeDetail]").hide();
        $("select[id=rodeTypeDetail]").hide();
        $("select[id=reptTypeDetail]").hide();
        $("select[id=piscTypeDetail]").hide();
        $("input[id=writeType]").show(); 
        //disabled 비활성화 
        $("input[id=writeType]").attr("disabled",false);
        $("select[id=dogTypeDetail]").attr("disabled",true);
        $("select[id=catTypeDetail]").attr("disabled",true);
        $("select[id=birdTypeDetail]").attr("disabled",true);
        $("select[id=bugsTypeDetail]").attr("disabled",true);
        $("select[id=reptTypeDetail]").attr("disabled",true);
        $("select[id=piscTypeDetail]").attr("disabled",true);
        $("input[id=rodeTypeDetail]").attr("disabled",true);
    }

    });
});

   </script>
</body>
</html>

   