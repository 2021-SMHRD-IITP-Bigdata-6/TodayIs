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
<title>Main</title>
<link rel="stylesheet" href="fontawesome/css/all.min.css" />

<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/templatemo-video-catalog.css" />
<!--

=======
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/templatemo-video-catalog.css" />
    <!--
>>>>>>> branch 'branches' of https://github.com/2021-SMHRD-IITP-Bigdata-6/TodayIs.git
    TemplateMo 552 Video Catalog
<<<<<<< HEAD

    https://templatemo.com/tm-552-video-catalog

    -->
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
								<nav class="navbar navbar-expand-lg mr-0 ml-auto"
									id="tm-main-nav">
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
										type="button" data-toggle="collapse" data-target="#navbar-nav"
										aria-controls="navbar-nav" aria-expanded="false"
										aria-label="Toggle navigation">
										<span> <i class="fas fa-bars tm-menu-closed-icon"></i>
											<i class="fas fa-times tm-menu-opened-icon"></i>
										</span>
									</button>
									<div class="collapse navbar-collapse tm-nav" id="navbar-nav">
										<ul class="navbar-nav text-uppercase">
											<%if(dto != null){ %>
											<li class="nav-item active"><a
												class="nav-link tm-nav-link" href="#"> <%=dto.getMb_nickname()%>
													's <%=dto.getMb_region()%><span class="sr-only">(current)</span>
											</a></li>
											<%} %>
											<%if(dto == null){ %>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="login.html">login</a></li>
											<%}else{ %>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="update.jsp?mb_id=<%=dto.getMb_id() %>">logout</a></li>
											<%} %>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="t_community.jsp">weather</a></li>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="t_mission.jsp">today</a>
											</li>
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
			<div class="tm-welcome-container text-center text-white">
				<div class="tm-welcome-container-inner">
					<!-- 메인페이지 기온 보여주기 -->
					<% if(dto != null){%>
					<p class="tm-welcome-text mb-1 text-white">
						<%=move_dao.Move(dto.getMb_region()).getW_temp() %>℃
					</p>
					<%}%>
					<a href="#content"
						class="btn tm-btn-animate tm-btn-cta tm-icon-down">
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
				<video autoplay muted loop id="tm-video">
					<source src="video/sun.mp4" type="video/mp4" />
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
									체감온도</h3>
								<p class="tm-catalog-item-text">
									<%if (dto != null) {%>
									<span class="tm-text-secondary"> <%=move_dao.Move(dto.getMb_region()).getW_body_temp()%>℃
									</span>
									<%}%><br />
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
								<h3 class="tm-text-primary mb-3 tm-catalog-item-title">습도</h3>
								<p class="tm-catalog-item-text">
									<%if(dto != null){ %>
									<span class="tm-text-secondary"> <%=move_dao.Move(dto.getMb_region()).getW_humidity()%>%
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
								<h3 class="tm-text-primary mb-3 tm-catalog-item-title">풍향</h3>
								<p class="tm-catalog-item-text">
									<%if(dto != null){ %>
									<span class="tm-text-secondary"> <%=move_dao.Move(dto.getMb_region()).getW_wind()%>
									</span>
									<%} %><br />
									<%if(dto != null){%>
									바람이 부네요
									<%} %>
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
									<h3 class="tm-text-primary mb-3 tm-catalog-item-title">세탁
										지수</h3>
									<p class="tm-catalog-item-text">
										<%if(dto != null){ %>
										<span class="tm-text-secondary"> <%=life_dao.life_dto(dto.getMb_region()).getw_wash() %>%
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
									<h3 class="tm-text-primary mb-3 tm-catalog-item-title">외출
										지수</h3>
									<p class="tm-catalog-item-text">
										<%if(dto != null){ %>
										<span class="tm-text-secondary"> <%=life_dao.life_dto(dto.getMb_region()).getW_out()%>%
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
									<h3 class="tm-text-primary mb-3 tm-catalog-item-title">운동
										지수</h3>
									<p class="tm-catalog-item-text">
										<%if(dto != null){ %>
										<span class="tm-text-secondary"> <%=life_dao.life_dto(dto.getMb_region()).getW_exercise() %>%
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
									<h3 class="tm-text-primary mb-3 tm-catalog-item-title">세차
										지수</h3>
									<p class="tm-catalog-item-text">
										<%if(dto != null){ %>
										<span class="tm-text-secondary"> <%=life_dao.life_dto(dto.getMb_region()).getW_washcar() %>%
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
									<h3 class="tm-text-primary mb-3 tm-catalog-item-title">우산
										지수</h3>
									<p class="tm-catalog-item-text">
										<%if(dto != null){ %>
										<span class="tm-text-secondary"> <%=life_dao.life_dto(dto.getMb_region()).getW_rain() %>%
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
									<h3 class="tm-text-primary mb-3 tm-catalog-item-title">수면
										지수</h3>
									<p class="tm-catalog-item-text">
										<%if(dto != null){ %>
										<span class="tm-text-secondary"> <%=life_dao.life_dto(dto.getMb_region()).getW_sleep() %>%
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
								<h3 class="tm-text-primary mb-3 tm-catalog-item-title">감기
									지수</h3>
								<p class="tm-catalog-item-text">
									<%if(dto != null){ %>
									<span class="tm-text-secondary"> <%=life_dao.life_dto(dto.getMb_region()).getW_cold() %>%
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
								<h3 class="tm-text-primary mb-3 tm-catalog-item-title">불조심
									지수</h3>
								<p class="tm-catalog-item-text">
									<%if(dto != null){ %>
									<span class="tm-text-secondary"> <%=life_dao.life_dto(dto.getMb_region()).getW_fire() %>%
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
									피부지수</h3>
								<p class="tm-catalog-item-text">
									<%if(dto != null){ %>
									<span class="tm-text-secondary"> <%=move_dao.Move(dto.getMb_region()).getW_temp()%>℃
									</span>
									<%} %><br />
									<%if(dto != null){
		                float move9 = Float.parseFloat(move_dao.Move(dto.getMb_region()).getW_temp());
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

				<!-- Subscribe form and footer links -->
				<div class="row mt-5 pt-3">
					<div class="col-xl-6 col-lg-12 mb-4">
						<div class="tm-bg-gray p-5 h-100">
							<h3 class="tm-text-primary mb-3">Do you want to get our
								latest updates?</h3>
							<p class="mb-5">Please subscribe our newsletter for upcoming
								new videos and latest information about our work. Thank you.</p>
							<form action="" method="GET" class="tm-subscribe-form">
								<input type="text" name="email" placeholder="Your Email..."
									required />
								<button type="submit"
									class="btn rounded-0 btn-primary tm-btn-small">
									Subscribe</button>
							</form>
						</div>
					</div>
					<div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-12 mb-4">
						<div class="p-5 tm-bg-gray">
							<h3 class="tm-text-primary mb-4">Today Developers</h3>
							<ul class="list-unstyled tm-footer-links">
								<li><a href="#">전웅철</a></li>
								<li><a href="#">박서현</a></li>
								<li><a href="#">김현철</a></li>
								<li><a href="#">유현지</a></li>
								<li><a href="login.html">그 외 도움을 주신분들♥</a></li>
							</ul>
						</div>
					</div>
					<div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-12 mb-4">
						<div class="p-5 tm-bg-gray h-100">
							<h3 class="tm-text-primary mb-4">Today Menu</h3>
							<ul class="list-unstyled tm-footer-links">
								<%if(dto == null){ %>
								<li><a href="login.html">login</a></li>
								<%}else{ %>
								<li><a href="update.jsp?mb_id=<%=dto.getMb_id() %>">update</a></li>
								<li><a href="region.html">map</a></li>
								<%} %>
								<li><a href="index.jsp">weather</a></li>
								<li><a href="#">today</a></li>
								<li><a href="#">my</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- row -->

				<footer class="row pt-5">
					<div class="col-12">
						<p class="text-right">
							Copyright 2020 The Video Catalog Company - Designed by <a
								href="https://templatemo.com" rel="nofollow" target="_parent">TemplateMo</a>
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