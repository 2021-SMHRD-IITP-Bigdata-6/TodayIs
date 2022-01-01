<%@page import="com.today.DTO.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<head>
<title>회원 수정 템플릿</title>
<link rel="stylesheet" href="css/login.css">
</head>
<body>
   <%
      memberDTO dto = (memberDTO) session.getAttribute("dto");
      String mb_id = request.getParameter("mb_id");
      System.out.print(mb_id);
   %>
            <div class="wrap" style="background-color: #414A52;" >
                <div class="form-wrap" style="border-radius: 80px/ 80px">
                    <div class="button-wrap">
                        <div id="btn"></div>
                        <button type="button" class="togglebtn" onclick="logout()" style="color: #7AE2DE; font-weight: bolder;" >LOGOUT</button>
                        <button type="button" class="togglebtn1" onclick="update()" style="color: #7AE2DE; font-weight: bolder;" >  UPDATE</button>
                    </div>
                    
                    <form id="logout" action="LogoutService" method="post" class="input-group">
                        <br><br>
      <button class="submit" onclick="location.href='LogoutService'" style="color: #7AE2DE; font-weight: bolder;"> LOGOUT </button>
                    </form>
                    <form id="update" action="UpdateService" style ="top: 100px; "method="post" class="input-group">
                        <input type="password" name="mb_pw" class="input-field" placeholder="Enter Password" required>
      <input type="text" name="mb_nickname" class="input-field" placeholder="Your nick name" required>
      <input type="text" name="mb_phone" class="input-field" placeholder="Your phone number" required>
                        
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
                        <button class = "submit" style="color: #7AE2DE; font-weight: bolder;" >UPDATE</button>
                        
                    </form>
                </div>
            </div>
            

   <script>
      var a = document.getElementById("logout");
      var b = document.getElementById("update");
      var c = document.getElementById("btn");
      
      
      function logout(){
            a.style.left = "50px";
            b.style.left = "450px";
            c.style.left = "0";
        }

        function update(){
            a.style.left = "-400px";
            b.style.left = "50px";
            c.style.left = "110px";
        }
        
   </script>

        </body>
</html>