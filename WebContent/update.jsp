
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
<title>☁︎ LOGOUT & UPDATE</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width" />

<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Roboto+Slab:400,700,300,100" />
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Roboto:400,400italic,300italic,300,500,500italic,700,900" />

<link rel="stylesheet" href="t_css/bootstrap.css?after" />
<link rel="stylesheet" href="t_css/font-awesome.css?after" />
<link rel="stylesheet" href="t_css/animate.css?after" />
<link rel="stylesheet" href="t_css/templatemo-misc.css?after" />
<link rel="stylesheet" href="t_css/templatemo-style.css?after" />
<link rel="stylesheet" href="css/bootstrap.min.css?after" />
<link rel="stylesheet" href="css/templatemo-video-catalog.css?after" />

<script src="js/vendor/modernizr-2.6.1-respond-1.1.0.min.js"></script>
<style>
	.layer{
		position:absolute;
		top:50%;
		left:50%;
		width:100px;
		height:100px;
		margin:-110px 0 0 -50px;	
	}
	.input-field{
		margin:5px 0 5px -80px;
		width: 380px;
		border-radius: 10px;
	}
	.input-fields{
		margin:5px 0 5px 40px;
		width: 10%;
		border-radius: 10px;
	}
	.submit{
		margin:5px 0 5px 12px;
		width: 100px;
		height: 50px;
		background-color:#efefef;
		border-color:#efefef;
	    color:#777777;
	    position:relative;
	    font-size:20px;
	    padding:0;
	    cursor:pointer;
	    transition:800ms ease all;
	    outline:none;
	}
	.submit:hover{
	  background:#efefef;
	  color:#054E32;
	}
	.submit:before,.submit:after{
	  content:'';
	  position:absolute;
	  top:0;
	  right:0;
	  height:2px;
	  width:0;
	  background:#98DFFF;
	  transition:400ms ease all;
	}
	.submit:after{
	  right:inherit;
	  top:inherit;
	  left:0;
	  bottom:0;
	}
	.submit:hover:before,.submit:hover:after{
	  width:100%;
	  transition:800ms ease all;
	}
	.h_area1{
		margin: 0 0 5px -70px;
		border-radius:10px;
		width: 400px;
	}
	.h_area2{
		margin: 0 0 0 -70px;
		border-radius:10px;
		width: 400px;
	}
</style>
</head>
<body style="height:100%; width:100%;">

<%
	memberDTO dto = (memberDTO) session.getAttribute("dto");
	String mb_id = request.getParameter("mb_id");
	System.out.print(mb_id);
	
	boardDTO board_dto = (boardDTO) session.getAttribute("board_dto");
	memberDTO dto2 = (memberDTO) session.getAttribute("dto");	
%>

<div class="tm-page-wrap mx-auto">
	<div class="position-relative">
		<div class="potition-absolute tm-site-header">
			<div class="container-fluid position-relative">
				<div class="row">                  
					<div class="col-5 col-md-8 ml-auto mr-0">
						<div class="tm-site-nav">
                             <nav class="navbar navbar-expand-lg mr-0 ml-auto" id="tm-main-nav">
                                  <button class="navbar-toggler tm-bg-black py-2 px-3 mr-0 ml-auto collapsed" type="button"
                                          data-toggle="collapse" data-target="#navbar-nav" aria-controls="navbar-nav"
                                          aria-expanded="false" aria-label="Toggle navigation">
                                        <span>
                                            <i class="fas fa-bars tm-menu-closed-icon"></i>
                                            <i class="fas fa-times tm-menu-opened-icon"></i>
                                        </span>
                                   </button>
                                   <div class="collapse navbar-collapse tm-nav"  id="navbar-nav" >
			                      <ul class="navbar-nav text-uppercase">
			                        <%if(dto != null){ %>
			                        <li class="nav-item">
			                          <a class="nav-link tm-nav-link" href="#">
			                          	<%=dto.getMb_nickname()%> 's <%=dto.getMb_region()%>
			                          </a>
			                        </li>
			                        <%} %>
			                        <%if(dto == null){ %>
			                        <li class="nav-item">
			                          <a class="nav-link tm-nav-link" href="login.jsp">login</a>
			                        </li>
			                        <%}else{ %>
			                        <li class="nav-item">
			                          <a class="nav-link tm-nav-link" href="LogoutService">logout</a>
			                        </li>
			                        <li class="nav-item">
			                          <a class="nav-link tm-nav-link" 
			                             href="update.jsp?mb_id=<%=dto.getMb_id() %>">update</a>
			                        </li>
			                        <%} %>
			                        <li class="nav-item active">
			                          <a class="nav-link tm-nav-link" href="t_community.jsp"
			                            >weather <span class="sr-only">(current)</span></a
			                          >
			                        </li>
			                        <li class="nav-item">
			                          <a class="nav-link tm-nav-link" href="about.html"
			                            >today</a
			                          >
			                        </li>
			                        <li class="nav-item">
			                          <a class="nav-link tm-nav-link" href="contact.html">my</a>
			                        </li>
			                        <li class="nav-item">
			                          <a class="nav-link tm-nav-link" href="region.html">map</a>
			                        </li>
			                      </ul>
                    			</div>
                  			</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 배너 사진 -->      
		<div class="tm-welcome-container tm-fixed-header tm-fixed-header-2" style="height:200px;">
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
 	
