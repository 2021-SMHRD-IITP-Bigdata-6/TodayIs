package com.today.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;


import com.today.DTO.boardDTO;


public class boardDAO {
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
		
		public int Tboard_insert(int article_seq, String m_article_subject, String m_article_content, String m_article_img,
				 String mb_id, String m_article_region) {
			int cnt = 0;
			try {
				getConn();
				String sql = "insert into t_community values(?, ?, ?, ?, ?, 0 , 0, sysdate, 0, ?)";
//				psmt = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS); 
				String generatedColumns[] = { "article_seq" };
				psmt = conn.prepareStatement(sql, generatedColumns); 
				psmt.setInt(1, 0);
				psmt.setString(2, m_article_subject);
				psmt.setString(3, m_article_content);
				psmt.setString(4, m_article_img);
				psmt.setString(5, m_article_region);
				psmt.setString(6, "mb_id 1");
				cnt = psmt.executeUpdate();
				
				
				ResultSet rs = psmt.getGeneratedKeys();	
				if (rs.next()) {
					cnt = rs.getInt(1);
					System.out.println("autoIncrement: " + cnt); // 출력
				}
				
			
			} catch (Exception e) {

				e.printStackTrace();
			} finally {
				close();
			}

			return cnt;
		}
		
		public int Mboard_insert(String m_article_subject, String m_article_content, String m_article_img,
				 String mb_id, String m_article_region) {
			int cnt = 0;
			try {
				getConn();
				String sql = "insert into t_community values(0, ?, ?, ?, ?, 0 , 0, sysdate, 0, ?)";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, m_article_subject);
				psmt.setString(2, m_article_content);
				psmt.setString(3, m_article_img);
				psmt.setString(4, m_article_region);
				psmt.setString(5, "mb_id 1");
				

				cnt = psmt.executeUpdate();
				
			} catch (Exception e) {

				e.printStackTrace();
			} finally {
				close();
			}

			return cnt;
		}
		
		public ArrayList<boardDTO> board_all() {
			ArrayList<boardDTO> board_arr = new ArrayList<boardDTO>();
			try {
				getConn();

				String sql = "select * from t_community";
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();

				while (rs.next() == true) {
					int m_article_seq = rs.getInt(1);
					String m_article_subject = rs.getString(2);
					String m_article_content = rs.getString(3);
					String m_article_img = rs.getString(4);
					String m_article_region = rs.getString(5);
					int m_article_latitude = rs.getInt(6);
					int m_article_logitude = rs.getInt(7);
					String m_article_date = rs.getString(8);					
					int m_article_likes = rs.getInt(9);
					String mb_id = rs.getString(10);
					boardDTO dto = new boardDTO(m_article_seq, m_article_subject, m_article_content, m_article_img, m_article_date, m_article_likes, mb_id, m_article_region, m_article_latitude, m_article_logitude);
					
					board_arr.add(dto);
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return board_arr;
		}

		
	}

