<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="layout/header.jsp" %>

<!DOCTYPE html>
<html lang="kor">
<!-- Basic -->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <title>adminpageassociatedvetcentermanagement</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="../css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="../css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="../css/custom.css">
    
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
  <!--Thomas lee started working on this page since nov 16th-->
    <div class="main-top">
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="our-link" style="float:right;">
              <ul>
                <li><a href="#">로그아웃</a></li>
              </ul>
            </div>
            <div class="our-link" style="float:right">
              <ul class="offer-box">
                <!--thomas's comment: 상기 offer-box 태그로 인해 하기 li 태그들은 Border-right에 하얀 선이 나왔고 해당 사유로 하기 태그들은 스타일을 없앴음.-->
                <li style="border-right:none; font-size:14px;">관리자페이지 입니다.</li>
                <li style="border-right:none; font-size:14px;">Admin Page</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  <!-- admin페이지의 header 시작...-->
  <header class="main-header">
    <!-- Start Navigation --> <!--하기 navbar navbar-expand-lg를 md로 교체-->
    <nav class="navbar navbar-expand-md navbar-light bg-light navbar-default bootsnav">
        <div class="container">
            <!-- Start Header Navigation -->
            <div class="navbar-header">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-menu" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fa fa-bars"></i>
            </button>
                <a class="navbar-brand" href="index.html"><img src="images/pawmaplogo.png" class="logo" alt="" width="216" height="118"></a>
            </div>
            <!-- End Header Navigation -->

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="navbar-menu">
                <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                    <li class="nav-item active"><a class="nav-link" href="adminpage2vetmange-tom.html"> 제휴병원 관리</a></li>
                    <li class="nav-item"><a class="nav-link" href="adminpage4usermanage-tom.html"> 회원정보 관리</a></li>
                    <li class="nav-item"><a class="nav-link" href="adminpage6sheltermanage-tom.html"> 보호소정보 관리</a></li>
                    <li class="nav-item"><a class="nav-link" href="adminpage9communitymanage-tom.html"> 커뮤니티 게시판 관리</a></li>
                    <li class="nav-item"><a class="nav-link" href="adminpage11counseloneonone-tom.html"> 1:1 상담 관리</a></li>
                    <li class="nav-item"><a class="nav-link" href="adminpage13donationmanage-tom.html"> 후원금 관리</a></li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
    </nav>
    <!-- End Navigation --> <!--관리자 페이지 공통 부분 완료...-->
  </header>
  <!--adminmainvetmanagement-->
    <div> 
        <h1 style="text-align: center; font-size:30px; margin-top:5%;">보호소정보 수정</h1>
    </div>
    <div style="margin-top: 40px; border-style: 3px solid orange ">
      <table style="margin-left: auto; margin-right: auto; text-align: center;">
        <form name="updateForm" action="/pawmap/admin/updateShelterForm/api" method="POST">
          <input type="hidden" name="shelterSeq" value="${getShelter.shelterSeq}">
        <tr>
            <td>사업자등록번호 </td>
            <td>
                    <!-- <input type="hidden" id="comNum" type="text" value="${getShelter.comNum}"> -->
                    <input type="text" id="comNum" name="comNum" placeholder="${getShelter.comNum}" value="${getShelter.comNum}"> </td>
        </tr>
        <tr>
            <td>보호소 명</td>
            <td><input id="shelterName" type="text"  name="shelterName" value="${getShelter.shelterName}" placeholder="보호소명"></td>
        </tr>
        <tr>
            <td>주소</td>
            <td><input id="shelterAddress" type="text"  name="shelterAddress" value="${getShelter.shelterAddress}" placeholder="주소"></td>
        </tr>
        <tr>
            <td>연락처:</td>
            <td><input id="shelterTel" type="text" name="shelterTel" value="${getShelter.shelterTel}" placeholder="연락처" ></td>
        </tr>
        <tr>
          <td>상세정보</td>
          <td><input id="content" type="text" name="content" value="${getShelter.content}" placeholder="상세정보" ></td>
        </tr>
    </form>
        <tr>
          <td>사진첨부</td>
          <td>
            <c:choose>
                <c:when test="${empty fileList}">
                    <form action="updateShelterFormInsertFiles" method="POST" enctype="multipart/form-data">
                        <!-- <h5>파일이 없을떄 ${fileList}</h5> -->
                        <!-- <div class="r form-group ml-5">
                            <div class="col-sm-10 col-sm-offset-2">
                                <div class="row form-group">  
                                    <div class="col-10 col-md-6">  
                                        <div class="control-group" id="fields">  
                                            <div class="controls">   -->
                                                <div class="entry input-group upload-input-group">  
                                                    <input class="form-control btn-file-upload" name="uploadFiles" multiple="multiple" type="file" style="width:60%;display:inline;" /> 
                                                    <input type="hidden" name="shelterName"  value="${getShelter.shelterName}">
                                                    <input type="hidden" name="boardSeq"  value="${getShelter.shelterSeq}">
                                                    <!-- <h1>${getShelter.shelterName}</h1>
                                                      <h1>${getShelter.shelterSeq}</h1> -->
                                                    </div>  
                                                    현재 첨부된 파일 : 없음
                                                    <div class="entry input-group upload-input-group">  
                                                    <button type="submit" class="btn btn-outline-primary btn-sm fileBtn">파일 등록</button>
                                                <!-- </div>  
                                            </div>  
                                        </div>  
                                    </div>  
                                </div>  
                            </div> -->
                        </div>
                    </form> 
                </c:when>
            </c:choose>

            <!-- 파일 삭제만 가능.... -->
            <c:choose>
                <c:when test="${!empty fileList}">
                    <c:forEach var="fileList" items="${fileList}" varStatus="i">
                        <form action="separateDeleteFileOnShelectForm" method="POST">
                            <!-- <div class="r form-group ml-5">
                                <div class="col-sm-10 col-sm-offset-2">
                                    <div class="row form-group">  
                                        <div class="col-10 col-md-6">  
                                            <div class="control-group" id="fields">  
                                                <div class="controls">   -->
                                                    <div class="entry input-group upload-input-group">  
                                                      <div style="width: 300px;">
                                                        현재 첨부된 파일 : ${fileList.originalFileName} 
                                                    </div>
                                                        <input type="hidden" name="fileSeq" class="hiddenFileSeq" value="${fileList.fileSeq}">
                                                        <input type="hidden" name="boardSeq" class="hiddenBoardSeq" value="${fileList.boardSeq}">
                                                    </div>  
                                                    <div class="entry input-group upload-input-group">  
                                                        <!-- <button type="submit" class="btn btn-outline-danger">파일삭제</button> -->
                                                        <!-- <span type="submit"class="btn btn-outline-primary btn-sm fileBtn" fileTask="U">파일 변경 (구현중)</span> -->
                                                        <span type="submit" class="btn btn-outline-danger btn-sm fileBtn" fileTask="D">파일삭제</span>
                                                    <!-- </div>  
                                                </div>  
                                            </div>  
                                        </div>  
                                    </div>  
                                </div> -->
                            </div>
                        </form>
                    </c:forEach>
                </c:when>
            </c:choose>

