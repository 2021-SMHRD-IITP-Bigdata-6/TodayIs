<%@page import="com.today.DTO.boardDTO"%>
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
<title>TODAY☁︎MAIN</title>
<link rel="stylesheet" href="fontawesome/css/all.min.css" />

<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/templatemo-video-catalog.css" />

<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/templatemo-video-catalog.css" />

<title>TODAY? MAIN PAGE</title>

</head>
<body>

	<%
// main 페이지 연결
memberDTO dto = (memberDTO)session.getAttribute("dto");
mainPageDTO move_dto = (mainPageDTO)session.getAttribute("move_dto");
boardDTO board_dto = (boardDTO)request.getAttribute("board_dto");


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
								<nav class="navbar navbar-expand-lg mr-0 ml-auto" id="tm-main-nav">
									<button class="navbar-toggler tm-bg-black py-2 px-3
                                          mr-0 ml-auto collapsed" type="button" data-toggle="collapse" data-target="#navbar-nav"></button>
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
											<li class="nav-item active"><a
												class="nav-link tm-nav-link" href="#"> <%=dto.getMb_nickname()%>'s
													<%=dto.getMb_region()%> <span class="sr-only">(current)</span>
											</a></li>
											<%
												}
											%>
											

											<%if(dto == null){ %>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="t_community.jsp">with</a></li>
											<li class="nav-item"><a class="nav-link tm-nav-link"

												href="t_mission.jsp">moment</a></li>
											<%} %>
			

											<%
                              	      if (dto != null) {
                           	      %>
                           	      			<li class="nav-item"><a class="nav-link tm-nav-link"
												href="t_community.jsp">with</a></li>
											<li class="nav-item"><a class="nav-link tm-nav-link"

												href="t_mission.jsp">moment</a></li>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="t_mymain.jsp">my</a></li>
											<%
												}
											%>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="region.html">map</a></li>
												<%
												if (dto == null) {
											%>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="login.jsp">login ☁︎ join</a></li>
											<%
												} else {
											%>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="update.jsp?mb_id=<%=dto.getMb_id()%>">logout ☁︎ update</a></li>
											<%
												}
											%>
										</ul>
							</nav>

									</div>
									
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
					<%System.out.println("test기온"+move_dao.Move(dto.getMb_region()).getW_temp()); %>
					<%=move_dao.Move(dto.getMb_region()).getW_temp() %>℃
				</p>
				<%}else{%>
				<p class="tm-welcome-text mb-1 text-white"><%=move_dao.Move("광주").getW_temp() %>℃
				</p>
				<br>
				<br>
				<br>
				<h4>회원가입 및 로그인 하시면 다양한 지역의 날씨 정보를 확인하실 수 있습니다.</h4>
				<%} %>
				<a href="#content"
					class="btn tm-btn-animate tm-btn-cta tm-icon-down"> <span>Detail</span>
				</a>
			</div>
		</div>
		<div id="tm-video-container">
			<% if(dto != null){%>
			<%if(move_dao.Move(dto.getMb_region()).getW_status().equals("맑음") 
	        		|| move_dao.Move(dto.getMb_region()).getW_status().equals("")){ %>
			<video autoplay muted loop id="tm-video">
				<!-- <source src="video/sunset-timelapse-video.mp4" type="video/mp4"> -->
				<source src="video/sun.mp4" type="video/mp4" />
			</video>
			<%}else if(move_dao.Move(dto.getMb_region()).getW_status().equals("구름많음")){ %>
			<video autoplay muted loop id="tm-video">
				<source src="video/cloud.mp4" type="video/mp4" />
			</video>
			<%}else if(move_dao.Move(dto.getMb_region()).getW_status().equals("구름조금")){%>
			<video autoplay muted loop id="tm-video">
				<source src="video/star.mp4" type="video/mp4" />
			</video>
			<%}else if(move_dao.Move(dto.getMb_region()).getW_status().equals("비많음")){ %>
			<video autoplay muted loop id="tm-video">
				<source src="video/forest.mp4" type="video/mp4" />
			</video>
			<%}else if(move_dao.Move(dto.getMb_region()).getW_status().equals("비적음")){ %>
			<video autoplay muted loop id="tm-video">
				<source src="video/rain.mp4" type="video/mp4" />
			</video>
			<%}else if(move_dao.Move(dto.getMb_region()).getW_status().equals("번개")){ %>
			<video autoplay muted loop id="tm-video">
				<source src="video/thunder.mp4" type="video/mp4" />
			</video>
			<%}else if(move_dao.Move(dto.getMb_region()).getW_status().equals("약한 눈 단속적") 
			    		 || move_dao.Move(dto.getMb_region()).getW_status().equals("약한 눈 연속적")){ %>
			<video autoplay muted loop id="tm-video">
				<source src="video/snow.mp4" type="video/mp4" />
			</video>
			<%}else if(move_dao.Move(dto.getMb_region()).getW_status().equals("흐림")){ %>
			<video autoplay muted loop id="tm-video">
				<source src="video/grey.mp4" type="video/mp4" />
			</video>
			<%}else if(move_dao.Move(dto.getMb_region()).getW_status().equals("박무")){ %>
			<video autoplay muted loop id="tm-video">
				<source src="video/smog.mp4" type="video/mp4" />
			</video>
			<%} %>
			<%}else{ %>
			<%if(move_dao.Move("광주").getW_status().equals("맑음") 
	        		|| move_dao.Move("광주").getW_status().equals("")){ %>
			<video autoplay muted loop id="tm-video">
				<!-- <source src="video/sunset-timelapse-video.mp4" type="video/mp4"> -->
				<source src="video/sun.mp4" type="video/mp4" />
			</video>
			<%}else if(move_dao.Move("광주").getW_status().equals("구름많음")){ %>
			<video autoplay muted loop id="tm-video">
				<source src="video/cloud.mp4" type="video/mp4" />
			</video>
			<%}else if(move_dao.Move("광주").getW_status().equals("구름조금")){%>
			<video autoplay muted loop id="tm-video">
				<source src="video/star.mp4" type="video/mp4" />
			</video>
			<%}else if(move_dao.Move("광주").getW_status().equals("비많음")){ %>
			<video autoplay muted loop id="tm-video">
				<source src="video/forest.mp4" type="video/mp4" />
			</video>
			<%}else if(move_dao.Move("광주").getW_status().equals("비적음")){ %>
			<video autoplay muted loop id="tm-video">
				<source src="video/rain.mp4" type="video/mp4" />
			</video>
			<%}else if(move_dao.Move("광주").getW_status().equals("번개")){ %>
			<video autoplay muted loop id="tm-video">
				<source src="video/thunder.mp4" type="video/mp4" />
			</video>
			<%}else if(move_dao.Move("광주").getW_status().equals("약한 눈 단속적") 
			    		 || move_dao.Move(dto.getMb_region()).getW_status().equals("약한 눈 연속적")){ %>
			<video autoplay muted loop id="tm-video">
				<source src="video/snow.mp4" type="video/mp4" />
			</video>
			<%}else if(move_dao.Move("광주").getW_status().equals("흐림")){ %>
			<video autoplay muted loop id="tm-video">
				<source src="video/grey.mp4" type="video/mp4" />
			</video>
			<%}else if(move_dao.Move("광주").getW_status().equals("박무")){ %>
			<video autoplay muted loop id="tm-video">
				<source src="video/smog.mp4" type="video/mp4" />
			</video>
			<%} %>
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
								<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35"
									fill="currentColor" class="bi bi-thermometer-half"
									viewBox="0 0 16 16">
  <path
										d="M9.5 12.5a1.5 1.5 0 1 1-2-1.415V6.5a.5.5 0 0 1 1 0v4.585a1.5 1.5 0 0 1 1 1.415z" />
  <path
										d="M5.5 2.5a2.5 2.5 0 0 1 5 0v7.55a3.5 3.5 0 1 1-5 0V2.5zM8 1a1.5 1.5 0 0 0-1.5 1.5v7.987l-.167.15a2.5 2.5 0 1 0 3.333 0l-.166-.15V2.5A1.5 1.5 0 0 0 8 1z" />
</svg>
								체감온도
							</h3>
							<p class="tm-catalog-item-text">
								<%if (dto != null) {%>
								<span class="tm-text-secondary"> <%=move_dao.Move(dto.getMb_region()).getW_body_temp()%>℃
								</span>
								<%}else{%>
								<span class="tm-text-secondary"> <%=move_dao.Move("광주").getW_body_temp()%>℃
								</span>
								<%} %><br />

								<%if(dto != null){
				               			float move = Float.parseFloat(move_dao.Move(dto.getMb_region()).getW_body_temp());
				               			int data = (int)move;
			               
			               				if(data >= 50){ %>
								뜨거워요. 화상에 주의하세요.
								<%}else if(data >= 38){ %>
								더워요. 잠깐만 움직여도 땀이 날 거에요.
								<%}else if(data >= 29){ %>
								낮에는 덥지만 저녁에는 선선할거에요.
								<%}else if(data >= 25){ %>
								날씨가 쌀쌀합니다. 가디건 챙기세요
								<%}else if(data >= 18){ %>
								추워요. 오늘은 코드 어떨가요?
								<%}else if(data >= 13){ %>
								추워요. 얇은 패딩을 추천합니다.
								<%}else if(data >= 5){ %>
								많이 추워요. 패딩과 목도리 잊지 마세요.
								<%}else{ %>
								이렇게 추운데..꼭 나가야 할까요?
								<%} %>
								<%}else{ %>
								<% float move = Float.parseFloat(move_dao.Move("광주").getW_body_temp());
			               				int data = (int)move;
			               
			              				if(data >= 50){ %>
								뜨거워요. 화상에 주의하세요.
								<%}else if(data >= 38){ %>
								더워요. 잠깐만 움직여도 땀이 날 거에요.
								<%}else if(data >= 29){ %>
								낮에는 덥지만 저녁에는 선선할거에요.
								<%}else if(data >= 25){ %>
								날씨가 쌀쌀합니다. 가디건 챙기세요
								<%}else if(data >= 18){ %>
								추워요. 오늘은 코드 어떨가요?
								<%}else if(data >= 13){ %>
								추워요. 얇은 패딩을 추천합니다.
								<%}else if(data >= 5){ %>
								많이 추워요. 패딩과 목도리 잊지 마세요.
								<%}else{ %>
								이렇게 추운데..꼭 나가야 할까요?
								<%} %>
								<%} %>
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
								<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35"
									fill="currentColor" class="bi bi-moisture" viewBox="0 0 16 16">
  <path
										d="M13.5 0a.5.5 0 0 0 0 1H15v2.75h-.5a.5.5 0 0 0 0 1h.5V7.5h-1.5a.5.5 0 0 0 0 1H15v2.75h-.5a.5.5 0 0 0 0 1h.5V15h-1.5a.5.5 0 0 0 0 1h2a.5.5 0 0 0 .5-.5V.5a.5.5 0 0 0-.5-.5h-2zM7 1.5l.364-.343a.5.5 0 0 0-.728 0l-.002.002-.006.007-.022.023-.08.088a28.458 28.458 0 0 0-1.274 1.517c-.769.983-1.714 2.325-2.385 3.727C2.368 7.564 2 8.682 2 9.733 2 12.614 4.212 15 7 15s5-2.386 5-5.267c0-1.05-.368-2.169-.867-3.212-.671-1.402-1.616-2.744-2.385-3.727a28.458 28.458 0 0 0-1.354-1.605l-.022-.023-.006-.007-.002-.001L7 1.5zm0 0-.364-.343L7 1.5zm-.016.766L7 2.247l.016.019c.24.274.572.667.944 1.144.611.781 1.32 1.776 1.901 2.827H4.14c.58-1.051 1.29-2.046 1.9-2.827.373-.477.706-.87.945-1.144zM3 9.733c0-.755.244-1.612.638-2.496h6.724c.395.884.638 1.741.638 2.496C11 12.117 9.182 14 7 14s-4-1.883-4-4.267z" />
</svg>
								습도
							</h3>
							<p class="tm-catalog-item-text">
								<%if(dto != null){ %>
								<span class="tm-text-secondary"> <%=move_dao.Move(dto.getMb_region()).getW_humidity()%>%
								</span>
								<%}else{%>
								<span class="tm-text-secondary"> <%=move_dao.Move("광주").getW_humidity()%>%
								</span>
								<%} %><br />
								<%if(dto != null){
		                float move2 = Float.parseFloat(move_dao.Move(dto.getMb_region()).getW_humidity());
		                int data2 = (int)move2;
		               
		                if(data2>= 70){ %>
								습하네요.
								<%}else if(data2 >= 57){ %>
								평균이에요.
								<%}else{ %>
								건조합니다.
								<%} %>
								<%}else{ %>

								<%float move2 = Float.parseFloat(move_dao.Move("광주").getW_humidity());
						                int data2 = (int)move2;
							               
						                if(data2>= 70){ %>
								습하네요.
								<%}else if(data2 >= 57){ %>
								평균이에요.
								<%}else{ %>
								건조합니다.
								<%} %>
								<%} %>
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
								<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35"
									fill="currentColor" class="bi bi-wind" viewBox="0 0 16 16">
  <path
										d="M12.5 2A2.5 2.5 0 0 0 10 4.5a.5.5 0 0 1-1 0A3.5 3.5 0 1 1 12.5 8H.5a.5.5 0 0 1 0-1h12a2.5 2.5 0 0 0 0-5zm-7 1a1 1 0 0 0-1 1 .5.5 0 0 1-1 0 2 2 0 1 1 2 2h-5a.5.5 0 0 1 0-1h5a1 1 0 0 0 0-2zM0 9.5A.5.5 0 0 1 .5 9h10.042a3 3 0 1 1-3 3 .5.5 0 0 1 1 0 2 2 0 1 0 2-2H.5a.5.5 0 0 1-.5-.5z" />
</svg>
								풍향
							</h3>
							<p class="tm-catalog-item-text">
								<%if(dto != null){ %>
								<span class="tm-text-secondary"> <%=move_dao.Move(dto.getMb_region()).getW_wind()%>
								</span>
								<%}else{ %>
								<span class="tm-text-secondary"> <%=move_dao.Move("광주").getW_wind()%>
								</span>
								<%} %><br />
								<%if(dto != null){%>
								바람이 부네요
								<%}else{%>
								바람이 부네요
								<%} %><br />
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
									<img alt="" src="./img/wash.png" width="35" height="35"
										style="filter: invert(52%) sepia(52%) saturate(668%) hue-rotate(155deg) brightness(94%) contrast(82%);">
									세탁 지수
								</h3>
								<p class="tm-catalog-item-text">
									<%if(dto != null){ %>
									<span class="tm-text-secondary"> <%=life_dao.life_dto(dto.getMb_region()).getw_wash() %>%
									</span>
									<%}else{%>
									<span class="tm-text-secondary"> <%=life_dao.life_dto("광주").getW_wash() %>%
									</span>
									<%} %><br />
									<%if(dto != null){
			                float move3 = Float.parseFloat(life_dao.life_dto(dto.getMb_region()).getw_wash());
			                int data3 = (int)move3;
			               
			                if(data3>= 80){ %>
									밀린 빨래하기 좋은 날이네요.
									<%}else if(data3 >= 70){ %>
									야외 건조 좋아요
									<%}else if(data3 >= 50){ %>
									야외에서 빨래를 말리려면 날씨를 한번 더 확인해주세요.
									<%}else if(data3 >= 30){ %>
									실내에서 말리세요.
									<%}else{ %>
									마르지 않아 냄새가 날 수 있어요.
									<%} %>
									<%}else{ %>
									<%float move3 = Float.parseFloat(life_dao.life_dto("광주").getw_wash());
							                int data3 = (int)move3;
								               
							                if(data3>= 80){ %>
									밀린 빨래하기 좋은 날이네요.
									<%}else if(data3 >= 70){ %>
									야외 건조 좋아요
									<%}else if(data3 >= 50){ %>
									야외에서 빨래를 말리려면 날씨를 한번 더 확인해주세요.
									<%}else if(data3 >= 30){ %>
									실내에서 말리세요.
									<%}else{ %>
									마르지 않아 냄새가 날 수 있어요.
									<%} %>
									<%} %>

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
									<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35"
										fill="currentColor" class="bi bi-emoji-sunglasses"
										viewBox="0 0 16 16">
  <path
											d="M4.968 9.75a.5.5 0 1 0-.866.5A4.498 4.498 0 0 0 8 12.5a4.5 4.5 0 0 0 3.898-2.25.5.5 0 1 0-.866-.5A3.498 3.498 0 0 1 8 11.5a3.498 3.498 0 0 1-3.032-1.75zM7 5.116V5a1 1 0 0 0-1-1H3.28a1 1 0 0 0-.97 1.243l.311 1.242A2 2 0 0 0 4.561 8H5a2 2 0 0 0 1.994-1.839A2.99 2.99 0 0 1 8 6c.393 0 .74.064 1.006.161A2 2 0 0 0 11 8h.438a2 2 0 0 0 1.94-1.515l.311-1.242A1 1 0 0 0 12.72 4H10a1 1 0 0 0-1 1v.116A4.22 4.22 0 0 0 8 5c-.35 0-.69.04-1 .116z" />
  <path
											d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-1 0A7 7 0 1 0 1 8a7 7 0 0 0 14 0z" />
</svg>
									외출 지수
								</h3>
								<p class="tm-catalog-item-text">
									<%if(dto != null){ %>
									<span class="tm-text-secondary"> <%=life_dao.life_dto(dto.getMb_region()).getW_out()%>%
									</span>
									<%}else{%>
									<span class="tm-text-secondary"> <%=life_dao.life_dto("광주").getW_out()%>%
									</span>
									<%} %><br />
									<%if(dto != null){
			                float move4 = Float.parseFloat(life_dao.life_dto(dto.getMb_region()).getW_out());
			                int data4 = (int)move4;
			               
			                if(data4>= 90){ %>
									상쾌한 야외 공기를 느껴보세요.
									<%}else if(data4 >= 80){ %>
									맑은 하늘을 느껴보세요.
									<%}else if(data4 >= 70){ %>
									교외로 드라이브 다녀오는 건 어떨까요?
									<%}else if(data4 >= 50){ %>
									가벼운 외출은 어떨까요?
									<%}else if(data4 >= 40){ %>
									실내 활동은 어떠세요?
									<%}else{ %>
									가급적 외출을 피하세요.
									<%} %>
									<%}else{ %>
									<%float move4 = Float.parseFloat(life_dao.life_dto("광주").getW_out());
			                				int data4 = (int)move4;
			                
											if(data4>= 90){ %>
									상쾌한 야외 공기를 느껴보세요.
									<%}else if(data4 >= 80){ %>
									맑은 하늘을 느껴보세요.
									<%}else if(data4 >= 70){ %>
									교외로 드라이브 다녀오는 건 어떨까요?
									<%}else if(data4 >= 50){ %>
									가벼운 외출은 어떨까요?
									<%}else if(data4 >= 40){ %>
									실내 활동은 어떠세요?
									<%}else{ %>
									<%} %>
									<%} %>
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
									<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35"
										fill="currentColor" class="bi bi-activity" viewBox="0 0 16 16">
  <path fill-rule="evenodd"
											d="M6 2a.5.5 0 0 1 .47.33L10 12.036l1.53-4.208A.5.5 0 0 1 12 7.5h3.5a.5.5 0 0 1 0 1h-3.15l-1.88 5.17a.5.5 0 0 1-.94 0L6 3.964 4.47 8.171A.5.5 0 0 1 4 8.5H.5a.5.5 0 0 1 0-1h3.15l1.88-5.17A.5.5 0 0 1 6 2Z" />
</svg>
									운동 지수
								</h3>
								<p class="tm-catalog-item-text">
									<%if(dto != null){ %>
									<span class="tm-text-secondary"> <%=life_dao.life_dto(dto.getMb_region()).getW_exercise() %>%
									</span>
									<%}else{%>
									<span class="tm-text-secondary"> <%=life_dao.life_dto("광주").getW_exercise() %>%
									</span>
									<%} %><br />
									<%if(dto != null){
			                float move10 = Float.parseFloat(life_dao.life_dto(dto.getMb_region()).getW_exercise());
			                int data10 = (int)move10;
			               
			                if(data10 >= 90){ %>
									상쾌한 야외 공기를 느껴보세요.
									<%}else if(data10 >= 80){ %>
									운동하기 좋은 날입니다.
									<%}else if(data10 >= 60){ %>
									준비운동을 철저히 하세요.
									<%}else if(data10 >= 30){ %>
									실내에서 가볍게 운동하세요.
									<%}else{ %>
									운동하기 좋지 않아요.
									<%} %>
									<%}else{ %>
									<%float move10 = Float.parseFloat(life_dao.life_dto("광주").getW_exercise());
							                int data10 = (int)move10;
								               
							                if(data10 >= 90){ %>
									상쾌한 야외 공기를 느껴보세요.
									<%}else if(data10 >= 80){ %>
									운동하기 좋은 날입니다.
									<%}else if(data10 >= 60){ %>
									준비운동을 철저히 하세요.
									<%}else if(data10 >= 30){ %>
									실내에서 가볍게 운동하세요.
									<%}else{ %>
									운동하기 좋지 않아요.
									<%} %>
									<%} %>
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
                            </div> -->
							<div class="p-4 tm-bg-gray tm-catalog-item-description">
								<h3 class="tm-text-primary mb-3 tm-catalog-item-title">
									<img src="./img/car.svg" width="35" height="35"> 세차 지수
								</h3>
								<p class="tm-catalog-item-text">
									<%if(dto != null){ %>
									<span class="tm-text-secondary"> <%=life_dao.life_dto(dto.getMb_region()).getW_washcar() %>%
									</span>
									<%}else{%>
									<span class="tm-text-secondary"> <%=life_dao.life_dto("광주").getW_washcar() %>%
									</span>
									<%} %><br />
									<%if(dto != null){
						                float move11 = Float.parseFloat(life_dao.life_dto(dto.getMb_region()).getW_washcar());
						                int data11 = (int)move11;
						               
							                if(data11 >= 80){ %>
									꼼꼼한 세차 좋아요.
									<%}else if(data11 >= 60){ %>
									간단히 닦아요.
									<%}else if(data11 >= 40){ %>
									차 내부 정돈이 좋아요.
									<%}else{ %>
									세차는 다음 기회에..
									<%} %>
									<%}else{ %>
									<% float move11 = Float.parseFloat(life_dao.life_dto("광주").getW_washcar());
						                int data11 = (int)move11;
						               
							                if(data11 >= 80){ %>
									꼼꼼한 세차 좋아요.
									<%}else if(data11 >= 60){ %>
									간단히 닦아요.
									<%}else if(data11 >= 40){ %>
									차 내부 정돈이 좋아요.
									<%}else{ %>
									세차는 다음 기회에..
									<%} %>
									<%} %>
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
									<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35"
										fill="currentColor" class="bi bi-umbrella" viewBox="0 0 16 16">
  <path
											d="M8 0a.5.5 0 0 1 .5.5v.514C12.625 1.238 16 4.22 16 8c0 0 0 .5-.5.5-.149 0-.352-.145-.352-.145l-.004-.004-.025-.023a3.484 3.484 0 0 0-.555-.394A3.166 3.166 0 0 0 13 7.5c-.638 0-1.178.213-1.564.434a3.484 3.484 0 0 0-.555.394l-.025.023-.003.003s-.204.146-.353.146-.352-.145-.352-.145l-.004-.004-.025-.023a3.484 3.484 0 0 0-.555-.394 3.3 3.3 0 0 0-1.064-.39V13.5H8h.5v.039l-.005.083a2.958 2.958 0 0 1-.298 1.102 2.257 2.257 0 0 1-.763.88C7.06 15.851 6.587 16 6 16s-1.061-.148-1.434-.396a2.255 2.255 0 0 1-.763-.88 2.958 2.958 0 0 1-.302-1.185v-.025l-.001-.009v-.003s0-.002.5-.002h-.5V13a.5.5 0 0 1 1 0v.506l.003.044a1.958 1.958 0 0 0 .195.726c.095.191.23.367.423.495.19.127.466.229.879.229s.689-.102.879-.229c.193-.128.328-.304.424-.495a1.958 1.958 0 0 0 .197-.77V7.544a3.3 3.3 0 0 0-1.064.39 3.482 3.482 0 0 0-.58.417l-.004.004S5.65 8.5 5.5 8.5c-.149 0-.352-.145-.352-.145l-.004-.004a3.482 3.482 0 0 0-.58-.417A3.166 3.166 0 0 0 3 7.5c-.638 0-1.177.213-1.564.434a3.482 3.482 0 0 0-.58.417l-.004.004S.65 8.5.5 8.5C0 8.5 0 8 0 8c0-3.78 3.375-6.762 7.5-6.986V.5A.5.5 0 0 1 8 0zM6.577 2.123c-2.833.5-4.99 2.458-5.474 4.854A4.124 4.124 0 0 1 3 6.5c.806 0 1.48.25 1.962.511a9.706 9.706 0 0 1 .344-2.358c.242-.868.64-1.765 1.271-2.53zm-.615 4.93A4.16 4.16 0 0 1 8 6.5a4.16 4.16 0 0 1 2.038.553 8.688 8.688 0 0 0-.307-2.13C9.434 3.858 8.898 2.83 8 2.117c-.898.712-1.434 1.74-1.731 2.804a8.687 8.687 0 0 0-.307 2.131zm3.46-4.93c.631.765 1.03 1.662 1.272 2.53.233.833.328 1.66.344 2.358A4.14 4.14 0 0 1 13 6.5c.77 0 1.42.23 1.897.477-.484-2.396-2.641-4.355-5.474-4.854z" />
</svg>
									우산 지수
								</h3>
								<p class="tm-catalog-item-text">
									<%if(dto != null){ %>
									<span class="tm-text-secondary"> <%=life_dao.life_dto(dto.getMb_region()).getW_rain() %>%
									</span>
									<%}else{%>
									<span class="tm-text-secondary"> <%=life_dao.life_dto("광주").getW_rain() %>%
									</span>
									<%} %><br />
									<%if(dto != null){
						                float move5 = Float.parseFloat(life_dao.life_dto(dto.getMb_region()).getW_rain());
						                int data5 = (int)move5;
						               
							                if(data5>= 90){ %>
									꼭 우산을 챙기세요.
									<%}else if(data5 >= 70){ %>
									우산을 챙기면 후회하지 않을 거에요.
									<%}else if(data5 >= 40){ %>
									가방에 작은 우산 정도.
									<%}else if(data5 >= 30){ %>
									가벼운 외출은 어떨까요?
									<%}else if(data5 >= 10){ %>
									우산이 없어도 좋아요.
									<%}else{ %>
									우산 걱정없이 외출하세요.
									<%} %>
									<%}else{ %>
									<%float move5 = Float.parseFloat(life_dao.life_dto("광주").getW_rain());
							                int data5 = (int)move5;
								               
							                if(data5>= 90){ %>
									꼭 우산을 챙기세요.
									<%}else if(data5 >= 70){ %>
									우산을 챙기면 후회하지 않을 거에요.
									<%}else if(data5 >= 40){ %>
									가방에 작은 우산 정도.
									<%}else if(data5 >= 30){ %>
									가벼운 외출은 어떨까요?
									<%}else if(data5 >= 10){ %>
									우산이 없어도 좋아요.
									<%}else{ %>
									우산 걱정없이 외출하세요.
									<%} %>
									<%} %>
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
									<img alt="" src="./img/bed.svg" width="35" height="35">
									수면 지수
								</h3>
								<p class="tm-catalog-item-text">
									<%if(dto != null){ %>
									<span class="tm-text-secondary"> <%=life_dao.life_dto(dto.getMb_region()).getW_sleep() %>%
									</span>
									<%}else{%>
									<span class="tm-text-secondary"> <%=life_dao.life_dto("광주").getW_sleep() %>%
									</span>
									<%} %><br />
									<%if(dto != null){
						                float move6 = Float.parseFloat(life_dao.life_dto(dto.getMb_region()).getW_sleep());
						                int data6 = (int)move6;
						               
							                if(data6>= 90){ %>
									푹 주무세요. 숙면하기 좋은 날입니다.
									<%}else if(data6 >= 80){ %>
									숙면하기 좋은 날씨입니다.
									<%}else if(data6 >= 70){ %>
									이불 잘 덮고 주무세요.
									<%}else if(data6 >= 50){ %>
									잠들기에 나쁘지 않아요.
									<%}else if(data6 >= 40){ %>
									잠들기 좀 힘들어요.
									<%}else{ %>
									난방이 필요합니다.
									<%} %>
									<%}else{ %>
									<%float move6 = Float.parseFloat(life_dao.life_dto("광주").getW_sleep());
							                int data6 = (int)move6;
								               
							                if(data6>= 90){ %>
									푹 주무세요. 숙면하기 좋은 날입니다.
									<%}else if(data6 >= 80){ %>
									숙면하기 좋은 날씨입니다.
									<%}else if(data6 >= 70){ %>
									이불 잘 덮고 주무세요.
									<%}else if(data6 >= 50){ %>
									잠들기에 나쁘지 않아요.
									<%}else if(data6 >= 40){ %>
									잠들기 좀 힘들어요.
									<%}else{ %>
									난방이 필요합니다.
									<%} %>
									<%} %>
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
								<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35"
									fill="currentColor" class="bi bi-emoji-dizzy"
									viewBox="0 0 16 16">
  <path
										d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
  <path
										d="M9.146 5.146a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708.708l-.647.646.647.646a.5.5 0 0 1-.708.708l-.646-.647-.646.647a.5.5 0 1 1-.708-.708l.647-.646-.647-.646a.5.5 0 0 1 0-.708zm-5 0a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 1 1 .708.708l-.647.646.647.646a.5.5 0 1 1-.708.708L5.5 7.207l-.646.647a.5.5 0 1 1-.708-.708l.647-.646-.647-.646a.5.5 0 0 1 0-.708zM10 11a2 2 0 1 1-4 0 2 2 0 0 1 4 0z" />
</svg>
								감기 지수
							</h3>
							<p class="tm-catalog-item-text">
								<%if(dto != null){ %>
								<span class="tm-text-secondary"> <%=life_dao.life_dto(dto.getMb_region()).getW_cold() %>%
								</span>
								<%}else{%>
								<span class="tm-text-secondary"> <%=life_dao.life_dto("광주").getW_cold() %>%
								</span>
								<%} %><br />
								<%if(dto != null){
					                float move7 = Float.parseFloat(life_dao.life_dto(dto.getMb_region()).getW_cold());
					                int data7 = (int)move7;
					               
						                if(data7>= 90){ %>
								외출시 일교차 주의하세요.
								<%}else if(data7 >= 70){ %>
								따뜻하게 하세요.
								<%}else if(data7 >= 50){ %>
								비타민 섭취 좋아요.
								<%}else if(data7 >= 30){ %>
								건강한 생활습관을 유지하세요.
								<%}else{ %>
								낮아도 방심은 금물!
								<%} %>
								<%}else{ %>
								<%  float move7 = Float.parseFloat(life_dao.life_dto("광주").getW_cold());
						                int data7 = (int)move7;
						               
						                if(data7>= 90){ %>
								외출시 일교차 주의하세요.
								<%}else if(data7 >= 70){ %>
								따뜻하게 하세요.
								<%}else if(data7 >= 50){ %>
								비타민 섭취 좋아요.
								<%}else if(data7 >= 30){ %>
								건강한 생활습관을 유지하세요.
								<%}else{ %>
								낮아도 방심은 금물!
								<%} %>
								<%} %>
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
								<img src="./img/flame1.svg" width="35" height="35"> 불조심 지수
							</h3>
							<p class="tm-catalog-item-text">
								<%if(dto != null){ %>
								<span class="tm-text-secondary"> <%=life_dao.life_dto(dto.getMb_region()).getW_fire() %>%
								</span>
								<%}else{%>
								<span class="tm-text-secondary"> <%=life_dao.life_dto("광주").getW_fire() %>%
								</span>
								<%} %><br />
								<%if(dto != null){
					                float move8 = Float.parseFloat(life_dao.life_dto(dto.getMb_region()).getW_fire());
					                int data8 = (int)move8;
					               
						                if(data8>= 85){ %>
								세심하게 주위를 살펴요.
								<%}else if(data8 >= 60){ %>
								불이 번지기 쉬워요.
								<%}else if(data8 >= 50){ %>
								주변의 불씨를 잘 살펴요.
								<%}else if(data8 >= 20){ %>
								소화기 점검은 평소에 하세요.
								<%}else{ %>
								낮아도 방심은 금물!
								<%} %>
								<%}else{ %>
								<%float move8 = Float.parseFloat(life_dao.life_dto("광주").getW_fire());
						                int data8 = (int)move8;
							               
						                if(data8>= 85){ %>
								세심하게 주위를 살펴요.
								<%}else if(data8 >= 60){ %>
								불이 번지기 쉬워요.
								<%}else if(data8 >= 50){ %>
								주변의 불씨를 잘 살펴요.
								<%}else if(data8 >= 20){ %>
								소화기 점검은 평소에 하세요.
								<%}else{ %>
								낮아도 방심은 금물!
								<%} %>
								<%} %>
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
								<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35"
									fill="currentColor" class="bi bi-emoji-neutral"
									viewBox="0 0 16 16">
  <path
										d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
  <path
										d="M4 10.5a.5.5 0 0 0 .5.5h7a.5.5 0 0 0 0-1h-7a.5.5 0 0 0-.5.5zm3-4C7 5.672 6.552 5 6 5s-1 .672-1 1.5S5.448 8 6 8s1-.672 1-1.5zm4 0c0-.828-.448-1.5-1-1.5s-1 .672-1 1.5S9.448 8 10 8s1-.672 1-1.5z" />
</svg>
								피부지수
							</h3>
							<p class="tm-catalog-item-text">
								<%if(dto != null){ %>
								<span class="tm-text-secondary"> <%=move_dao.Move(dto.getMb_region()).getW_temp()%>℃
								</span>
								<%}else{%>
								<span class="tm-text-secondary"> <%=move_dao.Move("광주").getW_temp()%>℃
								</span>
								<%} %><br />
								<%if(dto != null){
										float move9 = move_dao.Move(dto.getMb_region()).getW_temp();
		               /*  float move9 = Float.parseFloat(move_dao.Move(dto.getMb_region()).getW_temp()); */
					                int data9 = (int)move9;
					               
					                	if(data9>= 50){ %>
								목도리 장갑을 준비하세요.
								<%}else if(data9 >= 80){ %>
								피부에 영양을 주세요.
								<%}else if(data9 >= 60){ %>
								클렌징을 철저하게 해주세요.
								<%}else if(data9 >= 50){ %>
								수분 크림을 발라주세요.
								<%}else{ %>
								피부 관리는 평소에 하는 거 아시죠?
								<%} %>
								<%}else{ %>
								<%float move9 = move_dao.Move("광주").getW_temp();
							               /*  float move9 = Float.parseFloat(move_dao.Move(dto.getMb_region()).getW_temp()); */
						                int data9 = (int)move9;
						               
						                if(data9>= 50){ %>
								목도리 장갑을 준비하세요.
								<%}else if(data9 >= 80){ %>
								피부에 영양을 주세요.
								<%}else if(data9 >= 60){ %>
								클렌징을 철저하게 해주세요.
								<%}else if(data9 >= 50){ %>
								수분 크림을 발라주세요.
								<%}else{ %>
								피부 관리는 평소에 하는 거 아시죠?
								<%} %>
								<%} %>
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
						<li class="nav-item"><a href="#"
							class="nav-link tm-paging-link">∧</a></li>
						<!--
                            <li class="nav-item"><a href="#" class="nav-link tm-paging-link">3</a></li>
                            <li class="nav-item"><a href="#" class="nav-link tm-paging-link">4</a></li>
                            <li class="nav-item"><a href="#" class="nav-link tm-paging-link">></a></li>
                            -->
					</ul>
				</div>
			</main>

			<!-- Subscribe form and footer links --><!-- Subscribe form and footer links -->
			<div class="row mt-5 pt-3">
				<div class="col-xl-6 col-lg-12 mb-4">
					<div class="tm-bg-gray p-5 h-100">
						<h3 class="tm-text-primary mb-3">Our Team - ☁︎ Today</h3>
						<div class="p-5 tm-bg-gray">
							<ul class="list-unstyled tm-footer-links">
								<li><a href="#">전웅철</a></li>
								<li><a href="#">박서현</a></li>
								<li><a href="#">김현철</a></li>
								<li><a href="#">유현지</a></li>
								<li><a href="login.html">그 외 도움을 주신 분들♥</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-xl-6 col-lg-12 mb-4">
					<div class="tm-bg-gray p-5 h-100">
						<h3 class="tm-text-primary mb-3">Menu - ☁︎ Today</h3>
						<div class="p-5 tm-bg-gray">
							<ul class="list-unstyled tm-footer-links">
								<li><a href="tm-text-primary mb-4"></a></li>
								<li><a href="#">login</a></li>
								<li><a href="#">update</a></li>
								<li><a href="#">map</a></li>
								<li><a href="login.html">my</a></li>
							</ul>
						</div>
					</div>
				</div>


			</div>
			<!-- row -->
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

		$(document).ready(function() {
			/************** Video background *********/

			setVideoSize();

			// Set video background size based on window size
			let timeout;
			window.onresize = function() {
				clearTimeout(timeout);
				timeout = setTimeout(setVideoSize, 100);
			};

			// Play/Pause button for video background
			const btn = $("#tm-video-control-button");

			btn.on("click", function(e) {
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