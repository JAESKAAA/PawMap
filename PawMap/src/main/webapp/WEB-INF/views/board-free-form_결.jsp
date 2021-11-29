<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ include file="layout/header.jsp" %>

  
    <!-- 게시판 폼 시작 -->

    <form class="form-horizontal board-form" method="POST" action="insertFreeAndNanumBoard" enctype="multipart/form-data">
        <div class="container">
            <div class="card row">
                <div class="option-select ml-5">
                    <select class="form-control" name="boardType">
                        <option  value="f">자유게시판</option>
                        <option  value="s">나눔게시판</option>
                    </select>
                </div>
                <div class="form-group ml-5 ">
                    <label for="name" class="col-sm-2 control-label">닉네임</label>
                    <div class="col-sm-10">

                        <input type="hidden" class="form-control" id="user_id" name="userId" value="${principal.user.userId}" >
                        <input type="text" class="form-control input-nickname" id="user_nickname" name="${principal.user.userNickname}"  placeholder="${principal.user.userNickname}" readonly>

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
                                <div class="control-group" id="fields">  
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
    <!-- 게시판 폼 종료 -->
      
<%@ include file="layout/footer.jsp" %>
      
