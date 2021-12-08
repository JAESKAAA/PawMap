<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ include file="layout/header.jsp" %>


    <!---------------------------------- 회원가입 폼 -------------------------->

    <section class="vh-100">
      <div class="container h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
          <div class="col-lg-12 col-xl-11">
            <div class="card text-black" style="border-radius: 25px">
              <div class="card-body p-md-5">
                <div class="row justify-content-center">
                  <div
                    class="
                      col-md-10 col-lg-6 col-xl-6
                      order-2 order-lg-1
                      left-div
                    "
                  >
                    <div class="column-div hospital-join">
                      <div>
                        <a class="btn-join-hospital" href="/pawmap/hospitalJoinForm">병원회원 가입</a>
                      </div>
                    </div>
                  </div>
                  <div
                    class="
                      col-md-10 col-lg-6 col-xl-6
                      order-2 order-lg-1
                      left-div
                    "
                  >
                    <div class="column-div nomal-join">
                      <div>
                        <a class="btn-join-nomal" href="/pawmap/userJoinForm"
                          >일반회원 가입</a
                        >
                      </div>
                    </div>
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
   
