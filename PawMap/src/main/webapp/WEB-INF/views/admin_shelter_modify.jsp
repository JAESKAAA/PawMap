<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="layout/admin_header.jsp" %>
  <!--adminmainvetmanagement-->
<!--관리자가 회원정보 수정 페이지 시작...-->
<!--회원 정보 수정 제목 시작-->
<div class="u_container" style="border-radius:0px; margin-top:149px;">
	<div class="tbl-header" style="margin-left:0px; margin-right:0px;"> 
		<div class="row row-adminindex">
			<div>
				<h1 class="adminpagetoph1" style=" margin-top: 0px; margin-bottom:50px;">보호정보 수정</h1>	
			</div>
		</div>
	</div>
	<!--회원 정보 수정 제목 끝-->
	<!--회원 정보 수정 테이블 시작.-->
  <div id="adminusermanage" class="adminpagetablediv">
    <form name="updateForm" action="/pawmap/admin/updateShelterForm/api" method="POST"></form>
    <table class="u_join-table" style="margin-left: auto; margin-right: auto; text-align: center; border-top: none; border-bottom:none;">
          <input type="hidden" name="shelterSeq" value="${getShelter.shelterSeq}">
        <tr>
            <td>사업자등록번호 </td>
            <td>
                    <!-- <input type="hidden" id="comNum" type="text" value="${getShelter.comNum}"> -->
                    <input type="text" id="comNum" name="comNum" placeholder="${getShelter.comNum}" value="${getShelter.comNum}"> </td>
        </tr>
        <tr>
            <td>보호소 명</td>
            <td><input id="shelterName" type="text"  name="shelterName" value="${getShelter.shelterName}" placeholder="보호소명"></td>
        </tr>
        <tr>
            <td>주소</td>
            <td><input id="shelterAddress" type="text"  name="shelterAddress" value="${getShelter.shelterAddress}" placeholder="주소"></td>
        </tr>
        <tr>
            <td>연락처:</td>
            <td><input id="shelterTel" type="text" name="shelterTel" value="${getShelter.shelterTel}" placeholder="연락처" ></td>
        </tr>
        <tr>
          <td>상세정보</td>
          <td><input id="content" type="text" name="content" value="${getShelter.content}" placeholder="상세정보" ></td>
        </tr>
    </form>
        <tr>
          <td>사진첨부</td>
          <td>
            <c:choose>
                <c:when test="${empty fileList}">
                    <form action="updateShelterFormInsertFiles" method="POST" enctype="multipart/form-data">
                        <!-- <h5>파일이 없을떄 ${fileList}</h5> -->
                        <!-- <div class="r form-group ml-5">
                            <div class="col-sm-10 col-sm-offset-2">
                                <div class="row form-group">  
                                    <div class="col-10 col-md-6">  
                                        <div class="control-group" id="fields">  
                                            <div class="controls">   -->
                                                <div class="entry input-group upload-input-group">  
                                                    <input class="form-control btn-file-upload" name="uploadFiles" multiple="multiple" type="file" style="width:60%;display:inline;" /> 
                                                    <input type="hidden" name="shelterName"  value="${getShelter.shelterName}">
                                                    <input type="hidden" name="boardSeq"  value="${getShelter.shelterSeq}">
                                                    <!-- <h1>${getShelter.shelterName}</h1>
                                                      <h1>${getShelter.shelterSeq}</h1> -->
                                                    </div>  
                                                    현재 첨부된 파일 : 없음
                                                    <div class="entry input-group upload-input-group">  
                                                    <button type="submit" class="btn btn-outline-primary btn-sm fileBtn adminpagebuttonformanage">파일 등록</button>
                                                <!-- </div>  
                                            </div>  
                                        </div>  
                                    </div>  
                                </div>  
                            </div> -->
                        </div>
                    </form> 
                </c:when>
            </c:choose>

            <!-- 파일 삭제만 가능.... -->
            <c:choose>
                <c:when test="${!empty fileList}">
                    <c:forEach var="fileList" items="${fileList}" varStatus="i">
                        <form action="separateDeleteFileOnShelectForm" method="POST">
                            <!-- <div class="r form-group ml-5">
                                <div class="col-sm-10 col-sm-offset-2">
                                    <div class="row form-group">  
                                        <div class="col-10 col-md-6">  
                                            <div class="control-group" id="fields">  
                                                <div class="controls">   -->
                                                    <div class="entry input-group upload-input-group">  
                                                      <div style="width: 300px;">
                                                        현재 첨부된 파일 : ${fileList.originalFileName} 
                                                    </div>
                                                        <input type="hidden" name="fileSeq" class="hiddenFileSeq" value="${fileList.fileSeq}">
                                                        <input type="hidden" name="boardSeq" class="hiddenBoardSeq" value="${fileList.boardSeq}">
                                                    </div>  
                                                    <div class="entry input-group upload-input-group">  
                                                        <!-- <button type="submit" class="btn btn-outline-danger">파일삭제</button> -->
                                                        <!-- <span type="submit"class="btn btn-outline-primary btn-sm fileBtn" fileTask="U">파일 변경 (구현중)</span> -->
                                                        <span type="submit" class="btn btn-outline-danger btn-sm fileBtn" fileTask="D">파일삭제</span>
                                                    <!-- </div>  
                                                </div>  
                                            </div>  
                                        </div>  
                                    </div>  
                                </div> -->
                            </div>
                        </form>
                    </c:forEach>
                </c:when>
            </c:choose>

