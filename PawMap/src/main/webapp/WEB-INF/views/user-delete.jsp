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

<% String id="" ; id=(String) session.getAttribute("id"); if (id==null || id.equals("")) {
  response.sendRedirect("LoginForm.jsp"); } else { %>
  <center>

    <body onload="begin()">

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

      <hr>
      <br>
      <form name="deleteform" action="userdelete" method="post" onSubmit="return checkIt()">
        <table border="3" bordercolor="skyblue">
          <tr>
            <td width="80" align="center">비밀번호</td>
            <td>
              <input type="password" name="passwd" style="text-align: right;">
            </td>
          </tr>
        </table>
        <br>
        <input type="submit" value="회원탈퇴">
        <input type="button" value="취소" onclick="javascript:window.location='UserVO'">
      </form>
    </body>
  </center>
  <% } %>
    <script language="javascript">
      function begin() {
        document.deleteform.password.focus();
      }
      function checkIt() {
        if (!document.deleteform.password.value) {
          alert("비밀번호를 입력해주세요");
          document.deleteform.password.focus();
          return false;
        }
      }
    </script>
    </body>
</html>

