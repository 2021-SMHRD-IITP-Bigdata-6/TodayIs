package com.today.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
				String url = "jdbc:oracle:thin:@127.0.0.1:1521";
				String dbid = "hr";
				String dbpw = "hr";

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
		
		public int Update(String m_article_subject, String m_article_content, String m_article_img,
				 String mb_id, String m_article_region) {
			int cnt = 0;
			try {
				getConn();
				String sql2 = "insert into member_Message values( ?, ?, ?, ?,sysdate)";
				String sql1 = "update member_Message set m_article_subject = ?, m_article_content = ?,"
						+ "m_article_img = ?,sysdate, m_article_region = ? where mb_id = ?";
				psmt = conn.prepareStatement(sql1);
				psmt.setString(2, m_article_subject);
				psmt.setString(3, m_article_content);
				psmt.setString(4, m_article_img);
				psmt.setString(7, mb_id);
				psmt.setString(8, m_article_region);

				cnt = psmt.executeUpdate();
				
			} catch (Exception e) {

				e.printStackTrace();
			} finally {
				close();
			}

			return cnt;
		}
	}