<!-- 수정하다 만거 -->
            <!-- <c:choose>
              <c:when test="${!empty getShelter.originalFileName}">
                <c:forEach var="fileList" items="${fileList}" varStatus="i">
                  <form action="updateShelterFormInsertFiles" method="POST" enctype="multipart/form-data"  target="dummyframe">
                    <input type="hidden" name="fileSeq" value="${fileList.fileSeq}" />
                    <input type="hidden" name="boardSeq" value="${fileList.boardSeq}" />
                    <input type="hidden" name="boardType"  value="${fileList.boardType}" />
                    <input type="hidden" name="userId" value="${fileList.userId}" />
                    <input type="hidden" name="originalFileName" value="${fileList.originalFileName}" />
                    <input type="hidden" name="fileTask" value="" />
                    <input class="form-control btn-file-upload" name="uploadFiles" multiple="multiple" type="file" style="width:60%;display:inline;" />
                    <div style="width: 400px;">
                      첨부된 파일 : ${fileList.originalFileName}
                    </div>
                    <span class="btn btn-outline-primary btn-sm fileBtn" fileTask="U">파일 변경 (구현중)</span>
                    <span class="btn btn-outline-danger btn-sm fileBtn" fileTask="D">파일삭제</span>
                  </form>
                </c:forEach>
              </c:when>
              <c:otherwise>
                <form action="updateShelterFormInsertFiles" method="POST" enctype="multipart/form-data"  target="dummyframe"> -->
                  <!-- value 삭제 -> form만 둠 -->
                  <!-- <input type="hidden" name="fileSeq" value="" />
                  <input type="hidden" name="boardSeq" value="" />
                  <input type="hidden" name="boardType"  value="" />
                  <input type="hidden" name="userId" value="" />
                  <input type="hidden" name="originalFileName" value="" />
                  <input type="hidden" name="fileTask" value="" />
                  <input class="form-control btn-file-upload" name="uploadFiles" multiple="multiple" type="file" style="width:60%;display:inline;"/>
                  <div style="width: 400px;">
                    첨부된 파일 : 없음
                  </div>
                  <span class="btn btn-outline-primary btn-sm fileBtn" fileTask="U">파일 변경 (구현중)</span>
                  <span class="btn btn-outline-danger btn-sm fileBtn" fileTask="D">파일삭제</span>
                </form>
              </c:otherwise>
            </c:choose> -->
          </td>
      </tr>
          <!-- Form body here -->
      </form>
        <!--<tr>
          td>
            < 파일 삭제만 가능(결님 코드) 
            <c:choose>
              <c:when test="${!empty getShelter.originalFileName}">
                <c:forEach var="fileList" items="${fileList}" varStatus="i">
                  <form action="separateDeleteFileOnShelectForm" method="POST">
                    <h5>${getShelter.originalFileName}</h5> 
                    <input type="hidden" name="fileSeq" class="hiddenFileSeq" value="${fileList.fileSeq}">
                    <input type="hidden" name="boardSeq" class="hiddenBoardSeq" value="${fileList.boardSeq}">
                    <div class="entry input-group upload-input-group"> 
                      <button type="submit" class="btn btn-outline-danger">파일삭제</button>
                    </div>
                  </form>
                </c:forEach>
            </c:when>
          </c:choose>
        </td
      </tr>-->
      <tr>
        <td rowspan="2"><button class="adminpagebuttonformanage"><span id="submitBtn"  class="btn btn-complete">제출</button></td>
      </tr>
