<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ include file="layout/admin_header.jsp" %>

  <!--adminmainpage-->
  <div class="my-account-box-main">
    <div class="container">
      <div class="row row-adminindex">
            <div class="col-lg-4 col-md-12">
                <div class="account-box">
                    <div class="service-box">
                        <div class="service-icon">
                            <a href="/pawmap/getHospitalList"> <i class="far fa-hospital"></i> </a>
                        </div>
                        <div class="service-desc">
                            <h4>제휴병원 관리</h4>
                            <p>제휴된 동물 병원 정보 관리 및 수정</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-12">
                <div class="account-box">
                    <div class="service-box">
                        <div class="service-icon">
                            <a href="/pawmap/getUserList"><i class="fas fa-user-cog"></i> </a>
                        </div>
                        <div class="service-desc">
                            <h4>회원정보 관리</h4>
                            <p>회원정보 관리 및 수정</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row row-adminindex">
            <div class="col-lg-4 col-md-12">
                <div class="account-box">
                    <div class="service-box">
                        <div class="service-icon">
                            <a href="/pawmap/admin/getShelterList"> <i class="fas fa-building"></i> </a>
                        </div>
                        <div class="service-desc">
                            <h4>보호소정보 관리</h4>
                            <p>동불 보호소 정보 관리 및 수정</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-12">
                <div class="account-box">
                    <div class="service-box">
                        <div class="service-icon">
                            <a href="/pawmap/admin/communityManage"> <i class="fas fa-clipboard-list"></i> </a>
                        </div>
                        <div class="service-desc">
                            <h4>커뮤니티 게시판 관리</h4>
                            <p>커뮤니티 게시판 관리 및 수정</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      </div>
    </div>
  <!-- Start showing the summary of the each section(병원관리, 유저관리, 등등)-->
  <div class="cart-box-main">
    <div class="container">
        <div class="row">
            <div class="col-sm-6 col-lg-6 mb-3">
                <div class="title-left">
                    <h3>제휴 병원 관리</h3>
                </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="firstName">병원 이름</label>
                            <div class="invalid-feedback"> Valid first name is required. </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <input type="text" class="form-control" id="lastName" placeholder="이곳에 최근 등록된 병원 이름 3개만 표출..." value="" required>
                            <div class="invalid-feedback"> Valid last name is required. </div>
                        </div>
                    </div>     
            </div>
            <div class="col-sm-6 col-lg-6 mb-3">
                <div class="title-left">
                    <h3>회원정보 관리</h3>
                </div>
                <h5><a data-toggle="collapse" href="#formRegister" role="button" aria-expanded="false">Click here to Register</a></h5>
                <form class="mt-3 collapse review-form-box" id="formRegister">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="InputName" class="mb-0">First Name</label>
                            <input type="text" class="form-control" id="InputName" placeholder="First Name"> </div>
                        <div class="form-group col-md-6">
                            <label for="InputLastname" class="mb-0">Last Name</label>
                            <input type="text" class="form-control" id="InputLastname" placeholder="Last Name"> </div>
                        <div class="form-group col-md-6">
                            <label for="InputEmail1" class="mb-0">Email Address</label>
                            <input type="email" class="form-control" id="InputEmail1" placeholder="Enter Email"> </div>
                        <div class="form-group col-md-6">
                            <label for="InputPassword1" class="mb-0">Password</label>
                            <input type="password" class="form-control" id="InputPassword1" placeholder="Password"> </div>
                    </div>
                    <button type="submit" class="btn hvr-hover">Register</button>
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6 col-lg-6 mb-3">
                <div class="title-left">
                    <h3>동물 보호소 관리</h3>
                </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="firstName">보호소 이름</label>
                            <div class="invalid-feedback"> Valid first name is required. </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <input type="text" class="form-control" id="lastName" placeholder="이곳에 최근 등록된 보호소 이름 3개 표출" value="" required>
                            <div class="invalid-feedback"> Valid last name is required. </div>
                        </div>
                    </div>     
            </div>
            <div class="col-sm-6 col-lg-6 mb-3">
                <div class="title-left">
                    <h3>커뮤니티 관리</h3>
                </div>
                <h5><a data-toggle="collapse" href="#formRegister" role="button" aria-expanded="false">Click here to Register</a></h5>
                <form class="mt-3 collapse review-form-box" id="formRegister">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="InputName" class="mb-0">First Name</label>
                            <input type="text" class="form-control" id="InputName" placeholder="First Name"> </div>
                        <div class="form-group col-md-6">
                            <label for="InputLastname" class="mb-0">Last Name</label>
                            <input type="text" class="form-control" id="InputLastname" placeholder="Last Name"> </div>
                        <div class="form-group col-md-6">
                            <label for="InputEmail1" class="mb-0">Email Address</label>
                            <input type="email" class="form-control" id="InputEmail1" placeholder="Enter Email"> </div>
                        <div class="form-group col-md-6">
                            <label for="InputPassword1" class="mb-0">Password</label>
                            <input type="password" class="form-control" id="InputPassword1" placeholder="Password"> </div>
                    </div>
                    <button type="submit" class="btn hvr-hover">Register</button>
                </form>
            </div>
        </div>
    </div>
  </div>

<%@ include file="layout/admin_footer.jsp" %>

