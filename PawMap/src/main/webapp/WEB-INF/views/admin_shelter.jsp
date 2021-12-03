<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="layout/admin_header.jsp" %>
<!--관리자의 회원정보 관리 페이지 시작...-->
    <div class="tbl-header"> 
        <h1 class="adminpagetoph1">보호소정보 관리</h1>
    </div>
        <!-- search 버튼 시작 -->
        <div class="row tbl-header">
          <div class="main-search-input-wrap" >
              <div class="main-search-input fl-wrap">
                  <div class="main-search-input-item"> 
                      <input type="text" value="" placeholder="검색창입니다...."> 
                  </div> 
                <button class="main-search-button">Search</button>
              </div>
          </div>
        </div>
        <!--search button finished...-->
        <!--보호소정보 관리 리스트 시작-->
    <div id="associatedvetcenterlist" class="adminpagetablediv">
        <table class="table-striped table-hover adminpagetable">
          <colgroup>
            <col>
            <col>
            <col>
            <col>
            <col>
            <col>
          </colgroup>
          <thead class="admintablehead"> 
            <tr>
                <th class="admin-userseq">#</th> <!--admin-userseq는 shelter_Seq동일-->
                <th class="admin-username">보호소 이름</th> <!--admin-username은 shelter_name과 동일-->
                <th class="admin-address">보호소 주소</th> <!--admin-address은 shelter_address와 동일-->
                <th class="admin-usertelnum">연락처</th> <!--admin-usertelnum은 shelter_tel과 동일-->
                <th class="admin-comnum">사업자등록번호</th>
                <th class="admin-useractionbutton"></th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="user" items="${shelterList }"> <!--items needs to be replace...-->
              <tr>
                <td class="admin-userseq">${user.shelterSeq }</td>
                <td class="admin-username">${user.shelterName }</td>
                <td class="admin-address">${user.address }</td>
                <td class="admin-usertelnum">${user.shelterTel }</td>
                <td class="admin-comnum">${user.comNum }</td>
                <td class="admin-userregdate">${user.userRegDate }</td>
                <td class="admin-useractionbutton"><button class="adminpagebuttonformanage adminbuttonmargin-right" type="button" onclick="location.href='#'">수정</button>
                                                   <button class="adminpagebuttonformanage adminbuttonmargin-left" type="button" onclick="location.href='#'">삭제</button></td>
              </tr>
            </c:forEach>
          </tbody>            
        </table>
    </div>
    <!--보호소 등록 버튼 시작...-->
    <div style="margin-top: 40px">
      <table style="margin-left:auto; margin-right:auto; text-align: center;">
          <tr>
              <td><button class="adminpagebuttonformanage" type="button" onclick="location.href='adminpage7shelteradd-tom.html'">보호소 등록</button></td>
          </tr>
      </table>
    </div>
    <!--보호소 등록 버튼 끝... Dec3rd 20:17pm-->
    <!--page navigation-->
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

    <%@ include file="layout/admin_footer.jsp" %>