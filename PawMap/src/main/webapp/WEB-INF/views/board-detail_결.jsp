<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ include file="layout/header.jsp" %>

    <div class="board-type mt-5">
        <c:if test="${getFreeBoard.boardType eq 'f'}"> <h1>자유게시판</h1> </c:if>
        <c:if test="${getNanumBoard.boardType eq 's'}"> <h1>나눔게시판</h1> </c:if>
      </div>
<!-- 
      <c:if test="${getFreeBoard.boardType eq 'f'} ">
        <h1>자유게시판</h1>
      </c:if>
      <c:if test="${getFreeBoard.boardType eq 's'} ">
        <h1>나눔게시판</h1>
      </c:if>
    </div> -->
    
    <hr class="line-paint">

    <!-- 게시판 상세 폼 시작 -->
    <div class="about-box-main">
        <div class="container">
            <div class="row board-info">
                <div class="col-lg-6">
                    <h2 class="noo-sh-title-top mb-5 board_title">제목 : ${getFreeBoard.title} ${getNanumBoard.title}</h2>
                </div>
                <div class="col-lg-6" style="overflow:hidden;">

                    <h5 class="noo-sh-title-top mb-5 board_writer" id="freeBoardWriter" value="${getFreeBoard.userVO.userNickname } ${getNanumBoard.userVO.userNickname }">작성자 : ${getFreeBoard.userVO.userNickname } ${getNanumBoard.userVO.userNickname } </h5>
                </div>
                <div class="col-lg-6">
                    <h5 class=" mb-5 board_regDate">작성일 : <fmt:formatDate value="${getFreeBoard.regDate }" pattern="yyyy-MM-dd"/>
                      <fmt:formatDate value="${getNanumBoard.regDate }" pattern="yyyy-MM-dd"/></h5>
                </div>
                <div class="col-lg-6">
                    <h5 class=" mb-5 board_seq" id="freeBoardSeq">게시글 번호 : ${getFreeBoard.boardSeq} ${getNanumBoard.boardSeq}</h5>
                    <input type="hidden" value="${getNanumBoard.boardSeq}" id="nanumBoardSeq" />
                </div>
                <div class="col-lg-6">
                  <h5 class=" mb-5 board_seq" id="freeBoardSeq">조회수 : ${getFreeBoard.cnt}</h5>
              </div>
            </div>

            
            <!-- 현재 파일 이름이 한글이면 출력이 안되는 오류 있음 -->

            <c:if test="${getFreeBoard.boardType eq 'f' }">
            <c:choose>
              <c:when test="${empty freeBoardFileList}">
                <h1>테스트용 :: 파일이 없음</h1>

              </c:when>
              <c:otherwise>
                <c:forEach items="${freeBoardFileList}" var="fileList" varStatus="i">
                  <img class="img-fluid" src="${pageContext.request.contextPath}/upload/${fileList.originalFileName}" alt="" />
                </c:forEach>
              </c:otherwise>

              </c:choose>
              </c:if>


              <c:if test="${getNanumBoard.boardType eq 's' }">
                <c:choose>
                  <c:when test="${empty nanumBoardFileList}">
                    <h1>테스트용 :: 파일이 없음</h1>
                  </c:when>
                  <c:otherwise>
                    <c:forEach items="${nanumBoardFileList}" var="fileList" varStatus="i">
                      <img class="img-fluid" src="${pageContext.request.contextPath}/upload/${fileList.originalFileName}" alt="" />
                    </c:forEach>
                  </c:otherwise>
                  </c:choose>
                  </c:if>




            <div class="col-lg-6">
                <p class="mt-5">
                  ${getFreeBoard.content}
                  ${getNanumBoard.content}

                  <h1>${fileList.originalFileName}</h1>
                </p>
              </div>
              <!-- 자유게시판일경우 -->
              <c:if test="${getFreeBoard.boardType eq 'f' }">

              <div class="col-lg-6 mt-5">
                <button onclick="location.href='/pawmap/board/getFreeBoardList'" type="button" class="btn btn-secondary">목록으로</button>
              <c:if test="${getFreeBoard.userId == principal.user.userId}">
                <button onclick="location.href='/pawmap/board/updateFreeAndNanumBoardForm?boardSeq=${getFreeBoard.boardSeq}&boardType=${getFreeBoard.boardType}'" type="button" class="btn btn-primary">수정</button>
                <button id="delete-free-board" type="button" class="btn btn-secondary">삭제</button>
              </div>
              </c:if> 
            </c:if> 

              <!-- 나눔게시판일경우 -->
              <c:if test="${getNanumBoard.boardType eq 's'}">
              <div class="col-lg-6 mt-5">
                <button onclick="location.href='/pawmap/board/getNanumBoardList'" type="button" class="btn btn-secondary">목록으로</button>
              <c:if test="${getNanumBoard.userId == principal.user.userId}">
                <button onclick="location.href='/pawmap/board/updateNanumBoardForm?boardSeq=${getNanumBoard.boardSeq}&boardType=${getNanumBoard.boardType}'" type="button" class="btn btn-primary">수정</button>
                <button id="delete-nanum-board" type="button" class="btn btn-secondary">삭제</button>
              </div>
            </c:if>  
          </c:if>
        </div>
    </div>


    <section style="background-color: #f7f6f6;">
        <div class="container py-5 text-dark">
          <div class="row d-flex justify-content-center">
            <div class="col-md-12 col-lg-10 col-xl-8">
              <div class="d-flex justify-content-between align-items-center mb-4">
                <h4 class="text-dark mb-0">코멘트 수 ( ${commentSize} )</h4>
              </div>
      
              <!-- 댓글 다는곳 시작 -->

        <!-- 자유게시판일경우 -->
        <c:if test="${getFreeBoard.boardType eq 'f' }">

              <div class="card mb-3">
                <div class="card-body" style="padding: 1px;">
                    <div class="d-flex flex-start">
                        <form action="" style="width: 750px;">
                          <input type="hidden" name="userId" id="userId" value="${principal.user.userId}">
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
                                  <c:choose>
                                    <c:when test="${empty principal.user.userProfile || empty principal}">
                                      <img
                                        class="rounded-circle shadow-1-strong me-3"
                                        src="${pageContext.request.contextPath}/upload/noprofileuser.jpg"
                                        alt="img"
                                        width="40"
                                        height="40"
                                      />   
                                    </c:when>
                                    <c:otherwise>
                                      <img
                                          class="rounded-circle shadow-1-strong  mr-5"
                                          src="${pageContext.request.contextPath}/upload/${principal.user.userProfile}"
                                          alt="avatar"
                                          width="65"
                                          height="65"
                                      />
                                    </c:otherwise>
                                  </c:choose>
                                    <div class="w-100">
                                        <div class="form-outline">

                                            <textarea name="commentContent" class="form-control" id="reply-content" rows="4" cols="10"></textarea>

                                        </div>
                                        <c:choose>
                                          <c:when test="${empty principal}">
                                            <div class="d-flex justify-content-between mt-3">
                                              <button id="" onclick="alert('로그인이 필요합니다.')" type="button" class="btn btn-success">등록하기</button>
                                            </div>
                                          </c:when>
                                          <c:otherwise>
                                            <div class="d-flex justify-content-between mt-3">
                                                <button id="btn-reply-save" type="button" class="btn btn-success">등록하기</button>
                                            </div>
                                          </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
              </div>

            <!-- 댓글 다는곳 종료 -->

            <!-- ===============댓글 리스트 출력 시작================== -->

              <c:forEach var="reply" items="${freeBoardReplyList}" varStatus="i" >
                <div class="card mb-3">
                  <div class="card-body">
                    <div class="d-flex flex-start">
                      <c:choose>
                        <c:when  test="${empty reply.user_profile}">
                          <img
                          class="rounded-circle shadow-1-strong me-3"
                          src="${pageContext.request.contextPath}/upload/noprofileuser.jpg"
                          alt="img"
                          width="40"
                          height="40"
                          />
                        </c:when>
                        <c:otherwise>
                          <img
                          class="rounded-circle shadow-1-strong me-3"
                          src="${pageContext.request.contextPath}/upload/${reply.user_profile}"
                          alt="img"
                          width="40"
                          height="40"
                          />
                        </c:otherwise>
                      </c:choose>
                      <div class="w-100">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                          <h6 class="text-secondary fw-bold mb-0 ml-2 writer">
                            ${reply.user_nickname}
                            <div class="mt-3">
                              <span class="text-dark ms-2 ml-2">${reply.comment_content}</span>
                            </div>
                          </h6>
                          <p class="mb-5"><fmt:formatDate value="${reply.comment_regDate }" pattern="yyyy-MM-dd"/></p>
                        </div>
                        <div class="d-flex justify-content-between align-items-center">
                          <p class="small mb-0" style="color: #aaa;">


                            <!-- <h5 id="testtest">${reply.comment_seq}</h5>
                            <h5 id="testtest">${reply}</h5> -->
                            
                            <!-- <c:if test="${reply.user_id == principal.user.userId}">
                              <input type="hidden"  value="${reply.comment_seq}"/>
                              <a href="#!" class="link-grey ml-2 btn-update">수정하기</a> •
                              <button onclick="index.freeBoardReplyDelete()" class="link-grey ml-2 btn-delete">삭제하기</button> •
                            </c:if> -->

                            <!-- 현재 세션의 principal id와 코멘트를 쓴 사용자가 동일 할때만 수정, 삭제 버튼이 나오도록 함 -->
                            
                            <c:if test="${reply.user_id == principal.user.userId}">
                                <form action="deleteCommentOnFreeBoard" method="POST">
                                  <input type="hidden" class="hiddenCommentSeq" name="commentSeq" value="${reply.comment_seq}"/>
                                  <input type="hidden" name="boardSeq" value="${getFreeBoard.boardSeq}">
                                  <button type="button" class="link-grey ml-2 btn-update btn-comment-update" data-toggle='modal' data-target='.modifyModal${i.index}'>수정하기</button> 
                                  <button onclick="if(!confirm('삭제 하시겠습니까?')){return false}" class="link-grey ml-2 btn-delete">삭제하기</button> 

                                </form>
                                
                              <!--=============== 댓글 수정 모달창 시작============== -->
                                
                              <form action="updateCommentOnFreeBoard" method="POST" >
                                <div class="modal fade modifyModal${i.index}"  role="dialog">
                                  <div class="modal-dialog">
                                    <div class="modal-content">
                                      <div class="modal-header">
                                        <button type="button"  data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">댓글 수정</h4>
                                      </div>
                                      <div class="modal-body">
                                        <div class="">
                                          <label for="replyText">댓글 내용</label>
                                          <input type="text" class="form-control" id="commentContent" name="commentContent" placeholder="${reply.comment_content}">
                                        </div>
                                        <div class="">
                                          <label for="replyWriter">댓글 작성자</label>
                                          <input class="form-control" id="replyWriter" placeholder="${principal.user.userNickname}" readonly>
                                          <input type="hidden" id="hiddenCommentUserId" name="userId" value="${principal.user.userId}">
                                          <input type="hidden" id="hiddenFreeBoardSeq" name="boardSeq" value="${getFreeBoard.boardSeq}">
                                          <input type="hidden" id="hiddenCommentSeq" name="commentSeq" value="${reply.comment_seq}">
                                        </div>
                                      </div>
                                      <div class="modal-footer">
                                        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
                                        <button type="submit" class="btn btn-success modalModBtn">수정</button>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </form>

                              <!--=============== 댓글 수정 모달창 종료 ============== -->
                                      
                            </c:if>
                          </p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </c:forEach>
              </c:if>




              <!-- ===============댓글 리스트 출력 종료================== -->


