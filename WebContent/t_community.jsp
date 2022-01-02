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
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/templatemo-video-catalog.css" />

<script src="js/vendor/modernizr-2.6.1-respond-1.1.0.min.js"></script>

<style>
//
댓글 관련 스타일
li.upd {
	display: flex;
	justify-content: flex-end;
}

.replymenu a {
	cursor: pointer;
	word-spacing: 10px;
	line-height: 20px;
}

.replymenu {
	display: block;
	word-spacing: 10px;
	line-height: 20px;
	color: #777777;
}

.replyhide {
	display: none;
	word-spacing: 10px;
	line-height: 20px;
}

td {
	border: 1px solid #3399cc;
	padding: 10px;
	font-size: 13px;
	text-align: center;
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
</style>
</head>
<body>
	<%
	boardDTO board_dto = (boardDTO) session.getAttribute("mboard_dto");
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
								<nav class="navbar navbar-expand-lg mr-0 ml-auto"
									id="tm-main-nav">
									<button
										class="navbar-toggler tm-bg-black py-2 px-3 mr-0 ml-auto collapsed"
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
												href="#"> <%=dto.getMb_nickname()%> 's
											</a></li>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="#" id=Mb_region> <%=dto.getMb_region()%>
											</a></li>
											<%
												}
											%>
											<%
												if (dto == null) {
											%>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="login.html">login</a></li>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="team">join</a></li>
											<%
												} else {
											%>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="LogoutService">logout</a></li>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="update.jsp?mb_id=<%=dto.getMb_id()%>">update</a></li>
											<%
												}
											%>
											<li class="nav-item active"><a
												class="nav-link tm-nav-link" href="t_community.jsp">weather
													<span class="sr-only">(current)</span>
											</a></li>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="t_mission.jsp">today</a></li>
											<%
												if (dto != null) {
											%>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="t_mymain.jsp">my</a></li>
											<%} %>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="region.html">map</a></li>
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
								fill="currentColor" class="bi bi-chat-square-quote"
								viewBox="0 0 16 16">
  <path
									d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1h-2.5a2 2 0 0 0-1.6.8L8 14.333 6.1 11.8a2 2 0 0 0-1.6-.8H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h2.5a1 1 0 0 1 .8.4l1.9 2.533a1 1 0 0 0 1.6 0l1.9-2.533a1 1 0 0 1 .8-.4H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
  <path
									d="M7.066 4.76A1.665 1.665 0 0 0 4 5.668a1.667 1.667 0 0 0 2.561 1.406c-.131.389-.375.804-.777 1.22a.417.417 0 1 0 .6.58c1.486-1.54 1.293-3.214.682-4.112zm4 0A1.665 1.665 0 0 0 8 5.668a1.667 1.667 0 0 0 2.561 1.406c-.131.389-.375.804-.777 1.22a.417.417 0 1 0 .6.58c1.486-1.54 1.293-3.214.682-4.112z" />
</svg>
							Community
						</h2>
						<span>Region Shared</span>
						<h2>
							<a href="t_write.jsp" style="float: right;"><svg
									xmlns="http://www.w3.org/2000/svg" width="26" height="26"
									fill="currentColor" class="bi bi-pencil-square"
									viewBox="0 0 16 16">
  <path
										d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
  <path fill-rule="evenodd"
										d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
