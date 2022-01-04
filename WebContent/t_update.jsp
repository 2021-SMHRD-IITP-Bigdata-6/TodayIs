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
<title>☁︎ COMMUNITY</title>
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
	border: 2px solid #dee2e6;
	padding: 10px;
	font-size: small;
}
</style>
</head>
<body>
	<%
		boardDTO board_dto = (boardDTO) session.getAttribute("board_dto");
		memberDTO dto = (memberDTO) session.getAttribute("dto");	
		
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
											<%if(dto != null){ %>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="#"> <%=dto.getMb_nickname()%> 's
											</a></li>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="#" id=Mb_region> <%=dto.getMb_region()%>
											</a></li>
											<%} %>
											<%if(dto == null){ %>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="login.html">login</a></li>
											<%}else{ %>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="LogoutService">logout</a></li>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="update.jsp?mb_id=<%=dto.getMb_id() %>">update</a></li>
											<%} %>
											<li class="nav-item active"><a
												class="nav-link tm-nav-link" href="t_community.jsp">weather
													<span class="sr-only">(current)</span>
											</a></li>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="t_mission.jsp">mission</a>
											</li>
											<%
												if (dto != null) {
											%>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="t_mymain.jsp">my</a></li>
											<%} %>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="Kakao.jsp">map</a></li>
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

		<!-- community_click-->
		<div class="content-wrapper">
			<div class="inner-container container">
				<div class="row">
					<div class="section-header col-md-10">
						<h2>☁︎ COMMUNITY UPDATE</h2>

					</div>
					<!-- /.section-header -->
				</div>
				<!-- /.row -->
				<div class="row" style="display: block;">
					<form name="form" method="post"
						action="WriteUpdateService?article_seq=<%=board_dto.getM_article_seq() %>&select_img=<%=board_dto.getM_article_img() %>"
						enctype="multipart/form-data">
						<table class="table table-striped" style="text-align: center;">
							<thead>
								<tr>
									<th colspan="7"
										style="background-color: #eeeeee; text-align: center; font-size: 20px">
										오늘의 멋진 하루를 공유해주세요 ^^</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="3"><input type="text" class="form-control"
										id="inputSubject" placeholder="글 제목" name="m_article_subject"
										maxlength="50"></td>
									<td><input type="hidden" class="form-control"
										placeholder="글쓴이" name="mb_id" maxlength="20" id="inputmb_id" />
										<input type="text" class="form-control" placeholder="글쓴이"
										maxlength="20" id="inputnick" readonly /></td>
									<td><select name="article-sort" id="inputArticle-Sort"
										class="">

											<%if(board_dto.getM_board_type().equals("메인 게시판")) {%>
											<option>메인 게시판</option>
											<option>미션 게시판</option>
											<input type="hidden" class="form-control" id="inputArticle"
											value="메인 게시판" name="inputArticle-Sort" maxlength="20"
											readonly>
											<%} else { %>
											<option>미션 게시판</option>
											<option>메인 게시판</option>
											<input type="hidden" class="form-control" id="inputArticle"
											value="미션 게시판" name="inputArticle-Sort" maxlength="20"
											readonly>
											<% } %>
									</select></td>
									<td><select id="big" name="h_area1" class=""
										onChange="cat1_change(this.value,h_area2)" class="h_area1">
											<option><%=board_dto.getM_article_region().substring(0,2) %></option>
											<option value='1'>서울</option>
											<option value='2'>부산</option>
											<option value='3'>대구</option>
											<option value='4'>인천</option>
											<option value='5'>광주</option>
											<option value='6'>대전</option>
											<option value='7'>울산</option>
											<option value='8'>강원</option>
											<option value='9'>경기</option>
											<option value='10'>경남</option>
											<option value='11'>경북</option>
											<option value='12'>전남</option>
											<option value='13'>전북</option>
											<option value='14'>제주</option>
											<option value='15'>충남</option>
											<option value='16'>충북</option>
									</select></td>
									<td><select id="small" name="h_area2" class="h_area2">
											<option><%=board_dto.getM_article_region().substring(2) %></option>
									</select><input type="hidden" class="form-control" id="region"
										placeholder="지역을 선택해주세요" name="m_article_region"
										maxlength="20" readonly></td>
								</tr>
								<tr>
									<td colspan="7"><textarea class="form-control"
											placeholder="글 내용" id="inputcontent" name="m_article_content"
											maxlength="2048" style="height: 350px;"><%=board_dto.getM_article_content() %></textarea></td>
								</tr>

								<tr>
									<td><input type="file" class="m_article_img"
										name="m_article_img" id="m_article_img"
										onchange="readURL(this)"></td>
									<td colspan="5"><img style="width: 100%; height: 100%;"
										id="m_article_preview"></img></td>
									<td><input type="submit" value="등록하기"></td>
								</tr>
							</tbody>
						</table>
						<table>
						</table>
						<input type="hidden" class="form-control"
							name="m_article_img_name" id="m_article_img_name" readonly>
					</form>
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

	 var cat1_num = new Array(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16);
	    var cat1_name = new Array('서울','경기','인천','충북','충남','세종','대전','강원','전북','전남','광주','경북','울산','부산','경남','제주');
	   
	    var cat2_num = new Array();
	    var cat2_name = new Array();
	   
	    cat2_num[1] = new Array(1);
	    cat2_name[1] = new Array('서울');
	   
	    cat2_num[2] = new Array(2,3,4,5,6);
	    cat2_name[2] = new Array('파주','이천','양평','수원','동두천');
	   
	    cat2_num[3] = new Array(7,8);
	    cat2_name[3] = new Array('백령동','강화');
	   
	    cat2_num[4] = new Array(9,10,11,12,13);
	    cat2_name[4] = new Array('충주','추풍령','청주','제천','보은');
	   
	    cat2_num[5] = new Array(14,15,16,17,18,19);
	    cat2_name[5] = new Array('홍성','천안','서산','부여','보령','금산');
	   
	    cat2_num[6] = new Array(20);
	    cat2_name[6] = new Array('세종');
	   
	    cat2_num[7] = new Array(21);
	    cat2_name[7] = new Array('대전');
	   
	    cat2_num[8] = new Array(22,23,24,25,26,27,28,29,30,31,32,33,34);
	    cat2_name[8] = new Array('홍천','정선','영월','대관령','태백','춘천시','철원','인제','원주','동해','속초','북춘천','북강릉');
	   
	    cat2_num[9] = new Array(35,36,37,38,39,40,41,42,43);
	    cat2_name[9] = new Array('정읍','전주','장수','임실','순창','부안','남원','군산','고창');
	   
	    cat2_num[10] = new Array(44,45,46,47,48,49,50,51,52,53,54,55,56);
	    cat2_name[10] = new Array('고흥','해남','진도','장흥','완도','영광군','여수','순천','보성군','목포','광양','강진','흑산도');
	   
	    cat2_num[11] = new Array(57);
	    cat2_name[11] = new Array('광주');
	   
	    cat2_num[12] = new Array(58,59,60,61,62,63,64,65,66,67,68,69,70,71);
	    cat2_name[12] = new Array('포항','청송','의성','울진','영천','영주','영덕','안동','상주','봉화','문경','구미','경주','울릉도');
	   
	    cat2_num[13] = new Array(72);
	    cat2_name[13] = new Array('울산');
	   
	    cat2_num[14] = new Array(73);
	    cat2_name[14] = new Array('부산');
	   
	    cat2_num[15] = new Array(74,75,76,77,78,79,80,81,82,83,84,85,86,87,88);
	    cat2_name[15] = new Array('합천','함양군','통영','창원','진주','의령군','양산시','성산','산청','북창원','밀양','남해','김해시','거제','거창');
	   
	    cat2_num[16] = new Array(89,90);
	    cat2_name[16] = new Array('제주','서귀포');

	
	function cat1_change(key,sel){
	 if(key == '') return;
	 var name = cat2_name[key];
	 var val = cat2_num[key];
	
	 for(i=sel.length-1; i>=0; i--)
	  sel.options[i] = null;
	 sel.options[0] = new Option('-선택-','', '', 'true');
	 for(i=0; i<name.length; i++){
	  sel.options[i+1] = new Option(name[i],val[i]);
	 }
	}
	
	var selected_big
	var selected_small
	
	//상세지역 클릭 시 선택된 option태그의 내용을 text형태로 가지고 오기 
	$('#small').on('click', function(){
		selected_small = $('#small option:selected').text();
		console.log(selected_small);
		var result = selected_small;
		document.getElementById("region").value=result;
	});
	
	// 게시판 구분해서 가져오는 기능
	$('#inputArticle-Sort').on('click', function(){
		selected_article = $('#inputArticle-Sort option:selected').text();
		console.log(selected_article);
		document.getElementById("inputArticle").value = selected_article;
	});
	
	// 사진 게시물 미리보기 기능
	function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('m_article_preview').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
		console.log(input.files[0].name);
		document.getElementById("m_article_img_name").value = input.files[0].name;

	  } else {
	    document.getElementById('m_article_preview').src = "";
	  }
	};
	
	
	//업데이트용 주제 내용을 각각 로드
	m_article_mb_id = "${dto.getMb_id()}";
	document.getElementById("inputmb_id").value = m_article_mb_id;
	
	dto_nickname = "${dto.getMb_nickname()}";
	document.getElementById("inputnick").value = dto_nickname;
	
	m_article_subject = "${board_dto.getM_article_subject()}";
	document.getElementById("inputSubject").value = m_article_subject;
	
	m_article_region = "${board_dto.getM_article_region()}";
	document.getElementById("region").value = m_article_region;

	m_article_board_type = "${board_dto.getM_board_type()}";
	document.getElementById("inputArticle").value = m_article_board_type;

	
	$(document).ready(function() {
		m_article_inputimg = "${board_dto.getM_article_img()}";
		$("#m_article_preview").attr("src",m_article_inputimg);
		
		m_article_img = "${board_dto.getM_article_img()}";
		document.getElementById("m_article_img").value = m_article_img;
		
	});
	
	
	</script>
</body>
</html>
