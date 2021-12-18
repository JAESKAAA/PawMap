<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

    
    
    <hr class="line-paint">

    <!-- 게시판 상세 폼 시작 -->

    <div class="about-box-main">
        <div class="container">
            <c:choose>
              <c:when test="${empty medicalRecord }">
                <div class="col-lg-6">
                  <p class="mt-5">
                    진단서 작성 준비중입니다.
                  </p>
                </div>
              </c:when>
              <c:otherwise>
                <div class="row board-info">
                    <div class="col-lg-6">
                        <h2 class="noo-sh-title-top mb-5 board_title">제목 : ${medicalRecord[0].title}</h2>
                    </div>
                    <div class="col-lg-6" style="overflow:hidden;">
    
                        <h5 class="noo-sh-title-top mb-5 board_writer"  value="">작성자 : ${medicalRecord[0].user_name}</h5>
    
                    </div>
                    <div class="col-lg-6">
                      <h5 class=" mb-5 board_regDate">작성일 : ${medicalRecord[0].regDate}</h5>
                    </div>
    
                </div>
                <div class="col-lg-6">
                  <p class="mt-5">
                    ${medicalRecord[0].content}
                  </p>
                </div>
                
              </c:otherwise>
            </c:choose>

            
            <!-- 현재 파일 이름이 한글이면 출력이 안되는 오류 있음 -->
            <c:choose>
              <c:when test="${empty medicalFileList}">
                
              </c:when>
              <c:otherwise>
                <c:forEach items="${medicalFileList}" var="fileList" varStatus="i">
                  <img class="img-fluid" src="${pageContext.request.contextPath}/upload/${fileList.originalFileName}" alt="" />
                </c:forEach>
              </c:otherwise>
            </c:choose>
        </div>
    </div>


    

      
    
   <%@ include file="../layout/footer.jsp" %>
   

