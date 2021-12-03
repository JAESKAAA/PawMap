<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="layout/admin_header.jsp" %>
  <!--관리자의 제휴 병원 관리 리스트 페이지 시작-->
        <div class="tbl-header"> 
            <h1 class="adminpagetoph1">제휴 병원 관리</h1>
        </div>
        <!-- search 버튼 시작 -->
        <div class="row tbl-header">
          <div class="main-search-input-wrap" >
              <div class="main-search-input fl-wrap">
                  <div class="main-search-input-item"> 
                      <input type="text" value="" placeholder="검색창입니다."> 
                  </div> 
                <button class="main-search-button">Search</button>
              </div>
          </div>
        </div>
        <!--search button finished...-->
        <!--제휴병원 관리 리스트 부분시작...-->
        <!--nov25th, table style margin left and right were changed from auto to 3%, colgroup were added with width % value -->
          <div id="adminvetmanage" class="adminpagetablediv">
            <table class="table-striped table-hover adminpagetable">
              <colgroup>
                <col>
                <col>
                <col>
                <col>
                <col>
                <col>
                <col>
                <col>
                <col>
                <col >
              </colgroup>
              <thead class="admintablehead"> 
                  <tr>
                      <th class="admin-userseq">#</th>
                      <th class="admin-userid">병원아이디</th>
                      <th class="admin-useremail">병원이메일</th>
                      <th class="admin-username">병원이름</th>
                      <th class="admin-usertelnum">병원연락처</th>
                      <th class="admin-address">병원주소</th>
                      <th class="admin-comnum">사업자등록번호</th>
                      <th class="admin-role">종류</th>
                      <th class="admin-userregdate">회원등록일</th>
                      <th class="admin-useractionbutton"></th>
                  </tr>
                </thead>
                <tbody>
                 <c:forEach var="user" items="${userList }">
		            <tr>
		                <td class="admin-userseq">${user.userSeq }</td>
		                <td class="admin-userid">${user.userId }</td>
		                <td class="admin-useremail">${user.userEmail }</td>
		                <td class="admin-username">${user.userName }</td>
		                <td class="admin-usertelnum">${user.userTelNum }</td>
                    <td class="admin-address">${user.address }</td>
                    <td class="admin-comnum">${user.comNum }</td>
                    <td class="admin-role">${user.role }</td>
                    <td class="admin-userregdate">${user.userRegDate }</td>
		                <td class="admin-useractionbutton"><button class="adminpagebuttonformanage" type="button" onclick="location.href='adminpage5usermodify-tom.html'">관리하기</button></td>
		            </tr>
       			</c:forEach>
                </tbody>
              </table>
          </div>
  <!--제휴 병원 관리 테이블 리스트 끝-->
    <!--페이지 네비게이션 시작-->
    <div class="row mt-2">
      <div class="col-12" style="margin-top: 40px;">
        <nav aria-label="Page navigation example">
          <ul class="pagination justify-content-center">
              <li class="page-item"><a class="page-link" href="#">Previous</a></li>
              <li class="page-item"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item"><a class="page-link" href="#">4</a></li>
              <li class="page-item"><a class="page-link" href="#">5</a></li>
              <li class="page-item"><a class="page-link" href="#">Next</a></li>
          </ul>
        </nav>
      </div>
    </div>
    <!--페이지 네비게이션 종료-->

    <%@ include file="layout/admin_footer.jsp" %>