package com.today.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.today.DAO.commDAO;

import javafx.scene.control.Alert;


@WebServlet("/CommDelService")
public class CommDelService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String COMM_SEQ = request.getParameter("COMM_SEQ");
		
		commDAO dao = new commDAO();
		System.out.println(COMM_SEQ);
		int cnt = dao.comm_delete(COMM_SEQ);
		
		if (cnt > 0) {
			response.sendRedirect("t_community_click.jsp");
		} else {
			response.sendRedirect("t_community_click.jsp");
		}
	}

}
