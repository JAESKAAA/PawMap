<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- jstl 함수사용을 위한 설정 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<%@ include file="layout/header.jsp" %>
    
<style>
  header,
      nav {
        background:rgb(239 198 120);
        height: fit-content;
        font-size:medium;
        color: rgba(235, 180, 99, 0.842);
        height: 12%;
      }
</style>






    <!-- 유기동물 보호소 문구  -->
    <div class="products-box" style="margin-top:5rem;">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="title-all text-center">
              <h1>유기 동물 보호소</h1>
              <hr />
            </div>
          </div>
        </div>
      </div>
    </div>



    <!--컨텍 정보 부분-->
    <c:forEach items="${shelterPic}" var="shelterPic" varStatus="i">
	      <!-- 사진목록 끝-->
	      <!-- 보호센터 정보 부분-->
      <div id="abandon_detail_box" onclick="location.href='/pawmap/shelter_detail?shelterSeq=${shelterPic.shelterSeq }'" style="cursor:pointer;">
	      	<div class="abandon_detail_box_inner_img">
              <img class="img-fluid" src="${pageContext.request.contextPath}/upload/${shelterPic.originalFileName}" alt=""/>
	        </div>
            <div class="container">
              <div class="row abandon_detail_box_inner">
                <div>
                  <div class="contact-info-left">
                    <h2 style="margin-bottom: -2%">${shelterPic.shelterName }</h2>
                    <br />
                    <ul>
                      <li>
                        <p>
                          <i class="fas fa-map-marker-alt"></i>
                          <span class="contact_font">Address. </span><br />
                          ${shelterPic.shelterAddress }<br />
                        </p>
                      </li>
                      <li>
                        <p>
                          <i class="fas fa-phone-square"></i
                          ><span class="contact_font">Phone.</span><br />
                          <a href="tel:+1-888705770">${shelterPic.shelterTel }</a>
                        </p>
                      </li>
                      <li>
                        <p>
                          <i class="fas fa-paw"></i>
                          <span class="contact_font">Availability.</span> <br />
                          ${shelterPic.content}<br />
                        </p>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
	    </div>
    </c:forEach>
    

    <%@ include file="layout/footer.jsp" %>



    <a href="#" id="back-to-top" title="Back to top" style="display: none"
      >&uarr;</a
    >

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
    <!-- FontAwesome 용 JS 파일-->
    <script
      src="https://kit.fontawesome.com/f0999a1ca0.js"
      crossorigin="anonymous"
    ></script>
    <!--Tawk 위젯 부분-->
    <script type="text/javascript">
      var Tawk_API = Tawk_API || {},
        Tawk_LoadStart = new Date();
      (function () {
        var s1 = document.createElement("script"),
          s0 = document.getElementsByTagName("script")[0];
        s1.async = true;
        s1.src = "https://embed.tawk.to/619377006bb0760a4942cf7b/1fkk0hmc9";
        s1.charset = "UTF-8";
        s1.setAttribute("crossorigin", "*");
        s0.parentNode.insertBefore(s1, s0);
      })();
    </script>
    <!--Tawk 위젯 끝-->
  </body>
</html>
