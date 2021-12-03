<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="layout/admin_header.jsp" %>

  <!--adminmainvetmanagement-->
    <div> 
        <h1 style="text-align: center; font-size:30px; margin-top:5%;">회원정보 수정</h1>
    </div>
    <div style="margin-top: 40px; border-style: 3px solid orange ">
    	<form action="/pawmap/admin/updateUser" method="post">
	        <table style="margin-left: auto; margin-right: auto; text-align: center;">
	          <tr>
	              <td>이름: </td>
	              <td><input id="username" type="text" name="userName" value="${user.userName }"></td>
	          </tr>
	          <tr>
	              <td>ID:</td>
	              <td><input id="userID" type="text" name="userId" value="${user.userId }"></td>
	          </tr>
	          <tr>
	              <td>연락처:</td>
	              <td><input id="usercontactnumber" type="text" name="userTelNum" value="${user.userTelNum }"></td>
	          </tr>
	          <tr>
	              <td>이메일:</td>
	              <td><input id="usercontactnumber" type="text" name="userEmail" value="${user.userEmail }"></td>
	          </tr>
	          <tr>
	              <td>닉네임:</td>
	              <td><input id="user_nickname" type="text" name="userNickname" value="${user.userNickname }"></td>
                <td><button type="button" onclick="fn_anickcheck();">중복체크</button></td>
	          </tr>
	          <tr>
	            <td>주소:</td>
	            <td><input id="useraddress" type="text" name="address"  value="${user.address }"></td>
	        </tr>
	          <tr>
	            <td>사업자 등록 번호</td>
	            <td><input id="useraddress" type="text" name="comNum" value="${user.comNum }"></td>
	        </tr>
	        </table>
	        </div>
    <div style="margin-top: 40px">
      <table style="margin-left:auto; margin-right:auto; text-align: center;">
            <tr>
                <td><button style="margin-right: 30px;" type="submit">수정완료</button></td>
                <td><button style="margin-left: 30px;" type="button" onclick="location.href='adminpage4usermanage-tom.html'">회원삭제</button></td>
            </tr>
      </table>
      </div>
    	</form>
    

<%@ include file="layout/admin_footer.jsp" %>