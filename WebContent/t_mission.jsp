<%@page import="com.today.DAO.commDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.today.DAO.boardDAO"%>
<%@page import="com.today.DTO.memberDTO"%>
<%@page import="com.today.DTO.commDTO"%>
<%@page import="com.today.DTO.boardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8" />
<title>🌤 Today</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width" />

<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Roboto+Slab:400,700,300,100" />
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Roboto:400,400italic,300italic,300,500,500italic,700,900" />

<link rel="stylesheet" href="t_css/bootstrap.css" />
<link rel="stylesheet" href="t_css/font-awesome.css" /> 
<link rel="stylesheet" href="t_css/animate.css" />
<link rel="stylesheet" href="t_css/templatemo-misc.css" />
<link rel="stylesheet" href="t_css/templatemo-style.css" />
<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet"/>
      <!-- https://fonts.google.com/ -->
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/templatemo-video-catalog.css" />
	
    
<script src="js/vendor/modernizr-2.6.1-respond-1.1.0.min.js"></script>

<style>
//
댓글 관련 스타일
	.replymenu a {
	cursor: pointer;
	word-spacing: 10px;
	line-height: 20px;
}

.replymenu {
	display: block;
	word-spacing: 10px;
	line-height: 20px;
	
}

.replyhide {
	display: none;
	word-spacing: 10px;
	line-height: 20px;
}


 td {
	border: 1px solid #3399cc;
	padding: 10px;
	font-size: small;
}

 tr {
	border: 1px solid #3399cc;
	padding: 10px;
	font-size: small;
}



</style>
</head>
<body>
	<%
	boardDTO board_dto = (boardDTO) session.getAttribute("board_dto");
	commDTO comm_dto = (commDTO) session.getAttribute("comm_dto");
	memberDTO dto = (memberDTO) session.getAttribute("dto");

	boardDAO board_dao = new boardDAO();
	ArrayList<boardDTO> arr = board_dao.board_all();

	commDAO comm_dao = new commDAO();
	ArrayList<commDTO> all = comm_dao.comm_selectall();
	int cnt = 0;
	%>

