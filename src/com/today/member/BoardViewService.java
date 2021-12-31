package com.today.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.today.DAO.boardDAO;
import com.today.DTO.boardDTO;


@WebServlet("/BoardViewService")
public class BoardViewService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");

		String M_article_seq = request.getParameter("M_article_seq");
		System.out.println(M_article_seq);
		
		boardDAO dao = new boardDAO();
		
		boardDTO board_dto = dao.board_tocomm(M_article_seq);
		session.setAttribute("board_dto", board_dto);
		response.sendRedirect("t_community_click.jsp");
	}

}