</svg> </a>
						</h2>

					</div>
					<!-- /.section-header -->
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
												tyle="margin-top: 10%; margin-bottom: 5%; color: #3399cc; font-weight: 550;">
												#<%=arr.get(i).getM_article_region()%></h3>
										</a>
									</h3>
									<span class="blog-meta"><%=arr.get(i).getM_article_date()%></span>
									<!-- 글 내용-->
									<p class="getM_article_content" style="list-style: none;"><%=arr.get(i).getM_article_content()%></p>

									<!-- 댓글 구현부-->

									<ul>
										<!-- 작성자만 수정 삭제 가능 기능-->
										<%
											if (dto == null) {
										%>
										<li class="upd" style="font-size: 15px">수정/삭제시 로그인이 필요해요</li>
										<%
											} else if (dto.getMb_id().equals(arr.get(i).getMb_id())) {
										%>
										<li class="upd"><a
											href='BoardUpdateService?ARTICLE_SEQ=<%=arr.get(i).getM_article_seq()%>'><svg
													xmlns="http://www.w3.org/2000/svg" width="23" height="23"
													fill="currentColor" class="bi bi-pencil-square"
													viewBox="0 0 16 16">
  <path
														d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
  <path fill-rule="evenodd"
														d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
  <path
														d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
  <path fill-rule="evenodd"
														d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
</svg></a></li>
										<li class="upd"><a
											href='BoardDelService?ARTICLE_SEQ=<%=arr.get(i).getM_article_seq()%>'><svg
													style="position: relative; top: -10px; right: -82%;xmlns="
													http://www.w3.org/2000/svg" width="22" height="22"
													fill="currentColor" class="bi bi-x-square"
													viewBox="0 0 16 16">
  <path
														d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
  <path
														d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
  <path
														d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
  <path
														d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
</svg></a></li>
										<%
											}
										%>
										<li style="right: 30%; list-style: none;">
											<div class="like-button-wrapper">
												<a class="like_button"
													onclick="func(<%=arr.get(i).getM_article_seq()%>,<%=arr.get(i).getM_article_likes()%>)">
													<i class="like-counter fa fa-heart-o"></i> <span
													class="like_count"><%=arr.get(i).getM_article_likes()%></span>
												</a>

											</div>
										</li>
									</ul>


									<li class="replymenu" style="list-style: none;"><a
										href="#" onclick="return false;"
										style="font-size: 1rem; width: 100%; position: relative; top: -90px;"><svg
												"xmlns="http://www.w3.org/2000/svg" width="20" height="20"
												fill="currentColor" class="bi bi-hand-index-thumb"
												viewBox="0 0 16 16">
									 <path
													d="M6.75 1a.75.75 0 0 1 .75.75V8a.5.5 0 0 0 1 0V5.467l.086-.004c.317-.012.637-.008.816.027.134.027.294.096.448.182.077.042.15.147.15.314V8a.5.5 0 0 0 1 0V6.435l.106-.01c.316-.024.584-.01.708.04.118.046.3.207.486.43.081.096.15.19.2.259V8.5a.5.5 0 1 0 1 0v-1h.342a1 1 0 0 1 .995 1.1l-.271 2.715a2.5 2.5 0 0 1-.317.991l-1.395 2.442a.5.5 0 0 1-.434.252H6.118a.5.5 0 0 1-.447-.276l-1.232-2.465-2.512-4.185a.517.517 0 0 1 .809-.631l2.41 2.41A.5.5 0 0 0 6 9.5V1.75A.75.75 0 0 1 6.75 1zM8.5 4.466V1.75a1.75 1.75 0 1 0-3.5 0v6.543L3.443 6.736A1.517 1.517 0 0 0 1.07 8.588l2.491 4.153 1.215 2.43A1.5 1.5 0 0 0 6.118 16h6.302a1.5 1.5 0 0 0 1.302-.756l1.395-2.441a3.5 3.5 0 0 0 .444-1.389l.271-2.715a2 2 0 0 0-1.99-2.199h-.581a5.114 5.114 0 0 0-.195-.248c-.191-.229-.51-.568-.88-.716-.364-.146-.846-.132-1.158-.108l-.132.012a1.26 1.26 0 0 0-.56-.642 2.632 2.632 0 0 0-.738-.288c-.31-.062-.739-.058-1.05-.046l-.048.002zm2.094 2.025z" />
									</svg>Reply</a>
										<ul class="replyhide">
											<table
												style="width: 100%; margin-top: 10px; table-layout: fixed; word-break: break-all; border: 0.5px solid #3399cc;">
												<tr>
													<td width="50%">댓글내용</td>
													<td width="20%">작성자</td>
													<td width="20%">일 자</td>
												</tr>
												<%
													cnt = 0;
												for (int j = 0; j < all.size(); j++) {
													if (arr.get(i).getM_article_seq() == all.get(j).getComm_seq()) {
												%>
												<tr>
													<td width="50%"><%=all.get(j).getComm_content()%></td>
													<td width="20%"><%=all.get(j).getMb_id()%></td>
													<td width="20%"><%=all.get(j).getComm_date()%></td>
												</tr>
												<%
													cnt += 1;
												%>
												<%
													}
												}
												%>
											</table>
										</ul></li>
									<ul>
										<li class="article-category" style="list-style: none;"></li>
										<li class="article-comments" style="list-style: none;"><span><i
												class="fa fa-comments"></i><%=cnt%> </span></li>
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
