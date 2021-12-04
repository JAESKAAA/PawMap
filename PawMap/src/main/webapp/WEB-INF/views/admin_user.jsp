<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>


<%@ include file="layout/admin_header.jsp" %>


  <!--관리자의 회원정보 관리 페이지 시작...-->
    <div> 
        <h1 style="text-align: center; font-size:30px; margin-top:5%;">회원정보 관리</h1>
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

