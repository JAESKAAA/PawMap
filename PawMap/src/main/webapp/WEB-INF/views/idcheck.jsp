<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>아이디 중복 체크</title>
  
  <style>
    #div1 {
      font-size: 14px;
      font-weight: bold;
      width: 100%;
      height: 190px;
      background-color: aquamarine;
      text-align: center;
      vertical-align: middle;
      line-height: 2.0;
    }
  </style>
</head>
<body>
  <div id="div1">
    <br><br>
    <%
    if(cnt == 0) {
      out.print("사용 가능한 아이디 입니다.");
    %>
    
    <script>
      opener.document.joinForm.chk.value = "1";
    </script>


    <% 
    } else {
      out.print("이미 사용중인 아이디 입니다.");
      %>

      <script>
        opener.document.joinForm.chk.value = "0";
      </script>

      <%
    }
      %>
    <br><br>
    <button type="button" onclick="self.close()">닫기</button>
  </div>
</body>
</html>