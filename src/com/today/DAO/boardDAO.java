package com.today.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;

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

		public int comm_insert(String comm_content, String article_seq, String mb_id) {
			int cnt = 0;
			try {
				getConn();
				String sql = "insert into t_comment values(0, ?, ?, sysdate, ?)";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, article_seq);
				psmt.setString(2, comm_content);
				psmt.setString(3, "mb_id 1");

				cnt = psmt.executeUpdate();
				
			} catch (Exception e) {

				e.printStackTrace();
			} finally {
				close();
			}		
			return cnt;
		}
	}

