package com.today.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.today.DTO.boardDTO;

public class moveDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	boardDTO boardDTO = null;
	private boolean check;

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
			
		
		public String Move(String w_local, String w_status) {
			
				String weather_stat1 = null;
	        try {
	        	getConn();
	           	           
	           String sql = "select * from t_live_weather where w_local = ?";
	           psmt = conn.prepareStatement(sql);
	           psmt.setString(1, "광주");
	           
	           rs  = psmt.executeQuery(); 
	           
	           if(rs.next()) { 
	              w_status = rs.getString(3);
	              
	           }       
	           }catch(Exception e) {
		           System.out.println("sql 오류");
		           e.printStackTrace();
	          }finally {
	        	  close();
	         
	        }
	     return weather_stat1;
	}
}
