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
<title>☁︎ LOGIN & JOIN</title>
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
	.layer1{
		position:absolute;
		top:50%;
		left:50%;
		width:100px;
		height:100px;
		margin:-90px 0 0 -50px;	
	}
	.layer2{
		position:absolute;
		top:50%;
		left:50%;
		width:100px;
		height:100px;
		margin:-90px 0 0 -50px;	
	}
	
	.input-field {
		margin: 5px 0 0 -140px;
		width: 380px;
		border-radius: 10px;
	}
	
	.input-fields {
		margin: 5px 0 5px -140px;
		width: 380px;
		border-radius: 10px;
	}
	
	.submit {
		margin: 5px 0 3px -10px;
		width: 100px;
		height: 45px;
		background-color: #efefef;
		border-color: #efefef;
		color: #777777;
		position: relative;
		font-size: 20px;
		padding: 0;
		cursor: pointer;
		transition: 800ms ease all;
		outline: none;
	}
	
	.submit:hover {
		background: #efefef;
		color: #054E32;
	}
	
	.submit:before, .submit:after {
		content: '';
		position: absolute;
		top: 0;
		right: 0;
		height: 2px;
		width: 0;
		background: #58B28F;
		transition: 400ms ease all;
	}
	
	.submit:after {
		right: inherit;
		top: inherit;
		left: 0;
		bottom: 0;
	}
	
	.submit:hover:before, .submit:hover:after {
		width: 100%;
		transition: 800ms ease all;
	}
	.h_area1{
		margin: 0 0 5px -140px;
		border-radius:10px;
		width: 380px;
	}
	.h_area2{
		margin: 0 0 0 -140px;
		border-radius:10px;
		width: 380px;
	}
</style>
</head>
<body>

<%
   memberDTO dto = (memberDTO) session.getAttribute("dto");
   String mb_id = request.getParameter("mb_id");
   System.out.print(mb_id);
   
   // 로그인 한 장소에 대한 체크문
   String numbers = request.getParameter("numbers");
   
   
   boardDTO board_dto = (boardDTO) session.getAttribute("board_dto");
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
												href="login.jsp">login</a></li>
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
												href="about.html">today</a>
											</li>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="contact.html">my</a></li>
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
			<!-- 배너 사진 -->
			<div class="tm-welcome-container tm-fixed-header tm-fixed-header-2"
				style="height: 160px;">
				<!--
         <div class="text-center">
            <p class="pt-5 px-3 tm-welcome-text tm-welcome-text-2 mb-1 mt-lg-0 mt-5 text-white mx-auto">Another Image BG<br>it can be fixed.<br>Content will simply slide over.</p>                   
         </div>                
         -->
			</div>

			<!-- Header image -->
			<div id="tm-fixed-header-bg"></div>
		</div>
	</div>

	<!-- LOGIN & JOIN PAGE -->
	<div class="section-header col-md-12" style="margin: -280px 0 0 0">
		<h2>☁︎ TODAY?</h2>
		<span>오늘도 사용해 주셔서 감사합니다.</span> <a href="login.jsp"
			style="float: right;"><h2>LOGIN & JOIN ☁︎</h2></a>
	</div>
	
		 <form id="login" action="LoginService" method="post" class="input-group">
		<div class="layer1">
		<h2>LOGIN</h2>
		<input type="text" name="mb_id" class="input-field"
			placeholder="User id" required> 
			<input type="password" name="mb_pw" class="input-field" placeholder="Enter Password"
			required>
		<a href="LoginService"><button class="submit" style="margin: 5px 0 2px -10px;">login</button></a>

		<br><br>
		</form>
		
		<form id="register" action="JoinService" style ="top: 100px; "method="post" class="input-group">
		<div class="layer2">
		<h2>JOIN</h2>
		<input type="text" name="mb_id" class="input-field" placeholder="User id" required> 
		<input type="password" name="mb_pw" class="input-field" placeholder="Enter Password" required> 
		<input type="text" name="mb_nickname" class="input-field" placeholder="Your nick name" required> 
		<input type="text" name="mb_phone" class="input-field" placeholder="Your phone number" required>
			
			<select id="big"
			name="h_area1" class="" onChange="cat1_change(this.value,document.getElementById('small'))"
			class="h_area1" style="margin: 5px 0 5px -140px; border-radius:10px; width: 380px;">
			<option>-지역-</option>
			<option value='1'>서울</option>
			<option value='2'>경기</option>
			<option value='3'>인천</option>
			<option value='4'>충북</option>
			<option value='5'>충남</option>
			<option value='6'>세종</option>
			<option value='7'>대전</option>
			<option value='8'>강원</option>
			<option value='9'>전북</option>
			<option value='10'>전남</option>
			<option value='11'>광주</option>
			<option value='12'>경북</option>
			<option value='13'>울산</option>
			<option value='14'>부산</option>
			<option value='15'>경남</option>
			<option value='16'>제주</option>
		</select> 
		
		<select id="small" name="h_area2" class="h_area2">
			<option>-시/구-</option>
		</select>
			<input type="hidden" class="form-control" id="region"
			placeholder="지역을 선택해주세요" name="m_article_region" maxlength="20"
			readonly>
		<button class="submit"><a herf="JoinService"> join </a></button>
	</div>
	</form>
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
	console.log("test"+sel);
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
	
	m_article_mb_id = "${dto.getMb_id()}";
	document.getElementById("inputmb_id").value = m_article_mb_id;
	
	dto_nickname = "${dto.getMb_nickname()}";
	document.getElementById("inputnick").value = dto_nickname;
	</script>
	</div>
</body>
</html>