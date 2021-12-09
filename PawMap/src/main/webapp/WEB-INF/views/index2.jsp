<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="layout/header.jsp" %>

<style>
.hov-in {
  opacity: 0;
  background: rgba(0, 0, 0, 0.5);
  bottom: -50%;
  position: absolute;
  width: 100%;
  height: 100%;
  -webkit-transition: all 0.3s ease-out 0.5s;
  -moz-transition: all 0.3s ease-out 0.5s;
  -o-transition: all 0.3s ease-out 0.5s;
  -ms-transition: all 0.3s ease-out 0.5s;
  transition: all 0.3s ease-out 0.5s;
  text-align: center;
  display: table;
}
.hov-in a {
  display: table-cell;
  vertical-align: middle;
  height: 100%;
}

.ins-inner-box:hover .hov-in {
  bottom: 0;
  opacity: 1;
}
</style>



    <!-- Start Top Search -->
    <div class="top-search">
      <div class="container">
        <div class="input-group">
          <span class="input-group-addon"><i class="fa fa-search"></i></span>
          <input type="text" class="form-control" placeholder="Search" />
          <span class="input-group-addon close-search"
            ><i class="fa fa-times"></i
          ></span>
        </div>
      </div>
    </div>
    <!-- End Top Search -->

    <!-- Start Slider -->
    <div id="slides-shop" class="cover-slides">
      <ul class="slides-container">
        <li class="text-center">
          <img src="images/Dog1.jpg" alt="" />
          <div class="container">
            <div class="row">
              <div class="col-md-12">
                <h1 class="m-b-20">
                  <strong
                    >Welcome To <br />
                    PawMap</strong
                  >
                </h1>
                <p class="m-b-40">
                  테스트 문구
                  <br />
                  테스트 문구 테스트 테스트 테스트 테스트
                </p>
                <p><a class="btn hvr-hover" href="#">자세히 보기</a></p>
              </div>
            </div>
          </div>
        </li>
        <li class="text-center">
          <img src="images/Dog2.jpg" alt="" />
          <div class="container">
            <div class="row">
              <div class="col-md-12">
                <h1 class="m-b-20">
                  <strong
                    >PawMap <br />
                    병원 찾기 서비스</strong
                  >
                </h1>
                <p class="m-b-40">
                  반려동물을 위한 병원 찾기 서비스
                  <br />
                  여러분의 근처에 착한 동물 병원을 찾아보세요.
                </p>
                <p><a class="btn hvr-hover" href="#">자세히 보기</a></p>
              </div>
            </div>
          </div>
        </li>
        <li class="text-center">
          <img src="images/ugi.jpg" alt="" />
          <div class="container">
            <div class="row">
              <div class="col-md-12">
                <h1 class="m-b-20">
                  <strong
                    >PawMap <br />
                    보호소 찾기 서비스</strong
                  >
                </h1>
                <p class="m-b-40">
                  어려움에 처한 유기 및 파양 동물에게 작은 힘이 되어주세요.
                  <br />
                  여러분의 작은 관심이 이들에게 큰 힘이 됩니다.
                </p>
                <p><a class="btn hvr-hover" href="#">자세히 보기</a></p>
              </div>
            </div>
          </div>
        </li>
      </ul>
      <div class="slides-navigation">
        <a href="#" class="next"
          ><i class="fa fa-angle-right" aria-hidden="true"></i
        ></a>
        <a href="#" class="prev"
          ><i class="fa fa-angle-left" aria-hidden="true"></i
        ></a>
      </div>
    </div>
    <!-- End Slider -->

    <!-- 검색 부분-->
    <div class="container custom_margin">
      <div class="d-flex justify-content-center">
        <div class="search">
          <h3 class="text-center text-uppercase font-weight-bold">
            우리 동네 병원을 찾아보세요!
          </h3>
          <input
            class="search_input"
            type="text"
            name=""
            placeholder="search items !"
          />
          <a href="#" class="search_icon"><i class="fa fa-search"></i></a>
        </div>
      </div>
    </div>
    <!-- 검색 부분 끝-->

    <!--About Us 부분-->
    <div class="container custom_aboutUsBox">
      <div class="custom_aboutUs_textBox">
        <div class="h6 aboutUs_title">For the Animal</div>
        <br />
        <div class="custom_aboutUs_innerTextBox">
          동물을 위하는 마음으로 뭉쳤습니다.<br />
          강아지 고양이 말 소 개구리 파충류 돼지 곤충 매미 귀뚜라미 딱정벌레
        </div>
        <br />
        <button class="btn btn-primary btn-sm custom_btn" type="button">
          더보기
        </button>
      </div>
      <video
        class="index_video"
        src="images/cat_video.mp4"
        muted
        autoplay
        loop
      ></video>
    </div>
    <!--About Us 부분 끝-->

    <!--제휴 병원 소개 부분-->
    <div class="container custom_aboutUsBox">
      <div class="custom_aboutUs_img"></div>

      <div class="custom_aboutUs_textBox">
        <div class="h6 aboutUs_title">제휴 병원 안내</div>
        <br />
        <div class="custom_aboutUs_innerTextBox">
          잘하는 수의사들만 모아봤습니다.<br />
          강릉 아산병원 신림 양지병원 신촌 연세세브란스병원 <br />
          보라매공원 근처 보라매 병원 와플맛집 산책하고싶다
        </div>
        <br />
        <button class="btn btn-primary btn-sm custom_btn" type="button">
          더보기
        </button>
      </div>
    </div>
    <!--제휴 병원 소개 부분 끝-->

    <hr class="custom_hr" />


    
    <!-- Start Instagram Feed  -->
    <!-- 보호소 정보 페이지 표출부분 -->
    <div class="instagram-box">
      <div class="main-instagram owl-carousel owl-theme">
          <c:forEach items="${shelterPic}" var="shelterPic" varStatus="i">
          <div class="item">
            <div class="ins-inner-box" 
            style="    
            width:375px;
            height:375px;
            overflow:hidden;
            margin:0 auto;">
              <!-- <img src="images/abandoned2.jpg" alt="" /> -->
              <img class="img-fluid" src="${pageContext.request.contextPath}/upload/${shelterPic.originalFileName}" alt="" /
              style="    
              width:100%;
              height:100%;
              object-fit:cover">
            <div class="hov-in">
              <a>
                <h1 style="color: #ffffff"><strong>
                  ${shelterPic.shelterName }
                </h1></strong>
                <h4 style="color: #ffffff">
                  ${shelterPic.shelterAddress }
                  <br>
                  ${shelterPic.shelterTel } 
                </h4>

              </a>
            </div>
          </div>
        </div>
      </c:forEach>

      </div>
    </div>

        <!-- <div class="item">
          <div class="ins-inner-box">
            <img src="images/abandoned3.jpg" alt="" />
            <div class="hov-in">
              <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
          </div>
        </div> -->


    <!-- 후원자 표기 부분-->
    <!-- <div class="container charity_box">
      <div class="">후원자 닉네임 : 50,000원</div>
      <div class="">후원자 닉네임 : 50,000원</div>
      <div class="">후원자 닉네임 : 50,000원</div>
      <div class="">후원자 닉네임 : 50,000원</div>
    </div> -->
    <!-- 후원자 표기 부분 끝-->

    <!-- Start Products  -->
    <!-- <div class="products-box">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="title-all text-center">
              <h1>Fruits & Vegetables</h1>
              <p>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit
                amet lacus enim.
              </p>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <div class="special-menu text-center">
              <div class="button-group filter-button-group">
                <button class="active" data-filter="*">All</button>
                <button data-filter=".top-featured">Top featured</button>
                <button data-filter=".best-seller">Best seller</button>
              </div>
            </div>
          </div>
        </div>

        <div class="row special-list">
          <div class="col-lg-3 col-md-6 special-grid best-seller">
            <div class="products-single fix">
              <div class="box-img-hover">
                <div class="type-lb">
                  <p class="sale">Sale</p>
                </div>
                <img
                  src="images/img-pro-01.jpg"
                  class="img-fluid"
                  alt="Image"
                />
                <div class="mask-icon">
                  <ul>
                    <li>
                      <a
                        href="#"
                        data-toggle="tooltip"
                        data-placement="right"
                        title="View"
                        ><i class="fas fa-eye"></i
                      ></a>
                    </li>
                    <li>
                      <a
                        href="#"
                        data-toggle="tooltip"
                        data-placement="right"
                        title="Compare"
                        ><i class="fas fa-sync-alt"></i
                      ></a>
                    </li>
                    <li>
                      <a
                        href="#"
                        data-toggle="tooltip"
                        data-placement="right"
                        title="Add to Wishlist"
                        ><i class="far fa-heart"></i
                      ></a>
                    </li>
                  </ul>
                  <a class="cart" href="#">Add to Cart</a>
                </div>
              </div>
              <div class="why-text">
                <h4>Lorem ipsum dolor sit amet</h4>
                <h5>$7.79</h5>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 special-grid top-featured">
            <div class="products-single fix">
              <div class="box-img-hover">
                <div class="type-lb">
                  <p class="new">New</p>
                </div>
                <img
                  src="images/img-pro-02.jpg"
                  class="img-fluid"
                  alt="Image"
                />
                <div class="mask-icon">
                  <ul>
                    <li>
                      <a
                        href="#"
                        data-toggle="tooltip"
                        data-placement="right"
                        title="View"
                        ><i class="fas fa-eye"></i
                      ></a>
                    </li>
                    <li>
                      <a
                        href="#"
                        data-toggle="tooltip"
                        data-placement="right"
                        title="Compare"
                        ><i class="fas fa-sync-alt"></i
                      ></a>
                    </li>
                    <li>
                      <a
                        href="#"
                        data-toggle="tooltip"
                        data-placement="right"
                        title="Add to Wishlist"
                        ><i class="far fa-heart"></i
                      ></a>
                    </li>
                  </ul>
                  <a class="cart" href="#">Add to Cart</a>
                </div>
              </div>
              <div class="why-text">
                <h4>Lorem ipsum dolor sit amet</h4>
                <h5>$9.79</h5>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 special-grid top-featured">
            <div class="products-single fix">
              <div class="box-img-hover">
                <div class="type-lb">
                  <p class="sale">Sale</p>
                </div>
                <img
                  src="images/img-pro-03.jpg"
                  class="img-fluid"
                  alt="Image"
                />
                <div class="mask-icon">
                  <ul>
                    <li>
                      <a
                        href="#"
                        data-toggle="tooltip"
                        data-placement="right"
                        title="View"
                        ><i class="fas fa-eye"></i
                      ></a>
                    </li>
                    <li>
                      <a
                        href="#"
                        data-toggle="tooltip"
                        data-placement="right"
                        title="Compare"
                        ><i class="fas fa-sync-alt"></i
                      ></a>
                    </li>
                    <li>
                      <a
                        href="#"
                        data-toggle="tooltip"
                        data-placement="right"
                        title="Add to Wishlist"
                        ><i class="far fa-heart"></i
                      ></a>
                    </li>
                  </ul>
                  <a class="cart" href="#">Add to Cart</a>
                </div>
              </div>
              <div class="why-text">
                <h4>Lorem ipsum dolor sit amet</h4>
                <h5>$10.79</h5>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 special-grid best-seller">
            <div class="products-single fix">
              <div class="box-img-hover">
                <div class="type-lb">
                  <p class="sale">Sale</p>
                </div>
                <img
                  src="images/img-pro-04.jpg"
                  class="img-fluid"
                  alt="Image"
                />
                <div class="mask-icon">
                  <ul>
                    <li>
                      <a
                        href="#"
                        data-toggle="tooltip"
                        data-placement="right"
                        title="View"
                        ><i class="fas fa-eye"></i
                      ></a>
                    </li>
                    <li>
                      <a
                        href="#"
                        data-toggle="tooltip"
                        data-placement="right"
                        title="Compare"
                        ><i class="fas fa-sync-alt"></i
                      ></a>
                    </li>
                    <li>
                      <a
                        href="#"
                        data-toggle="tooltip"
                        data-placement="right"
                        title="Add to Wishlist"
                        ><i class="far fa-heart"></i
                      ></a>
                    </li>
                  </ul>
                  <a class="cart" href="#">Add to Cart</a>
                </div>
              </div>
              <div class="why-text">
                <h4>Lorem ipsum dolor sit amet</h4>
                <h5>$15.79</h5>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div> -->
    <!-- End Products  -->

    <!-- Start Blog  -->
    <!-- <div class="latest-blog">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="title-all text-center">
              <h1>latest blog</h1>
              <p>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit
                amet lacus enim.
              </p>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6 col-lg-4 col-xl-4">
            <div class="blog-box">
              <div class="blog-img">
                <img class="img-fluid" src="images/blog-img.jpg" alt="" />
              </div>
              <div class="blog-content">
                <div class="title-blog">
                  <h3>Fusce in augue non nisi fringilla</h3>
                  <p>
                    Nulla ut urna egestas, porta libero id, suscipit orci.
                    Quisque in lectus sit amet urna dignissim feugiat. Mauris
                    molestie egestas pharetra. Ut finibus cursus nunc sed
                    mollis. Praesent laoreet lacinia elit id lobortis.
                  </p>
                </div>
                <ul class="option-blog">
                  <li>
                    <a href="#"><i class="far fa-heart"></i></a>
                  </li>
                  <li>
                    <a href="#"><i class="fas fa-eye"></i></a>
                  </li>
                  <li>
                    <a href="#"><i class="far fa-comments"></i></a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 col-xl-4">
            <div class="blog-box">
              <div class="blog-img">
                <img class="img-fluid" src="images/blog-img-01.jpg" alt="" />
              </div>
              <div class="blog-content">
                <div class="title-blog">
                  <h3>Fusce in augue non nisi fringilla</h3>
                  <p>
                    Nulla ut urna egestas, porta libero id, suscipit orci.
                    Quisque in lectus sit amet urna dignissim feugiat. Mauris
                    molestie egestas pharetra. Ut finibus cursus nunc sed
                    mollis. Praesent laoreet lacinia elit id lobortis.
                  </p>
                </div>
                <ul class="option-blog">
                  <li>
                    <a href="#"><i class="far fa-heart"></i></a>
                  </li>
                  <li>
                    <a href="#"><i class="fas fa-eye"></i></a>
                  </li>
                  <li>
                    <a href="#"><i class="far fa-comments"></i></a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 col-xl-4">
            <div class="blog-box">
              <div class="blog-img">
                <img class="img-fluid" src="images/blog-img-02.jpg" alt="" />
              </div>
              <div class="blog-content">
                <div class="title-blog">
                  <h3>Fusce in augue non nisi fringilla</h3>
                  <p>
                    Nulla ut urna egestas, porta libero id, suscipit orci.
                    Quisque in lectus sit amet urna dignissim feugiat. Mauris
                    molestie egestas pharetra. Ut finibus cursus nunc sed
                    mollis. Praesent laoreet lacinia elit id lobortis.
                  </p>
                </div>
                <ul class="option-blog">
                  <li>
                    <a href="#"><i class="far fa-heart"></i></a>
                  </li>
                  <li>
                    <a href="#"><i class="fas fa-eye"></i></a>
                  </li>
                  <li>
                    <a href="#"><i class="far fa-comments"></i></a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div> -->
    <!-- End Blog  -->

    <!-- Start Instagram Feed //이거 디자인 좋은데 활용 방안 없을지 확인해보기 -->
    <!-- <div class="instagram-box">
      <div class="main-instagram owl-carousel owl-theme">
        <div class="item">
          <div class="ins-inner-box">
            <img src="images/instagram-img-01.jpg" alt="" />
            <div class="hov-in">
              <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
          </div>
        </div>
        <div class="item">
          <div class="ins-inner-box">
            <img src="images/instagram-img-02.jpg" alt="" />
            <div class="hov-in">
              <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
          </div>
        </div>
        <div class="item">
          <div class="ins-inner-box">
            <img src="images/instagram-img-03.jpg" alt="" />
            <div class="hov-in">
              <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
          </div>
        </div>
        <div class="item">
          <div class="ins-inner-box">
            <img src="images/instagram-img-04.jpg" alt="" />
            <div class="hov-in">
              <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
          </div>
        </div>
        <div class="item">
          <div class="ins-inner-box">
            <img src="images/instagram-img-05.jpg" alt="" />
            <div class="hov-in">
              <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
          </div>
        </div>
        <div class="item">
          <div class="ins-inner-box">
            <img src="images/instagram-img-06.jpg" alt="" />
            <div class="hov-in">
              <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
          </div>
        </div>
        <div class="item">
          <div class="ins-inner-box">
            <img src="images/instagram-img-07.jpg" alt="" />
            <div class="hov-in">
              <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
          </div>
        </div>
        <div class="item">
          <div class="ins-inner-box">
            <img src="images/instagram-img-08.jpg" alt="" />
            <div class="hov-in">
              <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
          </div>
        </div>
        <div class="item">
          <div class="ins-inner-box">
            <img src="images/instagram-img-09.jpg" alt="" />
            <div class="hov-in">
              <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
          </div>
        </div>
        <div class="item">
          <div class="ins-inner-box">
            <img src="images/instagram-img-05.jpg" alt="" />
            <div class="hov-in">
              <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
          </div>
        </div>
      </div>
    </div> -->
    <!-- End Instagram Feed  -->

<%@ include file="layout/footer.jsp" %>
 
