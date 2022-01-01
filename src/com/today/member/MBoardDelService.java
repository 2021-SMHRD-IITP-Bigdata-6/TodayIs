package com.today.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.today.DAO.boardDAO;
import com.today.DAO.mboardDAO;

@WebServlet("/MBoardDelService")
public class MBoardDelService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String ARTICLE_SEQ = request.getParameter("ARTICLE_SEQ");
		
		mboardDAO dao = new mboardDAO();
		System.out.println(ARTICLE_SEQ);
		int cnt = dao.Mboard_delete(ARTICLE_SEQ);
		
		if (cnt > 0) {
			response.sendRedirect("t_mission.jsp");
		} else {
			response.sendRedirect("t_mission.jsp");
		}
		
	}

}
