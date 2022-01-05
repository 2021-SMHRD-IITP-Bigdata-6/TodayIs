<%@page import="com.today.DAO.moveDAO"%>
<%@page import="com.today.DTO.memberDTO"%>
<%@page import="com.today.DAO.mainLifeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TODAY☁︎MAP</title>

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
.overlaybox {
	position: relative;
	width: 160px;
	height: 230px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/box_movie.png')
		no-repeat;
	padding: 10px;
}

.overlaybox div, ul {
	overflow: hidden;
	margin: 0;
	padding: 0;
}

.overlaybox li {
	list-style: none;
}

.overlaybox .boxtitle {
	color: #fff;
	font-size: 16px;
	font-weight: bold;
	background: no-repeat right 120px center;
	margin-bottom: 8px;
}

.overlaybox .first {
	position: relative;
	width: 140px;
	height: 100px;
	background-position: center center;
	background-size: 100%;
	margin-bottom: 8px;
}

.first .text {
	color: #fff;
	font-weight: bold;
}

.first .movietitle {
	position: absolute;
	width: 100%;
	bottom: 0;
	background: rgba(0, 0, 0, 0.4);
	padding: 7px 15px;
	font-size: 14px;
}

.overlaybox ul {
	width: 100%;
}

.overlaybox li {
	position: relative;
	margin-bottom: 2px;
	background: #2b2d36;
	padding: 5px 10px;
	color: #aaabaf;
	line-height: 1;
}

.overlaybox li span {
	display: inline-block;
}

.overlaybox li .number {
	font-size: 16px;
	font-weight: bold;
}

.overlaybox li .title {
	font-size: 13px;
}

.overlaybox li .up {
	background-position: 0 -40px;
}

.overlaybox li .down {
	background-position: 0 -60px;
}

.overlaybox li .count {
	position: absolute;
	margin-top: 5px;
	right: 15px;
	font-size: 10px;
}

.overlaybox li:hover {
	color: #fff;
	background: #d24545;
}

.overlaybox li:hover .up {
	background-position: 0 0px;
}