<!-- 수정하다 만거 -->
            <!-- <c:choose>
              <c:when test="${!empty getShelter.originalFileName}">
                <c:forEach var="fileList" items="${fileList}" varStatus="i">
                  <form action="updateShelterFormInsertFiles" method="POST" enctype="multipart/form-data"  target="dummyframe">
                    <input type="hidden" name="fileSeq" value="${fileList.fileSeq}" />
                    <input type="hidden" name="boardSeq" value="${fileList.boardSeq}" />
                    <input type="hidden" name="boardType"  value="${fileList.boardType}" />
                    <input type="hidden" name="userId" value="${fileList.userId}" />
                    <input type="hidden" name="originalFileName" value="${fileList.originalFileName}" />
                    <input type="hidden" name="fileTask" value="" />
                    <input class="form-control btn-file-upload" name="uploadFiles" multiple="multiple" type="file" style="width:60%;display:inline;" />
                    <div style="width: 400px;">
                      첨부된 파일 : ${fileList.originalFileName}
                    </div>
                    <span class="btn btn-outline-primary btn-sm fileBtn" fileTask="U">파일 변경 (구현중)</span>
                    <span class="btn btn-outline-danger btn-sm fileBtn" fileTask="D">파일삭제</span>
                  </form>
                </c:forEach>
              </c:when>
              <c:otherwise>
                <form action="updateShelterFormInsertFiles" method="POST" enctype="multipart/form-data"  target="dummyframe"> -->
                  <!-- value 삭제 -> form만 둠 -->
                  <!-- <input type="hidden" name="fileSeq" value="" />
                  <input type="hidden" name="boardSeq" value="" />
                  <input type="hidden" name="boardType"  value="" />
                  <input type="hidden" name="userId" value="" />
                  <input type="hidden" name="originalFileName" value="" />
                  <input type="hidden" name="fileTask" value="" />
                  <input class="form-control btn-file-upload" name="uploadFiles" multiple="multiple" type="file" style="width:60%;display:inline;"/>
                  <div style="width: 400px;">
                    첨부된 파일 : 없음
                  </div>
                  <span class="btn btn-outline-primary btn-sm fileBtn" fileTask="U">파일 변경 (구현중)</span>
                  <span class="btn btn-outline-danger btn-sm fileBtn" fileTask="D">파일삭제</span>
                </form>
              </c:otherwise>
            </c:choose> -->
          </td>
      </tr>
          <!-- Form body here -->
      </form>
        <!--<tr>
          td>
            < 파일 삭제만 가능(결님 코드) 
            <c:choose>
              <c:when test="${!empty getShelter.originalFileName}">
                <c:forEach var="fileList" items="${fileList}" varStatus="i">
                  <form action="separateDeleteFileOnShelectForm" method="POST">
                    <h5>${getShelter.originalFileName}</h5> 
                    <input type="hidden" name="fileSeq" class="hiddenFileSeq" value="${fileList.fileSeq}">
                    <input type="hidden" name="boardSeq" class="hiddenBoardSeq" value="${fileList.boardSeq}">
                    <div class="entry input-group upload-input-group"> 
                      <button type="submit" class="btn btn-outline-danger">파일삭제</button>
                    </div>
                  </form>
                </c:forEach>
            </c:when>
          </c:choose>
        </td
      </tr>-->
      <tr>
        <td rowspan="2"><span id="submitBtn"  class="btn btn-complete">제출</button></td>
      </tr>
