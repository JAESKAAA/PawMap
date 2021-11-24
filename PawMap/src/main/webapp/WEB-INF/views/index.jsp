<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>TEST 용</title>
  </head>
  <body>
    <h1>유저 등록 TEST용 JSP</h1>

    <form action="join" method="POST">
      아이디 : <input type="text" name="user_id" /> 비밀번호 :
      <input type="password" name="user_password" /> 이름 :
      <input type="text" name="user_name" />
      <button type="submit">제출</button>
    </form>
  </body>
</html>
