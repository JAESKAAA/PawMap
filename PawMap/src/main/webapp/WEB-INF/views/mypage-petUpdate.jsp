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

    <div class="container bootstrap snippet" style="padding: 50px;">
        <div class="row">
            <!-- 파일이 있는 상태에서는 update쿼리를 타도록  -->
                <c:if test="${!empty fileVO}" >
                    <div class="col-sm-3">
                        <form id="upload_form" action="updatePetInfoFormInsertFiles"  method="POST" enctype="multipart/form-data">       
                            <img class="img-fluid avatar img-circle img-thumbnail" src="${pageContext.request.contextPath}/upload/${fileVO.originalFileName}" alt="">      
                                
                            <input id="uploader" type="file" class="text-center center-block file-upload" name="uploadPetFiles" >   
                            
                            <input type="hidden" name="userId"  value="${principal.user.userId}">
                            <input type="hidden" name="fileSeq" class="hiddenFileSeq" value="${fileVO.fileSeq}">
                            <div class="entry input-group upload-input-group">  
                                <button id="uploader_btn" type="submit" class="btn btn-sm-danger">파일 수정 완료</button>
                            </div>   
                        </form>
                    </div>
                </c:if>
                <c:if test="${empty fileVO}">
                    <div class="col-m-12">
                        <form action="insertPetFileOnUpdateForm" method="POST" enctype="multipart/form-data">
                            <div class="text-center">
                                    
                                <img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail"
                                        alt="avatar">      
                                <input type="file" class="text-center center-block file-upload" name="uploadPetFiles" >   
                                <input type="hidden" name="userId"  value="${principal.user.userId}">
                                <input type="hidden" name="fileSeq" class="hiddenFileSeq" value="${pet.petSeq}">     
                                <div class="entry input-group upload-input-group">  
                                    <button type="submit" class="btn btn-sm-danger">파일등록 완료</button>
                                </div>              
                            </div>
                            </hr><br>
                        </form>
                    </div>
                </c:if>
                    
                    <!-- <img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail"
                        alt="avatar">
                    <input type="file" class="text-center center-block file-upload">
                </div> -->
                </hr><br>
            </div>
            <div class="">
                <div class="tab-content">
                    <div class="tab-pane active">
                        <form 
                        class="form" 
                        action="/pawmap/mypage/updatePetInfo" 
                        method="post" 
                        id="updateForm"
                        >
                        <div class="col-m-12">
                            <div class="tab-content">
                                <div class="tab-pane active">
                            <div class="form-group">
                                <div class="col-lg-12">
                                    <label for="name">이름</label>
                                    <input type="hidden" name="userId"  value="${principal.user.userId}">
                                    <input type="text" class="form-control" name="name" id="name" value="${pet.name}">
                                    <input type="hidden" class="form-control" id="user_id" name="petSeq" value="${pet.petSeq}" >
                                </div>
                            </div>
                            <br>
                            <div class="form-group">
                                <div class="col-xs-6">
                                    <label for="kind">성별</label>
                                    <input type="text" class="form-control" name="gender" id="kind" value="${pet.gender}">
                                </div>
                            </div>
                            <br>
                            <div class="form-group">
                                <div class="col-xs-6">
                                    <label for="age">나이</label>
                                    <input type="text" class="form-control" name="age" id="age" value="${pet.age}">
                                </div>
                            </div>
                            <br>
                            <!-- 라디오버튼 클릭시 값에 따른 드롭박스 활성화 비활성화 -->
                            <div class="form-group">
                                <div class="col-m-12">
                                    <label for="kind">종</label>
                                    <div >
                                        <input type="radio" name="petType" id="r1" value="강아지" <c:if test="${pet.petType == '강아지'}">checked</c:if>><label for="r1">강아지</label>
                                        <input type="radio" name="petType" id="r2" value="고양이" <c:if test="${pet.petType == '고양이'}">checked</c:if>><label for="r2">고양이</label>
                                        <input type="radio" name="petType" id="r4" value="새" <c:if test="${pet.petType == '새'}">checked</c:if>><label for="r3">새</label>
                                        <input type="radio" name="petType" id="r5" value="곤충류" <c:if test="${pet.petType == '곤충류'}">checked</c:if>><label for="r4">곤충류</label>
                                        <input type="radio" name="petType" id="r6" value="설치류" <c:if test="${pet.petType == '설치류'}">checked</c:if>><label for="r5">설치류</label>
                                        <input type="radio" name="petType" id="r7" value="파충류" <c:if test="${pet.petType == '파충류'}">checked</c:if>><label for="r6">파충류</label>
                                        <input type="radio" name="petType" id="r8" value="어류" <c:if test="${pet.petType == '어류'}">checked</c:if>><label for="r7">어류</label>
                                        <input type="radio" name="petType" id="r9" value="직접 입력" <c:if test="${pet.petType == '직접 입력'}">checked</c:if>><label for="r8">직접 입력</label>
                                      </div>
                                </div>
                            </div>
                            <br>
                            <div class="form-group">
                                <div class="col-m-12">
                                      <label class="petTypeDetail" for="petTypeDetail" >상세 종</label>
                                      <select size="1" id="dogTypeDetail" name="petTypeDetail" >
                                          <option value="골든리트리버" <c:if test="${pet.petTypeDetail == '골든리트리버'}">selected</c:if>>골든리트리버</option>
                                          <option value="그레이 하운드" <c:if test="${pet.petTypeDetail == '그레이 하운드'}">selected</c:if>>그레이 하운드</option>
                                          <option value="그레이트 데인" <c:if test="${pet.petTypeDetail == '그레이트 데인'}">selected</c:if>>그레이트 데인</option>
                                          <option value="닥스훈트" <c:if test="${pet.petTypeDetail == '닥스훈트'}">selected</c:if>>닥스훈트</option>
                                          <option value="달마시안" <c:if test="${pet.petTypeDetail == '달마시안'}">selected</c:if>>달마시안</option>
                                          <option value="도베르만" <c:if test="${pet.petTypeDetail == '도베르만'}">selected</c:if>>도베르만</option>
                                          <option value="동경견" <c:if test="${pet.petTypeDetail == '동경견'}">selected</c:if>>동경견</option>
                                          <option value="라사 압소" <c:if test="${pet.petTypeDetail == '라사 압소'}">selected</c:if>>라사 압소</option>
                                          <option value="라이카" <c:if test="${pet.petTypeDetail == '라이카'}">selected</c:if>>라이카</option>
                                          <option value="래브라도 리트리버" <c:if test="${pet.petTypeDetail == '래브라도 리트리버'}">selected</c:if>>래브라도 리트리버</option>
                                          <option value="말티즈" <c:if test="${pet.petTypeDetail == '말티즈'}">selected</c:if>>말티즈</option>
                                          <option value="믹스견" <c:if test="${pet.petTypeDetail == '믹스견'}">selected</c:if>>믹스견</option>
                                          <option value="보더콜리" <c:if test="${pet.petTypeDetail == '보더콜리'}">selected</c:if>>보더콜리</option>
                                          <option value="보스턴 테리어" <c:if test="${pet.petTypeDetail == '보스턴 테리어'}">selected</c:if>>보스턴 테리어</option>
                                          <option value="불독" <c:if test="${pet.petTypeDetail == '불독'}">selected</c:if>>불독</option>
                                          <option value="비글" <c:if test="${pet.petTypeDetail == '비글'}">selected</c:if>>비글</option>
                                          <option value="비숑 프리제" <c:if test="${pet.petTypeDetail == '비숑 프리제'}">selected</c:if>>비숑 프리제</option>
                                          <option value="사모예드" <c:if test="${pet.petTypeDetail == '사모예드'}">selected</c:if>>사모예드</option>
                                          <option value="삽살개" <c:if test="${pet.petTypeDetail == '삽살개'}">selected</c:if>>삽살개</option>
                                          <option value="샤 페이" <c:if test="${pet.petTypeDetail == '샤 페이'}">selected</c:if>>샤 페이</option>
                                          <option value="셔틀랜드 쉽독" <c:if test="${pet.petTypeDetail == '셔틀랜드 쉽독'}">selected</c:if>>셔틀랜드 쉽독</option>
                                          <option value="슈나우저" <c:if test="${pet.petTypeDetail == '슈나우저'}">selected</c:if>>슈나우저</option>
                                          <option value="스코티시 테리어" <c:if test="${pet.petTypeDetail == '스코티시 테리어'}">selected</c:if>>스코티시 테리어</option>
                                          <option value="시바" <c:if test="${pet.petTypeDetail == '시바'}">selected</c:if>>시바</option>
                                          <option value="시베리안 허스키" <c:if test="${pet.petTypeDetail == '시베리안 허스키'}">selected</c:if>>시베리안 허스키</option>
                                          <option value="시츄" <c:if test="${pet.petTypeDetail == '시츄'}">selected</c:if>>시츄</option>
                                          <option value="아메리칸 코커 스패니얼" <c:if test="${pet.petTypeDetail == '아메리칸 코커 스패니얼'}">selected</c:if>>아메리칸 코커 스패니얼</option>
                                          <option value="아메리칸 핏 불 테리어" <c:if test="${pet.petTypeDetail == '아메리칸 핏 불 테리어'}">selected</c:if>>아메리칸 핏 불 테리어</option>
                                          <option value="아프간 하운드" <c:if test="${pet.petTypeDetail == '아프간 하운드'}">selected</c:if>>아프간 하운드</option>
                                          <option value="알래스칸 맬러뮤트" <c:if test="${pet.petTypeDetail == '알래스칸 맬러뮤트'}">selected</c:if>>알래스칸 맬러뮤트</option>
                                          <option value="올드 잉글리시 쉽독" <c:if test="${pet.petTypeDetail == '올드 잉글리시 쉽독'}">selected</c:if>>올드 잉글리시 쉽독</option>
                                          <option value="요크셔테리어" <c:if test="${pet.petTypeDetail == '요크셔테리어'}">selected</c:if>>요크셔테리어</option>
                                          <option value="웨스트 하이랜드 화이트 테리어" <c:if test="${pet.petTypeDetail == '웨스트 하이랜드 화이트 테리어'}">selected</c:if>>웨스트 하이랜드 화이트 테리어</option>
                                          <option value="웰시코기" <c:if test="${pet.petTypeDetail == '웰시코기'}">selected</c:if>>웰시코기</option>
                                          <option value="잭 러셀 테리어" <c:if test="${pet.petTypeDetail == '잭 러셀 테리어'}">selected</c:if>>잭 러셀 테리어</option>
                                          <option value="제페니스 스피츠" <c:if test="${pet.petTypeDetail == '제페니스 스피츠'}">selected</c:if>>제페니스 스피츠</option>
                                          <option value="진돗개" <c:if test="${pet.petTypeDetail == '진돗개'}">selected</c:if>>진돗개</option>
                                          <option value="차우차우" <c:if test="${pet.petTypeDetail == '차우차우'}">selected</c:if>>차우차우</option>
                                          <option value="치와와" <c:if test="${pet.petTypeDetail == '치와와'}">selected</c:if>>치와와</option>
                                          <option value="코커 스패니얼" <c:if test="${pet.petTypeDetail == '코커 스패니얼'}">selected</c:if>>코커 스패니얼</option>
                                          <option value="파피용" <c:if test="${pet.petTypeDetail == '파피용'}">selected</c:if>>파피용</option>
                                          <option value="퍼그" <c:if test="${pet.petTypeDetail == '퍼그'}">selected</c:if>>퍼그</option>
                                          <option value="포메라니안" <c:if test="${pet.petTypeDetail == '포메라니안'}">selected</c:if>>포메라니안</option>
                                          <option value="기타종류" <c:if test="${pet.petTypeDetail == '기타 갱얼지'}">selected</c:if>>기타 갱얼지</option>
                                     </select>

                                     <select size="1" id="catTypeDetail" name="petTypeDetail" style="display: none;">
                                        <option value="나플레옹" selected <c:if test="${pet.petTypeDetail == '나플레옹'}">selected</c:if>>나플레옹</option>
                                        <option value="네벨룽" <c:if test="${pet.petTypeDetail == '네벨룽'}">selected</c:if>>네벨룽</option>
                                        <option value="노르웨이지안 포레스트 캣" <c:if test="${pet.petTypeDetail == '노르웨이지안 포레스트 캣'}">selected</c:if>>노르웨이지안 포레스트 캣</option>
                                        <option value="데본 렉스" <c:if test="${pet.petTypeDetail == '데본 렉스'}">selected</c:if>>데본 렉스</option>
                                        <option value="돈스코이" <c:if test="${pet.petTypeDetail == '돈스코이'}">selected</c:if>>돈스코이</option>
                                        <option value="라펌" <c:if test="${pet.petTypeDetail == '라펌'}">selected</c:if>>라펌</option>
                                        <option value="래그돌" <c:if test="${pet.petTypeDetail == '래그돌'}">selected</c:if>>래그돌</option>
                                        <option value="러시안 블루" <c:if test="${pet.petTypeDetail == '러시안 블루'}">selected</c:if>>러시안 블루</option>
                                        <option value="망스" <c:if test="${pet.petTypeDetail == '망스'}">selected</c:if>>망스</option>
                                        <option value="먼치킨" <c:if test="${pet.petTypeDetail == '먼치킨'}">selected</c:if>>먼치킨</option>
                                        <option value="믹스묘" <c:if test="${pet.petTypeDetail == '믹스묘'}">selected</c:if>>믹스묘</option>
                                        <option value="뱅갈" <c:if test="${pet.petTypeDetail == '뱅갈'}">selected</c:if>>뱅갈</option>
                                        <option value="버만" <c:if test="${pet.petTypeDetail == '버만'}">selected</c:if>>버만</option>
                                        <option value="버밀라" <c:if test="${pet.petTypeDetail == '버밀라'}">selected</c:if>>버밀라</option>
                                        <option value="봄베이"<c:if test="${pet.petTypeDetail == '봄베이'}">selected</c:if>>봄베이</option>
                                        <option value="브리티시" <c:if test="${pet.petTypeDetail == '브리티시'}">selected</c:if>>브리티시</option>
                                        <option value="샴" <c:if test="${pet.petTypeDetail == '샴'}">selected</c:if>>샴</option>
                                        <option value="세렝게티" <c:if test="${pet.petTypeDetail == '세렝게티'}">selected</c:if>>세렝게티</option>
                                        <option value="스코티시 폴드" <c:if test="${pet.petTypeDetail == '스코티시 폴드'}">selected</c:if>>스코티시 폴드</option>
                                        <option value="스키프 토이 밥테일" <c:if test="${pet.petTypeDetail == '스키프 토이 밥테일'}">selected</c:if>>스키프 토이 밥테일</option>
                                        <option value="스털링" <c:if test="${pet.petTypeDetail == '스털링'}">selected</c:if>>스털링</option>
                                        <option value="스핑크스" <c:if test="${pet.petTypeDetail == '스핑크스'}">selected</c:if>>스핑크스</option>
                                        <option value="시베리안" <c:if test="${pet.petTypeDetail == '시베리안'}">selected</c:if>>시베리안</option>
                                        <option value="싱가푸라" <c:if test="${pet.petTypeDetail == '싱가푸라'}">selected</c:if>>싱가푸라</option>
                                        <option value="아메리칸 밥테일" <c:if test="${pet.petTypeDetail == '아메리칸 밥테일'}">selected</c:if>>아메리칸 밥테일</option>
                                        <option value="아메리칸 쇼트헤어" <c:if test="${pet.petTypeDetail == '아메리칸 쇼트헤어'}">selected</c:if>>아메리칸 쇼트헤어</option>
                                        <option value="아비시니안" <c:if test="${pet.petTypeDetail == '아비시니안'}">selected</c:if>>아비시니안</option>
                                        <option value="윽시캣" <c:if test="${pet.petTypeDetail == '윽시캣'}">selected</c:if>>윽시캣</option>
                                        <option value="요크 초콜렛" <c:if test="${pet.petTypeDetail == '요크 초콜렛'}">selected</c:if>>요크 초콜렛</option>
                                        <option value="이그저틱 쇼트헤어" <c:if test="${pet.petTypeDetail == '이그저틱 쇼트헤어'}">selected</c:if>>이그저틱 쇼트헤어</option>
                                        <option value="이집션 마우" <c:if test="${pet.petTypeDetail == '이집션 마우'}">selected</c:if>>이집션 마우</option>
                                        <option value="자바니즈" <c:if test="${pet.petTypeDetail == '자바니즈'}">selected</c:if>>자바니즈</option>
                                        <option value="저먼 렉스" <c:if test="${pet.petTypeDetail == '저먼 렉스'}">selected</c:if>>저먼 렉스</option>
                                        <option value="제페니즈 밥테일" <c:if test="${pet.petTypeDetail == '제페니즈 밥테일'}">selected</c:if>>제페니즈 밥테일</option>
                                        <option value="친칠라" <c:if test="${pet.petTypeDetail == '친칠라'}">selected</c:if>>친칠라</option>
                                        <option value="카호마니" <c:if test="${pet.petTypeDetail == '카호마니'}">selected</c:if>>카호마니</option>
                                        <option value="코리안 숏헤어" <c:if test="${pet.petTypeDetail == '코리안 숏헤어'}">selected</c:if>>코리안 숏헤어</option>
                                        <option value="코리안 롱헤어" <c:if test="${pet.petTypeDetail == '코리안 롱헤어'}">selected</c:if>>코리안 롱헤어</option>
                                        <option value="터키쉬 앙고라" <c:if test="${pet.petTypeDetail == '터키쉬 앙고라'}">selected</c:if>>터키쉬 앙고라</option>
                                        <option value="페르시안" <c:if test="${pet.petTypeDetail == '페르시안'}">selected</c:if>>페르시안</option>
                                        <option value="기타종류" <c:if test="${pet.petTypeDetail == '기타 고먐미'}">selected</c:if>>기타 고먐미</option>
                                   </select>

                               <!-- option 수정할것 -->
                                <select size="1" id="birdTypeDetail" name="petTypeDetail" style="display: none;">
                                    <option value="금강 앵무" selected <c:if test="${pet.petTypeDetail == '금강 앵무'}">selected</c:if>>금강 앵무</option>
                                    <option value="닭" <c:if test="${pet.petTypeDetail == '닭'}">selected</c:if>>닭</option>
                                    <option value="뉴기니아 앵무" <c:if test="${pet.petTypeDetail == '뉴기니아 앵무'}">selected</c:if>>뉴기니아 앵무</option>
                                    <option value="사랑 앵무" <c:if test="${pet.petTypeDetail == '사랑 앵무'}">selected</c:if>>사랑 앵무</option>
                                    <option value="옐로우 코뉴어" <c:if test="${pet.petTypeDetail == '옐로우 코뉴어'}">selected</c:if>>옐로우 코뉴어</option>
                                    <option value="왕관 앵무" <c:if test="${pet.petTypeDetail == '왕관 앵무'}">selected</c:if>>왕관 앵무</option>
                                    <option value="카나리아" <c:if test="${pet.petTypeDetail == '카나리아'}">selected</c:if>>카나리아</option>
                                    <option value="패러킷" <c:if test="${pet.petTypeDetail == '패러킷'}">selected</c:if>>패러킷</option>
                                    <option value="기타종류" <c:if test="${pet.petTypeDetail == '기타 새'}">selected</c:if>>기타 새</option>
                            </select>
                                <select size="1" id="bugsTypeDetail" name="petTypeDetail" style="display: none;">
                                    <option value="나비" selected <c:if test="${pet.petTypeDetail == '나비'}">selected</c:if>>나비</option>
                                    <option value="딱정벌레" <c:if test="${pet.petTypeDetail == '딱정벌레'}">selected</c:if>>딱정벌레</option>
                                    <option value="무당벌레" <c:if test="${pet.petTypeDetail == '무당벌레'}">selected</c:if>>무당벌레</option>
                                    <option value="사마귀" <c:if test="${pet.petTypeDetail == '사마귀'}">selected</c:if>>사마귀</option>
                                    <option value="사슴벌레" <c:if test="${pet.petTypeDetail == '사슴벌레'}">selected</c:if>>사슴벌레</option>
                                    <option value="풍뎅이" <c:if test="${pet.petTypeDetail == '풍뎅이'}">selected</c:if>>풍뎅이</option>
                                    <option value="기타종류" <c:if test="${pet.petTypeDetail == '기타 곤충류'}">selected</c:if>>기타 곤충류</option>
                            </select>
                            <select size="1" id="rodeTypeDetail" name="petTypeDetail" style="display: none;">
                                <option value="고슴도치" selected <c:if test="${pet.petTypeDetail == '고슴도치'}">selected</c:if>>고슴도치</option>
                                <option value="기니피그" <c:if test="${pet.petTypeDetail == '기니피그'}">selected</c:if>>기니피그</option>
                                <option value="나무늘보" <c:if test="${pet.petTypeDetail == '나무늘보'}">selected</c:if>>나무늘보</option>
                                <option value="토끼" <c:if test="${pet.petTypeDetail == '토끼'}">selected</c:if>>토끼</option>
                                <option value="프랫" <c:if test="${pet.petTypeDetail == '프랫'}">selected</c:if>>프랫</option>
                                <option value="햄스터" <c:if test="${pet.petTypeDetail == '햄스터'}">selected</c:if>>햄스터</option>
                                <option value="하늘다람쥐" <c:if test="${pet.petTypeDetail == '하늘다람쥐'}">selected</c:if>>하늘다람쥐</option>
                                <option value="기타종류" <c:if test="${pet.petTypeDetail == '기타 설치류'}">selected</c:if>>기타 설치류</option>
                        </select>
                            <select size="1" id="reptTypeDetail" name="petTypeDetail" style="display: none;">
                                <option value="거북" selected <c:if test="${pet.petTypeDetail == '거북'}">selected</c:if>>거북</option>
                                <option value="개구리" <c:if test="${pet.petTypeDetail == '개구리'}">selected</c:if>>개구리</option>
                                <option value="도마뱀" <c:if test="${pet.petTypeDetail == '도마뱀'}">selected</c:if>>도마뱀</option>
                                <option value="뱀" <c:if test="${pet.petTypeDetail == '뱀'}">selected</c:if>>뱀</option>
                                <option value="자라" <c:if test="${pet.petTypeDetail == '자라'}">selected</c:if>>자라</option>
                                <option value="악어" <c:if test="${pet.petTypeDetail == '악어'}">selected</c:if>>악어</option>
                                <option value="기타종류" <c:if test="${pet.petTypeDetail == '기타 파충류'}">selected</c:if>>기타 파충류</option>
                        </select>
                            <select size="1" id="piscTypeDetail" name="petTypeDetail" style="display: none;">
                                <option value="구피" selected <c:if test="${pet.petTypeDetail == '구피'}">selected</c:if>>구피</option>
                                <option value="금붕어" <c:if test="${pet.petTypeDetail == '금붕어'}">selected</c:if>>금붕어</option>
                                <option value="네온테트라" <c:if test="${pet.petTypeDetail == '네온테트라'}">selected</c:if>>네온테트라</option>
                                <option value="라미레지" <c:if test="${pet.petTypeDetail == '라미레지'}">selected</c:if>>라미레지</option>
                                <option value="제브라다니오" <c:if test="${pet.petTypeDetail == '제브라다니오'}">selected</c:if>>제브라다니오</option>
                                <option value="베타" <c:if test="${pet.petTypeDetail == '베타'}">selected</c:if>>베타</option>
                                <option value="플라워혼" <c:if test="${pet.petTypeDetail == '플라워혼'}">selected</c:if>>플라워혼</option>
                                <option value="기타종류" <c:if test="${pet.petTypeDetail == '기타 어류'}">selected</c:if>>기타 어류</option>
                        </select>
                            <div style="">
                                <input id="writeType"  name="petTypeDetail" size="30" value="${pet.petTypeDetail}" <c:if test="${pet.petType == '직접 입력'}"></c:if>>
                            </div>
                                </div>
                            </div>
                            <br>
                            <div class="form-group">
                                <div class="col-xs-6">
                                    <label for="kind">증상</label>
                                    <input type="input" style="width: 40%;" class="form-control" name="symptom" id="kind" value="${pet.symptom}">
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

    <script>
        $(document).ready(function(){
            // 창이 열릴 때 기존에 체크된 라디오박스와 드롭박스가 보여지도록 설정 
            // if($("input[type=radio]:checked").val() == '${pet.petType}'){
            //     $("input[type=radio]:checked").show();
            // }
            // if($("option:selected]").val() == "${pet.petTypeDetail}") {
            //      $("option:selected]").select();
            // }
            fnSelectionChange();

            // 라디오버튼 클릭시 이벤트 발생
            $("input:radio[type=radio]").click(function(){
                fnSelectionChange();


            });
        });

 function fnSelectionChange() {
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

}else if($("input[type=radio]:checked").val() == "직접 입력"){
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
    console.log("${pet.petTypeDetail}")
    $("input[id=writeType]").attr("disabled",false);
    $("select[id=dogTypeDetail]").attr("disabled",true);
    $("select[id=catTypeDetail]").attr("disabled",true);
    $("select[id=birdTypeDetail]").attr("disabled",true);
    $("select[id=bugsTypeDetail]").attr("disabled",true);
    $("select[id=reptTypeDetail]").attr("disabled",true);
    $("select[id=piscTypeDetail]").attr("disabled",true);
    $("input[id=rodeTypeDetail]").attr("disabled",true);
}
 }
 
    </script>
    <script>
          let is_empty = document.querySelector("#uploader").value;
        
          $("#uploader_btn").on("click", function(e) {
              e.preventDefault();
              
              if(document.querySelector("#uploader").value === ''){
                  alert("파일 넣어주세요 !");
              }else{
                  $("#upload_form").submit();
              }
	});
    </script>
    </body>
    </html>
   