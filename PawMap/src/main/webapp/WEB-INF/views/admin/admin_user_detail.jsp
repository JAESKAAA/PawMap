<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ include file="../layout/admin_header.jsp" %>
<!--관리자가 회원정보 수정 페이지 시작...-->
<!--회원 정보 수정 제목 시작-->
<div class="u_container" style="border-radius:0px;">
	<div class="tbl-header" style="margin-left:0px; margin-right:0px;"> 
		<div class="row row-adminindex">
			<div>
				<h1 class="adminpagetoph1" style=" margin-top: 0px; margin-bottom:50px;">회원정보 수정</h1>	
			</div>
		</div>
	</div>

<!--
	<div class="u_container" style="border-radius:0px; margin-top:149px;">
		<div class="tbl-header" style="margin-left:0px; margin-right:0px;"> 
			<div class="row row-adminindex">
				<c:if test="${userList[0].userType == 'N'}">
					<h1 class="adminpagetoph1" style=" margin-top: 0px; margin-bottom:50px;">회원정보 관리</h1>
				</c:if>
				<c:if test="${userList[0].userType == 'H'}">
					<h1 class="adminpagetoph1" style=" margin-top: 0px; margin-bottom:50px;">병원정보 관리</h1>
				</c:if>
			</div>
		</div>-->
	<!--회원 정보 수정 제목 끝-->
	<!--회원 정보 수정 테이블 시작.-->
			<div id="adminusermanage" class="adminpagetablediv">
				<form action="/pawmap/admin/updateUser" method="post">
					<table class="u_join-table" style="margin-left: auto; margin-right: auto; text-align: center; border-top: none; border-bottom:none;">
					<tr>
						<td>ID:</td>
						<td><input id="userID" type="text" name="userId" value="${user.userId }" readonly></td>
					</tr>				
					<tr>
						<td>이름: </td>
						<td><input id="username" type="text" name="userName" value="${user.userName }"></td>
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
						<td><button class="adminpagebuttonformanage" style="width:158px;" type="button" onclick="fn_anickcheck();">중복체크</button>
							<p class="result"><span class="msg5">닉네임을 확인해주세요.</span></p></td>
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
				<div>
					<table style="margin-left:auto; margin-right:auto; margin-top: 27.5px; margin-bottom: 27.5px; text-align: center;">
					<tr>
						<td><button class="adminpagebuttonformanage" style="margin-right: 30px; width:158px;" type="submit">수정완료</button></td>
						<td><button class="adminpagebuttonformanage" style="margin-left: 30px; width:158px;" type="button" onclick="location.href='adminpage4usermanage-tom.html'">회원삭제</button></td>
					</tr>
			</div>
			</table>
				</form>
			</div>
		</div>

    
<%@ include file="../layout/admin_footer.jsp" %>
    