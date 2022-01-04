<%@page import="com.today.DAO.boardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.today.DAO.commDAO"%>
<%@page import="com.today.DTO.commDTO"%>
<%@page import="com.today.DTO.memberDTO"%>
<%@page import="com.today.DTO.boardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
<meta charset="utf-8" />
<title>TODAY ☁︎ COMMUNITY</title>
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

//
댓글 관련 스타일 끝 // 좋아요 기능
	a.like_button {
	right: 60px;
	bottom: 1px;
	position: absolute;
}

.content-box {
	box-sizing: border-box;
	width: 100%;
	border: solid #5B6DCD 1px;
	padding: 1px;
	background-color: white;
}

.contents_style {
	all: unset;
	line-height: 1.9;
	color: $alpha;
	font-weight: 300;
	margin-bottom: 20px;
	padding: 5px;
	letter-spacing: 0.3px;
}

.contents_style:after {
	all: unset;
}

h4:after {
	display: block;
	width: 100%;
	height: 2px;
	margin-top: 15px;
	content: '';
	background-color: #7AE2DE;
}

th, td {
	border: 1px solid #444444;
	padding: 10px;
	font-size: small;
}
</style>
</head>
<body>
	<%
	//업데이트후 세션
	boardDTO board_dto = null;
	boardDTO mboard_dto = (boardDTO) session.getAttribute("mboard_dto");
	//보드 세션
	boardDTO board_dto1 = (boardDTO) session.getAttribute("board_dto");
	String numbers = (String) session.getAttribute("numbers");
	
	//업데이트가 없을때 보드 세션으로 나온다.
	if (mboard_dto == null) {
		board_dto = board_dto1;
	} else if (mboard_dto != null) {
		board_dto = mboard_dto;
	}
	memberDTO dto = (memberDTO) session.getAttribute("dto");
	commDTO comm_dto = (commDTO) session.getAttribute("comm_dto");
	
	boardDAO dao = new boardDAO();
	

	
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
											//로그인 한 상태
											if(dto != null){ %>
											<li class="nav-item "><a
                                    class="nav-link tm-nav-link" href="index.jsp"> <%=dto.getMb_nickname()%> ☁︎ <%=dto.getMb_region()%> <span class="sr-only">(current)</span>
                                 </a></li>
											<li class="nav-item active"><a class="nav-link tm-nav-link"
												href="t_community.jsp">with<span class="sr-only">(current)</span>
												</a></li>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="t_mission.jsp">moment</a></li>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="t_mymain.jsp">my</a></li>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="Kakao.jsp">map</a></li>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="update.jsp?mb_id=<%=dto.getMb_id()%>">sign out</a></li>
											
											<%
											//로그인 안 한 상태
											}else{ %>
											<li class="nav-item"><a class="nav-link tm-nav-link"
                                    			href="index.jsp">☁︎ today</a></li>
                                    		<li class="nav-item active"><a class="nav-link tm-nav-link"
												href="t_community.jsp">with<span class="sr-only">(current)</span>
												</a></li>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="t_mission.jsp">moment</a></li>	
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="Kakao.jsp">map</a></li>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="login.jsp?numbers=4">sign in</a></li>
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
				<!--
                <div class="text-center">
               <p class="pt-5 px-3 tm-welcome-text tm-welcome-text-2 mb-1 mt-lg-0 mt-5 text-white mx-auto">Another Image BG<br>it can be fixed.<br>Content will simply slide over.</p>                   
            </div>                
                -->
			</div>

			<div id="tm-fixed-header-bg"></div>
			<!-- Header image -->
		</div>

		<!-- community_click-->
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
							&nbsp with
						</h2>
						<span><%=board_dto.getMb_id()%>회원님 <b>#<%=board_dto.getM_article_region()%></b></span>
					</div>
					<!-- /.section-header -->
				</div>
				<!-- /.row -->
				<div class="row">
					<div class="blog-image col-md-12">
						<a
							href="t_community_search.jsp?region=<%=board_dto.getM_article_region() %>">
							<h1 style="font-size: 200%; color: #3399cc;">
								#<%=board_dto.getM_article_region()%></h1>
						</a> <img src="<%=board_dto.getM_article_img()%>"
							style="width: 100%; height: 100%;" id="m_article_preview">
					</div>
					<!-- /.blog-image -->
					<div class="blog-info col-md-12">
						<div class="box-content">
							<h2 class="blog-title"><%=board_dto.getM_article_subject()%></h2>
							<span class="blog-meta"><%=dao.board_tocomm(String.valueOf(board_dto1.getM_article_seq())).getM_article_date() %></span>
							<p><%=board_dto.getM_article_content()%></p>
						</div>
					</div>
					
					<%try {
					if (board_dto.getM_board_type().equals("미션 게시판")) { } else {%>

					<!-- /.row -->
					<%
					commDAO comm_dao = new commDAO();
					ArrayList<commDTO> arr = comm_dao.comm_all(board_dto.getM_article_seq());
					int cnt = 0;
					for (int i = 0; i < arr.size(); i++) {
				%>
					<div class="row">
						<div class="col-md-12">
							<h2 class="comment-heading"><%=i+1 + "번째 댓글" %></h2>
							<div class="box-content">
								<div class="comment">
									<div class="comment-inner">
										<div class="author-avatar">
											<img src="images/blog/basic_user.png" alt="" />
										</div>
										<div class="comment-body">
											<h4><%=arr.get(i).getMb_id()%></h4>
											<span><%=arr.get(i).getComm_date()%></span>
											<p><%=arr.get(i).getComm_content()%></p>
											<%if(dto.getMb_id().equals(arr.get(i).getMb_id())) {%>
											<a
												href='CommDelService?COMM_SEQ=<%=arr.get(i).getM_article_seq()%>'>
												삭제 </a>
												<%} %>
										</div>
									</div>
								</div>
							</div>
							<%
						cnt = cnt +1;
							}
						%>
						</div>
						<!-- /.col-md-12 -->

						<!-- /.row -->

						<div class="col-md-12 comment-form">
							<h2 class="comment-heading">Leave a Comment</h2>
							<div class="box-content">
								<p>
									<label for="name">Nick-name :</label> <input type="text"
										name="name" id="id_name" placeholder="로그인이 필요합니다." readonly>
								</p>
								<p>
									<label for="comment">Your comment:</label>
									<textarea name="comment" id="replytext"></textarea>
								</p>
								<button type="button" id="btnReply">댓글쓰기</button>
							</div>
							<!-- /.box-content -->
						</div>
						<!-- /.comment-form -->
					</div>

					<%
					}
				} catch (Exception e) {
				}
					%>
				</div>
				<!-- /.row -->
			</div>
			<!-- /.inner-content -->
		</div>
	</div>
	<!-- /.content-wrapper -->

	<script src="js/vendor/jquery-1.11.0.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="js/vendor/jquery-1.11.0.min.js"><\/script>');
	</script>
	<script src="js/plugins.js"></script>
	<script src="js/main.js"></script>

	<!-- Preloader -->
	<script type="text/javascript">
		//<![CDATA[
		$(window).load(function() {
			// makes sure the whole site is loaded
			$(".loader-item").fadeOut(); // will first fade out the loading animation
			$("#pageloader").delay(350).fadeOut("slow"); // will fade out the white DIV that covers the website.
			$("body").delay(350).css({
				"overflow-y" : "visible"
			});
		});
		//]]>

		//댓글 쓰기 (버튼을 눌러서 id값이 넘어와 실행되는 자바스크립트 구문)
		$("#btnReply").click(function() {
			var comm_content = $("#replytext").val(); //댓글 내용
			var article_seq = "${board_dto.getM_article_seq()}"; //게시물 번호
			var mb_id = "${dto.getMb_id()}"; //작성자 아이디
			var param = {
				"comm_content" : comm_content,
				"article_seq" : article_seq,
				"mb_id" : mb_id
			};
			//var param="replytext="+replytext+"&bno="+bno;
			$.ajax({
				type : "post", //데이터를 보낼 방식
				url : "ReplyService", //데이터를 보낼 url
				data : param, //보낼 데이터

				success : function() { //데이터를 보내는것이 성공했을시 출력되는 메시지
					location.reload();
					alert("댓글이 등록되었습니다.");
				}
			});
		});
		
		m_article_inputregion = "${dto.getMb_id()}";
		document.getElementById("id_name").value = m_article_inputregion;
		
	</script>
</body>
</html>
