package com.today.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.today.DTO.boardDTO;
import com.today.DTO.commDTO;

public class commDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	boardDTO boardDTO = null;
	private boolean check;
	commDTO comm_dto = null;

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
	
	// 해당 글의 댓글 조회
	public ArrayList<commDTO> comm_all(int article_seq) {
		ArrayList<commDTO> al = new ArrayList<commDTO>();
		try {
			getConn();

			String sql = "select * from t_comment where article_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, article_seq);
			rs = psmt.executeQuery();

			while (rs.next() == true) {
				int number = rs.getInt("comm_seq");
				int m_article_seq = rs.getInt("article_seq");		
				String content = rs.getString("comm_content");
				String date = rs.getString("comm_date").substring(0,10);
				String id = rs.getString("mb_id");
				
				comm_dto = new commDTO(number, m_article_seq, content, date, id);
				al.add(comm_dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return al;
	}
	
	//댓글 전체 조회
	public ArrayList<commDTO> comm_selectall() {
		ArrayList<commDTO> all = new ArrayList<commDTO>();
		try {
			getConn();

			String sql = "select * from t_comment";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next() == true) {
				int comm_seq = rs.getInt("comm_seq");
				int article_seq = rs.getInt("article_seq");		
				String content = rs.getString("comm_content");
				String date = rs.getString("comm_date").substring(0,10);
				String id = rs.getString("mb_id");
				
				comm_dto = new commDTO(comm_seq, article_seq, content, date, id);
				all.add(comm_dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return all;
	}
	
	// 댓글 삭제
	public int comm_delete(String COMM_SEQ) {
		int cnt = 0;

		try {
			getConn();

				String sql = "delete from t_comment where COMM_SEQ = ? ";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, COMM_SEQ);

				cnt = psmt.executeUpdate();
				
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return cnt;
	}

	
}
