<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>
<!DOCTYPE html>
<html lang="en">
    
<!-- Basic -->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <title>Freshshop - Ecommerce Bootstrap 4 HTML Template</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="../css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="../css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="../css/custom.css">

    <!-- 결 커스텀 css -->
    <link rel="stylesheet" href="../css/style-gyul.css">

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<style>

.board-form{
    margin-bottom: 20px;
}

</style>

</head>

<body>
    <!-- Start Main Top -->
 
    <!-- End Main Top -->

    <!-- Start Main Top -->
    
    <!-- end Main Top -->
  
    <!-- 게시판 폼 시작 -->
    <form class="form-horizontal board-form" method="POST" action="insertFreeAndNanumBoard" >
        <h1>유저 아이디 == ${principal.user.userId}</h1>
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
                                            <input class="form-control btn-file-upload" name="fields[]" type="file">  
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
      
      

    <!-- Start Footer  -->
    
    <!-- End Footer  -->

    <!-- Start copyright  -->

    <!-- End copyright  -->

    <a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

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

</html>