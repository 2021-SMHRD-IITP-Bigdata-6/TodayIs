package com.today.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.today.DTO.boardDTO;
import com.today.DTO.memberDTO;

public class memberDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

	int cnt = 0;
	memberDTO dto = null;
	private boolean check;

	public void getConn() {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("연결");

			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524";
			String dbid = "cgi_8_1_1216";
			String dbpw = "smhrd1";

			conn = DriverManager.getConnection(url, dbid, dbpw);
			if (conn != null) {
				System.out.println("맴버 연결 성공");
			} else {
				System.out.println("연결실패");

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 회원가입 DAO
	public int join(memberDTO dto) {

		try {

			getConn();

			// ------------------------------ DB연결
			String sql = "insert into t_member values (?,?,?,?,?,sysdate,0)";
			// 5. SQL 명령문을 준비
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getMb_id());
			psmt.setString(2, dto.getMb_pw());
			psmt.setString(3, dto.getMb_nickname());
			psmt.setString(4, dto.getMb_phone());
			psmt.setString(5, dto.getMb_region());

			// 6. SQL 명령문 실행
			cnt = psmt.executeUpdate();

			// 7. 명령 후 처리

		} catch (Exception e) {
			// ClassNotFoundException, SQLException
			e.printStackTrace();

		} finally {
			close();
		}
		return cnt;

	}

	// 로그인 DAO
	public memberDTO Login(memberDTO dto1) {

		try {
			getConn();

			// 패스워드를 여기서 비교해도 되지만 메모리적부담이 크다.
			String sql = "select * from t_member where mb_id= ? ";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto1.getMb_id());

			rs = psmt.executeQuery();
			System.out.println(rs);
			System.out.println(dto1.getMb_id());

			if (rs.next()) {
				String getmb_id = rs.getString(1); // 데이터베이스의 이메일
				String getmb_pw = rs.getString(2); // 데이터베이스 의 패스워드
				String getmb_nickname = rs.getString(3); // 데이터베이스 의 닉네임
				String getmb_phone = rs.getString(4); // 데이터베이스의 전화번호
				String getmb_region = rs.getString(5); // 데이터베이스의 지역

				// 내가 가져온 이메일의 비밀번호와 데이터 베이스의 비밀번호와 비교한다.
				// 같다면??
				if (dto1.getMb_pw().equals(getmb_pw)) {
					dto = new memberDTO(getmb_id, getmb_pw, getmb_nickname, getmb_phone, getmb_region);
				} else {

				}

			}

		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			close();
		}

		return dto;

	}

	// 업데이트 DAO
	public int Update(String mb_id, String mb_pw, String mb_nickname, String mb_phone, String mb_region) {

		try {
			getConn();

			System.out.println("dao=" + mb_id);

			String sql = "update t_member set mb_pw=?, mb_phone = ?, mb_nickname=?, mb_region = ? where mb_id= ? ";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, mb_pw);
			psmt.setString(2, mb_phone);
			psmt.setString(3, mb_nickname);
			psmt.setString(4, mb_region);
			psmt.setString(5, mb_id);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();

		} finally {

			close();
		}
		return cnt;

	}

	// 개인 게시판 전체 조회 기능(메인)
	public ArrayList<boardDTO> m_board_all(String m_mb_id) {
		ArrayList<boardDTO> board_arr = new ArrayList<boardDTO>();
		try {
			getConn();

			String sql = "select * from t_community where mb_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, m_mb_id);
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
				boardDTO dto = new boardDTO(m_article_seq, m_article_subject, m_article_content, m_article_img,
						m_article_date, m_article_likes, mb_id, m_article_region, m_article_latitude,
						m_article_logitude);

				board_arr.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return board_arr;
	}
	
	// 개인 게시판 전체 조회 기능(미션)
	public ArrayList<boardDTO> m_mboard_all(String m_mb_id) {
		ArrayList<boardDTO> mboard_arr = new ArrayList<boardDTO>();
		try {
			getConn();
			String sql = "select * from t_mission_community where mb_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, m_mb_id);
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


		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return mboard_arr;
	}

}
