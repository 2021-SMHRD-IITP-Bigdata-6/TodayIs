package com.today.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.today.DAO.boardDAO;
import com.today.DTO.boardDTO;

@WebServlet("/ReplyService")
public class ReplyService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		boardDTO dto = (boardDTO) session.getAttribute("dto");
		
		String comm_content = request.getParameter("comm_content");
		String article_seq = request.getParameter("article_seq");
		String mb_id = request.getParameter("mb_id");
		boardDAO dao = new boardDAO();
		int cnt = 0;
		
		// 댓글 데이터가 잘 받아지는지
		System.out.println(comm_content);
		System.out.println(article_seq);
		System.out.println(mb_id);

		cnt =dao.comm_insert(comm_content, article_seq, mb_id);
		
		if (cnt > 0) {
//			boardDTO board_dto = new boardDTO(cnt ,m_article_subject, m_article_content, m_article_img_name, mb_id, m_article_region, m_board_type);
//			session.setAttribute("board_dto", board_dto); 
			response.sendRedirect("t_community_board.jsp");
			
			
		} else {
			response.sendRedirect("t_community_board.jsp");
			System.out.println("연결확인");
		}
	}

}
