package com.today.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.sun.org.apache.bcel.internal.generic.RETURN;
import com.today.DTO.boardDTO;
import com.today.DTO.mainLifeDTO;

public class mainLifeDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	boardDTO boardDTO = null;
	mainLifeDTO life_dto = null;

	// 데이터베이스 연결 호출 메소드
	public void getConn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524";
			String dbid = "cgi_8_1_1216";
			String dbpw = "smhrd1";

			conn = DriverManager.getConnection(url, dbid, dbpw);

			if (conn != null) {
				System.out.println("연결성공");
			} else {
				System.out.println("연결실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			System.out.println("연결 끊기 실패");
			e.printStackTrace();
		}

	}


	public mainLifeDTO life_dto(String t_region) {
		
		
		
        try {
        	getConn();
           	           
           String sql = "select * from t_life_number where t_region = ?";
           psmt = conn.prepareStatement(sql);
           if(t_region.equals("파주")||t_region.equals("인천")||t_region.equals("이천")||t_region.equals("양평")||t_region.equals("수원")||t_region.equals("백령도")||t_region.equals("서울") || t_region.equals("강화")||t_region.equals("동두천")) {
        	   psmt.setString(1, "서울/경기지역");
           }else if (t_region.equals("충주")||t_region.equals("추풍령")||t_region.equals("청주")||t_region.equals("제천")||t_region.equals("보은")) {
        	   psmt.setString(1, "충북지역");
           }else if (t_region.equals("홍성")||t_region.equals("천안")||t_region.equals("세종")||t_region.equals("서산")||t_region.equals("부여")||t_region.equals("보령")||t_region.equals("금산")||t_region.equals("대전")) {
        	   psmt.setString(1, "충남지역");
           }else if (t_region.equals("홍천")||t_region.equals("정선군")||t_region.equals("영월")||t_region.equals("대관령")||t_region.equals("고산")) {
        	   psmt.setString(1, "강원영서지역");
           }else if (t_region.equals("태백")||t_region.equals("춘천")||t_region.equals("철원")||t_region.equals("인제")||t_region.equals("원주")||t_region.equals("동해")||t_region.equals("속초")||t_region.equals("북춘천")||t_region.equals("북강릉")) {
        	   psmt.setString(1, "강원영동지역");
           }else if (t_region.equals("정읍")||t_region.equals("전주")||t_region.equals("장수")||t_region.equals("임실")||t_region.equals("순창군")||t_region.equals("부안")||t_region.equals("남원")||t_region.equals("군산")||t_region.equals("고창") || t_region.equals("고창군") || t_region.equals("고흥")) {
        	   psmt.setString(1, "전북지역");
           }else if (t_region.equals("해남")||t_region.equals("진도군")||t_region.equals("장흥")||t_region.equals("완도")||t_region.equals("영광군")||t_region.equals("여수")||t_region.equals("순천")||t_region.equals("보성군")||t_region.equals("목포")||t_region.equals("광주")||t_region.equals("광양시")||t_region.equals("흑산도") || t_region.equals("강진군")) {
        	   psmt.setString(1, "전남지역");
           }else if (t_region.equals("포항")||t_region.equals("청송군")||t_region.equals("의성")||t_region.equals("울진")||t_region.equals("울산")||t_region.equals("영천")||t_region.equals("영주")||t_region.equals("영덕")||t_region.equals("안동")||t_region.equals("상주")||t_region.equals("부산")||t_region.equals("봉화")||t_region.equals("문경")||t_region.equals("대구")||t_region.equals("구미")) {
        	   psmt.setString(1, "경북지역");
           }else if (t_region.equals("합천")||t_region.equals("함양군")||t_region.equals("통영")||t_region.equals("창원")||t_region.equals("진주")||t_region.equals("의령군")||t_region.equals("양산시")||t_region.equals("성산")||t_region.equals("산청")||t_region.equals("북창원")||t_region.equals("밀양")||t_region.equals("남해")||t_region.equals("김해시")||t_region.equals("경주시") || t_region.equals("거제") || t_region.equals("거창")) {
        	   psmt.setString(1, "경남지역");
           }else if (t_region.equals("제주")||t_region.equals("서귀포")) {
        	   psmt.setString(1, "제주도지역");
           }else if (t_region.equals("울릉도")) {
        	   psmt.setString(1, "울릉도지역");
           }

           
           rs  = psmt.executeQuery(); 
           
           if(rs.next()) { 
        	
        	String t_local = rs.getNString(2);
        	String w_wash = rs.getNString(3);
        	String w_out = rs.getNString(4);
        	String w_exercise = rs.getNString(5);
        	String w_washcar = rs.getNString(6);
        	String w_rain = rs.getNString(7);
        	String w_sleep = rs.getNString(8);
        	String w_cold = rs.getNString(9);
        	String w_fire = rs.getNString(10);   
        	
        	life_dto = new mainLifeDTO(t_local, w_wash, w_out, w_exercise, w_washcar, 
        			              w_rain, w_sleep, w_cold, w_fire);
           }       
         }catch(Exception e) {
	           System.out.println("sql 오류");
	           e.printStackTrace();
          }finally {
        	  close();
         
        }
        return life_dto;
	}

}
