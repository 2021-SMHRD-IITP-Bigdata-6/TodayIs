<%@page import="com.today.DTO.mainLifeDTO"%>
<%@page import="com.today.DAO.mainLifeDAO"%>
<%@page import="com.today.DAO.moveDAO"%>
<%@page import="com.today.DTO.mainPageDTO"%>
<%@page import="com.today.DTO.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Video Catalog</title>
    <link rel="stylesheet" href="fontawesome/css/all.min.css" />

    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/templatemo-video-catalog.css" />
    <!--

    TemplateMo 552 Video Catalog

    https://templatemo.com/tm-552-video-catalog

    -->
<title> TODAY? MAIN PAGE </title>
</head>
<body>

<%
// main 페이지 연결
memberDTO dto = (memberDTO)session.getAttribute("dto");
mainPageDTO move_dto = (mainPageDTO)session.getAttribute("move_dto");
moveDAO move_dao = new moveDAO();
	
// main 상세 페이지 연결
mainLifeDAO life_dao = new mainLifeDAO();
mainLifeDTO life_dto = null;
%>

<div class="tm-page-wrap mx-auto">
      <div class="position-relative">
        <div class="position-absolute tm-site-header">
          <div class="container-fluid position-relative">
            <div class="row">
              <div class="col-5 col-md-8 ml-auto mr-0">
                <div class="tm-site-nav">
                  <nav
                    class="navbar navbar-expand-lg mr-0 ml-auto"
                    id="tm-main-nav"
                  >
                    <button
                      class="
                        navbar-toggler
                        tm-bg-black
                        py-2
                        px-3
                        mr-0
                        ml-auto
                        collapsed
                      "
                      type="button"
                      data-toggle="collapse"
                      data-target="#navbar-nav"
                      aria-controls="navbar-nav"
                      aria-expanded="false"
                      aria-label="Toggle navigation"
                    >
                      <span>
                        <i class="fas fa-bars tm-menu-closed-icon"></i>
                        <i class="fas fa-times tm-menu-opened-icon"></i>
                      </span>
                    </button>
                    <div
                      class="collapse navbar-collapse tm-nav"
                      id="navbar-nav"
                    >
                      <ul class="navbar-nav text-uppercase">
                        <%if(dto != null){ %>
                        <li class="nav-item">
                          <a class="nav-link tm-nav-link" href="#">
                          	<%=dto.getMb_nickname()%> 's
                          </a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link tm-nav-link" href="#" id=Mb_region>
                          	<%=dto.getMb_region()%>
                          </a>
                        </li>
                        <%} %>
                        <%if(dto == null){ %>
                        <li class="nav-item">
                          <a class="nav-link tm-nav-link" href="login.html">login</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link tm-nav-link" href="team">join</a>
                        </li>
                        <%}else{ %>
                        <li class="nav-item">
                          <a class="nav-link tm-nav-link" href="LogoutService">logout</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link tm-nav-link" 
                             href="update.jsp?mb_id=<%=dto.getMb_id() %>">update</a>
                        </li>
                        <%} %>
                        <li class="nav-item active">
                          <a class="nav-link tm-nav-link" href="t_community.jsp"
                            >weather <span class="sr-only">(current)</span></a
                          >
                        </li>
                        <li class="nav-item">
                          <a class="nav-link tm-nav-link" href="about.html"
                            >today</a
                          >
                        </li>
                        <li class="nav-item">
                          <a class="nav-link tm-nav-link" href="contact.html"
                            >my</a
                          >
                        </li>
                      </ul>
                    </div>
                  </nav>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="tm-welcome-container text-center text-white">
          <div class="tm-welcome-container-inner">
          		<!-- 메인페이지 기온 보여주기 -->
            	<% if(dto != null){%>
            		<p class="tm-welcome-text mb-1 text-white">
           			<%=move_dao.Move(dto.getMb_region()).getW_temp() %>℃
           			</p>
           		<%}%>
            <a
              href="#content"
              class="btn tm-btn-animate tm-btn-cta tm-icon-down"
            >
              <span>Detail</span>
            </a>
          </div>
        </div>
        <div id="tm-video-container">
        <% if(dto != null){%>
        	 <%if(move_dao.Move(dto.getMb_region()).getW_status().equals("맑음") 
        		|| move_dao.Move(dto.getMb_region()).getW_status().equals("")){ %>
		          <video autoplay muted loop id="tm-video">
		            <!-- <source src="video/sunset-timelapse-video.mp4" type="video/mp4"> -->
		            <source src="video/Sun.mp4" type="video/mp4" />
		          </video>
		     <%}else if(move_dao.Move(dto.getMb_region()).getW_status().equals("구름많음")){ %>
		     	<video autoplay muted loop id="tm-video">
		            <source src="video/CloudMore.mp4" type="video/mp4" />
		          </video>
		     <%}else if(move_dao.Move(dto.getMb_region()).getW_status().equals("구름조금")){%>
		     	<video autoplay muted loop id="tm-video">
		            <source src="video/CloudLess.mp4" type="video/mp4" />
		          </video>
		     <%}else if(move_dao.Move(dto.getMb_region()).getW_status().equals("비많음")){ %>
		     	<video autoplay muted loop id="tm-video">
		            <source src="video/Forest .mp4" type="video/mp4" />
		          </video>
		     <%}else if(move_dao.Move(dto.getMb_region()).getW_status().equals("비적음")){ %>
		     	<video autoplay muted loop id="tm-video">
		            <source src="video/Rainless.mp4" type="video/mp4" />
		          </video>
		     <%}else if(move_dao.Move(dto.getMb_region()).getW_status().equals("번개")){ %>
		     	<video autoplay muted loop id="tm-video">
		            <source src="video/Lightning.mp4" type="video/mp4" />
		          </video>
		     <%}else if(move_dao.Move(dto.getMb_region()).getW_status().equals("약한 눈 단속적") 
		    		 || move_dao.Move(dto.getMb_region()).getW_status().equals("약한 눈 연속적")){ %>
		     	<video autoplay muted loop id="tm-video">
		            <source src="video/Snow.mp4" type="video/mp4" />
		          </video>
		     <%}else if(move_dao.Move(dto.getMb_region()).getW_status().equals("흐림")){ %>
		     	<video autoplay muted loop id="tm-video">
		            <source src="video/Grey.mp4" type="video/mp4" />
		          </video>
		     <%}else if(move_dao.Move(dto.getMb_region()).getW_status().equals("박무")){ %>
		     	<video autoplay muted loop id="tm-video">
		            <source src="video/smog.mp4" type="video/mp4" />
		          </video>
		     <%} %>
	  <%}else{ %>
	  	<video autoplay muted loop id="tm-video">
		     <source src="video/smog.mp4" type="video/mp4" />
		</video>
	  <%} %>	
      </div>
        <i id="tm-video-control-button" class="fas fa-pause"></i>
      </div>

      <div class="container-fluid">
        <div id="content" class="mx-auto tm-content-container">
          <main>
            <div class="row">
              <div class="col-12">
                <h2 class="tm-page-title mb-4">상세 날씨</h2>

                <!--
                            <div class="tm-categories-container mb-5">
                                <h3 class="tm-text-primary tm-categories-text">Categories:</h3>
                                <ul class="nav tm-category-list">
                                    <li class="nav-item tm-category-item"><a href="#" class="nav-link tm-category-link active">All</a></li>
                                    <li class="nav-item tm-category-item"><a href="#" class="nav-link tm-category-link">Drone Shots</a></li>
                                    <li class="nav-item tm-category-item"><a href="#" class="nav-link tm-category-link">Nature</a></li>
                                    <li class="nav-item tm-category-item"><a href="#" class="nav-link tm-category-link">Actions</a></li>
                                    <li class="nav-item tm-category-item"><a href="#" class="nav-link tm-category-link">Featured</a></li>
                                </ul>
                            </div>        
                            -->
              </div>
            </div>

            <!--첫 번째 줄 : 상세날씨 -->
            <div class="row tm-catalog-item-list">
              <div class="col-lg-4 col-md-6 col-sm-12 tm-catalog-item">
                <!--
                            <div class="position-relative tm-thumbnail-container">
                                <img src="img/tn-01.jpg" alt="Image" class="img-fluid tm-catalog-item-img">    
                                <a href="video-page.html" class="position-absolute tm-img-overlay">
                                    <i class="fas fa-play tm-overlay-icon"></i>
                                </a>    
                            </div>
                            -->
                <div class="p-4 tm-bg-gray tm-catalog-item-description">
                  <h3 class="tm-text-primary mb-3 tm-catalog-item-title">
                    체감온도
                  </h3>
                  <p class="tm-catalog-item-text">
                  	<%if (dto != null) {%>
	                    <span class="tm-text-secondary">
	                   	<%=move_dao.Move(dto.getMb_region()).getW_body_temp()%>℃	
	                    </span>
	                <%}%><br />추워요.
                  </p>
                </div>
              </div>

              <div class="col-lg-4 col-md-6 col-sm-12 tm-catalog-item">
                <!--
                            <div class="position-relative tm-thumbnail-container">
                                <img src="img/tn-02.jpg" alt="Image" class="img-fluid tm-catalog-item-img">    
                                <a href="video-page.html" class="position-absolute tm-img-overlay">
                                    <i class="fas fa-play tm-overlay-icon"></i>
                                </a>    
                            </div>
                            -->
                <div class="p-4 tm-bg-gray tm-catalog-item-description">
                  <h3 class="tm-text-primary mb-3 tm-catalog-item-title">
                    습도
                  </h3>
                  <p class="tm-catalog-item-text">
                  	<%if(dto != null){ %>
                    	<span class="tm-text-secondary">
                    	<%=move_dao.Move(dto.getMb_region()).getW_humidity()%>%
                    	</span>
                    <%} %><br />대체로 좋아요.
                  </p>
                </div>
              </div>
              <div class="col-lg-4 col-md-6 col-sm-12 tm-catalog-item">
                <!--
                            <div class="position-relative tm-thumbnail-container">
                                <img src="img/tn-03.jpg" alt="Image" class="img-fluid tm-catalog-item-img">    
                                <a href="video-page.html" class="position-absolute tm-img-overlay">
                                    <i class="fas fa-play tm-overlay-icon"></i>
                                </a>
                            </div>                            
                            -->
                <div class="p-4 tm-bg-gray tm-catalog-item-description">
                  <h3 class="tm-text-primary mb-3 tm-catalog-item-title">
                    풍향
                  </h3>
                  <p class="tm-catalog-item-text">
                  	<%if(dto != null){ %>
                    	<span class="tm-text-secondary">
                    	<%=move_dao.Move(dto.getMb_region()).getW_wind()%>
                    	</span>
                    	<%} %><br />바람이 세요.
                  </p>
                </div>
              </div>

              <div class="row tm-catalog-item-list">
                <div class="col-12">
                  <h2 class="tm-page-title mb-4">생활 지수</h2>

                  <!--
                                <div class="tm-categories-container mb-5">
                                    <h3 class="tm-text-primary tm-categories-text">Categories:</h3>
                                    <ul class="nav tm-category-list">
                                        <li class="nav-item tm-category-item"><a href="#" class="nav-link tm-category-link active">All</a></li>
                                        <li class="nav-item tm-category-item"><a href="#" class="nav-link tm-category-link">Drone Shots</a></li>
                                        <li class="nav-item tm-category-item"><a href="#" class="nav-link tm-category-link">Nature</a></li>
                                        <li class="nav-item tm-category-item"><a href="#" class="nav-link tm-category-link">Actions</a></li>
                                        <li class="nav-item tm-category-item"><a href="#" class="nav-link tm-category-link">Featured</a></li>
                                    </ul>
                                </div>        
                                -->
                </div>

                <!--두 번째 줄 : 생활지수-->
                <div class="col-lg-4 col-md-6 col-sm-12 tm-catalog-item">
                  <!--텍스트 위 이미지
                            <div class="position-relative tm-thumbnail-container">
                                <img src="img/tn-04.jpg" alt="Image" class="img-fluid tm-catalog-item-img">    
                                <a href="video-page.html" class="position-absolute tm-img-overlay">
                                    <i class="fas fa-play tm-overlay-icon"></i>
                                </a>
                            </div>
                            -->

                  <div class="p-4 tm-bg-gray tm-catalog-item-description">
                    <h3 class="tm-text-primary mb-3 tm-catalog-item-title">
                      세탁 지수
                    </h3>
                    <p class="tm-catalog-item-text">
                      <%if(dto != null){ %>
	                      <span class="tm-text-secondary">
	                      <%=life_dao.life_dto(dto.getMb_region()).getw_wash() %>%
	                      </span>
                      <%} %><br />빨래하기  좋은 날씨입니다.
                    </p>
                  </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-12 tm-catalog-item">
                  <!--텍스트 위 이미지
                            <div class="position-relative tm-thumbnail-container">
                                <img src="img/tn-05.jpg" alt="Image" class="img-fluid tm-catalog-item-img">    
                                <a href="video-page.html" class="position-absolute tm-img-overlay">
                                    <i class="fas fa-play tm-overlay-icon"></i>
                                </a>
                            </div>
                            -->
                  <div class="p-4 tm-bg-gray tm-catalog-item-description">
                    <h3 class="tm-text-primary mb-3 tm-catalog-item-title">
                      외출 지수
                    </h3>
                    <p class="tm-catalog-item-text">
                      <%if(dto != null){ %>
	                      <span class="tm-text-secondary">
	                      <%=life_dao.life_dto(dto.getMb_region()).getW_out() %>%
	                      </span>
                      <%} %><br />외출하기 좋은 날씨입니다.
                    </p>
                  </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-12 tm-catalog-item">
                  <!--텍스트 위 이미지
                            <div class="position-relative tm-thumbnail-container">
                                <img src="img/tn-06.jpg" alt="Image" class="img-fluid tm-catalog-item-img">    
                                <a href="video-page.html" class="position-absolute tm-img-overlay">
                                    <i class="fas fa-play tm-overlay-icon"></i>
                                </a>
                            </div>              
                            -->
                  <div class="p-4 tm-bg-gray tm-catalog-item-description">
                    <h3 class="tm-text-primary mb-3 tm-catalog-item-title">
                      운동 지수
                    </h3>
                    <p class="tm-catalog-item-text">
                      <%if(dto != null){ %>
	                      <span class="tm-text-secondary">
	                      <%=life_dao.life_dto(dto.getMb_region()).getW_exercise() %>%
	                      </span>
                      <%} %><br />실내운동을 즐겨요.
                    </p>
                  </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-12 tm-catalog-item">
                  <!--텍스트 위 이미지
                            <div class="position-relative tm-thumbnail-container">
                                <img src="img/tn-07.jpg" alt="Image" class="img-fluid tm-catalog-item-img">    
                                <a href="video-page.html" class="position-absolute tm-img-overlay">
                                    <i class="fas fa-play tm-overlay-icon"></i>
                                </a>
                            </div>    
                            -->
                  <div class="p-4 tm-bg-gray tm-catalog-item-description">
                    <h3 class="tm-text-primary mb-3 tm-catalog-item-title">
                      세차 지수
                    </h3>
                    <p class="tm-catalog-item-text">
                      <%if(dto != null){ %>
	                      <span class="tm-text-secondary">
	                      <%=life_dao.life_dto(dto.getMb_region()).getW_washcar() %>%
	                      </span>
                      <%} %><br />세차하기 좋은 날씨입니다.
                    </p>
                  </div>
                </div>

                <div class="col-lg-4 col-md-6 col-sm-12 tm-catalog-item">
                  <!--텍스트 위 이미지
                            <div class="position-relative tm-thumbnail-container">
                                <img src="img/tn-08.jpg" alt="Image" class="img-fluid tm-catalog-item-img">    
                                <a href="video-page.html" class="position-absolute tm-img-overlay">
                                    <i class="fas fa-play tm-overlay-icon"></i>
                                </a>
                            </div>
                            -->
                  <div class="p-4 tm-bg-gray tm-catalog-item-description">
                    <h3 class="tm-text-primary mb-3 tm-catalog-item-title">
                      우산 지수
                    </h3>
                    <p class="tm-catalog-item-text">
                      <%if(dto != null){ %>
	                      <span class="tm-text-secondary">
	                      <%=life_dao.life_dto(dto.getMb_region()).getW_rain() %>%
	                      </span>
                      <%} %><br />휴대 편리한 우산으로 준비하세요.
                    </p>
                  </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-12 tm-catalog-item">
                  <!--텍스트 위 이미지
                            <div class="position-relative tm-thumbnail-container">
                                <img src="img/tn-09.jpg" alt="Image" class="img-fluid tm-catalog-item-img">    
                                <a href="video-page.html" class="position-absolute tm-img-overlay">
                                    <i class="fas fa-play tm-overlay-icon"></i>
                                </a>
                            </div>              
                            -->
                  <div class="p-4 tm-bg-gray tm-catalog-item-description">
                    <h3 class="tm-text-primary mb-3 tm-catalog-item-title">
                      수면 지수
                    </h3>
                    <p class="tm-catalog-item-text">
                    <%if(dto != null){ %>
	                      <span class="tm-text-secondary">
	                      <%=life_dao.life_dto(dto.getMb_region()).getW_sleep() %>%
	                      </span>
                      <%} %><br />쾌적하게 수면할 수 있습니다.
                    </p>
                  </div>
                </div>
              </div>

              <!--네 번째 줄 : 생활지수-->
              <div class="col-lg-4 col-md-6 col-sm-12 tm-catalog-item">
                <!--텍스트 위 이미지
                        <div class="position-relative tm-thumbnail-container">
                            <img src="img/tn-07.jpg" alt="Image" class="img-fluid tm-catalog-item-img">    
                            <a href="video-page.html" class="position-absolute tm-img-overlay">
                                <i class="fas fa-play tm-overlay-icon"></i>
                            </a>
                        </div>    
                        -->
                <div class="p-4 tm-bg-gray tm-catalog-item-description">
                  <h3 class="tm-text-primary mb-3 tm-catalog-item-title">
                    감기 지수
                  </h3>
                  <p class="tm-catalog-item-text">
                  <%if(dto != null){ %>
	                    <span class="tm-text-secondary">
	                    <%=life_dao.life_dto(dto.getMb_region()).getW_cold() %>%
	                    </span>
                    <%} %><br />감기 걸리지 않게 유의하세요.
                  </p>
                </div>
              </div>

              <div class="col-lg-4 col-md-6 col-sm-12 tm-catalog-item">
                <!--텍스트 위 이미지
                        <div class="position-relative tm-thumbnail-container">
                            <img src="img/tn-08.jpg" alt="Image" class="img-fluid tm-catalog-item-img">    
                            <a href="video-page.html" class="position-absolute tm-img-overlay">
                                <i class="fas fa-play tm-overlay-icon"></i>
                            </a>
                        </div>
                        -->
                <div class="p-4 tm-bg-gray tm-catalog-item-description">
                  <h3 class="tm-text-primary mb-3 tm-catalog-item-title">
                    불조심 지수
                  </h3>
                  <p class="tm-catalog-item-text">
                  <%if(dto != null){ %>
	                    <span class="tm-text-secondary">
	                    <%=life_dao.life_dto(dto.getMb_region()).getW_fire() %>%
	                    </span>
                    <%} %><br />세심하게 주위를 살펴요.
                  </p>
                </div>
              </div>
              <div class="col-lg-4 col-md-6 col-sm-12 tm-catalog-item">
                <!--텍스트 위 이미지
                        <div class="position-relative tm-thumbnail-container">
                            <img src="img/tn-09.jpg" alt="Image" class="img-fluid tm-catalog-item-img">    
                            <a href="video-page.html" class="position-absolute tm-img-overlay">
                                <i class="fas fa-play tm-overlay-icon"></i>
                            </a>
                        </div>              
                        -->
                <div class="p-4 tm-bg-gray tm-catalog-item-description">
                  <h3 class="tm-text-primary mb-3 tm-catalog-item-title">
                    피부지수
                  </h3>
                  <p class="tm-catalog-item-text">
                  <%if(dto != null){ %>
	                  <span class="tm-text-secondary">
	                  <%=move_dao.Move(dto.getMb_region()).getW_temp()%>℃
	                  </span>
                  <%} %><br />목도리 장갑  준비하세요.
                  </p>
                </div>
              </div>
            </div>

            <!-- Catalog Paging Buttons -->
            <div>
              <ul class="nav tm-paging-links">
                <!--
                            <li class="nav-item active"><a href="#" class="nav-link tm-paging-link"></a>1</li>
                            -->
                <li class="nav-item">
                  <a href="#" class="nav-link tm-paging-link">∧</a>
                </li>
                <!--
                            <li class="nav-item"><a href="#" class="nav-link tm-paging-link">3</a></li>
                            <li class="nav-item"><a href="#" class="nav-link tm-paging-link">4</a></li>
                            <li class="nav-item"><a href="#" class="nav-link tm-paging-link">></a></li>
                            -->
              </ul>
            </div>
          </main>

          <!-- Subscribe form and footer links -->
          <div class="row mt-5 pt-3">
            <div class="col-xl-6 col-lg-12 mb-4">
              <div class="tm-bg-gray p-5 h-100">
                <h3 class="tm-text-primary mb-3">
                  Do you want to get our latest updates?
                </h3>
                <p class="mb-5">
                  Please subscribe our newsletter for upcoming new videos and
                  latest information about our work. Thank you.
                </p>
                <form action="" method="GET" class="tm-subscribe-form">
                  <input
                    type="text"
                    name="email"
                    placeholder="Your Email..."
                    required
                  />
                  <button
                    type="submit"
                    class="btn rounded-0 btn-primary tm-btn-small"
                  >
                    Subscribe
                  </button>
                </form>
              </div>
            </div>
            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-12 mb-4">
              <div class="p-5 tm-bg-gray">
                <h3 class="tm-text-primary mb-4">Quick Links</h3>
                <ul class="list-unstyled tm-footer-links">
                  <li><a href="#">Duis bibendum</a></li>
                  <li><a href="#">Purus non dignissim</a></li>
                  <li><a href="#">Sapien metus gravida</a></li>
                  <li><a href="#">Eget consequat</a></li>
                  <li><a href="#">Praesent eu pulvinar</a></li>
                </ul>
              </div>
            </div>
            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-12 mb-4">
              <div class="p-5 tm-bg-gray h-100">
                <h3 class="tm-text-primary mb-4">Our Pages</h3>
                <ul class="list-unstyled tm-footer-links">
                  <li><a href="#">Our Videos</a></li>
                  <li><a href="#">License Terms</a></li>
                  <li><a href="#">About Us</a></li>
                  <li><a href="#">Contact</a></li>
                  <li><a href="#">Privacy Policies</a></li>
                </ul>
              </div>
            </div>
          </div>
          <!-- row -->

          <footer class="row pt-5">
            <div class="col-12">
              <p class="text-right">
                Copyright 2020 The Video Catalog Company - Designed by
                <a href="https://templatemo.com" rel="nofollow" target="_parent"
                  >TemplateMo</a
                >
              </p>
            </div>
          </footer>
        </div>
        <!-- tm-content-container -->
      </div>
    </div>
    <!-- .tm-page-wrap -->

    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
    	// 날씨에 따라 메인화면 영상 송출?

    	
    
      function setVideoSize() {
        const vidWidth = 1920;
        const vidHeight = 1080;
        let windowWidth = window.innerWidth;
        let newVidWidth = windowWidth;
        let newVidHeight = (windowWidth * vidHeight) / vidWidth;
        let marginLeft = 0;
        let marginTop = 0;

        if (newVidHeight < 500) {
          newVidHeight = 500;
          newVidWidth = (newVidHeight * vidWidth) / vidHeight;
        }

        if (newVidWidth > windowWidth) {
          marginLeft = -((newVidWidth - windowWidth) / 2);
        }

        if (newVidHeight > 720) {
          marginTop = -((newVidHeight - $("#tm-video-container").height()) / 2);
        }

        const tmVideo = $("#tm-video");

        tmVideo.css("width", newVidWidth);
        tmVideo.css("height", newVidHeight);
        tmVideo.css("margin-left", marginLeft);
        tmVideo.css("margin-top", marginTop);
      }

      $(document).ready(function () {
        /************** Video background *********/

        setVideoSize();

        // Set video background size based on window size
        let timeout;
        window.onresize = function () {
          clearTimeout(timeout);
          timeout = setTimeout(setVideoSize, 100);
        };

        // Play/Pause button for video background
        const btn = $("#tm-video-control-button");

        btn.on("click", function (e) {
          const video = document.getElementById("tm-video");
          $(this).removeClass();

          if (video.paused) {
            video.play();
            $(this).addClass("fas fa-pause");
          } else {
            video.pause();
            $(this).addClass("fas fa-play");
          }
        });
      });
    </script>
  </body>
</html>