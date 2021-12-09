<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>


<%@ include file="layout/admin_header.jsp" %>


  <!--관리자의 회원정보 관리 페이지 시작...-->
        <div class="tbl-header"> 
            <div class="row row-adminindex">
            <div>
                <h1 class="adminpagetoph1" style=" margin-top: 0px;">회원정보 관리</h1>
            </div>
            </div>
        </div>
        <!-- search 버튼 시작 -->
        <div class="row">
          <div class="main-search-input-wrap" >
              <div class="main-search-input fl-wrap" style="margin-top: 30px;">
                  <c:choose >
                  	<c:when test="${userList[0].userType eq 'N' }">
	                  <div class="main-search-input-item"> 
	                      <input type="text" id="searchInput" onkeyup="admin_user_search();" name="search_value" placeholder="Search Products..."> 
	                  </div> 
	                <button class="main-search-button" onclick="admin_user_search();">Search</button>
                  	</c:when>
                  	<c:otherwise>
	                  <div class="main-search-input-item"> 
	                      <input type="text" id="searchInput" onkeyup="admin_hospital_search();" name="search_value" placeholder="Search Products..."> 
	                  </div> 
	                <button class="main-search-button" onclick="admin_hospital_search();">Search</button>
                  	</c:otherwise>
                  </c:choose>
              </div>
          </div>
        </div>
        <!--search button finished...-->
        <!--회원정보 관리 리스트 시작-->
    <div style="margin-top: 40px; border-style: 3px solid orange ">
        <table id="table_user_admin" style="margin-left: auto; margin-right: auto; text-align: center;">
            <tr>
                <th>번째</th>
                <th>아이디</th>
                <th>이름</th>
                <th>닉네임</th>
                <th>이메일</th>
                <th>연락처</th>
                <th>관리</th>
            </tr>
           <c:forEach var="user" items="${userList }">
            <tr>
                <td>${user.userSeq }</td>
                <td>${user.userId}</td>
                <td>${user.userName }</td>
                <td>${user.userNickname }</td>
                <td>${user.userEmail }</td>
                <td>${user.userTelNum }</td>
                <td><button style="margin-left: 30px;" type="button" onclick="location.href='/pawmap/getUser?userId=${user.userId}'">관리하기</button></td>
            </tr>
           </c:forEach>
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
              <li class="page-item pagination_button ${num == pageMaker.cri.pageNum ? "active" : "" }""> 
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
            <c:when test="${userList[0].userType eq 'N' }">
				<form id="admin_user_paging_form" action="/pawmap/getUserList" method="get">
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
  
<%@ include file="layout/admin_footer.jsp" %>

