<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var ="pageTitle" value="로그인 비밀번호 찾기"/>
<!-- <%@ include file="./index.jsp"%>  -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/"/>



<div>
    <script>
    // 테스트 테이터 
         function makeTestData() {
             var form = document.FindLoginPasswordForm__submit;
             form.userId.value = '1111';
             form.userEmail.value = '1111@naver.com';
         }

    // 로그인 실패시
    function FindLoginPasswordForm__submit(form){
        if(isNoeLoading()) {
            alert('처리중입니다.');
            return;
        }

        form.userId.value = form.userId.value.trim();
        form.userId.value = form.userId.value.replaceAll('-','');
        form.userId.value = form.userId.value.replaceAll('_','');
        form.userId.value = form.userId.value.replaceAll(' ','');

        if(form.userId.value.length == 0) {
            form.userId.focus();
            alert('아이디를 입력해주세요.');
 

            return;
        }

        form.userEmail.value = form.userEmail.value.trim();
        form.userEmail.value = form.userEmail.value.replaceAll(' ','');

        if(form.userEmail.value.length == 0) {
            form.userEmail.focus();
            alert('이메일을 입력해주세요.');
          

            return;
        }
        form.submit();
        startLoading();
    }
    </script>

    // 테스트 테이터 
    <div class="con">
            <button onclick="makeTestData();">Test Data</button>
        </div>
 



    <h1>비밀번호 찾기</h1>
    <form action="forgotPw.do" method="POST" onsubmit="DoFindLoginPassword__submit(this); return false;">
        <input type="hidden" name="loginPwReal"/>
        <hr />
        <div>
            <div>아이디</div>
            <div>
                <input name="name" type="text" maxlength="50" placeholder="로그인 아이디를 입력하세요"/>
                </div>
        </div>

        <hr />
        <div>
            <div>이메일</div>
            <div>
                <input name="eamil" type="email" maxlength="50" placeholder="가입시 입력한 이메일을 입력하세요"/>
                </div>
        </div>

        <hr />
        <div>
        
            <div>
                <input  type="submit" value="로그인 비밀번호 찾기" />찾기
                <button type="button" onclick="history.back();">뒤로가기</button>
                </div>
        </div>
        </form>

</div>