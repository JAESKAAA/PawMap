<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- jstl 함수사용을 위한 설정 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<%@ include file="layout/header.jsp" %>
    
<link rel="stylesheet" href="../css/style-gyul.css">

<style>

.page-item.active .page-link{
    background-color: rgb(207, 111, 21);
    border-color: rgb(207, 111, 21);
} 
  
</style>

</head>

<body>
    <!-- Start Main Top -->
 
    <!-- End Main Top -->

    <!-- Start Main Top -->

  
<div class="board-type reservation-board ">
    <h1>자유게시판</h1>
</div>

<div class="container mt-5" style="width: 70%;">
    <div class="board-free" >
        <div id="slides-shop" class="cover-slides">
            <ul class="slides-container">
                
                <li class="text-center">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <c:set var="thumnails" value="${latelyBoardListForMain}" />
                                    <img src="${pageContext.request.contextPath}/upload/${thumnails[0].originalFilename}" alt="">
                                    <h2 class="m-b-20"><strong style="color: rgb(241, 238, 233);">${latelyBoardListForMain[0].title}</strong></h2>
                                    <p><a class="btn hvr-hover" href="getFreeBoard?boardSeq=${latelyBoardListForMain[0].board_seq}" style="background: none; font-size:15px;">글 보러가기</a></p>
                                    
                            </div>
                        </div>
                    </div>
                </li>

                <li class="text-center">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                    <img src="${pageContext.request.contextPath}/upload/${thumnails[1].originalFilename}" alt="">
                                    <h2 class="m-b-20"><strong style="color: rgb(245, 242, 238);">${latelyBoardListForMain[1].title}</strong></h2>
                                    <p><a class="btn hvr-hover" href="getFreeBoard?boardSeq=${latelyBoardListForMain[1].board_seq}" style="background: none; font-size:15px;">글 보러가기</a></p>
                                  
                            </div>
                        </div>
                    </div>
                </li>

                <li class="text-center">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                    <img src="${pageContext.request.contextPath}/upload/${thumnails[2].originalFilename}" alt="">
                                    <h2 class="m-b-20"><strong style="color: rgb(238, 235, 229);">${latelyBoardListForMain[2].title}</strong></h2>
                                    <p><a class="btn hvr-hover" href="getFreeBoard?boardSeq=${latelyBoardListForMain[2].board_seq}" style="background: none; font-size:15px;">글 보러가기</a></p>
                                  
                            </div>
                        </div>
                    </div>
                </li>
                
            </ul>
        </div>  
    </div>
</div>    
<hr class="line-paint">


<!-- board list form 시작 -->