<!-- LOOUT & UPDATE PAGE -->
<div class="section-header col-md-12" style="margin:-210px 0 0 0">
	<h2>☁︎ TODAY?</h2>
	<span>오늘도 사용해 주셔서 감사합니다.</span>
	<a href="update.jsp" style="float: right;"><h2>LOOUT & UPDATE☁︎</h2></a>
</div>

<div  class="layer"> 
	<form id="logout" action="LogoutService" style ="top: -20px; "method="post" class="input-group">
	<!-- LOGOUT 기능 -->            
	<h2 id="title">LOGOUT</h2>
	<button class="submit" id="lay" ><a href="LogoutService"> logout </a></button>
	</form>

	<form id="update" action="UpdateService" style ="top: 30px; "method="post" class="input-group" >
	<!-- UPDATE 기능 -->               
	<h2 id="title">UPDATE</h2>
	<input style="width:380px;" type="password" name="mb_pw" class="input-field" placeholder="Enter Password" required>
	<input type="text" name="mb_nickname" class="input-field" placeholder="Your nick name" required>
	<input type="text" name="mb_phone" class="input-field" placeholder="Your phone number" required>
                        
                        <select id="big" name="h_area1" class="h_area1" onChange="cat1_change(this.value,document.getElementById('small'))">                          					
										    <option>- 지역 선택 -</option>											
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
                        </select>
                        <select id="small" name="h_area2" class="h_area2">
											<option>- 시/군 -</option>
						</select>
						<input type="hidden" class="form-control" id="region"
										placeholder="지역을 선택해주세요" name="m_article_region"
										maxlength="20" readonly>
                        <button class = "submit"><a href="UpdateService"> update </a></button>
                        <br>
                        </form>
    </div>
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
	 var cat1_name = new Array('서울','부산','대구','인천','광주','대전','울산','강원','경기','경남','경북','전남','전북','제주','충남','충북');
	
	 var cat2_num = new Array();
	 var cat2_name = new Array();
	
	 cat2_num[1] = new Array(17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41);
	 cat2_name[1] = new Array('강남구','강동구','강북구','강서구','관악구','광진구','구로구','금천구','노원구','도봉구','동대문구','동작구','마포구','서대문구','서초구','성동구','성북구','송파구','양천구','영등포구','용산구','은평구','종로구','중구','중랑구');
	
	 cat2_num[2] = new Array(42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57);
	 cat2_name[2] = new Array('강서구','금정구','남구','동구','동래구','부산진구','북구','사상구','사하구','서구','수영구','연제구','영도구','중구','해운대구','기장군');
	
	 cat2_num[3] = new Array(58,59,60,61,62,63,64,65);
	 cat2_name[3] = new Array('남구','달서구','동구','북구','서구','수성구','중구','달성군');
	
	 cat2_num[4] = new Array(66,67,68,69,70,71,72,73,74,75);
	 cat2_name[4] = new Array('계양구','남구','남동구','동구','부평구','서구','연수구','중구','강화군','옹진군');
	
	 cat2_num[5] = new Array(76,77,78,79,80);
	 cat2_name[5] = new Array('광산구','남구','동구','북구','서구');
	
	 cat2_num[6] = new Array(81,82,83,84,85);
	 cat2_name[6] = new Array('대덕구','동구','서구','유성구','중구');
	
	 cat2_num[7] = new Array(86,87,88,89,90);
	 cat2_name[7] = new Array('남구','동구','북구','중구','울주군');
	
	 cat2_num[8] = new Array(91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108);
	 cat2_name[8] = new Array('강릉시','동해시','삼척시','속초시','원주시','춘천시','태백시','고성군','양구군','양양군','영월군','인제군','정선군','철원군','평창군','홍천군','화천군','횡성군');
	
	 cat2_num[9] = new Array(109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148);
	 cat2_name[9] = new Array('고양시 덕양구','고양시 일산구','과천시','광명시','광주시','구리시','군포시','김포시','남양주시','동두천시','부천시 소사구','부천시 오정구','부천시 원미구','성남시 분당구','성남시 수정구','성남시 중원구','수원시 권선구','수원시 장안구','수원시 팔달구','시흥시','안산시 단원구','안산시 상록구','안성시','안양시 동안구','안양시 만안구','오산시','용인시','의왕시','의정부시','이천시','파주시','평택시','하남시','화성시','가평군','양주군','양평군','여주군','연천군','포천군');
	
	 cat2_num[10] = new Array(149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168);
	 cat2_name[10] = new Array('거제시','김해시','마산시','밀양시','사천시','양산시','진주시','진해시','창원시','통영시','거창군','고성군','남해군','산청군','의령군','창녕군','하동군','함안군','함양군','합천군');
	
	 cat2_num[11] = new Array(169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192);
	 cat2_name[11] = new Array('경산시','경주시','구미시','김천시','문경시','상주시','안동시','영주시','영천시','포항시 남구','포항시 북구','고령군','군위군','봉화군','성주군','영덕군','영양군','예천군','울릉군','울진군','의성군','청도군','청송군','칠곡군');
	
	 cat2_num[12] = new Array(193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214);
	 cat2_name[12] = new Array('광양시','나주시','목포시','순천시','여수시','강진군','고흥군','곡성군','구례군','담양군','무안군','보성군','신안군','영광군','영암군','완도군','장성군','장흥군','진도군','함평군','해남군','화순군');
	
	 cat2_num[13] = new Array(215,216,217,218,219,220,221,222,223,224,225,226,227,228,229);
	 cat2_name[13] = new Array('군산시','김제시','남원시','익산시','전주시 덕진구','전주시 완산구','정읍시','고창군','무주군','부안군','순창군','완주군','임실군','장수군','진안군');
	
	 cat2_num[14] = new Array(230,231,232,233);
	 cat2_name[14] = new Array('서귀포시','제주시','남제주군','북제주군');
	
	 cat2_num[15] = new Array(234,235,236,237,238,239,240,241,242,243,244,245,246,247,248);
	 cat2_name[15] = new Array('공주시','논산시','보령시','서산시','아산시','천안시','금산군','당진군','부여군','서천군','연기군','예산군','청양군','태안군','홍성군');
	
	 cat2_num[16] = new Array(249,250,251,252,253,254,255,256,257,258,259,260);
	 cat2_name[16] = new Array('제천시','청주시 상당구','청주시 흥덕구','충주시','괴산군','단양군','보은군','영동군','옥천군','음성군','진천군','청원군');
	
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
	
	var selected_small
	
	//상세지역 클릭 시 선택된 option태그의 내용을 text형태로 가지고 오기 
	$('#small').on('click', function(){
		selected_small = $('#small option:selected').text();
		console.log(selected_small);
		var result = selected_big + " " + selected_small;
		document.getElementById("region").value=result;
	});
	
	// 게시판 구분해서 가져오는 기능
	$('#inputArticle-Sort').on('click', function(){
		selected_article = $('#inputArticle-Sort option:selected').text();
		console.log(selected_article);
		document.getElementById("inputArticle").value = selected_article;
	});
	</script>
</div>  
</body>
</html>