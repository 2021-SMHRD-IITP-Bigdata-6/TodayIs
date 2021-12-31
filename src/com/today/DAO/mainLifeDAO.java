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




	public mainLifeDTO life_dto(String w_indexindex) {

		
		
		
        try {
        	getConn();
           	           
           String sql = "select * from t_life_number where w_indexindex = ?";
           psmt = conn.prepareStatement(sql);
           if(w_indexindex.equals("파주")||w_indexindex.equals("인천")||w_indexindex.equals("이천")||w_indexindex.equals("양평")||w_indexindex.equals("수원")||w_indexindex.equals("백령도")||w_indexindex.equals("서울") || w_indexindex.equals("강화")||w_indexindex.equals("동두천")) {
        	   psmt.setString(1, "0");
           }else if (w_indexindex.equals("충주")||w_indexindex.equals("추풍령")||w_indexindex.equals("청주")||w_indexindex.equals("제천")||w_indexindex.equals("보은")) {
        	   psmt.setString(1, "1");
           }else if (w_indexindex.equals("홍성")||w_indexindex.equals("천안")||w_indexindex.equals("세종")||w_indexindex.equals("서산")||w_indexindex.equals("부여")||w_indexindex.equals("보령")||w_indexindex.equals("금산")||w_indexindex.equals("대전")) {
        	   psmt.setString(1, "2");
           }else if (w_indexindex.equals("홍천")||w_indexindex.equals("정선군")||w_indexindex.equals("영월")||w_indexindex.equals("대관령")||w_indexindex.equals("고산")) {
        	   psmt.setString(1, "3");
           }else if (w_indexindex.equals("태백")||w_indexindex.equals("춘천")||w_indexindex.equals("철원")||w_indexindex.equals("인제")||w_indexindex.equals("원주")||w_indexindex.equals("동해")||w_indexindex.equals("속초")||w_indexindex.equals("북춘천")||w_indexindex.equals("북강릉")) {
        	   psmt.setString(1, "4");
           }else if (w_indexindex.equals("정읍")||w_indexindex.equals("전주")||w_indexindex.equals("장수")||w_indexindex.equals("임실")||w_indexindex.equals("순창군")||w_indexindex.equals("부안")||w_indexindex.equals("남원")||w_indexindex.equals("군산")||w_indexindex.equals("고창") || w_indexindex.equals("고창군") || w_indexindex.equals("고흥")) {
        	   psmt.setString(1, "5");
           }else if (w_indexindex.equals("해남")||w_indexindex.equals("진도군")||w_indexindex.equals("장흥")||w_indexindex.equals("완도")||w_indexindex.equals("영광군")||w_indexindex.equals("여수")||w_indexindex.equals("순천")||w_indexindex.equals("보성군")||w_indexindex.equals("목포")||w_indexindex.equals("광주")||w_indexindex.equals("광양시")||w_indexindex.equals("흑산도") || w_indexindex.equals("강진군")) {
        	   psmt.setString(1, "6");
           }else if (w_indexindex.equals("포항")||w_indexindex.equals("청송군")||w_indexindex.equals("의성")||w_indexindex.equals("울진")||w_indexindex.equals("울산")||w_indexindex.equals("영천")||w_indexindex.equals("영주")||w_indexindex.equals("영덕")||w_indexindex.equals("안동")||w_indexindex.equals("상주")||w_indexindex.equals("부산")||w_indexindex.equals("봉화")||w_indexindex.equals("문경")||w_indexindex.equals("대구")||w_indexindex.equals("구미")) {
        	   psmt.setString(1, "7");
           }else if (w_indexindex.equals("합천")||w_indexindex.equals("함양군")||w_indexindex.equals("통영")||w_indexindex.equals("창원")||w_indexindex.equals("진주")||w_indexindex.equals("의령군")||w_indexindex.equals("양산시")||w_indexindex.equals("성산")||w_indexindex.equals("산청")||w_indexindex.equals("북창원")||w_indexindex.equals("밀양")||w_indexindex.equals("남해")||w_indexindex.equals("김해시")||w_indexindex.equals("경주시") || w_indexindex.equals("거제") || w_indexindex.equals("거창")) {
        	   psmt.setString(1, "8");
           }else if (w_indexindex.equals("제주")||w_indexindex.equals("서귀포")) {
        	   psmt.setString(1, "9");
           }else if (w_indexindex.equals("울릉도")) {
        	   psmt.setString(1, "10");
           }

           
           rs  = psmt.executeQuery(); 
           
           if(rs.next()) { 
        	
        	String w_index = rs.getString(1);
        	String w_local = rs.getString(2);
        	String w_wash = rs.getString(3);
        	String w_out = rs.getString(4);
        	String w_exercise = rs.getString(5);
        	String w_washcar = rs.getString(6);
        	String w_rain = rs.getString(7);
        	String w_sleep = rs.getString(8);
        	String w_cold = rs.getString(9);
        	String w_fire = rs.getString(10);   
        	
        	life_dto = new mainLifeDTO(w_indexindex, w_local, w_wash, w_out, w_exercise, w_washcar, w_rain, w_sleep, w_cold, w_fire);
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
