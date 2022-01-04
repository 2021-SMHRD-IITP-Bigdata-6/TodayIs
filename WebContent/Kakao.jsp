<%@page import="com.today.DAO.moveDAO"%>
<%@page import="com.today.DTO.memberDTO"%>
<%@page import="com.today.DAO.mainLifeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.overlaybox {
	position: relative;
	width: 100px;
	height: 220px;
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
	width: 100px;
	height: 100px;
	background: url('UploadWrite/무등산.jpg') no-repeat;
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

// 메인 DIV 관련 CSS



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
	<div style="background-color: #aaaaaa; width: 100%; height: 100%;">
	<div style=" position: relative;" >
	<button onclick="panTo1()">서울</button>
	<button onclick="panTo2()">경기</button>
	<button onclick="panTo3()">인천</button>
	<button onclick="panTo4()">충북</button>
	<button onclick="panTo5()">충남</button>
	<button onclick="panTo6()">세종</button>
	<button onclick="panTo7()">대전</button>
	<button onclick="panTo8()">강원</button> <br>
	<button onclick="panTo9()">전북</button>
	<button onclick="panTo10()">전남</button>
	<button onclick="panTo11()">광주</button>
	<button onclick="panTo12()">경북</button>
	<button onclick="panTo13()">울산</button>
	<button onclick="panTo14()">부산</button>
	<button onclick="panTo15()">경남</button>
	<button onclick="panTo16()">제주</button>
	</div>
	<div id="map" style="width: 800px; height: 800px; position: relative; left:25% "></div>		

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
			[35.1595454, 126.8526012] // 광주
			
		];
	
		var a = 35.1595454;
		var b = 126.8526012;
		
		var container = document.getElementById('map');
		var options = {
			//광주 위도 경도가 기본값
			center : new kakao.maps.LatLng(a , b),
			level : 11
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
		var content1 = '<div class="overlaybox">'
			+ '    <div class="boxtitle">서울 날씨 </div>'
			+ '    <div class="first">' 
		    + '    <div class="movietitle text"><%=wm_dao.Move("서울").getW_temp() %>℃</div>'
			+ '    </div>' + '    <ul>' + '        <li class="up">'
			+ '            <span class="number"></span>'
			+ '            <span class="title"><%=wm_dao.Move("서울").getW_status()%></span>'
			+ '            <span class="arrow up"></span>'
			+ '           ' + '        </li>'
			+ '        <li>' + ' <span class="number"></span>'
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
	
	
	//* 경기(양평)  *//
		var content2 = '<div class="overlaybox">'
			+ '    <div class="boxtitle">경기 날씨 </div>'
			+ '    <div class="first">' 
		    + '    <div class="movietitle text"><%=wm_dao.Move("양평").getW_temp() %>℃</div>'
			+ '    </div>' + '    <ul>' + '        <li class="up">'
			+ '            <span class="number"></span>'
			+ '            <span class="title"><%=wm_dao.Move("양평").getW_status()%></span>'
			+ '            <span class="arrow up"></span>'
			+ '           ' + '        </li>'
			+ '        <li>' + ' <span class="number"></span>'
			+ '            <span class="title"><%=wm_dao.Move("양평").getW_body_temp()%>℃</span>'
			+ '            <span class="arrow up"></span>'
			+ '           ' + '        </li>'
			+ '        <li>' + '            <span class="number"></span>'
			+ '            <span class="title"><%=wm_dao.Move("양평").getW_wind()%></span>'
			+ '            <span class="arrow down"></span>'
			+ '            ' + '        </li>'
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
			+ '    <div class="first">' 
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
			+ '        <li>' + '            <span class="number"></span>'
			+ '            <span class="title"><%=wm_dao.Move("인천").getW_wind()%></span>'
			+ '            <span class="arrow down"></span>'
			+ '            ' + '        </li>'
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
		
		//* 충북 *//
		var content3 = '<div class="overlaybox">'
			+ '    <div class="boxtitle">인천 날씨 </div>'
			+ '    <div class="first">' 
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
			+ '        <li>' + '            <span class="number"></span>'
			+ '            <span class="title"><%=wm_dao.Move("인천").getW_wind()%></span>'
			+ '            <span class="arrow down"></span>'
			+ '            ' + '        </li>'
			+ '    </ul>' + '</div>';

	var position3 = new kakao.maps.LatLng(37.4485339, 126.6355905);
		var customOverlay3 = new kakao.maps.CustomOverlay({
			position : position3,
			content : content3,
			xAnchor : 0.3,
			yAnchor : 0.80
		    
		});
		customOverlay3.setMap(map);
		//* 충북 *//	
	
	
	//* 광주  *//
		var content11 = '<div class="overlaybox">'
				+ '    <div class="boxtitle">광주 날씨 </div>'
				+ '    <div class="first">' 
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
				+ '        <li>' + '            <span class="number"></span>'
				+ '            <span class="title"><%=wm_dao.Move("광주").getW_wind()%></span>'
				+ '            <span class="arrow down"></span>'
				+ '            ' + '        </li>' + '    </ul>' + '</div>';
		var position11 = new kakao.maps.LatLng(35.1595454, 126.8526012);
		var customOverlay11 = new kakao.maps.CustomOverlay({
			position : position11,
			content : content11,
			xAnchor : 0.3,
			yAnchor : 0.80
		});
		customOverlay11.setMap(map);
		//* 광주  *//

		
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

		//* 광주  *//
		function panTo11() {
			// 이동할 위도 경도 위치를 생성합니다 
			var moveLatLon = new kakao.maps.LatLng(35.1595454, 126.8526012);

			// 지도 중심을 부드럽게 이동시킵니다
			// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			map.panTo(moveLatLon);
		}
	</script>
</body>
</html>