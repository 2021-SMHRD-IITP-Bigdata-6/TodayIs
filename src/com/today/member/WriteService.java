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

@WebServlet("/WriteService")
public class WriteService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		boardDTO dto = (boardDTO) session.getAttribute("dto");
		String subject = request.getParameter("m_article_subject");
		String content = request.getParameter("m_article_content");
		String img = request.getParameter("m_article_img");
		String id = request.getParameter("mb_id");
		String region = request.getParameter("m_article_region");
		
		boardDAO dao = new boardDAO();
		
		int cnt =dao.board_insert(subject, content, img, id, region);
		
		if (cnt > 0) {
			response.sendRedirect("t_community_board.jsp");
			
		} else {
			response.sendRedirect("t_write.jsp");
			System.out.println("연결확인");
		}
	}

}
