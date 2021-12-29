package com.today.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.today.DAO.moveDAO;

import com.today.DTO.mainPageDTO;

@WebServlet("/MoveService")
public class MoveService extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		System.out.println("왔다.");
		
		HttpSession session = request.getSession();

		
		String w_local = request.getParameter("region");
		System.out.println(w_local);
		moveDAO dao = new moveDAO();
		dao.Move(w_local);
		mainPageDTO move_dto = new mainPageDTO(w_local, dao.Move(w_local).getW_status() , dao.Move(w_local).getW_temp());
		
		
		if (dao.Move(w_local).getW_status() != null) {
			session.setAttribute("move_dto", move_dto); 
			response.sendRedirect("mainPage.jsp");
			
			
		} else {
			response.sendRedirect("mainPage.jsp");

		}
	}

}
