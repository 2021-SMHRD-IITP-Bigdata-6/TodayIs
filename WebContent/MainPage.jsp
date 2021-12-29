<%@page import="com.today.DTO.mainPageDTO"%>
<%@page import="com.today.DTO.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="description"
	content="A free html template with Sketch design made with Bootstrap">
<meta name="keywords"
	content="free html template, bootstrap, ui kit, sass" />
<meta name="author" content="Codrops" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- favicon generated by http://realfavicongenerator.net/ -->
<link rel="apple-touch-icon" sizes="57x57"
	href="img/favicon/apple-touch-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60"
	href="img/favicon/apple-touch-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="img/favicon/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76"
	href="img/favicon/apple-touch-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="img/favicon/apple-touch-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120"
	href="img/favicon/apple-touch-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144"
	href="img/favicon/apple-touch-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="img/favicon/apple-touch-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180"
	href="img/favicon/apple-touch-icon-180x180.png">
<link rel="icon" type="image/png" href="img/favicon/favicon-32x32.png"
	sizes="32x32">
<link rel="icon" type="image/png" href="img/favicon/favicon-194x194.png"
	sizes="194x194">
<link rel="icon" type="image/png" href="img/favicon/favicon-96x96.png"
	sizes="96x96">
<link rel="icon" type="image/png"
	href="img/favicon/android-chrome-192x192.png" sizes="192x192">
<link rel="icon" type="image/png" href="img/favicon/favicon-16x16.png"
	sizes="16x16">
<link rel="manifest" href="img/favicon/manifest.json">
<link rel="mask-icon" href="img/favicon/safari-pinned-tab.svg"
	color="#5bbad5">
<link rel="shortcut icon" href="img/favicon/favicon.ico">
<meta name="msapplication-TileColor" content="#66e0e5">
<meta name="msapplication-TileImage"
	content="img/favicon/mstile-144x144.png">
<meta name="msapplication-config"
	content="img/favicon/browserconfig.xml">
<meta name="theme-color" content="#ffffff">

<!-- end favicon links -->
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/normalize.min.css">
<link rel="stylesheet" href="css/animate.min.css">
<link rel="stylesheet" href="css/flickity.min.css">
<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery.mb.YTPlayer/3.3.9/css/jquery.mb.YTPlayer.min.css">
<script src="//code.jquery.com/jquery-latest.min.js"></script>
<script>
	var player = [ "Snow.mp4", "RainMore.mp4", "RainLess.mp4", "Lightning.mp4", "CloudMore.mp4", "CloudLess.mp4", "Sun.mp4", "Grey.mp4"];
		
	function playit() {
		var t = ["Snow.mp4", "RainMore.mp4", "RainLess.mp4", "Lightning.mp4", "CloudMore.mp4", "CloudLess.mp4", "Sun.mp4", "Grey.mp4"];
		var myNodelist = document.getElementsByTagName('source');
		var i;
		for (i = 0; i < myNodelist.length; i++) {
			myNodelist[i].src = t[i];
		
		}
		console.log(t);
	}
</script>
</head>

