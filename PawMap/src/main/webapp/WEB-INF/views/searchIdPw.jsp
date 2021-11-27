<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<c:set var ="pageTitle" value="로그인 비밀번호 찾기"/>
<html lang="ko">
  <!-- Basic -->

  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Site Metas -->
    <title>Freshshop - Ecommerce Bootstrap 4 HTML Template</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <!-- Site Icons -->
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <!-- Site CSS -->
    <link rel="stylesheet" href="css/style.css" />
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css" />
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/custom.css" />

    <!-- 결 커스텀 css -->
    <link rel="stylesheet" href="css/style-gyul.css" />

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <style> 
      .modal { 
        position: absolute; 
        /* visibility: hidden; */
         display:none ;
        width: 100%; 
        height: 50%; 
        background-color: white;
        border-radius: 2%;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        box-shadow : rgba(0,0,0,0.3) 0 0 0 9999px, rgba(0,0,0,0.3) 1px 1px 2px 2px;
        z-index : 100;
        overflow: hidden;
        animation-name: modalopen;
    animation-duration: var(--modal-duration);
        margin: 10%;

        /* display: table; */
       
        vertical-align: middle;
         } 
    
        .close {
          position: absolute;
          top: 10px;
          right: 10px;
    
        }

         /* .modal-back {
          position: fixed;
          top: 0;
          left: 0;
          width: 100%;
          height: 100%;
          background-color: rgba(0, 0, 0, 0.3);
          z-index: -1;
        } */

        .samsam {
          padding: 10%;
          
        }

        </style>
   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/"></script>
  </head>



  <body>
    

  

    <!---------------------------------- 비밀번호 찾기 폼 시작 -------------------------->
    
    <div class="container-fluid">
      <div class="row justify-content-center ">
        <div class="col-12 col-sm-10 col-md-12 col-lg-11 col-xl-10">
          <div class="card-loginForm d-flex mx-auto my-5">
            <div class="row">
              <div class="col-md-5 col-sm-12 col-xs-12 c1-loginForm p-5">
                <div class="row mb-5 m-3">
                  <img src="" width="70vw" height="55vh" alt="" />
                </div>
                <img
                src="images/gyul_animals_img-001.jpg"
                width="250vw"
                height="120vh"
                class="mx-auto d-flex"
                style="border-radius: 30px"
                />
                <div class="row justify-content-center">
                  <div
                  class="
                  w-75
                  mx-md-5 mx-1 mx-sm-2
                  mb-5
                  mt-4
                  px-sm-5 px-md-2 px-xl-1 px-2
                  "
                  >
                    <h1 class="wlcm">Welcome PawMap</h1>
                  </div>
                </div>
              </div>
              <div class="col-md-7 col-sm-12 col-xs-12 c2 px-5 pt-5">
                
                
                
                <div style="margin-bottom: 10px;"
                class="custom-control custom-radio custom-control-inline">
                <input type="radio" class="custom-control-input" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
                <label class="custom-control-label font-weight-bold text-black"	for="search_1">아이디 찾기</label>
              </div>
              <div class="custom-control custom-radio custom-control-inline">
                <input type="radio" class="custom-control-input" id="search_2" name="search_total" onclick="search_check(2)"> 
                <label class="custom-control-label font-weight-bold text-black" for="search_2">비밀번호 찾기</label>
              </div>
              
              
              
                              <!-- 아이디 표출 모달-->
                              <div id="modal"  class="modal" role="dialog">
                                <div class="samsam">
                                <div class="modal_header">
                                    <h4>손님 아이디는?</h4><span class="close">&times;</span>
                                   <br>
                                  </div>
                                  <br>
                                  <br>
                                    <div class="modal_contents">
                                      <h2 id="id_value"></h2>
                                    <br>
                              
                                  </div>
                                </div>  
                                  <div class="modal-back"></div>
                                </div>
                              
                            




                  <div  id="searchI" method="POST">
                    <!-- action="searchIdPw"  name="forgotId"-->
                    <div class="form-group" >
                      <label class="font-weight-bold " for="userName">이름</label>
                      <div>
                        <input type="text" class="form-control" id="userName" name="userName" required="required" autofocus="autofocus" placeholder="ex) 은혜">
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="font-weight-bold " for="userTelNum">전화번호</label>
                      <div>
                        <input type="text" class="form-control" id="userTelNum"	name="userTelNum" required="required" placeholder="ex) 010-1111-1111">
                      </div>
                    </div>
                    <div class="form-group">
                      <!-- <button id="searchBtn" type="button"  onclick="idSearch_click()"  data-toggle="modal"	href="#" data-target=".modal" class="btn btn-primary btn-block">확인</button> -->
                      <!--  type="button"  -->
                      <button id="searchBtn" type="button" onclick="idSearch_click()" class="btn btn-primary btn-block">확인</button>
                      <a class="btn btn-outline-danger btn-block" onclick="history.back();" style="color: red;" >취소</a>
                  </div>
                </div>







               
                <form action="searchPw" id="searchP" style="display: none;"  name="forgotPw" method="POST">
                  <div class="form-group" >
                    <label class="font-weight-bold " for="userId">아이디</label>
                    <div>
                      <input type="text" class="form-control" id="userId" name="userId" required="required" autofocus="autofocus" placeholder="ex) ampawmap">
                    </div>
                  </div>
                  <div class="form-group" >
                    <label class="font-weight-bold " for="userName">이름</label>
                    <div>
                      <input type="text" class="form-control" id="userName" name="userName" required="required" autofocus="autofocus" placeholder="ex) 고결">
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="font-weight-bold " for="userEmail">이메일</label>
                    <div>
                      <input type="email" class="form-control" id="userEmail"	name="userEmail" type="email" placeholder="ex) ampawmap@gmail.com">
                    </div>
                  </div>
                  <div class="form-group">
                    <button id="searchBtn2" type="submit" class="btn btn-primary btn-block">확인</button>
                  <a class="btn btn-outline-danger btn-block"	onclick="history.back();">취소</a>
                </div>
                </form>
              

        </div>
    </div>
</div>
</div>
</div>
</div>

<script>


  $(document).ready(function() {
  /////////모///달///기///능///////////
  // 1. 모달창 히든 불러오기
  $('#searchBtn').click(function() {
   $('#modal').show();
  });
  // 2. 모달창 닫기 버튼
  $('.close').on('click', function() {
    $('#modal').hide();
  });
  // 3. 모달창 위도우 클릭 시 닫기
  $(window).on('click', function() {
    if (event.target == $('#modal').get(0)) {
            $('#modal').hide();
         }
  });
});
  // 아이디찾기 화면, 비밀번호 찾기화면 선택하는 스크립트 
  //체크 버튼에 따라 아이디/비밀번호 기능이 달라진다
    function search_check(num) {
      if (num == '1') {
        document.getElementById("searchP").style.display = "none";
        document.getElementById("searchI").style.display = "";	
      } else {
        document.getElementById("searchI").style.display = "none";
        document.getElementById("searchP").style.display = "";
      }
    }
    


  // 아이디 & 스토어 값 저장하기 위한 변수
	var idV = "";
	// 아이디 값 받고 출력하는 ajax
	var idSearch_click = function(){
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/pawmap/searchIdPw?userName="
					+$('#userName').val()+"&userTelNum="+$('#userTelNum').val(),
			success:function(data){
				if(data == 0){
					$('#id_value').text("회원 정보를 확인해주세요!");	
				} else {
					$('#id_value').text(data);
					// 아이디값 별도로 저장
					idV = data;
				}
			}
		});
	}



 
</script>

                                
</body>
</html>
