package com.today.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.stream.Collectors;

import com.today.DTO.boardDTO;

public class mboardDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

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
	
	//조건없이 미션게시판 전체 조회
			public ArrayList<boardDTO> mboard_all() {
				ArrayList<boardDTO> mboard_arr = new ArrayList<boardDTO>();
				try {
					getConn();

					String sql = "select * from t_mission_community";
					psmt = conn.prepareStatement(sql);
					rs = psmt.executeQuery();

					while (rs.next() == true) {
						int m_article_seq = rs.getInt(1);
						String m_article_subject = rs.getString(2);
						String m_article_content = rs.getString(3);
						String m_article_img = rs.getString(4);
						String m_article_date = rs.getString(5);					
						int m_article_likes = rs.getInt(6);
						String mb_id = rs.getString(7);
						String m_article_region = rs.getString(8);
						int m_article_latitude = rs.getInt(9);
						int m_article_logitude = rs.getInt(10);
						boardDTO dto = new boardDTO(m_article_seq, m_article_subject, m_article_content, m_article_img, m_article_date, m_article_likes, mb_id, m_article_region, m_article_latitude, m_article_logitude);
						mboard_arr.add(dto);
					}
					
					// boardDTO의 getM_article_seq의 기준으로 역정렬한다.
					mboard_arr.stream().sorted(Comparator.comparing(boardDTO::getM_article_date)).collect(Collectors.toList());

				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					close();
				}
				return mboard_arr;
			}
	
			
			//게시판 정보 전체 조회(지역용)
			public ArrayList<boardDTO> mboard_to_region(String region) {
				ArrayList<boardDTO> mboard_arr = new ArrayList<boardDTO>();
				try {
					getConn();

					String sql = "select * from t_mission_community where m_article_region = ? ";
					psmt = conn.prepareStatement(sql);
					psmt.setString(1, region);
					rs = psmt.executeQuery();

					while (rs.next() == true) {
						int m_article_seq = rs.getInt(1);
						String m_article_subject = rs.getString(2);
						String m_article_content = rs.getString(3);
						String m_article_img = rs.getString(4);
						String m_article_date = rs.getString(5);					
						int m_article_likes = rs.getInt(6);
						String mb_id = rs.getString(7);
						String m_article_region = rs.getString(8);
						int m_article_latitude = rs.getInt(9);
						int m_article_logitude = rs.getInt(10);
						boardDTO dto = new boardDTO(m_article_seq, m_article_subject, m_article_content, m_article_img, m_article_date, m_article_likes, mb_id, m_article_region, m_article_latitude, m_article_logitude);
						mboard_arr.add(dto);
					}
					
					// boardDTO의 getM_article_seq의 기준으로 역정렬한다.
					mboard_arr.stream().sorted(Comparator.comparing(boardDTO::getM_article_seq).reversed()).collect(Collectors.toList());

				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					close();
				}
				return mboard_arr;
			}
			
			//게시판 정보 전체 조회(게시글 순번)
			public boardDTO mboard_tocomm(String M_article_seq) {
				boardDTO dto =null;
				try {
					getConn();
					String m_board_type = "미션 게시판";
					String sql = "select * from t_mission_community where m_article_seq = ?";
					psmt = conn.prepareStatement(sql);
					psmt.setInt(1, Integer.parseInt(M_article_seq));
					rs = psmt.executeQuery();
					
					while (rs.next() == true) {
						int m_article_seq = rs.getInt(1);
						String m_article_subject = rs.getString(2);
						String m_article_content = rs.getString(3);
						String m_article_img = rs.getString(4);
						String m_article_date = rs.getString(5);					
						int m_article_likes = rs.getInt(6);
						String mb_id = rs.getString(7);
						String m_article_region = rs.getString(8);
						int m_article_latitude = rs.getInt(9);
						int m_article_logitude = rs.getInt(10);
						dto = new boardDTO(m_article_seq, m_article_subject, m_article_content, m_article_img, m_article_date, m_article_likes, mb_id, m_article_region, m_article_latitude, m_article_logitude, m_board_type);	
					}


				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					close();
				}
				return dto;
			}
			
			// 미션 게시판 업데이트
			public int Mboard_update(String article_seq, String m_article_subject, String m_article_content, String m_article_img,
					 String mb_id, String m_article_region) {
				int cnt = 0;
				try {
					getConn();
					int m_article_seq = Integer.parseInt(article_seq);
					String sql = "update t_mission_community set m_article_subject = ?, m_article_content = ?, m_article_img = ?,"
							+ "m_article_region = ?, m_article_date = sysdate where m_article_seq = ?";
					psmt = conn.prepareStatement(sql); 
					psmt.setString(1, m_article_subject);
					psmt.setString(2, m_article_content);
					psmt.setString(3, m_article_img);
					psmt.setString(4, m_article_region);
					psmt.setInt(5, m_article_seq);
					cnt = psmt.executeUpdate();

				} catch (Exception e) {

					e.printStackTrace();
				} finally {
					close();
				}

				return cnt;
			}
	
}
