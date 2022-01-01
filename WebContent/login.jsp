
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
		memberDTO dto = (memberDTO) session.getAttribute("dto");
		String mb_id = request.getParameter("mb_id");
		System.out.print(mb_id);
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
                                    <div class="collapse navbar-collapse tm-nav"    id="navbar-nav"      >
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
            <!--
                <div class="text-center">
               <p class="pt-5 px-3 tm-welcome-text tm-welcome-text-2 mb-1 mt-lg-0 mt-5 text-white mx-auto">Another Image BG<br>it can be fixed.<br>Content will simply slide over.</p>                   
            </div>                
                -->
            </div>

            <div id="tm-fixed-header-bg"></div> <!-- Header image -->
      </div>
 
	<div class="row">
                    <div class="section-header col-md-12">
                        <h2>☁︎ TODAY?</h2>
                        <span>사용해 주셔서 감사합니다.</span>
                        <a href="login.jsp" style="float: right;"><h2>LOGIN & JOIN ☁︎</h2></a>
                    </div> <!-- /.section-header -->
                </div> <!-- /.row -->
                   
                   
                        <h1>LOGIN</h1><br>
                        <input type="text" name="mb_id" class="input-field" placeholder="User id" required>
                        <input type="password" name="mb_pw"  class="input-field" placeholder="Enter Password" required><br><br>
                        <button class="submit" style="color: #7AE2DE; font-weight: bolder;" >로그인</button>
                        <h1>JOIN</h1><br>
                        <input type="text" name="mb_id"  class="input-field" placeholder="User id" required>
                        <input type="password" name="mb_pw"  class="input-field" placeholder="Enter Password" required>
                        <input type="text" name="mb_nickname"  class="input-field" placeholder="Your nick name" required>
                        <input type="text" name="mb_phone"  class="input-field" placeholder="Your phone number" required>
                        
                        <select name ="mb_region" class="input-fields">
                        	<option>-지역 선택-</option>
                        	<option>서울</option>
                        	<option>부산</option>
                        	<option>대구</option>
                        	<option>인천</option>
                        	<option>광주</option>
                        	<option>대전</option>
                        	<option>울산</option>
                        	<option>강원</option>
                        	<option>경기</option>
                        	<option>경남</option>
                        	<option>경북</option>
                        	<option>전남</option>
                        	<option>전북</option>
                        	<option>제주</option>
                        	<option>충남</option>
                        	<option>충북</option>
                        </select><br>
                        <button class = "submit" style="color: #7AE2DE; font-weight: bolder;" >회원가입</button>
                        
                        
	</div>
</body>
</html>