package com.today.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.stream.Collectors;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import com.today.DTO.boardDTO;
import com.today.DTO.commDTO;


public class boardDAO {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

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
					System.out.println("보드 연결 성공");
				} else {

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
				e.printStackTrace();
			}
		}
		
		// 공유 게시판 입력
		public int Tboard_insert(int article_seq, String m_article_subject, String m_article_content, String m_article_img,
				 String mb_id, String m_article_region) {
			int cnt = 0;
			try {
				getConn();
				String sql = "insert into t_community values(?, ?, ?, ?, ?, 0 , 0, sysdate, 0, ?)";

				String generatedColumns[] = { "article_seq" };
				psmt = conn.prepareStatement(sql, generatedColumns); 
				psmt.setInt(1, 0);
				psmt.setString(2, m_article_subject);
				psmt.setString(3, m_article_content);
				psmt.setString(4, m_article_img);
				psmt.setString(5, m_article_region);
				psmt.setString(6, mb_id);
				
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
		
		// 메인 게시판 업데이트
		public int Tboard_update(String article_seq, String m_article_subject, String m_article_content, String m_article_img,
				 String mb_id, String m_article_region) {
			int cnt = 0;
			try {
				getConn();
				int m_article_seq = Integer.parseInt(article_seq);
				String sql = "update t_community set article_subject = ?, article_content = ?, article_img = ?,"
						+ "article_region = ?, article_date = sysdate where article_seq = ?";
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
		
		
		// 미션 게시판 입력
		public int Mboard_insert(String m_article_subject, String m_article_content, String m_article_img,
				 String mb_id, String m_article_region) {
			int cnt = 0;
			try {
				getConn();
				String sql = "insert into t_mission_community values(0, ?, ?, ?, sysdate, 0 , ?, ?, 0, 0)";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, m_article_subject);
				psmt.setString(2, m_article_content);
				psmt.setString(3, m_article_img);
				psmt.setString(4, mb_id);
				psmt.setString(5, m_article_region);
				
				cnt = psmt.executeUpdate();
				
			} catch (Exception e) {

				e.printStackTrace();
			} finally {
				close();
			}

			return cnt;
		}
		
		//조건없이 게시판 전체 조회
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
				
				// boardDTO의 getM_article_seq의 기준으로 역정렬한다.
				board_arr.stream().sorted(Comparator.comparing(boardDTO::getM_article_seq)).collect(Collectors.toList());

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return board_arr;
		}
		
		//게시판 정보 전체 조회(게시글 순번)
		public boardDTO board_tocomm(String M_article_seq) {
			boardDTO dto =null;
			try {
				getConn();
				String m_board_type = "메인 게시판";
				String sql = "select * from t_community where article_seq = ?";
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, Integer.parseInt(M_article_seq));
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
					dto = new boardDTO(m_article_seq, m_article_subject, m_article_content, m_article_img, m_article_date, m_article_likes, mb_id, m_article_region, m_article_latitude, m_article_logitude, m_board_type);	
			
				}


			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return dto;
		}
		
		// 메인 게시판 글 삭제
		public int Mboard_delete(String ARTICLE_SEQ) {
			int cnt = 0;

			try {
				getConn();

					String sql = "delete from t_community where ARTICLE_SEQ = ? ";
					psmt = conn.prepareStatement(sql);
					psmt.setString(1, ARTICLE_SEQ);
					cnt = psmt.executeUpdate();
					
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close();
			}

			return cnt;
		}
		
		
		//로그인용 보드 dto 뿌리기
				public boardDTO board_tologin() {
					boardDTO dto =null;
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
							dto = new boardDTO(m_article_seq, m_article_subject, m_article_content, m_article_img, m_article_date, m_article_likes, mb_id, m_article_region, m_article_latitude, m_article_logitude);
							
						}

					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						close();
					}
					return dto;
				}

				public int board_like(String article_seq, String like_count, String counter) {
					boardDTO dto =null;
					int cnt = 0;
					int ARTICLE_LIKES = Integer.parseInt(like_count)+1;
					if (counter.equals("o")) {
					ARTICLE_LIKES = Integer.parseInt(like_count)+1;
					} else {
					ARTICLE_LIKES = Integer.parseInt(like_count);
					}
					try {
						getConn();
						String sql = "Update t_community set ARTICLE_LIKES = ? where ARTICLE_SEQ = ? ";
						psmt = conn.prepareStatement(sql);
						psmt.setInt(1, ARTICLE_LIKES);
						psmt.setString(2, article_seq);
						

						cnt = psmt.executeUpdate();
						
					

					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						close();
					}	
					return cnt;
				}
		
				//게시판 정보 전체 조회(지역용)
				public ArrayList<boardDTO> board_to_region(String region) {
					ArrayList<boardDTO> board_arr = new ArrayList<boardDTO>();
					try {
						getConn();

						String sql = "select * from t_community where article_region = ? ";
						psmt = conn.prepareStatement(sql);
						psmt.setString(1, region);
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
						
						// boardDTO의 getM_article_seq의 기준으로 역정렬한다.
						board_arr.stream().sorted(Comparator.comparing(boardDTO::getM_article_seq).reversed()).collect(Collectors.toList());

					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						close();
					}
					return board_arr;
				}
				
	}

