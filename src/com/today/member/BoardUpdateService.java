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

@WebServlet("/BoardUpdateService")
public class BoardUpdateService extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		request.setCharacterEncoding("utf-8");
		
		String ARTICLE_SEQ = request.getParameter("ARTICLE_SEQ");
		
		boardDAO dao = new boardDAO();
		boardDTO board_dto = dao.board_tocomm(ARTICLE_SEQ);
		
		
		System.out.println("게시물 수정 연결");
		System.out.println(ARTICLE_SEQ);

		session.setAttribute("board_dto", board_dto); 
		response.sendRedirect("t_update.jsp");

		
		
	}

}
