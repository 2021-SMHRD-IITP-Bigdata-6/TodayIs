package com.today.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.today.DAO.boardDAO;
import com.today.DTO.boardDTO;

@WebServlet("/BoardSearchService")
public class BoardSearchService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("장소 검색 연결 확인");
		
		HttpSession session = request.getSession();
		ArrayList<boardDTO> al = new ArrayList<boardDTO>();
		
		request.setCharacterEncoding("utf-8");

		String region = request.getParameter("region");
		System.out.println(region);

		boardDAO dao = new boardDAO();
		al = dao.board_to_region(region);

		session.setAttribute("board_region", al);
		response.sendRedirect("t_community_search.jsp");
	}

}