</table>
<iframe name="dummyframe" id="dummyframe" style="display: none;"></iframe>




    <!-- ALL JS FILES -->
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="../js/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <!-- ALL PLUGINS -->
    <script src="../js/jquery.superslides.min.js"></script>
    <script src="../js/bootstrap-select.js"></script>
    <script src="../js/inewsticker.js"></script>
    <script src="../js/bootsnav.js."></script>
    <script src="../js/images-loded.min.js"></script>
    <script src="../js/isotope.min.js"></script>
    <script src="../js/owl.carousel.min.js"></script>
    <script src="../js/baguetteBox.min.js"></script>
    <script src="../js/form-validator.min.js"></script>
    <script src="../js/contact-form-script.js"></script>
    <script src="../js/custom.js"></script>
    


</body>
    <!-- 글 수정관련 스크립트 -->
<script>
    function fnUpdateShelterForm(obj) {
    if(confirm("글을 수정합니까?") == true) { // 확인
        location.href='/pawmap/admin/updateShelterForm/api/${getShelter.shelterSeq}';
            } else { //취소
            return;
            }
    };


    $(function() {
      // ■ 파일 업로드
      $('.fileBtn').click(function() {
          let fileTask = $(this).attr("fileTask");

          if(fileTask == "U" && $(this).siblings('input[name=uploadFiles]').val() == '') {
            alert("변경할 파일을 먼저 선택해주세요!");
            return false;
          }

          let taskName = "변경";
          if(fileTask == "D") taskName = "삭제";
          if(confirm(taskName + "하시겠습니까?")) {
                $('input[name=fileTask]').val(fileTask);
                $(this).closest("form").submit();
          }
      });
      
      // ■ [제출] 버튼 클릭 이벤트
      $('#submitBtn').click(function() {
        if(confirm("수정하시겠습니까?")) {
          $('form[name=updateForm]').submit();
        } else { //취소
          return;
        }
      });
    });
</script>




<!-- 
    <script>
      // id값으로 이동 - 메소드
      		$("#update-shelter-form").on("click",()=>{
			this.updateShelterForm();
		});
    </script>

    <script>
      let index = {
      	updateShelterForm:function(){
		let shelterSeq = $("#shelterSeq").val();
		
		let data = {
			shelterSeq: $("#shelter_seq").val(),
			comNum : $("#com_num").val(),
			shelterName : $("#shelter_name").val(),
      shelterAddress : $("#shelter_address").val(),
      shelterTel : $("shelter_tel").val(),
			content: $("#content").val()
		};
		alert("글 수정시 뜨는 알람");
		console.log("updateShelterForm:function 탐, shelterSeq ==="+shelterSeq+"data =======: "+ data);
		$.ajax({
			type: 'POST',
			url: "/pawmap/admin/updateShelterForm/api/"+shelterSeq,
			data : JSON.stringify(data),
			contentType : 'application/json; charset=utf-8',
      processData: false, 
      contentType: false,
			success : function() {
				alert("글 수정 통과 알람");
				location.href ="shelterList?shelterSeq="+shelterSeq
			},
			error : function(e) {
				console.log(e);
			}
		});
	}
} -->
    </script>

<%@ include file="layout/footer.jsp" %>
</html>