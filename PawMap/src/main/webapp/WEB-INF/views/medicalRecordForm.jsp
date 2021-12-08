<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ include file="layout/header.jsp" %>

    
    <c:choose>
        <c:when test="${empty reservationInfo[0].reservation_status}">
            <form class="form-horizontal board-form" method="POST" action="insertWriteRecord" enctype="multipart/form-data">
                <div class="container">
                    <div class="card row">
                        <div class="option-select ml-5">
                            <select class="form-control" name="boardType">
                                <option  value="m">진단서작성</option>
                            </select>
                        </div>
                        <div class="form-group ml-5 ">
                            <label for="name" class="col-sm-2 control-label">닉네임</label>
                            <div class="col-sm-10">
                                <input type="hidden" name="userId" value="${reservationInfo[0].user_id}">
                                <input type="hidden" name="reservationDate" value="${reservationInfo[0].reservation_date}">
                                <input type="hidden" name="scheduleTime" value="${reservationInfo[0].schedule_time}">
                                <input type="hidden" name="comNum" value="${principal.user.comNum}">
        
                                <input type="text" class="form-control input-nickname"   placeholder="${principal.user.userName}" readonly>
        
                            </div>
                        </div>
                        <div class="form-group ml-5 ">
                            <label for="name" class="col-sm-2 control-label">고객 닉네임</label>
                            <div class="col-sm-10">
        
                                <input type="text" class="form-control input-nickname"   placeholder="${reservationInfo[0].user_nickname}" readonly>
        
                            </div>
                        </div>
                        <div class="form-group ml-5 ">
                            <label for="title" class="col-sm-2 control-label">제목</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control input-title" id="title" name="title" placeholder="제목" required>
                            </div>
                        </div>
                        <div class="form-group ml-5">
                            <label for="content" class="col-sm-2 control-label" >내용</label>
                            <div class="col-sm-10">
                                <textarea class="form-control content" rows="4" name="content" required></textarea>
                            </div>
                        </div>
                        <div class="r form-group ml-5">
                            <div class="col-sm-10 col-sm-offset-2">
                                <div class="row form-group">  
                                    <div class="col-10 col-md-6">  
                                        <div class="control-group">  
                                            <div class="controls">  
                                                <div class="entry input-group upload-input-group">  
                                                    <input class="form-control btn-file-upload" name="uploadFiles" multiple="multiple" type="file">  
                                                </div>  
                                            </div>  
                                        </div>  
                                    </div>  
                                </div>  
                            </div>
                        </div>
                        <div class="r form-group ml-5">
                            <div class="col-sm-10 col-sm-offset-2">
                                <input id="btn-submit" name="btn-submit" type="submit" value="작성완료" class="btn btn-complete">
                            </div>
                        </div>
                    </div>    
                </div>    
            </form>
        </c:when>
        <c:otherwise>
            <div class="container">
                <div class="card row">
                    <form class="form-horizontal board-form" method="POST" action="updateWriteRecord" enctype="multipart/form-data">
                        <div class="option-select ml-5">
                            <select class="form-control" name="boardType">
                                <option  value="m">진단서작성</option>
                            </select>
                        </div>
                        <div class="form-group ml-5 ">
                            <label for="name" class="col-sm-2 control-label">닉네임</label>
                            <div class="col-sm-10">
                                <input type="hidden" name="userId" value="${reservationInfo[0].user_id}">
                                <input type="hidden" name="reservationDate" value="${reservationInfo[0].reservation_date}">
                                <input type="hidden" name="scheduleTime" value="${reservationInfo[0].schedule_time}">
                                <input type="hidden" name="comNum" value="${principal.user.comNum}">
        
                                <input type="text" class="form-control input-nickname"   placeholder="${principal.user.userName}" readonly>
        
                            </div>
                        </div>
                        <div class="form-group ml-5 ">
                            <label for="name" class="col-sm-2 control-label">고객 닉네임</label>
                            <div class="col-sm-10">
        
                                <input type="text" class="form-control input-nickname"   placeholder="${reservationInfo[0].user_nickname}" readonly>
        
                            </div>
                        </div>
                        <div class="form-group ml-5 ">
                            <label for="title" class="col-sm-2 control-label">제목</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control input-title" id="title" name="title" placeholder="${medicalRecord[0].title}" required>
                            </div>
                        </div>
                        <div class="form-group ml-5">
                            <label for="content" class="col-sm-2 control-label" >내용</label>
                            <div class="col-sm-10">
                                <textarea class="form-control content" rows="4" name="content"  required>${medicalRecord[0].content}</textarea>
                            </div>
                        </div>
                        
                        <div class="r form-group ml-5">
                            <div class="col-sm-10 col-sm-offset-2">
                                <input id="btn-submit" name="btn-submit" type="submit" value="수정완료" class="btn btn-complete">
                            </div>
                        </div>
                    </form>
                    <c:choose>
                        <c:when test="${empty fileList}">
                            <h1>${reservationInfo}</h1>
                            <h1>${reservationInfo[0].reservation_seq}</h1>
                            <h1>${principal.user.comNum}</h1>
                            <form action="updateMedicalRecordFormInsertFiles" method="POST" enctype="multipart/form-data">
                                <div class="r form-group ml-5">
                                    <div class="col-sm-10 col-sm-offset-2">
                                        <div class="row form-group">  
                                            <div class="col-10 col-md-6">  
                                                <div class="control-group" id="fields">  
                                                    <div class="controls">  
                                                        <div class="entry input-group upload-input-group">  
                                                            <input class="form-control btn-file-upload" name="uploadFiles" multiple="multiple" type="file">  
                                                            <input type="hidden" name="userId"  value="${principal.user.userId}">  
                                                            <input type="hidden" name="boardSeq" class="hiddenBoardSeq" value="${medicalRecord[0].board_seq}">
                                                            <input type="hidden" name="comNum"  value="${principal.user.comNum}">
                                                            <input type="hidden" name="reservationSeq"  value="${reservationInfo[0].reservation_seq}"> 
                                                        </div>  
                                                        <div class="entry input-group upload-input-group">  
                                                            <button type="submit" class="btn btn-outline-danger mt-2">파일 등록</button>
                                                        </div>  
                                                    </div>  
                                                </div>  
                                            </div>  
                                        </div>  
                                    </div>
                                </div>
                            </form> 
                        </c:when>
                    </c:choose>

                    <!-- 파일 삭제만 가능.... -->
                    <c:choose>
                        <c:when test="${!empty fileList}">
                            <c:forEach var="fileList" items="${fileList}" varStatus="i">
                                <form action="saperateDeleteFileOnMedicalBoard" method="POST">
                                    <div class="r form-group ml-5">
                                        <div class="col-sm-10 col-sm-offset-2">
                                            <div class="row form-group">  
                                                <div class="col-10 col-md-6">  
                                                    <div class="control-group" id="fields">  
                                                        <div class="controls">  
                                                            <div class="entry input-group upload-input-group">  
                                                                <h5>${fileList.originalFileName}</h5> 
                                                                <input type="hidden" name="fileSeq" class="hiddenFileSeq" value="${fileList.fileSeq}">
                                                                <input type="hidden" name="boardSeq" class="hiddenBoardSeq" value="${fileList.boardSeq}">
                                                                <input type="hidden" name="comNum"  value="${principal.user.comNum}">
                                                                <input type="hidden" name="reservationSeq"  value="${reservationInfo[0].reservation_seq}">
                                                            </div>  
                                                            <div class="entry input-group upload-input-group">  
                                                                <button type="submit" class="btn btn-outline-danger">파일삭제</button>
                                                            </div>  
                                                        </div>  
                                                    </div>  
                                                </div>  
                                            </div>  
                                        </div>
                                    </div>
                                </form>
                            </c:forEach>
                        </c:when>
                    </c:choose>
                </div>    
            </div>    
        </c:otherwise>
    </c:choose>



      
<%@ include file="layout/footer.jsp" %>
      