<<<<<<< HEAD


    <!-- 나눔게시판일경우 -->
        <c:if test="${getNanumBoard.boardType eq 's' }">

          <div class="card mb-3">
            <div class="card-body" style="padding: 1px;">
                <div class="d-flex flex-start">
                    <form action="" style="width: 750px;">

                      <input type="hidden" name="userId" id="userId" value="${principal.user.userId}">
                      <input type="hidden" name="boardSeq" id="nanumBoardSeqHidden" value="${getNanumBoard.boardSeq}">
                      <input type="hidden" name="boardType" id="boardTypeForReply" value="${getNanumBoard.boardType}">
                      <input type="hidden" name="hospitalSeq" id="hospitalSeqForReply" value="${getNanumBoard.hospitalSeq}">

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
                                    <c:choose>
                                      <c:when test="${empty principal}">
                                        <div class="d-flex justify-content-between mt-3">
                                          <button id="" onclick="alert('로그인이 필요합니다.')" type="button" class="btn btn-success">등록하기</button>
                                        </div>
                                      </c:when>
                                      <c:otherwise>
                                        <div class="d-flex justify-content-between mt-3">
                                            <button id="btn-reply-save-nanum" type="button" class="btn btn-success">등록하기</button>
                                        </div>
                                      </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
          </div>

        <!-- 댓글 다는곳 종료 -->

        <!-- ===============댓글 리스트 출력 시작================== -->

          <c:forEach var="reply" items="${nanumBoardReplyList}" varStatus="i" >
            <div class="card mb-3">
              
              <div class="card-body">
                <div class="d-flex flex-start">
                  <img
                  class="rounded-circle shadow-1-strong me-3"
                  alt="img"
                  width="40"
                  height="40"
                  />
                  <div class="w-100">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                      <h6 class="text-secondary fw-bold mb-0 ml-2 writer">
                        ${reply.user_nickname}
                        <div class="mt-3">
                          <span class="text-dark ms-2 ml-2">${reply.comment_content}</span>
                        </div>
                      </h6>
                      <p class="mb-5"><fmt:formatDate value="${reply.comment_regDate }" pattern="yyyy-MM-dd"/></p>
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                      <p class="small mb-0" style="color: #aaa;">


                        <!-- <h5 id="testtest">${reply.comment_seq}</h5>
                        <h5 id="testtest">${reply}</h5> -->
                        
                        <!-- <c:if test="${reply.user_id == principal.user.userId}">
                          <input type="hidden"  value="${reply.comment_seq}"/>
                          <a href="#!" class="link-grey ml-2 btn-update">수정하기</a> •
                          <button onclick="index.freeBoardReplyDelete()" class="link-grey ml-2 btn-delete">삭제하기</button> •
                        </c:if> -->

                        <!-- 현재 세션의 principal id와 코멘트를 쓴 사용자가 동일 할때만 수정, 삭제 버튼이 나오도록 함 -->
                        
                        <c:if test="${reply.user_id == principal.user.userId}">
                            <form action="deleteCommentOnNanumBoard" method="POST">
                              <input type="hidden" class="hiddenCommentSeq" name="commentSeq" value="${reply.comment_seq}"/>
                              <input type="hidden" name="boardSeq" value="${getNanumBoard.boardSeq}">
                              <button type="button" class="link-grey ml-2 btn-update btn-comment-update" data-toggle='modal' data-target='.modifyModal${i.index}'>수정하기</button> 
                              <button onclick="if(!confirm('삭제 하시겠습니까?')){return false}" class="link-grey ml-2 btn-delete">삭제하기</button> 

                            </form>
                            
                          <!--=============== 댓글 수정 모달창 시작============== -->
                            
                          <form action="updateCommentOnNanumBoard" method="POST" >
                            <div class="modal fade modifyModal${i.index}"  role="dialog">
                              <div class="modal-dialog">
                                <div class="modal-content">
                                  <div class="modal-header">
                                    <button type="button"  data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">댓글 수정</h4>
                                  </div>
                                  <div class="modal-body">
                                    <div class="">
                                      <label for="replyText">댓글 내용</label>
                                      <input type="text" class="form-control" id="commentContent" name="commentContent" placeholder="${reply.comment_content}">
                                    </div>
                                    <div class="">
                                      <label for="replyWriter">댓글 작성자</label>
                                      <input class="form-control" id="replyWriter" placeholder="${principal.user.userNickname}" readonly>
                                      <input type="hidden" id="hiddenCommentUserId" name="userId" value="${principal.user.userId}">
                                      <input type="hidden" id="hiddenFreeBoardSeq" name="boardSeq" value="${getNanumBoard.boardSeq}">
                                      <input type="hidden" id="hiddenCommentSeq" name="commentSeq" value="${reply.comment_seq}">
                                    </div>
                                  </div>
                                  <div class="modal-footer">
                                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
                                    <button type="submit" class="btn btn-success modalModBtn">수정</button>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </form>

                          <!--=============== 댓글 수정 모달창 종료 ============== -->
                                  
                        </c:if>
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </c:forEach>
          </c:if>
            </div>
          </div>
        </div>
    </section> 

      
    
   <%@ include file="layout/footer.jsp" %>
   

