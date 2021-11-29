<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ include file="layout/header.jsp" %>

    <!-- Start 회원정보 타이틀 영역 -->
    <div class="pet-all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>회원정보</h2>
                </div>
            </div>
        </div>
    </div>
    <!-- End 회원정보 타이틀 영역 -->

    <!-- Start 회원정보 영역-->
    <div class="container" style="margin-top: 5%; width: 50%;">
        <div class="input-form-backgroud row">
        <div class="input-form col-md-12 mx-auto">
            <form class="validation-form" action="/PawMap/infoForm" method="post" id="updateinfo">
                <div class="mb-3">
                    <label for="name">이름</label>
                    <input type="text" class="form-control" id="name" placeholder="이름" value="${UserVO.userName}" readonly/>
                </div>
                <div class="mb-3">
                    <label for="customer-id">아이디</label>
                    <input type="text" class="form-control" id="customer-id" placeholder="아이디" value="${UserVO.userID}" readonly/>
                </div>
            <div class="mb-3">
                <label for="password">비밀번호</label>
                <input type="password" class="form-control" id="password" placeholder="비밀번호 입력" maxlength="12" required/>
                <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
            </div>
            <div class="mb-3">
                <label for="password">비밀번호 확인</label>
                <input type="password" class="form-control" id="password" placeholder="비밀번호 재입력" maxlength="12" required/>
                <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
            </div>
            <div class="mb-3">
                <label for="nickname" style="width: 100%;">닉네임</label>
                <input type="text" style="display: inline-block; width: 70%;" class="form-control" id="nickname" value="${UserVO.userNickname}"/>
                <a href="#" class="my-btn text-white text-weight-bold">중복확인</a>
            </div>
            <div class="mb-3">
                <label for="phone">연락처</label>
                <input type="phone" class="form-control" id="phone" placeholder="000-0000-0000" value="${UserVO.userTelNum}"/>
            </div>
            <div class="mb-3">
                <label for="email" style="width: 100%;">이메일</label>
                <input type="email" style="display: inline-block; width: 70%;" class="form-control" id="email" placeholder="you@example.com" value="${UserVO.userEmail}"/>
                <a href="#" class="my-btn text-white text-weight-bold">중복확인</a>
            </div>
            <div class="mb-3">
                <label for="address">주소</label>
                <input type="text" class="form-control" id="address" value="${UserVO.address}"/>
            </div>
            <hr class="mb-4" />
            <div class="mb-4">
                <a href="#" class="my-btn text-white text-weight-bold">수정</a>
                <a href="/pawmap/userdelete" class="my-btn text-white text-weight-bold">회원탈퇴</a>
            </div>
            </div>
            </form>
        </div>
        </div>
    </div>
    <!-- End 회원정보 영역-->

    <%@ include file="layout/footer.jsp" %>