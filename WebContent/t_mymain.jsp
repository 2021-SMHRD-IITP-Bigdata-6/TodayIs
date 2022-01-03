<%@page import="com.today.DAO.memberDAO"%>
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
	border: 25px solid #efefef;
	background-color: #efefef;
	font-size: small;
	width: 20%;
}

.model {
	position:;
	width: 100%;
	height: 100%;
	background: raba(0, 0, 0, 0.8);
	top: 0;
	left: 0;
	display: block;
}
</style>
</head>
<body>
	<%
	boardDTO board_dto = (boardDTO) session.getAttribute("board_dto");
	commDTO comm_dto = (commDTO) session.getAttribute("comm_dto");
	memberDTO dto = (memberDTO) session.getAttribute("dto");

	memberDAO dao = new memberDAO();

	ArrayList<boardDTO> arr = dao.m_board_all(dto.getMb_id());
	ArrayList<boardDTO> all = dao.m_mboard_all(dto.getMb_id());
	
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
												href="t_mission.jsp">mission</a></li>
											<%
												if (dto != null) {
											%>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="t_mymain.jsp">my</a></li>
											<%
												}
											%>
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
				<!--
        			<div class="text-center">
					<p class="pt-5 px-3 tm-welcome-text tm-welcome-text-2 mb-1 mt-lg-0 mt-5 text-white mx-auto">Another Image BG<br>it can be fixed.<br>Content will simply slide over.</p>                	
				</div>                
                -->
			</div>
			<div id="tm-fixed-header-bg"></div>
			<!-- Header image -->
		</div>
		<!--page start-->
		<div class="content-wrapper">
			<div class="inner-container container">
				<div class="row">
					<div class="section-header col-md-12">
						<h2>☁︎ MY MEMORRY</h2>
						<form name="Search_type" method="post">

							<span> 지난 게시물을 확인해봐요~ +_+</span> <a href="t_write.jsp"
								style="float: right;"><h2>New Write ☁︎</h2></a>
						</form>
					</div>
					<!-- /.section-header -->
				</div>
				<!-- /.row -->
				<div class="projects-holder-3">
					<div class="row">
						<table>
							<span> ☁︎ 메인 게시판 </span>
							<!--미션글_1-->
							<%
								int i = 0;
							try {
								//행 관리
								Loop1 : for (int k = 0; k < 5; k++) {
							%>
							<tr valign="top">
								<%
									for (int j = 0; j < 5; j++) {
									System.out.print(i);
									//열 관리
								%>
								<td valign="top">
									<div class="project-thumb">
										<img src="<%=arr.get(i).getM_article_img()%>"
											onclick="func2(<%=i%>)" class="modal_con">
										<div class="modal">
											<div class="modal_content"
												style="border: 10px solid #aaaaaa; width: 50%; position: relative; left: 25%; top: 150px;">
												<img src="<%=arr.get(i).getM_article_img()%>"
													class="modal_img">
											</div>
										</div>
									</div>
									<div class="box-content project-detail">

										<h2>
											<a
												href="t_mission_search.jsp?region=<%=arr.get(i).getM_article_region()%>">
												<h3
													style="margin-top: 10%; margin-bottom: 5%; color: #3399cc; font-weight: 550;">
													#<%=arr.get(i).getM_article_region()%></h3>
											</a>
										</h2>
										<span style="font-size: 120%;"><%=arr.get(i).getM_article_subject()%></span><br>
										<span class="blog-meta"
											style="font-size: 85%; color: #aaaaaa; font-size: 0.84em;"><%=arr.get(i).getM_article_date()%></span>
										<p><%=arr.get(i).getM_article_content().substring(0, 10) + "..."%></p>
										<br>



										<ul>
											<!-- 작성자만 수정 삭제 가능 기능-->
											<%
												if (dto == null) {
											%>
											<li class="upd" style="font-size: 15px; list-style: none;">수정/삭제시
												로그인이 필요해요</li>
											<%
												} else if (dto.getMb_id().equals(arr.get(i).getMb_id())) {
											%>
											<li class="upd" style="list-style: none;"><a
												href='BoardUpdateService?ARTICLE_SEQ=<%=arr.get(i).getM_article_seq()%>'>수정</a></li>
											<li class="upd" style="list-style: none;"><a
												href='MyDelService?ARTICLE_SEQ=<%=arr.get(i).getM_article_seq()%>'>삭제</a></li>

											<li style="right: 30%; list-style: none;">
												<div class="like-button-wrapper">
													<a class="like_button"
														onclick="func(<%=arr.get(i).getM_article_seq()%>,<%=arr.get(i).getM_article_likes()%>)">
														<i class="like-counter fa fa-heart-o"></i> <span
														class="like_count"><%=arr.get(i).getM_article_likes()%></span>
													</a>

												</div>
											</li>
											<%
												}
											%>
										</ul>
									</div>
									</div>
								</td>
								<%
									if (i < arr.size() - 1) {
									i = i + 1;
								} else {
									break Loop1;

								}

								}
								%>
							</tr>
							<%
								}
							} catch (Exception e) {
							}
							%>
														
						</table>
						
						<table>
							<span> ☁︎ 미션 게시판 </span>
							<!--미션글_1-->
							<%
								i = 0;
							try {
								//행 관리
								Loop1 : for (int k = 0; k < 5; k++) {
							%>
							<tr valign="top">
								<%
									for (int j = 0; j < 5; j++) {
									System.out.print(i);
									//열 관리
								%>
								<td valign="top">
									<div class="project-thumb">
										<img src="<%=all.get(i).getM_article_img()%>"
											onclick="func2(<%=i%>)" class="modal_con">
										<div class="modal">
											<div class="modal_content"
												style="border: 10px solid #aaaaaa; width: 50%; position: relative; left: 25%; top: 150px;">
												<img src="<%=all.get(i).getM_article_img()%>"
													class="modal_img">
											</div>
										</div>
									</div>
									<div class="box-content project-detail">

										<h2>
											<a
												href="t_mission_search.jsp?region=<%=all.get(i).getM_article_region()%>">
												<h3
													style="margin-top: 10%; margin-bottom: 5%; color: #3399cc; font-weight: 550;">
													#<%=all.get(i).getM_article_region()%></h3>
											</a>
										</h2>
										<span style="font-size: 120%;"><%=all.get(i).getM_article_subject()%></span><br>
										<span class="blog-meta"
											style="font-size: 85%; color: #aaaaaa; font-size: 0.84em;"><%=all.get(i).getM_article_date()%></span>
										<p><%=all.get(i).getM_article_content().substring(0, 10) + "..."%></p>
										<br>



										<ul>
											<!-- 작성자만 수정 삭제 가능 기능-->
											<%
												if (dto == null) {
											%>
											<li class="upd" style="font-size: 15px; list-style: none;">수정/삭제시
												로그인이 필요해요</li>
											<%
												} else if (dto.getMb_id().equals(arr.get(i).getMb_id())) {
											%>
											<li class="upd" style="list-style: none;"><a
												href='BoardUpdateService?ARTICLE_SEQ=<%=arr.get(i).getM_article_seq()%>'>수정</a></li>
											<li class="upd" style="list-style: none;"><a
												href='MyDelService?ARTICLE_SEQ=<%=arr.get(i).getM_article_seq()%>'>삭제</a></li>

											<li style="right: 30%; list-style: none;">
												<div class="like-button-wrapper">
													<a class="like_button"
														onclick="func(<%=all.get(i).getM_article_seq()%>,<%=all.get(i).getM_article_likes()%>)">
														<i class="like-counter fa fa-heart-o"></i> <span
														class="like_count"><%=all.get(i).getM_article_likes()%></span>
													</a>

												</div>
											</li>
											<%
												}
											%>
										</ul>
									</div>
									</div>
								</td>
								<%
									if (i < all.size() - 1) {
									i = i + 1;
								} else {
									break Loop1;

								}

								}
								%>
							</tr>
							<%
								}
							} catch (Exception e) {
							}
							%>
														
						</table>
						
						
						
					</div>
					<!-- /.projects-holder-2 -->
				</div>
				<!-- /.inner-content -->
			</div>
			<!-- /.content-wrapper -->
		</div>

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
    				url : "MLikeService", //데이터를 보낼 url
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
