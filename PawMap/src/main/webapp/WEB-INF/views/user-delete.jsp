<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">

  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Site Metas -->
  <title>PawMap</title>
  <meta name="keywords" content="">
  <meta name="description" content="">
  <meta name="author" content="">

  <!-- Site Icons -->
  <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
  <link rel="apple-touch-icon" href="images/apple-touch-icon.png">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <!-- Site CSS -->
  <link rel="stylesheet" href="css/style.css">
  <!-- Responsive CSS -->
  <link rel="stylesheet" href="css/responsive.css">
  <!-- Custom_실비아 CSS -->
  <link rel="stylesheet" href="css/custom-실비아.css">
</head>

<body>	
  <!-- Start 회원탈퇴 타이틀 영역 -->
  <div class="pet-all-title-box">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <h2>회원탈퇴</h2>
        </div>
      </div>
    </div>
  </div>
  <!-- End 회원탈퇴 타이틀 영역 -->

	<form action="/userdelete", method="post">
		탈퇴를 원하시면 비밀번호를 입력해 주세요:
    <input type="password" name="pw" /><br />
    <button type="button" class="my-btn text-white text-weight-bold" id="btnUserdelete">탈퇴</button>
    <a href="#" class="my-btn text-white text-weight-bold">취소</a>
	</form>

  <script>
    $("#btnUserdelete").on("click", function() {
      $.ajax({
        async: true,
        type: 'POST',
        data: JSON.stringify(param),
        url: "userdelete",
        contentType: "application/json; carset=UTF=8",
        success: function(data) {
          alert("탈퇴가 처리되었습니다.");
          location.href = "/index2";
        },
        error: function(jqXHR, textStatus, errorThrown) {
          alert("ERROR:" + textStatus + ":" + errorThrown);
        }
      })
    });
  </script>
</body>
</html>