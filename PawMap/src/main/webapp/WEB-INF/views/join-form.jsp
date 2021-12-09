<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ include file="layout/header.jsp" %>


    <!---------------------------------- 회원가입 폼 -------------------------->

  <section class="vh-100" style="padding-top:200px;">
    <div class="container h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-lg-6 col-xl-6" style="padding-bottom: 15px;">
          <div class="u_card text-black" style="border-radius: 25px">
            <div class="card-body p-md-5">
              <h4 class="ptitle">병원회원</h4>
              <p class="pr">위치기반으로 동물병원을
                <br class="pc">무료로 홍보할 수 있습니다.
              </p>
              <div class="join-icon">
                <i class="fas fa-hospital-alt"></i>
              </div>
                <div class="column-div hospital-join">
                  <div>
                    <a class="button button-gradient" href="/pawmap/hospitalJoinForm">병원회원 가입</a>
                  </div>
                </div>
            </div>
          </div>
        </div>
        <div class="col-lg-6 col-xl-6" style="padding-bottom: 15px;">
          <div class="u_card text-black" style="border-radius: 25px">
            <div class="card-body p-md-5">
              <h4 class="ptitle">일반회원</h4>
              <p class="pr">진료예약 및 진단서 조회를
                <br class="pc">할 수 있습니다.
              </p>
              <div class="join-icon">
                <i class="fas fa-users"></i>
              </div>
                <div>
                  <div class="column-div hospital-join">
                    <a class="button button-gradient" href="/pawmap/userJoinForm">일반회원 가입</a>
                  </div>
                </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

    <!---------------------------------- 회원가입 폼 종료 -------------------------->

<%@ include file="layout/footer.jsp" %>