<div class="container">
  <div>

    <section>
      <!--for demo wrap-->
      
      <div class="tbl-header">
          <h1></h1>
        <!-- search 버튼 시작 -->
        <form id="listForm" action="getFreeBoardList" name="POST">
        <!-- <input type="hidden" id="hKeywordType" name="hKeywordType" value="${keywordType}">
        <input type="hidden" id="hKeyword" name="hKeyword" value="${keyword}"> -->
        <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
        <div class="main-search-input-wrap" >
            <div class="option-select">
                <select class="form-control" name="keywordType" id="keywordType">
                    <option class="optionKeywordTypeTitle"  value="title" >제목</option>
                    <option class="optionKeywordTypeContent" value="content" >내용</option>
                </select>
            </div>
          <div class="main-search-input fl-wrap" style="margin-top: 30px;">
            <div class="main-search-input-item"> 
              <input id="input-keyword" name="keyword" type="text" value="" placeholder="검색어를 입력하세요"> 
            </div> 
            <input type="submit" class="main-search-button" id="searchBtn" value="검색"/>
          </div>
        </div>
    </form>
   
        <!-- search 버튼 종료 -->  
              <table class="board-table" cellpadding="0" cellspacing="0" >
                <thead>
                  <tr>
                    <th >번호</th>
                    <th class="title">제목</th>
                    <th>작성자</th>
                    <th>등록일</th>
                    <th>조회수</th>
                  </tr>
                </thead>
              </table>
            </div>
            <div class="tbl-content">
              <table class="board-table" cellpadding="0" cellspacing="0">
                <tbody>
                  <c:forEach var="freeBoard" items="${freeBoardList }">
			          	<tr>
				        	<td>${freeBoard.boardSeq }</td>
				        	<td class="title"><a href="getFreeBoard?boardSeq=${freeBoard.boardSeq}&pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}">${freeBoard.title } &nbsp [${freeBoard.count }]</a></td>
                            <!-- <td class="title"><a href="getFreeBoard?boardSeq=${freeBoard.boardSeq}">${freeBoard.title }</a></td> -->

                            <td>${freeBoard.userVO.userNickname }</td>

					        <td><fmt:formatDate value="${freeBoard.regDate }" pattern="yyyy-MM-dd"/></td>
                            <td>${freeBoard.cnt }</td>
			          	</tr>
		          </c:forEach>
                </tbody>
              </table>
            </div>

            <!-- <h1>${principal.user.userId}</h1> -->
            <c:choose>
                <c:when test="${empty principal}">
                    <div style="display:inline-block;">
                        <a  class="nav-link" href='#' onclick="noLoginUserCantWrite(); return false">글쓰러가기</a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div style="display:inline-block;">
                        <a  class="nav-link" href="/pawmap/board/form">글쓰러가기</a>
                    </div>
                </c:otherwise>
            </c:choose>

        </section>
    </div>
</div>

<!-- 페이지 네이션 시작 -->

<div class="page-div">
    <ul class="pagination justify-content-center">
        <c:if test="${pageMaker.prev }">
            <li class="page-item pagination_button">
                <a class="page-link" href="${pageMaker.startPage - 1 }" >Prev</a>
            </li>
        </c:if>
        <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
        <li class="page-item pagination_button ${num == pageMaker.cri.pageNum? "active" : "" }" > 
            <a id="nowPage" class="page-link" href="${num }">${num }</a>
        </li>
        </c:forEach>
        <c:if test="${pageMaker.next }">
        <li class="page-item pagination_button">
            <a class="page-link" href="${pageMaker.endPage + 1 }">Next</a>
        </li>
        </c:if>
    </ul>
</div>



<!-- 페이지 네이션 종료 -->

<!-- board list form 종료 -->
      

    <!-- Start Footer  -->


    <%@ include file="layout/footer.jsp" %>

    <script>

        function noLoginUserCantWrite(){
            alert("로그인이 필요합니다.");
            
        }

        $(document).ready(function() {


            //console.log($("#hKeywordType").val());
            //console.log($("#hKeyword").val());
            var listForm = $("#listForm");

            var link = document.location.href;

            var keyword = getParameterByName('keyword');

            var keywordType = getParameterByName('keywordType');

            var optionKeywordTypeTitle = $(".optionKeywordTypeTitle");
            var optionKeywordTypeContent = $(".optionKeywordTypeContent");

            function getParameterByName(name) { name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]"); 
            var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), 
                results = regex.exec(location.search); 
                return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " ")); 
            }

            function holdKeywordType(keywordType){
                if(keywordType == "title"){
                    console.log("holdKeywordType ======= title");
                    optionKeywordTypeTitle.prop("selected",true);
                }
                if(keywordType == "content"){
                    console.log("holdKeywordType ======= content");  
                    optionKeywordTypeContent.prop("selected",true);      
                }
            }


                $(".page-link").on("click", function(e) {
                e.preventDefault();
                
                listForm.find("input[name='pageNum']").val($(this).attr("href"));
                listForm.submit();
            });
            
            document.getElementById("input-keyword").value=keyword;

            //console.log(link);
            //console.log(keyword);
            //console.log(optionKeywordTypeTitle);
            //console.log(optionKeywordTypeContent);
            holdKeywordType(keywordType);

        });
        
    </script>
    
