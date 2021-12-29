<%@page import="com.today.DTO.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
    <html>
    	<meta charset="utf-8">
        <head>
            <title> to 로그인 / 회원가입 폼 템플릿</title>
            <link rel="stylesheet" href="css/update.css">
        </head>
        <body>
            <div class="wrap" style="background-image: url(./imgs/background.jpg);">
                <div class="form-wrap">
                    <div class="button-wrap" style="width:150px;">
                        <div id="btn" style="width:150px;"></div>
                        <button type="button" style= width:150px; class="togglebtn" onclick="login()">정보 수정</button>
                    </div>
                    
                    <form id="login" action="LoginService" method="post" class="input-group">
                        <input type="password" name="mb_pw"  class="input-field" placeholder="Enter Password" required>
                        <input type="text" name="mb_nickname"  class="input-field" placeholder="Your nick name" required>
                        <input type="text" name="mb_phone"  class="input-field" placeholder="Your phone number" required>
                        <li>사는 지역</li>
                        <select name ="mb_region" class="input-fields">
                        	<option>-선택-</option>
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
                        </select> 
                        <br>
                        <button class="submit">정보수정</button>
                    </form>
                </div>
            </div>
            
            <script>
                var x = document.getElementById("login");
                var z = document.getElementById("btn");
                
                
                function tochange(){
                    x.style.left = "50px";
                    z.style.left = "0";
                }
            </script>
        </body>
    </html>