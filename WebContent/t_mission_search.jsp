<%@page import="com.today.DAO.mboardDAO"%>
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
<title>TODAY☁︎MOMENT</title>
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

li {
	list-style: none;
}

ul {
	list-style: none;
}

.fa-bars:before {
	content: "\f0c9";
    display: inline-block;
    font-family: "FontAwesome";
    font-weight: 800;
   
}

*, ::after, ::before {
    box-sizing: border-box;
    font-size: 20px; 
    font-family: FontAwesome;
}
.fa, .far, .fas {
    font-family: "FontAwesome";
    font-style: normal;
    font-variant: normal;
    format: "woff";  
    src :url("../webfonts/fa-solid-800.ttf") ;
</style>
</head>
<body>
	<%
	boardDTO board_dto = (boardDTO) session.getAttribute("board_dto");
	commDTO comm_dto = (commDTO) session.getAttribute("comm_dto");
	memberDTO dto = (memberDTO) session.getAttribute("dto");

	request.setCharacterEncoding("utf-8");
	String region = request.getParameter("region");
	
	
	mboardDAO mboard_dao = new mboardDAO();
	ArrayList<boardDTO> arr = mboard_dao.mboard_to_region(region);
	


	int cnt = 0;
	%>

	<div class="tm-page-wrap mx-auto">
		<div class="position-relative">
			<div class="potition-absolute tm-site-header">
				<div class="container-fluid position-relative">
					<div class="row">
						<div class="col-6 col-md-11 ml-auto mr-0">
							<div class="tm-site-nav">
								<nav class="navbar navbar-expand-lg mr-0 ml-auto"
									id="tm-main-nav">
									<button
										class="navbar-toggler
                                          tm-bg-black
                                          py-2
                                          px-3
                                          mr-0
                                          ml-auto
                                          collapsed"
										type="button" data-toggle="collapse" data-target="#navbar-nav"
										aria-controls="navbar-nav" aria-expanded="false"
										aria-label="Toggle navigation">
										<span> <i class="fas fa-bars tm-menu-closed-icon"></i>
											<i class="fas fa-times tm-menu-opened-icon"></i>
										</span>
									</button>
									<div class="collapse navbar-collapse tm-nav" id="navbar-nav">
										<ul class="navbar-nav text-uppercase">
											<%
                                    if (dto != null) {
                                 %>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="index.jsp"> <%=dto.getMb_nickname()%> ☁︎ <%=dto.getMb_region()%>
											</a></li>
											<%
                                    }
                                 %>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="t_community.jsp">with </a></li>
											<li class="nav-item active"><a
												class="nav-link tm-nav-link" href="t_mission.jsp">moment<span
													class="sr-only">(current)</span></a></li>
											<%
                                    if (dto != null) {
                                 %>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="t_mymain.jsp">my</a></li>
											<%} %>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="Kakao.jsp">map</a></li>
											<%
                                    if (dto == null) {
                                 %>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="login.jsp?numbers=5">sign in</a></li>
											<%
                                    } else {
                                 %>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="LogoutService">sign out</a></li>

											<%
                                    }
                                 %>
										</ul>
									</div>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="tm-welcome-container tm-fixed-header tm-fixed-header-2">

			</div>

			<div id="tm-fixed-header-bg"></div>
			<!-- Header image -->
		</div>

		<!-- section-header -->
		<div class="content-wrapper">
			<div class="inner-container container">
				<div class="row">
					<div class="section-header col-md-12">
						<h2>
							<svg xmlns="http://www.w3.org/2000/svg" width="26" height="26"
								fill="currentColor" class="bi bi-easel-fill" viewBox="0 0 16 16">
  <path
									d="M8.473.337a.5.5 0 0 0-.946 0L6.954 2H2a1 1 0 0 0-1 1v7a1 1 0 0 0 1 1h1.85l-1.323 3.837a.5.5 0 1 0 .946.326L4.908 11H7.5v2.5a.5.5 0 0 0 1 0V11h2.592l1.435 4.163a.5.5 0 0 0 .946-.326L12.15 11H14a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1H9.046L8.473.337z" />
</svg>
							&nbsp MOMENT
						</h2>
						<span>mission : TRUE BLUE SKY</span> <a
							href="t_write.jsp?numberring=2" style="float: right;"><h2>
								<svg xmlns="http://www.w3.org/2000/svg" width="26" height="26"
									fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
  <path
										d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z" />
</svg>
								&nbsp new
							</h2></a>
					</div>
				<!-- /.row -->
				<div class="row">
					<div class="blog-masonry masonry-true">
						<%
							try {
							for (int i = 0; i < arr.size(); i++) {
						%>
						<!-- 1번 게시물 -->

						<span class="post-masonry col-md-4 col-sm-6">
							<div class="blog-thumb">
								<!-- 사진 출력부-->
								<img src="<%=arr.get(i).getM_article_img()%>">
								<div class="overlay-b">
									<div class="overlay-inner">
										<!-- 게시물로 이동-->
										<a class="fa fa-link"
											href="BoardViewService?M_article_seq=<%=arr.get(i).getM_article_seq()%>">
										</a>
									</div>
								</div>
							</div>
							<div class="blog-body">
								<div class="box-content">
									<!-- 글 제목-->
									<h3 class="post-title"><%=arr.get(i).getM_article_subject()%>
										<!-- 장소 검색기능-->
										<a
											href="t_community_search.jsp?region=<%=arr.get(i).getM_article_region()%>">
											<h3
												style="margin-top: 10%; margin-bottom: 5%; color: #7AE2DE; font-weight: bold;">
												#<%=arr.get(i).getM_article_region()%></h3>
										</a>
									</h3>
									<span class="blog-meta"><%=arr.get(i).getM_article_date() %></span>
									<!-- 글 내용-->
									<p class="getM_article_content" style="list-style: none;"><%=arr.get(i).getM_article_content()%></p>

									<!-- 댓글 구현부-->
									<ul>
										<!-- 작성자만 수정 삭제 가능 기능-->
																				<%
                                 if (dto == null) {
                              %>
										<li class="upd" style="font-size: 15px; list-style: none;">수정&삭제
											시 로그인이 필요해요</li>
										<%
                                 } else if (dto.getMb_id().equals(arr.get(i).getMb_id())) {
                              %>
										<li class="upd"
											style="list-style: none; display: inline-block; position: relative; left: 77%;"><a
											href='MBoardUpdateService?ARTICLE_SEQ=<%=arr.get(i).getM_article_seq()%>'><svg
													xmlns="http://www.w3.org/2000/svg" width="23" height="23"
													fill="currentColor" class="bi bi-pencil-square"
													viewBox="0 0 16 16"> <path
														d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" /> <path
														fill-rule="evenodd"
														d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" /> <path
														d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" /> <path
														fill-rule="evenodd"
														d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" /> </svg></a></li>
										<li class="upd"
											style="list-style: none; display: inline-block; position: relative; left: 81%;"><a
											href='MBoardDelService?ARTICLE_SEQ=<%=arr.get(i).getM_article_seq()%>'><svg
													xmlns=" http://www.w3.org/2000/svg" width="22" height="22"
													fill="currentColor" class="bi bi-x-square"
													viewBox="0 0 16 16">
  <path
														d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" /> <path
														d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
  <path
														d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" /> <path
														d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" /> </svg>
										</a></li>
										<span class="like-button-wrapper"
											style="color: #aaaaaa; position: relative; left: -20%">
											<a class="like_button"	onclick="func(<%=arr.get(i).getM_article_seq()%>,<%=arr.get(i).getM_article_likes()%>)">
												<i class="like-counter fa fa-heart-o"></i> <span
												class="like_count"><%=arr.get(i).getM_article_likes()%></span>
										</a>
										</span>

										<%
                                 }
                              %>
									</ul>
								</div>
							</div>
						</span>
						<%
							}
						} catch (Exception e) {
						}
						%>
						<!-- /.post-masonry -->
					</div>
					<!-- /.blog-masonry -->
				</div>


				<!-- /.row -->
				<!--
        <div class="row">
          <div class="col-md-12">
            <div class="pagination text-center">
              <ul>
                <li><a href="javascript:void(0)">1</a></li>
                <li><a href="javascript:void(0)" class="active">2</a></li>
                <li><a href="javascript:void(0)">3</a></li>
                <li><a href="javascript:void(0)">4</a></li>
                <li><a href="javascript:void(0)">...</a></li>
                <li><a href="javascript:void(0)">11</a></li>
              </ul>
            </div>
            -->
				<!-- /.pagination -->
			</div>
			<!-- /.col-md-12 -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /.inner-content -->


	<script src="js/vendor/jquery-1.11.0.min.js"></script>
	<script>
      window.jQuery ||
        document.write(
          '<script src="js/vendor/jquery-1.11.0.min.js"><\/script>'
        );
    </script>
	<script src="js/plugins.js"></script>

	<!-- 애니메이션 효과 -->
	<!-- <script src="js/main.js"></script>-->
	<!-- Preloader -->
	<script type="text/javascript">
      //<![CDATA[
      $(window).load(function () {
        // makes sure the whole site is loaded
        $(".loader-item").fadeOut(); // will first fade out the loading animation
        $("#pageloader").delay(350).fadeOut("slow"); // will fade out the white DIV that covers the website.
        $("body").delay(350).css({ "overflow-y": "visible" });
      });
      //]]>
      
		function func(a, b) {
			console.log(a);
			console.log(b);
			var c = $(".like_button").parent().find(".like-counter");
			if(c.hasClass("fa-heart")) {
				var counter = "x";  
			} else if(c.hasClass("fa-heart-o")){
				var counter = "o";
			}
			var article_seq = a; //게시물 번호
			var like_count = b;
			
			var param = {"article_seq" : article_seq,"like_count" : like_count, "counter" : counter };
			$.ajax({
				type : "post", //데이터를 보낼 방식
				url : "LikeService", //데이터를 보낼 url
				data : param, //보낼 데이터

				success : function() { //데이터를 보내는것이 성공했을시 출력되는 메시지
				
				}
			});
		}
	
		// 댓글 펼치기 기능
		$(document).ready(function() {
			$(".replymenu>a").click(function() {
				var submenu = $(this).next("ul");

				// submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
				if (submenu.is(":visible")) {
					submenu.slideUp();
				} else {
					submenu.slideDown();
				}
			}).mouseover(function() {
				$(this).next("ul").slideDown();
			});

			// 댓글 초기화후 다시 불러오는 작업
		});
		
		
		// 좋아요 +1 기능  기초 구현
		$(".like_button").on("click", function(){
	        var a = $(this).parent().find(".like-counter");
			var t = $(this).parent().find(".like_count");
			console.log(t.html());
			if(a.hasClass("fa-heart-o")){
				console.log("좋아요 +1")
				// span태그 숫자 변경
		        t.html(1 * t.html() + 1);
				$(a).removeClass("fa-heart-o"),
		        $(a).addClass("fa-heart")
		        
		        console.log(t.html());

		        //db 관련 정보들

		

			}else if(a.hasClass("fa-heart")){
				console.log("좋아요 -1")
				t.html(1 * t.html() - 1);
				$(a).removeClass("fa-heart"),
		        $(a).addClass("fa-heart-o")
		        console.log(t.html());
			}
			
			
		});
	

      
    </script>
</body>
</html>
