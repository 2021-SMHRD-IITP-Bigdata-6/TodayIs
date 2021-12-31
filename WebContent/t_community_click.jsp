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

    <link
      rel="stylesheet"
      href="http://fonts.googleapis.com/css?family=Roboto+Slab:400,700,300,100"
    />
    <link
      rel="stylesheet"
      href="http://fonts.googleapis.com/css?family=Roboto:400,400italic,300italic,300,500,500italic,700,900"
    />

    <link rel="stylesheet" href="t_css/bootstrap.css" />
    <link rel="stylesheet" href="t_css/font-awesome.css" />
    <link rel="stylesheet" href="t_css/animate.css" />
    <link rel="stylesheet" href="t_css/templatemo-misc.css" />
    <link rel="stylesheet" href="t_css/templatemo-style.css" />
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
		boardDTO board_dto = (boardDTO) session.getAttribute("board_dto");		
		memberDTO dto = (memberDTO) session.getAttribute("dto");
		commDTO comm_dto = (commDTO) session.getAttribute("comm_dto"); 
	%>
    <!-- nav bar -->

    <!-- community_click-->
    <div class="content-wrapper">
      <div class="inner-container container">
        <div class="row">
          <div class="section-header col-md-12">
            <h2>☁︎ COMMUNITY</h2>
            <span>mission : keywords</span>
          </div>
          <!-- /.section-header -->
        </div>
        <!-- /.row -->
        <div class="row">
          <div class="blog-image col-md-12">
          <h1>#<%=board_dto.getM_article_region()%></h1>
            <img src="<%=board_dto.getM_article_img()%>"
					style="width: 100%; height: 100%;" id="m_article_preview">
          </div>
          <!-- /.blog-image -->
          <div class="blog-info col-md-12">
            <div class="box-content">
              <h2 class="blog-title"><%=board_dto.getM_article_subject()%></h2>
              <span class="blog-meta">2021-12-12</span>
              <p>글내용</p>
            </div>
          </div>
          <!-- /.blog-info -->
          <div class="blog-tags col-md-12">
            <span>Tags</span>:
            <a href="#">눈</a>
            <a href="#">추움</a>
            <a href="#">얼어죽음</a>
            <a href="#">겨울왕국</a>
            <a href="#">엘사</a>
          </div>
          <!-- /.blog-tags -->
        </div>
        <!-- /.row -->
        <div class="row">
          <div class="col-md-12">
            <h2 class="comment-heading">Comments (3)</h2>
            <div class="box-content">
              <div class="comment">
                <div class="comment-inner">
                  <div class="author-avatar">
                    <img src="images/blog/basic_user.png" alt="" />
                  </div>
                  <div class="comment-body">
                    <h4>댓글_작성자1</h4>
                    <span>2021-12-12</span>
                    <p>난 안추운데?<a href="#">↩︎</a></p>
                  </div>
                </div>
                <div class="nested-comment">
                  <div class="comment">
                    <div class="comment-inner">
                      <div class="author-avatar">
                        <img src="images/blog/basic_user.png" alt="" />
                      </div>
                      <div class="comment-body">
                        <h4>댓글_작성자2</h4>
                        <span>2021-12-12</span>
                        <p>퉤<a href="#">↩︎</a></p>
                      </div>
                    </div>
                  </div>
                  <!-- /.comment -->
                  <div class="nested-comment">
                    <div class="comment">
                      <div class="comment-inner">
                        <div class="author-avatar">
                          <img src="images/blog/basic_user.png" alt="" />
                        </div>
                        <div class="comment-body">
                          <h4>댓글_작성자3</h4>
                          <span>2021-12-12</span>
                          <p>니가 뭔데 <a href="#">↩︎</a></p>
                        </div>
                      </div>
                    </div>
                    <!-- /.comment -->
                  </div>
                  <!-- /.nested-comment -->
                </div>
                <!-- /.nested-comment -->
              </div>
              <!-- /.comment -->
              <div class="comment last">
                <div class="comment-inner">
                  <div class="author-avatar">
                    <img src="images/blog/basic_user.png" alt="" />
                  </div>
                  <div class="comment-body">
                    <h4>댓글_작성자4</h4>
                    <span>2021-12-12</span>
                    <p>나도 추움<a href="#">↩︎</a></p>
                  </div>
                </div>
              </div>
              <!-- /.comment -->
            </div>
            <!-- /.box-content -->
          </div>
          <!-- /.col-md-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
          <div class="col-md-12 comment-form">
            <h2 class="comment-heading">Leave a Comment</h2>
            <div class="box-content">
              <p>
                <label for="name">Nick-name :</label>
                <input type="text" name="name" id="name" />
              </p>
              <p>
                <label for="comment">Your comment:</label>
                <textarea name="comment" id="comment"></textarea>
              </p>
              <input
                type="submit"
                class="mainBtn"
                id="submit-comment"
                value="Submit Comment"
              />
            </div>
            <!-- /.box-content -->
          </div>
          <!-- /.comment-form -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.inner-content -->
    </div>
    <!-- /.content-wrapper -->

    <script src="js/vendor/jquery-1.11.0.min.js"></script>
    <script>
      window.jQuery ||
        document.write(
          '<script src="js/vendor/jquery-1.11.0.min.js"><\/script>'
        );
    </script>
    <script src="js/plugins.js"></script>
    <script src="js/main.js"></script>

    <!-- Preloader -->
    <script type="text/javascript">
      //<![CDATA[
      $(window).load(function () {
        // makes sure the whole site is loaded
        $(".loader-item").fadeOut(); // will first fade out the loading animation
        $("#pageloader").delay(350).fadeOut("slow"); // will fade out the white DIV that covers the website.
        $("body").delay(350).css({ "overflow-y": "visible" });
      });
      //]]>
    </script>
  </body>
</html>
