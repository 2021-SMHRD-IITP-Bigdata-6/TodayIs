<%@page import="com.today.DTO.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<head>
<title>회원 수정 템플릿</title>
<link rel="stylesheet" href="css/update.css">
</head>
<body>
	<%
		memberDTO dto = (memberDTO) session.getAttribute("dto");
		String mb_id = request.getParameter("mb_id");
		System.out.print(mb_id);
	%>

	<div class="wrap" style="background-color: #414A52;">
		<div class="form-wrap" style="border-radius: 80px/ 80px">
			<div class="button-wrap">
				<div id="btn"></div>
				<button type="button" class="togglebtn"
					onclick="login()" style="color: #7AE2DE; font-weight: bolder;" ><%=mb_id %> 님 정보수정 </button>
			</div>

			<form id="login" action="UpdateService" method="post" class="input-group">
				<input type="password" name="mb_pw" class="input-field"
					placeholder="Enter Password" required>
					<input type="text" name="mb_nickname" class="input-field" placeholder="Your nick name" required>
					<input type="text" name="mb_phone" class="input-field" placeholder="Your phone number" required>
				    
				    <select name="mb_region" class="input-fields">
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
				</select> <br>
				<button class="submit" style="color: #7AE2DE; font-weight: bolder;">정보수정</button>
			</form>
		</div>
	</div>

	<script>
		var x = document.getElementById("login");
		var z = document.getElementById("btn");

		function tochange() {
			x.style.left = "50px";
			z.style.left = "0";
		}
	</script>
</body>
</html>