<body>
 <%
      memberDTO dto = (memberDTO) session.getAttribute("dto");
      mainPageDTO move_dto = (mainPageDTO)session.getAttribute("move_dto");
      
   %>

	<div class="container-fluid">
		<div class="row">
			<div class="header-nav-wrapper">
				<div class="logo">
					<a href="/index.html"><font size="20px" font-weight="bold"> TODAY? </font></a>
				</div>
				<div class="primary-nav-wrapper">
					<nav>
						<ul class="primary-nav">
						<%if(dto != null) { %>
							<li><%=dto.getMb_id() %> </li>
							<li><%=dto.getMb_nickname() %> </li>
							<li><%=dto.getMb_region() %> </li>
							<%} %>
	
						
							<%if(dto == null) { %>
							<li><a href="login.html"> 로그인 </a></li>
							<%} else{ %>
							<li><a href="LogoutService"> 로그아웃 </a></li>
							<li><a href="update.jsp"> 정보수정 </a></li>
							<%} %>
							
							
							<li><a href="t_community.jsp"> 공유 게시판 </a></li>
							<li><a href="#articles"> 미션 게시판 </a></li>
							<li><a href="#freebies"> 지도로 보기 </a></li>
						</ul>
					</nav>
					
					<div class="secondary-nav-wrapper">
						<ul class="secondary-nav">
							<%if(dto == null) { %>
							<li class="subscribe"><a href="">글작성시 로그인이 필요합니다.</a></li>
							<%} else{ %>
							<li class="subscribe"><a href="t_write.jsp">글작성하기</a></li>
							<%} %>
							<li class="search"><a href="#search" class="show-search"><li class="fa fa-search"></i></a></li>
						</ul>
					</div>
					<div class="search-wrapper">
						<ul class="search">
							<li><input type="text" id="search-input"
								placeholder="Start typing then hit enter to search"></li>
							<li><a href="#" class="hide-search"><i
									class="fa fa-close"></i></a></li>
						</ul>
					</div>
				</div>
				<div class="navicon">
					<a class="nav-toggle" href="#"><span></span></a>
				</div>
			</div>
		</div>
	</div>
	<header class="hero">
		<div class="carousel js-flickity">
			<video id="video" width="100%" autoplay="1" loop="1" controls="0" muted="1" style="margin-top: 0px; margin-left: 0px">
				<source src="mp4/Snow.mp4" type="video/mp4" id="video1">	
				<!--  <source src="mp4/Rain.mp4" type="video/mp4" id="video2">			
				<source src="mp4/Lightning.mp4" type="video/mp4" id="video3">
				<source src="mp4/weat-field.mp4" type="video/mp4" id="video4">-->
			</video>
			
			<button onclick="Weather()"> hi </button>
			<script>
			// 날씨 정보 이후.. 사용하기
		/*	var snow = player[0];
			var rain = player[1];
			var light = player[2];
			var wind = player[3];*/
			
		/*	if("snow".equals("눈")){
				<source src="mp4/Snow.mp4" type="video/mp4" id="video1">
			}else if("rain".equals("흐리고")){
				<source src="mp4/Rain.mp4" type="video/mp4" id="video2">
			}else if("rain".equals("흐리고")){
				<source src="mp4/Lightning.mp4" type="video/mp4" id="video3">	
			}else{
				<source src="mp4/weat-field.mp4" type="video/mp4" id="video4">
			}*/
			</script>
		</div>
		<input type="text" name="move_region">
		<button type="submit" value="submit"> 버튼 </button>
		<div class='mouse-container'>
			<a href="#intro">
				<div class='mouse'>
					<span class='scroll-down'></span>
				</div>
			</a>
		</div>
		
		
		<script>
		// 동적 화면 sql 실행
		$("document").click(function() { // 로그인 후로 조건 변경 필요
			var region = "${member_dto.getregion()}"; // 로그인된 사람 지역
			$.ajax({
				type : "post", //데이터를 보낼 방식
				url : "MoveService", //데이터를 보낼 url
				data : region, //보낼 데이터

				success : function() { //데이터를 보내는것이 성공했을시 출력되는 메시지
					alert("로그인되었습니다.");
				}
			});
		});
		
		$(document).ready(function(){
			
			if(weather_stat.equals("맑음") || weather_stat.equals("")){
				$("#video1").attr("src", "mp4/Sun.mp4");	
				System.out.prinln("오늘날씨 맑음, 직역, 기온");
			}else if(weather_stat.equals("구름많음")){
				$("#video2").attr("src", "mp4/CloudMore.mp4");
			}else if(weather_stat.equals("구름적음")){
				$("#video3").attr("src", "mp4/CloudLess.mp4");
			}else if(weather_stat.equals("비많음")){
				$("#video4").attr("src", "mp4/RainMore.mp4");
			}else if(weather_stat.equals("비적음")){
				$("#video5").attr("src", "mp4/RainLess.mp4");
			}else if(weather_stat.equals("번개")){
				$("#video4").attr("src", "mp4/Lightning.mp4");
			}else if(weather_stat.equals("눈")){
				$("#video5").attr("src", "mp4/Snow.mp4");
			}else if(weather_stat.equals("흐림")){
				$("#video5").attr("src", "mp4/Grey.mp4");
			}
			
			//console.log(1);
			//$("#video1").attr("src", "mp4/Lightning.mp4");
			//document.getElementById('video').load();
			
		});
	
		</script>
		
	</header>
</body>
</html>