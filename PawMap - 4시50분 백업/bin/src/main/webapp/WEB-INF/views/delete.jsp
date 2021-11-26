<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, member.DBBean"
  %>
  <% request.setCharacterEncoding("utf-8"); %>

    <html>
    <% String id=(String) session.getAttribute("id"); String passwd=request.getParameter("passwd"); DBBean
      delete=DBBean.getInstance(); int check=delete.deleteMember(id, passwd); if (check==1) { session.invalidate(); %>
      <center>
        <form action="LoginForm.jsp" method="post">
          <b>
            <h2>회원정보가 삭제되었습니다.</h2>
          </b>
          <input type="submit" value="확인">
        </form>
        <% } else { %>
          <script language="javascript">
            alert("비밀번호가 맞지 않습니다.");
            history.go(-1);
 <%}%>

          </script>
      </center>

    </html>