<div class="tm-page-wrap mx-auto">
		<div class="position-relative">
			<div class="potition-absolute tm-site-header">
				<div class="container-fluid position-relative">
					<div class="row">						
                        <div class="col-5 col-md-8 ml-auto mr-0">
                            <div class="tm-site-nav">
                                <nav class="navbar navbar-expand-lg mr-0 ml-auto" id="tm-main-nav">
                                    <button class="navbar-toggler tm-bg-black py-2 px-3 mr-0 ml-auto collapsed" type="button"
                                        data-toggle="collapse" data-target="#navbar-nav" aria-controls="navbar-nav"
                                        aria-expanded="false" aria-label="Toggle navigation">
                                        <span>
                                            <i class="fas fa-bars tm-menu-closed-icon"></i>
                                            <i class="fas fa-times tm-menu-opened-icon"></i>
                                        </span>
                                    </button>
                                    <div class="collapse navbar-collapse tm-nav" id="navbar-nav">
                                        <ul class="navbar-nav text-uppercase">
                                            <li class="nav-item">
                                                <a class="nav-link tm-nav-link" href="index.html">weather</a>
                                            </li>
                                            <li class="nav-item active">
                                                <a class="nav-link tm-nav-link" href="ver1_community_mission.html">today <span class="sr-only">(current)</span></a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link tm-nav-link" href="contact.html">my</a>
                                            </li>
                                        </ul>
                                    </div>
                                </nav>
                            </div>
                        </div>
					</div>
				</div>
			</div>
            
			<div class="tm-welcome-container tm-fixed-header tm-fixed-header-2">
				<!--
        			<div class="text-center">
					<p class="pt-5 px-3 tm-welcome-text tm-welcome-text-2 mb-1 mt-lg-0 mt-5 text-white mx-auto">Another Image BG<br>it can be fixed.<br>Content will simply slide over.</p>                	
				</div>                
                -->
            </div>

            <div id="tm-fixed-header-bg"></div> <!-- Header image -->
		</div>



        <!--page start-->
        <div class="content-wrapper">
            <div class="inner-container container">
                <div class="row">
                    <div class="section-header col-md-12">
                        <h2>☁︎ COMMUNITY MISSION_ver1</h2>
                        <span>mission : keywords</span>
                    </div> <!-- /.section-header -->
                </div> <!-- /.row -->
                <div class="projects-holder-3">
                    <!--
                    <div class="filter-categories">
                        <ul class="project-filter">
                            <li class="filter" data-filter="all"><span>지역</span></li>
                            <li class="filter" data-filter="buildings"><span>서울</span></li>
                            <li class="filter" data-filter="design"><span>부산</span></li>
                            <li class="filter" data-filter="architecture"><span>대구</span></li>
                            <li class="filter" data-filter="ic"><span>인천</span></li>
                            <li class="filter" data-filter="gj"><span>광주</span></li>
                            <li class="filter" data-filter="nature"><span>대전</span></li>
                            <li class="filter" data-filter="nature"><span>울산</span></li>
                            <li class="filter" data-filter="nature"><span>강원</span></li>
                            <li class="filter" data-filter="nature"><span>경기</span></li>
                            <li class="filter" data-filter="nature"><span>경남</span></li>
                            <li class="filter" data-filter="nature"><span>경북</span></li>
                            <li class="filter" data-filter="nature"><span>전남</span></li>
                            <li class="filter" data-filter="nature"><span>전북</span></li>
                            <li class="filter" data-filter="nature"><span>제주</span></li>
                            <li class="filter" data-filter="nature"><span>충남</span></li>
                            <li class="filter" data-filter="nature"><span>충북</span></li>
                        </ul>
                    </div>
                    -->
                    
                    <div class="projects-holder">
                        <div class="row">
                            <!--미션글_1-->
                            <div class="col-md-4 project-item mix design">
                                <div class="project-thumb">
                                    <img src="images/projects/project_1.jpg" alt="">
                                    <div class="overlay-b">
                                        <div class="overlay-inner">
                                            <a href="images/projects/project_1.jpg" class="fancybox fa fa-expand" title="글내용"></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="box-content project-detail">
                                    <h2><a href="project-details.html">#지역</a></h2>
                                    <p>글 내용</p>
                                </div>
                            </div> <!--미션글_2 -->
                            <div class="col-md-4 project-item mix nature">
                                <div class="project-thumb">
                                    <img src="images/projects/project_2.jpg" alt="">
                                    <div class="overlay-b">
                                        <div class="overlay-inner">
                                            <a href="images/projects/project_2.jpg" class="fancybox fa fa-expand" title="Project Title Here"></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="box-content project-detail">
                                    <h2><a href="project-details.html">#지역</a></h2>
                                    <p>글 내용</p>
                                </div>
                            </div> <!--미션글_3 -->
                            <div class="col-md-4 project-item mix architecture">
                                <div class="project-thumb">
                                    <img src="images/projects/project_3.jpg" alt="">
                                    <div class="overlay-b">
                                        <div class="overlay-inner">
                                            <a href="images/projects/project_3.jpg" class="fancybox fa fa-expand" title="Project Title Here"></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="box-content project-detail">
                                    <h2><a href="project-details.html">#지역</a></h2>
                                    <p>글 내용</p>
                                </div>
                            </div> <!--미션글_4 -->
                            <div class="col-md-4 project-item mix buildings">
                                <div class="project-thumb">
                                    <img src="images/projects/project_4.jpg" alt="">
                                    <div class="overlay-b">
                                        <div class="overlay-inner">
                                            <a href="images/projects/project_4.jpg" class="fancybox fa fa-expand" title="Project Title Here"></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="box-content project-detail">
                                    <h2><a href="project-details.html">#지역</a></h2>
                                    <p>글 내용</p>
                                </div>
                            </div> <!--미션글_5 -->
                            <div class="col-md-4 project-item mix gj">
                                <div class="project-thumb">
                                    <img src="images/projects/project_5.jpg" alt="">
                                    <div class="overlay-b">
                                        <div class="overlay-inner">
                                            <a href="images/projects/project_5.jpg" class="fancybox fa fa-expand" title="Project Title Here"></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="box-content project-detail">
                                    <h2><a href="project-details.html">#지역</a></h2>
                                    <p>글내용</p>
                                </div>
                            </div> <!--미션글_6 -->
                            <div class="col-md-4 project-item mix ic">
                                <div class="project-thumb">
                                    <img src="images/projects/project_6.jpg" alt="">
                                    <div class="overlay-b">
                                        <div class="overlay-inner">
                                            <a href="images/projects/project_6.jpg" class="fancybox fa fa-expand" title="Project Title Here"></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="box-content project-detail">
                                    <h2><a href="project-details.html">#지역</a></h2>
                                    <p>글내용</p>
                                </div>
                            </div> <!--미션글_7 -->
                            <div class="col-md-4 project-item mix gj">
                                <div class="project-thumb">
                                    <img src="images/projects/project_6.jpg" alt="">
                                    <div class="overlay-b">
                                        <div class="overlay-inner">
                                            <a href="images/projects/project_6.jpg" class="fancybox fa fa-expand" title="Project Title Here"></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="box-content project-detail">
                                    <h2><a href="project-details.html">#지역</a></h2>
                                    <p>글내용</p>
                                </div>




                        </div> <!-- /.row -->

                        <!--더보기 버튼<div class="load-more">
                            <a href="javascript:void(0)" class="load-more">Load More</a>
                        </div>
                    </div> 
                    --><!-- /.projects-holder -->
                </div> <!-- /.projects-holder-2 -->
            </div> <!-- /.inner-content -->
        </div> <!-- /.content-wrapper -->

        <script src="js/vendor/jquery-1.11.0.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.0.min.js"><\/script>')</script>
        <script src="js/plugins.js"></script>
        <script src="js/main.js"></script>

        <!-- Preloader -->
        <script type="text/javascript">
            //<![CDATA[
            $(window).load(function() { 
                $('.loader-item').fadeOut(); 
                    $('#pageloader').delay(350).fadeOut('slow');
                $('body').delay(350).css({'overflow-y':'visible'});
            })
            //]]>
        </script>

    </body>
</html>
