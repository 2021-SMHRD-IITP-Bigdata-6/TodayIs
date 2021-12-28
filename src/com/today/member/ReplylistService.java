package com.today.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.today.DAO.commDAO;
import com.today.DTO.boardDTO;


@WebServlet("/ReplylistService")
public class ReplylistService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("댓글 전체 불러오기 연결확인");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		boardDTO dto = (boardDTO) session.getAttribute("dto");
		
		commDAO dao = new commDAO();
		int cnt = 0;
		
		


		
	}

}
