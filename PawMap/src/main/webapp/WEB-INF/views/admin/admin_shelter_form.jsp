<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../layout/admin_header.jsp" %>

  <!--adminmainvetmanagement-->
      <div class="u_container" style="border-radius:0px;">
        <div class="tbl-header" style="margin-left:0px; margin-right:0px;"> 
          <div class="row row-adminindex">
            <div>
              <h1 class="adminpagetoph1" style=" margin-top: 0px; margin-bottom:50px;">보호소 등록</h1>	
            </div>
          </div>
        </div>
      
      <!-- form 시작! -->
      <div id="adminusermanage" class="adminpagetablediv">
        <form class="form-horizontal board-form" method="POST" action="insertShelterForm" enctype="multipart/form-data">
          <table class="u_join-table" style="margin-left: auto; margin-right: auto; text-align: center; border-top: none; border-bottom:none;">
              <tr>
                <td>사업자등록번호: </td>
                <td></td>
                <td><input id="comNum" name="comNum" type="text" placeholder="내용을 임력해 주세요"></td>
            </tr>
            <tr>
              <td>보호소 명: </td>
              <td></td>
              <td><input id="shelterName" name="shelterName" type="text" placeholder="내용을 임력해 주세요"></td>
            </tr>
            <tr>
              <td>주소: </td>
              <td></td>
              <td><input id="shelterAddress" name="shelterAddress" type="text" placeholder="내용을 임력해 주세요"></td>
            </tr>
            <tr>
              <td>연락처: </td>
              <td></td>
              <td><input id="shelterTel" name="shelterTel" type="text" placeholder="내용을 임력해 주세요"></td>
            </tr>
            <tr>
              <td>상세정보: </td>
              <td></td>
              <td><input id="content" name="content" type="text" placeholder="내용을 임력해 주세요"></td>
            </tr>
            <tr>
              <td>사진첨부: </td>
              <td></td>
              <td><input class="form-control btn-file-upload" name="uploadFiles" multiple="multiple" type="file"></td>
            </tr>
          </table>
      </div>
    <div style="margin-top: 40px">
        <table style="margin-left:auto; margin-right:auto; margin-bottom: 40px; text-align: center;">
            <tr>
                <td>
                  <input id="btn-submit" name="btn-submit" type="submit" value="작성완료" class="btn btn-complete">
                </td>
            </tr>
        </table>
        </form>
      </div>
  </div>
  

  
  



    <!-- ALL JS FILES -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- ALL PLUGINS -->
    <script src="js/jquery.superslides.min.js"></script>
    <script src="js/bootstrap-select.js"></script>
    <script src="js/inewsticker.js"></script>
    <script src="js/bootsnav.js."></script>
    <script src="js/images-loded.min.js"></script>
    <script src="js/isotope.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/baguetteBox.min.js"></script>
    <script src="js/form-validator.min.js"></script>
    <script src="js/contact-form-script.js"></script>
    <script src="js/custom.js"></script>

    
</body>

<%@ include file="../layout/admin_footer.jsp" %>