package com.today.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.today.DTO.boardDTO;
import com.today.DTO.mainPageDTO;

public class moveDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	boardDTO boardDTO = null;
	private boolean check;
	private String w_temp;

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
			
		
		public mainPageDTO Move(String w_local) {
			
			mainPageDTO main_dto = null;
			mainPageDTO second_dto = null;
			
	        try {
	        	getConn();
	           	           
	           String sql = "select * from t_live_weather where w_local = ?";
	           psmt = conn.prepareStatement(sql);
	           psmt.setString(1, w_local);
	           
	           rs  = psmt.executeQuery(); 
	           
	           if(rs.next()) { 
	        	 
	        	String w_region = rs.getString(2);
	        	String w_status = rs.getString(3);
	        	String w_temp = rs.getString(4);
	        	String w_body_temp = rs.getNString(5);
	        	String w_humidity = rs.getNString(6);
	        	String w_wind = rs.getNString(7);
	        	
	        	main_dto = new mainPageDTO(w_region, w_status, w_temp);
	        	
	        	second_dto = new mainPageDTO(w_local, w_status, w_temp, w_body_temp, w_humidity, w_wind);
	           }       
	           }catch(Exception e) {
		           System.out.println("sql 오류");
		           e.printStackTrace();
	          }finally {
	        	  close();
	         
	        }
	     return second_dto;
		}
}
