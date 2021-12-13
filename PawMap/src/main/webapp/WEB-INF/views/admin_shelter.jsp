<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="layout/admin_header.jsp" %>

  <!--보호소정보관리 페이지 시작-->
  <div class="tbl-header" style="margin-top:149px;"> 
      <div class="row row-adminindex">
        <div>
          <h1 class="adminpagetoph1" style=" margin-top: 0px;">보호소 정보 관리</h1>
        </div>
      </div>
  </div>
        <!-- search 버튼 시작 --> <!--
        <div class="row tbl-header">
          <div class="main-search-input-wrap" >
              <div class="main-search-input fl-wrap">
                  <div class="main-search-input-item"> 
                      <input type="text" value="" placeholder="검색창입니다...."> 
                  </div> 
                <button class="main-search-button">Search</button>
              </div>
          </div>
        </div> -->
        <!--search button finished...-->

        <!--search 버튼 시작-->
        <div class="row tbl-header">
          <div class="main-search-input-wrap" >
              <div class="main-search-input fl-wrap" style="margin-top: 30px;">
                  <c:choose >
                  	<c:when test="${shelter[0].shelterSeq ne null }">
	                  <div class="main-search-input-item"> 
	                      <input type="text" id="searchInput" onkeyup="admin_shelter_search();" name="search_value" placeholder="보호소 이름을 검색하세요."> 
	                  </div> 
	                <button class="main-search-button" onclick="admin_shelter_search();">Search</button>
                  	</c:when>
                  	<c:otherwise>
	                  <div class="main-search-input-item"> 
	                      <input type="text" id="searchInput" onkeyup="admin_hosptial_search();" name="search_value" placeholder="병원 회원 ID를 검색하세요."> 
	                  </div> 
	                <button class="main-search-button" onclick="admin_hospital_search();">Search</button>
                  	</c:otherwise>
                  </c:choose>
              </div>
          </div>
        </div>
        <!--search button finished...-->

        <!--보호소정보 관리 리스트 시작-->
        <div id="associatedvetcenterlist" class="adminpagetablediv">
          <table id="table_shelter_admin" class="table-striped table-hover adminpagetable">
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
              <c:forEach var="shelter" items="${shelter }">
                <tr>
                        <td class="admin-userseq">${shelter.shelterSeq }</td>
                        <td class="admin-username">${shelter.shelterName }</td>
                        <td class="admin-address">${shelter.shelterAddress}</td>
                        <td class="admin-usertelnum">${shelter.shelterTel }</td>
                        <td class="admin-comnum">${shelter.comNum }</td>
                        <td class="admin-useractionbutton"><button class="adminpagebuttonformanage adminbuttonmargin-right" type="button" onclick="location.href='/pawmap/admin/updateShelterForm?shelterSeq=${shelter.shelterSeq}'">수정</button>
                                                          <button class="adminpagebuttonformanage adminbuttonmargin-left" type="button" id="${shelter.shelterSeq}" onclick="fnDeleteShelter(this);">삭제</button></td>
                    </tr>
                   </c:forEach>
            </tbody>
          </table>
        </div>
    <div style="margin-top: 40px">
      <table style="margin-left:auto; margin-right:auto; text-align: center;">
          <tr>
              <td><button class="adminpagebuttonformanage" style="margin: center;" type="button" onclick="location.href='/pawmap/admin/shelterForm'">보호소 등록</button></td>
          </tr>
      </table>
    </div>
    
     <!-- 페이지네이션 부분 시작-->
     <div class="page-div hospital_pagination_custom">
      <ul class="pagination justify-content-center">
          <c:if test="${pageMaker.prev }">
              <li class="page-item pagination_button">
                  <a class="page-link" href="${pageMaker.startPage - 1 }" >Prev</a>
              </li>
          </c:if>
          <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage}">
            <li class="page-item pagination_button ${num == pageMaker.cri.pageNum ? "active" : "" }"> 
                <a id="nowPage" class="page-link" href="${num }">${num }</a>
            </li>
          </c:forEach>
          <c:if test="${pageMaker.next }">
            <li class="page-item pagination_button">
                <a class="page-link" href="${pageMaker.endPage+1}">Next</a>
            </li>
          </c:if>
      </ul>
    </div>
  <!--  페이지네이션 끝 -->
  <!--  페이지 처리 폼 -->
  <c:choose>
    <c:when test="${communityBoardList[0].boardType eq 'f' }">
      <form id="admin_user_paging_form" action="/pawmap/admin/shelterList" method="get">
        <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
        <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
      </form>
    </c:when>
    <c:otherwise>
      <form id="admin_user_paging_form" action="/pawmap/getHospitalList" method="get">
        <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
        <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
        <input type="hidden" name="value" value="${value }">
      </form>
    </c:otherwise>
  </c:choose>
  <!--  페이지 처리 폼 끝-->



    <!--채팅 아이콘-->
    <!-- <button id="chat_icon" onclick="hideDisplay()"
      ><i class="far fa-comment"></i></button> -->
    <!--채팅 아이콘 끝-->

    <!-- 채팅 모달 추가될 자리-->
    <!-- <div class="chat_container">
      <button class="chat_close" onclick="chatHide()"><i class="fas fa-times"></i></button>
    </div> -->
    <!-- 채팅 모달 끝-->

    <a href="#" id="back-to-top" title="Back to top" style="display: none"
      >&uarr;</a>

<script>

  function fnDeleteShelter(obj) {
    if(confirm("정말 이 보호소를 삭제하시겠습니까?") == true) { // 확인
        location.href='/pawmap/admin/deleteShelterForm?shelterSeq=' + obj.id ;
            } else { //취소
            return;
            }
    };
		

</script>


    <%@ include file="layout/footer.jsp" %>
</body>

</html>