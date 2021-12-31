package com.today.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.today.DAO.boardDAO;
import com.today.DAO.memberDAO;
import com.today.DTO.boardDTO;
import com.today.DTO.memberDTO;
@WebServlet("/LoginService")
public class LoginService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");

		String mb_id = request.getParameter("mb_id");
		String mb_pw = request.getParameter("mb_pw");

		memberDAO dao = new memberDAO();
		memberDTO dto_two = new memberDTO(mb_id, mb_pw);
		memberDTO dto = dao.Login(dto_two);
		
		//보드 dto 세션불러오기
		boardDAO board_dao = new boardDAO();
		boardDTO board_dto = board_dao.board_tologin();
		
		if (dto!=null) {
			System.out.println("여긴오나");

			HttpSession session = request.getSession();
			session.setAttribute("dto", dto);
			response.sendRedirect("index.jsp");
			session.setAttribute("board_dto", board_dto);
			
		}else {
			response.sendRedirect("login.html");
			
		}
	}

}