</table>
<iframe name="dummyframe" id="dummyframe" style="display: none;"></iframe>
</div>
</div>



    <!-- ALL JS FILES -->
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="../js/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <!-- ALL PLUGINS -->
    <script src="../js/jquery.superslides.min.js"></script>
    <script src="../js/bootstrap-select.js"></script>
    <script src="../js/inewsticker.js"></script>
    <script src="../js/bootsnav.js."></script>
    <script src="../js/images-loded.min.js"></script>
    <script src="../js/isotope.min.js"></script>
    <script src="../js/owl.carousel.min.js"></script>
    <script src="../js/baguetteBox.min.js"></script>
    <script src="../js/form-validator.min.js"></script>
    <script src="../js/contact-form-script.js"></script>
    <script src="../js/custom.js"></script>
    


</body>
    <!-- 글 수정관련 스크립트 -->
<script>
    function fnUpdateShelterForm(obj) {
    if(confirm("글을 수정합니까?") == true) { // 확인
        location.href='/pawmap/admin/updateShelterForm/api/${getShelter.shelterSeq}';
            } else { //취소
            return;
            }
    };


    $(function() {
      // ■ 파일 업로드
      $('.fileBtn').click(function() {
          let fileTask = $(this).attr("fileTask");

          if(fileTask == "U" && $(this).siblings('input[name=uploadFiles]').val() == '') {
            alert("변경할 파일을 먼저 선택해주세요!");
            return false;
          }

          let taskName = "변경";
          if(fileTask == "D") taskName = "삭제";
          if(confirm(taskName + "하시겠습니까?")) {
                $('input[name=fileTask]').val(fileTask);
                $(this).closest("form").submit();
          }
      });
      
      // ■ [제출] 버튼 클릭 이벤트
      $('#submitBtn').click(function() {
        if(confirm("수정하시겠습니까?")) {
          $('form[name=updateForm]').submit();
        } else { //취소
          return;
        }
      });
    });
</script>




<!-- 
    <script>
      // id값으로 이동 - 메소드
      		$("#update-shelter-form").on("click",()=>{
			this.updateShelterForm();
		});
    </script>

    <script>
      let index = {
      	updateShelterForm:function(){
		let shelterSeq = $("#shelterSeq").val();
		
		let data = {
			shelterSeq: $("#shelter_seq").val(),
			comNum : $("#com_num").val(),
			shelterName : $("#shelter_name").val(),
      shelterAddress : $("#shelter_address").val(),
      shelterTel : $("shelter_tel").val(),
			content: $("#content").val()
		};
		alert("글 수정시 뜨는 알람");
		console.log("updateShelterForm:function 탐, shelterSeq ==="+shelterSeq+"data =======: "+ data);
		$.ajax({
			type: 'POST',
			url: "/pawmap/admin/updateShelterForm/api/"+shelterSeq,
			data : JSON.stringify(data),
			contentType : 'application/json; charset=utf-8',
      processData: false, 
      contentType: false,
			success : function() {
				alert("글 수정 통과 알람");
				location.href ="shelterList?shelterSeq="+shelterSeq
			},
			error : function(e) {
				console.log(e);
			}
		});
	}
} -->
<!--    </script>
-->
<%@ include file="layout/admin_footer.jsp" %>
