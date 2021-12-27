package com.today.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.today.DAO.commDAO;
import com.today.DAO.moveDAO;
import com.today.DTO.boardDTO;
import com.today.DTO.commDTO;
import com.today.DTO.mainPageDTO;
@WebServlet("/MoveService")
public class MoveService extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("왔다.");
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		
		String w_local = request.getParameter("region");
		moveDAO dao = new moveDAO();
		
		
		// 댓글 데이터가 잘 받아지는지
		String w_status = dao.Move(w_local);
		
		if (w_status != null) {
			
			mainPageDTO move_dto = new mainPageDTO(w_status);
			session.setAttribute("move_dto", move_dto); 
			response.sendRedirect("mainPage.jsp");
			
			
		} else {
			response.sendRedirect("t_community_board.jsp");
			System.out.println("연결확인");
		}
	}

}
