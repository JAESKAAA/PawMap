<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ include file="layout/header.jsp" %>

    <div class="board-type mt-5">
      <c:if test="${getFreeBoard.boardType eq 'f'} ">
        <h1>자유게시판</h1>
      </c:if>
      <h1>자유게시판</h1>
    </div>
    
    <hr class="line-paint">

    <!-- 게시판 상세 폼 시작 -->

    <div class="about-box-main">
        <div class="container">
            <div class="row board-info">
                <div class="col-lg-6">
                    <h2 class="noo-sh-title-top mb-5 board_title">제목 : ${getFreeBoard.title}</h2>
                </div>
                <div class="col-lg-6" style="overflow:hidden;">

                    <h5 class="noo-sh-title-top mb-5 board_writer" id="freeBoardWriter" value="${getFreeBoard.userVO.userNickname }">작성자 : ${getFreeBoard.userVO.userNickname }</h5>

                </div>
                <div class="col-lg-6">
                    <h5 class=" mb-5 board_regDate">작성일 : <fmt:formatDate value="${getFreeBoard.regDate }" pattern="yyyy-MM-dd"/></h5>
                </div>
                <div class="col-lg-6">
                    <h5 class=" mb-5 board_seq" id="freeBoardSeq">게시글 번호 : ${getFreeBoard.boardSeq}</h5>
                </div>
            </div>
            <img class="img-fluid" src="../images/결_pet_toy_001.jpeg" alt="" />
            <div class="col-lg-6">
                <p class="mt-5">
                  ${getFreeBoard.content}
                </p>
              </div>
              <h1>${getFreeBoard.userId}</h1>
              <h1>${principal.user.userId}</h1>
              <div class="col-lg-6 mt-5">
                <button onclick="location.href='/pawmap/board/getFreeBoardList'" type="button" class="btn btn-secondary">목록으로</button>
              <c:if test="${getFreeBoard.userId == principal.user.userId}">
                <button onclick="location.href='/pawmap/board/updateFreeAndNanumBoardForm?boardSeq=${getFreeBoard.boardSeq}'" type="button" class="btn btn-primary">수정</button>
                <button id="delete-free-board" type="button" class="btn btn-secondary">삭제</button>
              </c:if>  

              </div>
        </div>
    </div>


    <section style="background-color: #f7f6f6;">
        <div class="container py-5 text-dark">
          <div class="row d-flex justify-content-center">
            <div class="col-md-12 col-lg-10 col-xl-8">
              <div class="d-flex justify-content-between align-items-center mb-4">
                <h4 class="text-dark mb-0">코멘트 (3)</h4>
              </div>
      
              <!-- 댓글 다는곳 시작 -->

              <div class="card mb-3">
                <div class="card-body" style="padding: 1px;">
                    <div class="d-flex flex-start">
                        <form action="" style="width: 750px;">
                          <input type="hidden" name="userId" id="userId" value="${getFreeBoard.userId}">
                          <input type="hidden" name="boardSeq" id="freeBoardSeqHidden" value="${getFreeBoard.boardSeq}">
                          <input type="hidden" name="boardType" id="boardTypeForReply" value="${getFreeBoard.boardType}">
                          <input type="hidden" name="hospitalSeq" id="hospitalSeqForReply" value="${getFreeBoard.hospitalSeq}">
                            <div class="card-body p-4">
                                <div class="mb-2">
                                    <h5>닉네임</h5>
                                    <c:choose>
                                        <c:when test="${empty principal}">
                                          <input style="color:rgba(204, 156, 22, 0.8) ;"   placeholder="로그인이 필요합니다."  readonly>
                                        </c:when>
                                        <c:otherwise>
                                          <input style="color:rgba(204, 156, 22, 0.8) ;"  value="${principal.user.userNickname}" placeholder="${principal.user.userNickname}"  readonly> 
                                        </c:otherwise>
                                    </c:choose>

                                </div>
                                <div class="d-flex flex-start w-100">
                                    <img
                                        class="rounded-circle shadow-1-strong  mr-5"
                                        src="https://mdbootstrap.com/img/Photos/Avatars/img%20(21).jpg"
                                        alt="avatar"
                                        width="65"
                                        height="65"
                                    />
                                    <div class="w-100">
                                        <div class="form-outline">

                                            <textarea name="commentContent" class="form-control" id="reply-content" rows="4" cols="10"></textarea>

                                        </div>
                                        <div class="d-flex justify-content-between mt-3">
                                            <button id="btn-reply-save" type="button" class="btn btn-success">등록하기</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
              </div>

            <!-- 댓글 다는곳 종료 -->


              <div class="card mb-3">
                <div class="card-body">
                  <div class="d-flex flex-start">
                    <img
                      class="rounded-circle shadow-1-strong me-3"
                      src="https://mdbootstrap.com/img/Photos/Avatars/img%20(26).jpg"
                      alt="avatar"
                      width="40"
                      height="40"
                    />
                    <div class="w-100">
                      <div class="d-flex justify-content-between align-items-center mb-3">
                        <h6 class="text-secondary fw-bold mb-0 ml-2 writer">
                          {작성자}
                          <span class="text-dark ms-2 ml-2">Hmm, This poster looks cool</span>
                        </h6>
                        <p class="mb-0">2 days ago</p>
                      </div>
                      <div class="d-flex justify-content-between align-items-center">
                        <p class="small mb-0" style="color: #aaa;">
                          <a href="#!" class="link-grey ml-2 btn-update">수정하기</a> •
                          <a href="#!" class="link-grey ml-2 btn-delete">삭제하기</a> •
                        </p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="card mb-3">
                <div class="card-body">
                  <div class="d-flex flex-start">
                    <img
                      class="rounded-circle shadow-1-strong me-3"
                      src="https://mdbootstrap.com/img/Photos/Avatars/img%20(26).jpg"
                      alt="avatar"
                      width="40"
                      height="40"
                    />
                    <div class="w-100">
                      <div class="d-flex justify-content-between align-items-center mb-3">
                        <h6 class="text-secondary fw-bold mb-0 ml-2 writer">
                          {작성자}
                          <span class="text-dark ms-2 ml-2">Hmm, This poster looks cool</span>
                        </h6>
                        <p class="mb-0">2 days ago</p>
                      </div>
                      <div class="d-flex justify-content-between align-items-center">
                        <p class="small mb-0" style="color: #aaa;">
                          <a href="#!" class="link-grey ml-2 btn-update">수정하기</a> •
                          <a href="#!" class="link-grey ml-2 btn-delete">삭제하기</a> •
                        </p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              
              <div class="card mb-3">
                <div class="card-body">
                  <div class="d-flex flex-start">
                    <img
                      class="rounded-circle shadow-1-strong me-3"
                      src="https://mdbootstrap.com/img/Photos/Avatars/img%20(26).jpg"
                      alt="avatar"
                      width="40"
                      height="40"
                    />
                    <div class="w-100">
                      <div class="d-flex justify-content-between align-items-center mb-3">
                        <h6 class="text-secondary fw-bold mb-0 ml-2 writer">
                          {작성자}
                          <span class="text-dark ms-2 ml-2">Hmm, This poster looks cool</span>
                        </h6>
                        <p class="mb-0">2 days ago</p>
                      </div>
                      <div class="d-flex justify-content-between align-items-center">
                        <p class="small mb-0" style="color: #aaa;">
                          <a href="#!" class="link-grey ml-2 btn-update">수정하기</a> •
                          <a href="#!" class="link-grey ml-2 btn-delete">삭제하기</a> •
                        </p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
    </section> 
   <%@ include file="layout/footer.jsp" %>
   

