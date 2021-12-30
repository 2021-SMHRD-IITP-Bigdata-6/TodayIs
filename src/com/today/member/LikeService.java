package com.today.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.today.DAO.boardDAO;
import com.today.DTO.boardDTO;


@WebServlet("/LikeService")
public class LikeService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("좋아요 db 연결 성공");
		request.setCharacterEncoding("utf-8");

		String article_seq = request.getParameter("article_seq");
		String counter = request.getParameter("counter");
		String like_count = request.getParameter("like_count");
	
			
		System.out.println(article_seq);
		System.out.println(counter);
		System.out.println(like_count);
		
		boardDAO dao = new boardDAO();
		dao.board_like(article_seq, like_count, counter);
		
		response.sendRedirect("t_community.jsp");
		
		
	}

}