.overlaybox li:hover .down {
	background-position: 0 -20px;
}
</style>
</head>
<body>

	<%
		//로그인 정보 dto
	memberDTO dto = (memberDTO) session.getAttribute("dto");

	//실시간 날씨 관련 데이터
	mainLifeDAO w_dao = new mainLifeDAO();
	moveDAO wm_dao = new moveDAO();
	%>

	<div class="tm-page-wrap mx-auto">
		<div class="position-relative">
			<div class="potition-absolute tm-site-header">
				<div class="container-fluid position-relative">
					<div class="row">
						<div class="col-6 col-md-10 ml-auto mr-0">
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
											//로그인을 하면	
											if (dto != null) {
											%>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href=""> <%=dto.getMb_nickname()%> 's <%=dto.getMb_region()%>
											</a></li>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="t_community.jsp">with </a></li>
											<li class="nav-item "><a
												class="nav-link tm-nav-link" href="t_mission.jsp">moment</a></li>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="t_mymain.jsp">my</a></li>
											<li class="nav-item active"><a class="nav-link tm-nav-link"
												href="Kakao.jsp">map<span class="sr-only">(current)</span></a></li>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="update.jsp">sign out</a></li>
											<%
												}
											%>
											
											<%
											//로그인 안 한 상태
												if (dto == null) {
											%>
											<li class="nav-item"><a class="nav-link tm-nav-link"
                                    			href="index.jsp">☁︎ today</a></li>
                                    		<li class="nav-item"><a class="nav-link tm-nav-link"
												href="t_community.jsp">with </a></li>
											<li class="nav-item"><a
												class="nav-link tm-nav-link" href="t_mission.jsp">moment</a></li>
											<li class="nav-item active"><a class="nav-link tm-nav-link"
												href="Kakao.jsp">map<span class="sr-only">(current)</span></a></li>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="login.jsp?numbers=6">sign in</a></li>							
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

			<div class="tm-welcome-container tm-fixed-header tm-fixed-header-5">
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
						<h2>
							<svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
  <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
</svg>
							&nbsp MAP
						</h2>
						<span> WEATHER STATUS/ TEMP / BODY-TEMP </span>
						
						
					</div>
					<!-- /.section-header -->
				</div>
				<!-- /.row -->
			<div class="projects-holder-3">

					<div class="blog-masonry masonry-true">
						<div class="row" align="center">
							<button onclick="panTo1()">서울</button>
							<button onclick="panTo2()">경기</button>
							<button onclick="panTo3()">인천</button>
							<button onclick="panTo4()">충북</button>
							<button onclick="panTo5()">세종</button>
							<button onclick="panTo6()">대전</button>
							<button onclick="panTo7()">강원</button>
							<br>
							<button onclick="panTo8()">전북</button>
							<button onclick="panTo9()">전남</button>
							<button onclick="panTo10()">광주</button>
							<button onclick="panTo11()">경북</button>
							<button onclick="panTo12()">울산</button>
							<button onclick="panTo13()">부산</button>
							<button onclick="panTo14()">경남</button>
							<button onclick="panTo15()">제주</button>
							<div class="section-header col-md-12">
								<div id="map"
									style="width: 100%; height: 800px; position: relative;"></div>
							</div>
						</div>
					</div>
				</div >
			</div>
		</div>


	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fc7696aa31445fcfe21fc7bb8d6cc220"></script>
	<script src="js/vendor/jquery-1.11.0.min.js"></script>
	<script>
	

	
	var selected_big
		var region = [
			[37.3306890, 126.5930664], // 서울
			[37.4980273, 127.5117792], // 경기도(양평)
			[37.4585339, 126.7055905], // 인천(강화도)
			[36.9883750, 127.8987446], // 충북
			[36.5995087, 126.6665707], // 세종
			[36.2936611, 127.3963480], // 대전
			[37.7126012, 128.7122185], // 강원
			[35.8624242, 127.0758648], // 전북
			[34.8030064, 127.3505135], // 전남
			[35.1595454, 126.8526012], // 광주
			[36.9835881, 128.8818743], // 경북
			[35.6185699, 129.3624188], // 울산
			[35.1262092, 128.8168360], // 부산
			[35.9409719, 128.5193229], // 경남
			[33.3871676, 126.5429675] // 제주		

		];
	
		var a = 35.1595454;
		var b = 126.8526012;
		
		var container = document.getElementById('map');
		var options = {
			//광주 위도 경도가 기본값
			center : new kakao.maps.LatLng(a , b),
			level : 10
		}
		var map = new kakao.maps.Map(container, options);
		
	// 지역 클릭 시 선택된 option태그의 내용을 text형태로 가지고 오기
	$('#big').on('click', function(){
		selected_big = $('#big option:selected').text();
		var region_name =['서울','경기','인천','충북','충남','세종','대전','강원','전북','전남','광주','경북','울산','부산','경남','제주'];
		
		
		
		for (var i = 0; i < 16; i ++) {
		if( selected_big == region_name[i]) {
			console.log(region_name[i]);
			a = region[i][0];
			b = region[i][1];

		};
		};
		});

	
	
	//* 서울  *//
		var content1 = '<div class="overlaybox" >'
			+ '    <div class="boxtitle">서울 날씨 </div>'
			+ '    <div class="first" style="background: url(\'UploadWrite/서울로고.png\') no-repeat;background-position: center center;background-size: 100%;">' 
		    + '    <div class="movietitle text"><%=wm_dao.Move("서울").getW_temp()%>℃</div>'
			+ '    </div>' + '    <ul>' + '        <li class="up">'
			+ '            <span class="number"></span>'
			+ '            <span class="title"><%=wm_dao.Move("서울").getW_status()%></span>'
			+ '            <span class="arrow up"></span>'
			+ '           ' + '        </li>'
			+ '        <li>' 
			+ '            <span class="title"><%=wm_dao.Move("서울").getW_body_temp()%>℃</span>'
			+ '            <span class="arrow up"></span>'
			+ '           ' + '        </li>'
			+ '    </ul>' + '</div>';

	var position1 = new kakao.maps.LatLng(37.5406890, 126.9930664);
		var customOverlay1 = new kakao.maps.CustomOverlay({
			position : position1,
			content : content1,
			xAnchor : 0.3,
			yAnchor : 0.70
		    
		});
		customOverlay1.setMap(map);
	//* 서울  *//
	
	
	//* 경기(수원)  *//
		var content2 = '<div class="overlaybox">'
			+ '    <div class="boxtitle">경기 날씨 </div>'
			+ '    <div class="first" style="background: url(\'UploadWrite/경기도로고.png\') no-repeat;background-position: center center;background-size: 100%;">' 
		    + '    <div class="movietitle text"><%=wm_dao.Move("수원").getW_temp()%>℃</div>'
			+ '    </div>' + '    <ul>' + '        <li class="up">'
			+ '            <span class="number"></span>'
			+ '            <span class="title"><%=wm_dao.Move("수원").getW_status()%></span>'
			+ '            <span class="arrow up"></span>'
			+ '           ' + '        </li>'
			+ '        <li>' + ' <span class="number"></span>'
			+ '            <span class="title"><%=wm_dao.Move("수원").getW_body_temp()%>℃</span>'
			+ '            <span class="arrow up"></span>'
			+ '           ' + '        </li>'
			+ '    </ul>' + '</div>';

	var position2 = new kakao.maps.LatLng(37.4980273, 127.5117792);
		var customOverlay2 = new kakao.maps.CustomOverlay({
			position : position2,
			content : content2,
			xAnchor : 0.3,
			yAnchor : 0.80
		    
		});
		customOverlay2.setMap(map);
	//* 경기(양평)  *//	
	
	//* 인천 *//
		var content3 = '<div class="overlaybox">'
			+ '    <div class="boxtitle">인천 날씨 </div>'
			+ '    <div class="first" style="background: url(\'UploadWrite/인천로고.png\') no-repeat;background-position: center center;background-size: 200%;">' 
		    + '    <div class="movietitle text"><%=wm_dao.Move("인천").getW_temp()%>℃</div>'
			+ '    </div>' + '    <ul>' + '        <li class="up">'
			+ '            <span class="number"></span>'
			+ '            <span class="title"><%=wm_dao.Move("인천").getW_status()%></span>'
			+ '            <span class="arrow up"></span>'
			+ '           ' + '        </li>'
			+ '        <li>' + ' <span class="number"></span>'
			+ '            <span class="title"><%=wm_dao.Move("인천").getW_body_temp()%>℃</span>'
			+ '            <span class="arrow up"></span>'
			+ '           ' + '        </li>'
			+ '    </ul>' + '</div>';

	var position3 = new kakao.maps.LatLng(37.4485339, 126.6355905);
		var customOverlay3 = new kakao.maps.CustomOverlay({
			position : position3,
			content : content3,
			xAnchor : 0.3,
			yAnchor : 0.80
		    
		});
		customOverlay3.setMap(map);
		//* 인천 *//	
		
		
		//* 충북(청주) *//
		var content4 = '<div class="overlaybox">'
			+ '    <div class="boxtitle">충북 날씨 </div>'
			+ '    <div class="first" style="background: url(\'UploadWrite/충북로고.png\') no-repeat;background-position: center center;background-size: 200%;">' 
		    + '    <div class="movietitle text"><%=wm_dao.Move("청주").getW_temp()%>℃</div>'
			+ '    </div>' + '    <ul>' + '        <li class="up">'
			+ '            <span class="number"></span>'
			+ '            <span class="title"><%=wm_dao.Move("청주").getW_status()%></span>'
			+ '            <span class="arrow up"></span>'
			+ '           ' + '        </li>'
			+ '        <li>' + ' <span class="number"></span>'
			+ '            <span class="title"><%=wm_dao.Move("청주").getW_body_temp()%>℃</span>'
			+ '            <span class="arrow up"></span>'
			+ '           ' + '        </li>'
			+ '    </ul>' + '</div>';

	var position4 = new kakao.maps.LatLng(36.9883750, 127.8987446);
		var customOverlay4 = new kakao.maps.CustomOverlay({
			position : position4,
			content : content4,
			xAnchor : 0.3,
			yAnchor : 0.80
		    
		});
		customOverlay4.setMap(map);
		//* 충북 *//	
		
		
		
	//* 세종 *//
		var content5 = '<div class="overlaybox">'
			+ '    <div class="boxtitle">세종 날씨 </div>'
			+ '    <div class="first" style="background: url(\'UploadWrite/세종로고.png\') no-repeat;background-position: center center;background-size: 200%;">' 
		    + '    <div class="movietitle text"><%=wm_dao.Move("홍성").getW_temp()%>℃</div>'
			+ '    </div>' + '    <ul>' + '        <li class="up">'
			+ '            <span class="number"></span>'
			+ '            <span class="title"><%=wm_dao.Move("홍성").getW_status()%></span>'
			+ '            <span class="arrow up"></span>'
			+ '           ' + '        </li>'
			+ '        <li>' + ' <span class="number"></span>'
			+ '            <span class="title"><%=wm_dao.Move("홍성").getW_body_temp()%>℃</span>'
			+ '            <span class="arrow up"></span>'
			+ '           ' + '        </li>'
			+ '    </ul>' + '</div>';

	var position5 = new kakao.maps.LatLng(36.5995087, 126.6665707);
		var customOverlay5 = new kakao.maps.CustomOverlay({
			position : position5,
			content : content5,
			xAnchor : 0.3,
			yAnchor : 0.80
		    
		});
		customOverlay5.setMap(map);
		//* 세종 *//	
		
		
		//* 대전 *//
		var content6 = '<div class="overlaybox">'
			+ '    <div class="boxtitle">대전 날씨 </div>'
			+ '    <div class="first" style="background: url(\'UploadWrite/대전로고.png\') no-repeat;background-position: center center;background-size: 200%;">' 
		    + '    <div class="movietitle text"><%=wm_dao.Move("대전").getW_temp()%>℃</div>'
			+ '    </div>' + '    <ul>' + '        <li class="up">'
			+ '            <span class="number"></span>'
			+ '            <span class="title"><%=wm_dao.Move("대전").getW_status()%></span>'
			+ '            <span class="arrow up"></span>'
			+ '           ' + '        </li>'
			+ '        <li>' + ' <span class="number"></span>'
			+ '            <span class="title"><%=wm_dao.Move("대전").getW_body_temp()%>℃</span>'
			+ '            <span class="arrow up"></span>'
			+ '           ' + '        </li>'
			+ '    </ul>' + '</div>';

	var position6 = new kakao.maps.LatLng(36.2936611, 127.3963480);
		var customOverlay6 = new kakao.maps.CustomOverlay({
			position : position6,
			content : content6,
			xAnchor : 0.3,
			yAnchor : 0.80
		    
		});
		customOverlay6.setMap(map);
		//* 대전 *//	
		
		
		//* 강원 *//
		var content7 = '<div class="overlaybox">'
			+ '    <div class="boxtitle">강원 날씨 </div>'
			+ '    <div class="first" style="background: url(\'UploadWrite/강원로고.png\') no-repeat;background-position: center center;background-size: 100%;">' 
		    + '    <div class="movietitle text"><%=wm_dao.Move("북강릉").getW_temp()%>℃</div>'
			+ '    </div>' + '    <ul>' + '        <li class="up">'
			+ '            <span class="number"></span>'
			+ '            <span class="title"><%=wm_dao.Move("북강릉").getW_status()%></span>'
			+ '            <span class="arrow up"></span>'
			+ '           ' + '        </li>'
			+ '        <li>' + ' <span class="number"></span>'
			+ '            <span class="title"><%=wm_dao.Move("북강릉").getW_body_temp()%>℃</span>'
			+ '            <span class="arrow up"></span>'
			+ '           ' + '        </li>'
			+ '    </ul>' + '</div>';

	var position7 = new kakao.maps.LatLng(37.7126012, 128.7122185);
		var customOverlay7 = new kakao.maps.CustomOverlay({
			position : position7,
			content : content7,
			xAnchor : 0.3,
			yAnchor : 0.80
		    
		});
		customOverlay7.setMap(map);
		//* 강원 *//
		
		//* 전북 *//
		var content8 = '<div class="overlaybox">'
			+ '    <div class="boxtitle">전북 날씨 </div>'
			+ '    <div class="first" style="background: url(\'UploadWrite/전북로고.png\') no-repeat;background-position: center center;background-size: 100%;">' 
		    + '    <div class="movietitle text"><%=wm_dao.Move("전주").getW_temp()%>℃</div>'
			+ '    </div>' + '    <ul>' + '        <li class="up">'
			+ '            <span class="number"></span>'
			+ '            <span class="title"><%=wm_dao.Move("전주").getW_status()%></span>'
			+ '            <span class="arrow up"></span>'
			+ '           ' + '        </li>'
			+ '        <li>' + ' <span class="number"></span>'
			+ '            <span class="title"><%=wm_dao.Move("전주").getW_body_temp()%>℃</span>'
			+ '            <span class="arrow up"></span>'
			+ '           ' + '        </li>'
			+ '    </ul>' + '</div>';

	var position8 = new kakao.maps.LatLng(35.8624242, 127.0758648);
		var customOverlay8 = new kakao.maps.CustomOverlay({
			position : position8,
			content : content8,
			xAnchor : 0.3,
			yAnchor : 0.80
		    
		});
		customOverlay8.setMap(map);
		//* 전북 *//	
		
		//* 전남 *//
		var content9 = '<div class="overlaybox">'
			+ '    <div class="boxtitle">전남 날씨 </div>'
			+ '    <div class="first" style="background: url(\'UploadWrite/전남로고.png\') no-repeat;background-position: center center;background-size: 100%;">' 
		    + '    <div class="movietitle text"><%=wm_dao.Move("여수").getW_temp()%>℃</div>'
			+ '    </div>' + '    <ul>' + '        <li class="up">'
			+ '            <span class="number"></span>'
			+ '            <span class="title"><%=wm_dao.Move("여수").getW_status()%></span>'
			+ '            <span class="arrow up"></span>'
			+ '           ' + '        </li>'
			+ '        <li>' + ' <span class="number"></span>'
			+ '            <span class="title"><%=wm_dao.Move("여수").getW_body_temp()%>℃</span>'
			+ '            <span class="arrow up"></span>'
			+ '           ' + '        </li>'
			+ '    </ul>' + '</div>';

	var position9 = new kakao.maps.LatLng(34.8030064, 127.3505135);
		var customOverlay9 = new kakao.maps.CustomOverlay({
			position : position9,
			content : content9,
			xAnchor : 0.3,
			yAnchor : 0.80
		    
		});
		customOverlay9.setMap(map);
		//* 전남 *//	
	
		
	
	//* 광주  *//
		var content10 = '<div class="overlaybox">'
				+ '    <div class="boxtitle">광주 날씨 </div>'
				+ '    <div class="first" style="background: url(\'UploadWrite/무등산.jpg\') no-repeat;background-position: center center;background-size: 100%;">' 
			    + '    <div class="movietitle text"><%=wm_dao.Move("광주").getW_temp()%>℃</div>'
				+ '    </div>' + '    <ul>' + '        <li class="up">'
				+ '            <span class="number"></span>'
				+ '            <span class="title"><%=wm_dao.Move("광주").getW_status()%></span>'
				+ '            <span class="arrow up"></span>'
				+ '           ' + '        </li>'
				+ '        <li>' + ' <span class="number"></span>'
				+ '            <span class="title"><%=wm_dao.Move("광주").getW_body_temp()%>℃</span>'
				+ '            <span class="arrow up"></span>'
				+ '           ' + '        </li>'
				+ '    </ul>' + '</div>';
		var position10 = new kakao.maps.LatLng(35.1595454, 126.8526012);
		var customOverlay10 = new kakao.maps.CustomOverlay({
			position : position10,
			content : content10,
			xAnchor : 0.3,
			yAnchor : 0.80
		});
		customOverlay10.setMap(map);
		//* 광주  *//
		
		
		//* 경북  *//
		var content11 = '<div class="overlaybox">'
				+ '    <div class="boxtitle">경북 날씨 </div>'
				+ '    <div class="first" style="background: url(\'UploadWrite/경북로고.png\') no-repeat;background-position: center center;background-size: 100%;">' 
			    + '    <div class="movietitle text"><%=wm_dao.Move("영주").getW_temp()%>℃</div>'
				+ '    </div>' + '    <ul>' + '        <li class="up">'
				+ '            <span class="number"></span>'
				+ '            <span class="title"><%=wm_dao.Move("영주").getW_status()%></span>'
				+ '            <span class="arrow up"></span>'
				+ '           ' + '        </li>'
				+ '        <li>' + ' <span class="number"></span>'
				+ '            <span class="title"><%=wm_dao.Move("영주").getW_body_temp()%>℃</span>'
				+ '            <span class="arrow up"></span>'
				+ '           ' + '        </li>'
				+ '    </ul>' + '</div>';
		var position11 = new kakao.maps.LatLng(36.9835881, 128.8818743);
		var customOverlay11 = new kakao.maps.CustomOverlay({
			position : position11,
			content : content11,
			xAnchor : 0.3,
			yAnchor : 0.80
		});
		customOverlay11.setMap(map);
		//* 경북  *//
		
	//* 울산  *//
		var content12 = '<div class="overlaybox">'
				+ '    <div class="boxtitle">울산 날씨 </div>'
				+ '    <div class="first" style="background: url(\'UploadWrite/울산로고.png\') no-repeat;background-position: center center;background-size: 100%;">' 
			    + '    <div class="movietitle text"><%=wm_dao.Move("울산").getW_temp()%>℃</div>'
				+ '    </div>' + '    <ul>' + '        <li class="up">'
				+ '            <span class="number"></span>'
				+ '            <span class="title"><%=wm_dao.Move("울산").getW_status()%></span>'
				+ '            <span class="arrow up"></span>'
				+ '           ' + '        </li>'
				+ '        <li>' + ' <span class="number"></span>'
				+ '            <span class="title"><%=wm_dao.Move("울산").getW_body_temp()%>℃</span>'
				+ '            <span class="arrow up"></span>'
				+ '           ' + '        </li>'
				+ '    </ul>' + '</div>';
		var position12 = new kakao.maps.LatLng(35.6185699, 129.3624188);
		var customOverlay12 = new kakao.maps.CustomOverlay({
			position : position12,
			content : content12,
			xAnchor : 0.3,
			yAnchor : 0.80
		});
		customOverlay12.setMap(map);
		//* 울산  *//
		
		//* 부산  *//
		var content13 = '<div class="overlaybox">'
				+ '    <div class="boxtitle">부산 날씨 </div>'
				+ '    <div class="first" style="background: url(\'UploadWrite/부산로고.png\') no-repeat;background-position: center center;background-size: 100%;">' 
			    + '    <div class="movietitle text"><%=wm_dao.Move("부산").getW_temp()%>℃</div>'
				+ '    </div>' + '    <ul>' + '        <li class="up">'
				+ '            <span class="number"></span>'
				+ '            <span class="title"><%=wm_dao.Move("부산").getW_status()%></span>'
				+ '            <span class="arrow up"></span>'
				+ '           ' + '        </li>'
				+ '        <li>' + ' <span class="number"></span>'
				+ '            <span class="title"><%=wm_dao.Move("부산").getW_body_temp()%>℃</span>'
				+ '            <span class="arrow up"></span>'
				+ '           ' + '        </li>'
				+ '    </ul>' + '</div>';
		var position13 = new kakao.maps.LatLng(35.1262092, 128.8168360);
		var customOverlay13 = new kakao.maps.CustomOverlay({
			position : position13,
			content : content13,
			xAnchor : 0.3,
			yAnchor : 0.80
		});
		customOverlay13.setMap(map);
		//* 부산  *//
		
		//* 경남  *//
		var content14 = '<div class="overlaybox">'
				+ '    <div class="boxtitle">경남 날씨 </div>'
				+ '    <div class="first" style="background: url(\'UploadWrite/경남로고.png\') no-repeat;background-position: center center;background-size: 100%;">' 
			    + '    <div class="movietitle text"><%=wm_dao.Move("대구").getW_temp()%>℃</div>'
				+ '    </div>' + '    <ul>' + '        <li class="up">'
				+ '            <span class="number"></span>'
				+ '            <span class="title"><%=wm_dao.Move("대구").getW_status()%></span>'
				+ '            <span class="arrow up"></span>'
				+ '           ' + '        </li>'
				+ '        <li>' + ' <span class="number"></span>'
				+ '            <span class="title"><%=wm_dao.Move("대구").getW_body_temp()%>℃</span>'
				+ '           ' + '        </li>'
				+ '    </ul>' + '</div>';
		var position14 = new kakao.maps.LatLng(35.9409719, 128.5193229);
		var customOverlay14 = new kakao.maps.CustomOverlay({
			position : position14,
			content : content14,
			xAnchor : 0.3,
			yAnchor : 0.80
		});
		customOverlay14.setMap(map);
		//* 경남  *//
		
		//* 제주  *//
		var content15 = '<div class="overlaybox">'
				+ '    <div class="boxtitle">제주 날씨 </div>'
				+ '    <div class="first" style="background: url(\'UploadWrite/제주로고.png\') no-repeat;background-position: center center;background-size: 100%;">' 
			    + '    <div class="movietitle text"><%=wm_dao.Move("제주").getW_temp()%>℃</div>'
				+ '    </div>' + '    <ul>' + '        <li class="up">'
				+ '            <span class="number"></span>'
				+ '            <span class="title"><%=wm_dao.Move("제주").getW_status()%></span>'
				+ '            <span class="arrow up"></span>'
				+ '           ' + '        </li>'
				+ '        <li>' + ' <span class="number"></span>'
				+ '            <span class="title"><%=wm_dao.Move("제주").getW_body_temp()%>℃</span>'
				+ '        </li>' + '    </ul>' + '</div>';
		var position15 = new kakao.maps.LatLng(33.3871676, 126.5429675);
		var customOverlay15 = new kakao.maps.CustomOverlay({
			position : position15,
			content : content15,
			xAnchor : 0.3,
			yAnchor : 0.80
		});
		customOverlay15.setMap(map);
		//* 제주  *//

		//* 서울  *//
		function panTo1() {
			// 이동할 위도 경도 위치를 생성합니다 
			var moveLatLon = new kakao.maps.LatLng(37.3306890, 126.5930664);

			// 지도 중심을 부드럽게 이동시킵니다
			// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			map.panTo(moveLatLon);
		}

		// 경기
		function panTo2() {
			// 이동할 위도 경도 위치를 생성합니다 
			var moveLatLon = new kakao.maps.LatLng(37.4980273, 127.5117792);

			// 지도 중심을 부드럽게 이동시킵니다
			// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			map.panTo(moveLatLon);
		}

		// 인천
		function panTo3() {
			// 이동할 위도 경도 위치를 생성합니다 
			var moveLatLon = new kakao.maps.LatLng(37.4585339, 126.7055905);

			// 지도 중심을 부드럽게 이동시킵니다
			// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			map.panTo(moveLatLon);
		}

		// 충주
		function panTo4() {
			// 이동할 위도 경도 위치를 생성합니다 
			var moveLatLon = new kakao.maps.LatLng(36.9883750, 127.8987446);

			// 지도 중심을 부드럽게 이동시킵니다
			// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			map.panTo(moveLatLon);
		}

		// 세종
		function panTo5() {
			// 이동할 위도 경도 위치를 생성합니다 
			var moveLatLon = new kakao.maps.LatLng(36.6003765, 126.6827069);

			// 지도 중심을 부드럽게 이동시킵니다
			// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			map.panTo(moveLatLon);
		}

		// 대전
		function panTo6() {
			// 이동할 위도 경도 위치를 생성합니다 
			var moveLatLon = new kakao.maps.LatLng(36.2936611, 127.3963480);

			// 지도 중심을 부드럽게 이동시킵니다
			// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			map.panTo(moveLatLon);
		}

		// 강원
		function panTo7() {
			// 이동할 위도 경도 위치를 생성합니다 
			var moveLatLon = new kakao.maps.LatLng(37.7126012, 128.7122185);

			// 지도 중심을 부드럽게 이동시킵니다
			// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			map.panTo(moveLatLon);
		}

		function panTo8() {
			// 이동할 위도 경도 위치를 생성합니다 
			var moveLatLon = new kakao.maps.LatLng(35.8624242, 127.0758648);

			// 지도 중심을 부드럽게 이동시킵니다
			// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			map.panTo(moveLatLon);
		}

		function panTo9() {
			// 이동할 위도 경도 위치를 생성합니다 
			var moveLatLon = new kakao.maps.LatLng(34.8030064, 127.3505135);

			// 지도 중심을 부드럽게 이동시킵니다
			// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			map.panTo(moveLatLon);
		}

		//* 광주  *//
		function panTo10() {
			// 이동할 위도 경도 위치를 생성합니다 
			var moveLatLon = new kakao.maps.LatLng(35.1595454, 126.8526012);

			// 지도 중심을 부드럽게 이동시킵니다
			// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			map.panTo(moveLatLon);

		}

		function panTo11() {
			// 이동할 위도 경도 위치를 생성합니다 
			var moveLatLon = new kakao.maps.LatLng(36.9835881, 128.8818743);

			// 지도 중심을 부드럽게 이동시킵니다
			// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			map.panTo(moveLatLon);
		}

		function panTo12() {
			// 이동할 위도 경도 위치를 생성합니다 
			var moveLatLon = new kakao.maps.LatLng(35.6185699, 129.3624188);

			// 지도 중심을 부드럽게 이동시킵니다
			// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			map.panTo(moveLatLon);
		}
		function panTo13() {
			// 이동할 위도 경도 위치를 생성합니다 
			var moveLatLon = new kakao.maps.LatLng(35.1262092, 128.8168360);

			// 지도 중심을 부드럽게 이동시킵니다
			// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			map.panTo(moveLatLon);
		}

		function panTo14() {
			// 이동할 위도 경도 위치를 생성합니다 
			var moveLatLon = new kakao.maps.LatLng(35.9409719, 128.5193229);

			// 지도 중심을 부드럽게 이동시킵니다
			// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			map.panTo(moveLatLon);
		}

		function panTo15() {
			// 이동할 위도 경도 위치를 생성합니다 
			var moveLatLon = new kakao.maps.LatLng(33.3871676, 126.5429675);

			// 지도 중심을 부드럽게 이동시킵니다
			// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			map.panTo(moveLatLon);
		}
	</script>
</body>
</html>