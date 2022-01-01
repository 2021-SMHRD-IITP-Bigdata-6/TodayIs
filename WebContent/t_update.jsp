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
                                <nav class="navbar navbar-expand-lg mr-0 ml-auto" id="tm-main-nav">
                                    <button class="navbar-toggler tm-bg-black py-2 px-3 mr-0 ml-auto collapsed" type="button"
                                        data-toggle="collapse" data-target="#navbar-nav" aria-controls="navbar-nav"
                                        aria-expanded="false" aria-label="Toggle navigation">
                                        <span>
                                            <i class="fas fa-bars tm-menu-closed-icon"></i>
                                            <i class="fas fa-times tm-menu-opened-icon"></i>
                                        </span>
                                    </button>
                                    <div class="collapse navbar-collapse tm-nav"    id="navbar-nav"  >
                      <ul class="navbar-nav text-uppercase">
                        <%if(dto != null){ %>
                        <li class="nav-item">
                          <a class="nav-link tm-nav-link" href="#">
                          	<%=dto.getMb_nickname()%> 's
                          </a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link tm-nav-link" href="#" id=Mb_region>
                          	<%=dto.getMb_region()%>
                          </a>
                        </li>
                        <%} %>
                        <%if(dto == null){ %>
                        <li class="nav-item">
                          <a class="nav-link tm-nav-link" href="login.html">login</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link tm-nav-link" href="team">join</a>
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
            
         <div class="tm-welcome-container tm-fixed-header tm-fixed-header-2">
             </div>

            <div id="tm-fixed-header-bg"></div> <!-- Header image -->
      </div>
 
	<!-- community_click-->
	<div class="content-wrapper">
		<div class="inner-container container">
			<div class="row" >
				<div class="section-header col-md-10" >
					<h2>☁︎ COMMUNITY UPDATE </h2>

				</div>
				<!-- /.section-header -->
			</div>
			<!-- /.row -->
			<div class="row" style="display: block;">
				<form name="form" method="post" action="WriteUpdateService?article_seq=<%=board_dto.getM_article_seq() %>" enctype="multipart/form-data">
					<table class="table table-striped"
						style="text-align: center;">
						<thead>
							<tr>
								<th colspan="7"
									style="background-color: #eeeeee; text-align: center; font-size: 20px">
									오늘의 멋진 하루를 공유해주세요 ^^</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="3"><input type="text" class="form-control" id="inputSubject"
									placeholder="글 제목" name="m_article_subject" maxlength="50"/></td>
								<td><input type="hidden" class="form-control"
									placeholder="글쓴이" name="mb_id" maxlength="20" id="inputmb_id"/>
									<input type="text" class="form-control"
									placeholder="글쓴이" maxlength="20" id="inputnick" readonly/></td>
									<td><select name="article-sort" id="inputArticle-Sort" class="" >
											<option >메인 게시판</option>
											<option>미션 게시판</option>
										</select><input type="hidden" class="form-control" id ="inputArticle"
									value="메인 게시판" name="inputArticle-Sort" maxlength="20" readonly></td>				
								 <td>
								<select id="big" name="h_area1" class="" onChange="cat1_change(this.value,h_area2)" class="h_area1" >
								  <option >-지역-</option>
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
								<td><select id="small" name="h_area2" class="h_area2" >
								  <option>-시/구-</option>
								</select><input type="hidden" class="form-control" id ="region" 
									placeholder="지역을 선택해주세요" name="m_article_region" maxlength="20" readonly> </td>
							</tr>
							<tr>
								<td colspan="7"><textarea class="form-control" placeholder="글 내용" id ="inputcontent"
								name="m_article_content" maxlength="2048" style="height: 350px;"><%=board_dto.getM_article_content() %></textarea></td>
							</tr>
						
					<tr>
			  		  <td><input type="file" class="m_article_img"  name="m_article_img" onchange="readURL(this)"></td>
			  		  <td colspan="5"><img style="width: 100%; height: 100%;" id="m_article_preview"></img></td>
			  		  <td><input type="submit" value="등록하기"></td>	
					</tr>
						</tbody>
					</table>
					<table>
					 </table>
					 <input type="hidden" class="form-control" name ="m_article_img_name" id ="m_article_img_name" readonly>
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
	
	var selected_big
	var selected_small
	
	// 지역 클릭 시 선택된 option태그의 내용을 text형태로 가지고 오기
	$('#big').on('click', function(){
		selected_big = $('#big option:selected').text();
		console.log(selected_big);
	});
	
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
	
	
	
	//업데이트용 주제 내용을 각각 로드




	$(document).ready(function() {
		m_article_inputimg = "${board_dto.getM_article_img()}";
		$("#m_article_preview").attr("src",m_article_inputimg);
		
		m_article_subject = "${board_dto.getM_article_subject()}";
		document.getElementById("inputSubject").value = m_article_subject;
		
		m_article_mb_id = "${board_dto.getMb_id()}";
		document.getElementById("inputmb_id").value = m_article_mb_id;
		
		m_article_board_type = "${board_dto.getM_board_type()}";
		document.getElementById("inputArticle").value = m_article_board_type;
		

		m_article_inputregion = "${board_dto.getM_article_region()}";
		document.getElementById("region").value = m_article_inputregion;
	});
	
	
	</script>
</body>
</html>
