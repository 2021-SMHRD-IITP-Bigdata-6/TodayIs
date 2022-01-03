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
	width: 360px;
	height: 350px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/box_movie.png')
		no-repeat;
	padding: 15px 10px;
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
	width: 247px;
	height: 136px;
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
	width: 247px;
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
<table>
<tr>
	<td><select id="big" name="h_area1" class="" onChange="cat1_change()">
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
	</select></td>
	<td>><input type="hidden" class="form-control" id="region"
		placeholder="지역을 선택해주세요" name="m_article_region" maxlength="20"
		readonly></td>
		
	</table>
	<div id="map" style="width: 800px; height: 800px;"></div>


<div ></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fc7696aa31445fcfe21fc7bb8d6cc220"></script>
			<script src="js/vendor/jquery-1.11.0.min.js"></script>
	<script>
	
	function cat1_change(key,sel){
		console.log("test"+sel);
	 if(key == '') return;
	
	 for(i=sel.length-1; i>=0; i--)
	  sel.options[i] = null;
	 sel.options[0] = new Option('-선택-','', '', 'true');
	 for(i=0; i<name.length; i++){
	  sel.options[i+1] = new Option(name[i],val[i]);
	 }
	
	var selected_big
	
	// 지역 클릭 시 선택된 option태그의 내용을 text형태로 가지고 오기
	$('#big').on('click', function(){
		selected_big = $('#big option:selected').text();
		console.log(selected_big);
	});
	}
	
	
	
		var region = [
			[37.3306890, 126.5930664], // 서울
			[37.4980273, 127.5117792], // 경기도(양평)
			[37.4585339, 126.7055905], // 인천(강화도)
			[35.1595454, 126.8526012], // 광주
			
		];
		
		var region_name =['서울','경기','인천','충북','충남','세종','대전','강원','전북','전남','광주','경북','울산','부산','경남','제주'];
		
	
		var container = document.getElementById('map');
		var options = {
			//광주 위도 경도가 기본값
			center : new kakao.maps.LatLng(region[0][0], region[0][1]),
			level : 11
		};

		var map = new kakao.maps.Map(container, options);

		var content = '<div class="overlaybox">'
				+ '    <div class="boxtitle">광주 날씨 </div>'
				+ '    <div class="first">' 
			    + '    <div class="movietitle text"><%=wm_dao.Move("광주").getW_body_temp() %>℃</div>'
				+ '    </div>' + '    <ul>' + '        <li class="up">'
				+ '            <span class="number">날씨상태</span>'
				+ '            <span class="title"><%=wm_dao.Move("광주").getW_status() %></span>'
				+ '            <span class="arrow up"></span>'
				+ '           ' + '        </li>'
				+ '        <li>' + ' <span class="number">체감온도</span>'
				+ '            <span class="title"><%=wm_dao.Move("광주").getW_body_temp() %>℃</span>'
				+ '            <span class="arrow up"></span>'
				+ '           ' + '        </li>'
				+ '        <li>' + '            <span class="number">습도</span>'
				+ '            <span class="title"><%=wm_dao.Move("광주").getW_humidity() %></span>'
				+ '            <span class="arrow up"></span>'
				+ '          ' + '        </li>'
				+ '        <li>' + '            <span class="number">풍향</span>'
				+ '            <span class="title"><%=wm_dao.Move("광주").getW_wind() %></span>'
				+ '            <span class="arrow down"></span>'
				+ '            ' + '        </li>'
				+ '    </ul>' + '</div>';

		// 커스텀 오버레이가 표시될 위치입니다 
		var position = new kakao.maps.LatLng(35.1595454, 126.8526012);

		// 커스텀 오버레이를 생성합니다
		var customOverlay = new kakao.maps.CustomOverlay({
			position : position,
			content : content,
			xAnchor : 0.3,
			yAnchor : 0.91
		});

		// 커스텀 오버레이를 지도에 표시합니다
		customOverlay.setMap(map);
		



	</script>
</body>
</html>