package com.today.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.today.DAO.memberDAO;
import com.today.DTO.memberDTO;

@WebServlet("/JoinService")
public class JoinService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String mb_id = request.getParameter("mb_id");
		String mb_pw = request.getParameter("mb_pw");
		String mb_nickname = request.getParameter("mb_nickname");
		String mb_phone = request.getParameter("mb_phone");
		String mb_region = request.getParameter("mb_region");
		
		memberDTO dto = new memberDTO(mb_id, mb_pw, mb_nickname, mb_phone, mb_region);
		
		System.out.println(mb_id);
		System.out.println(mb_pw);
		System.out.println(mb_nickname);
		System.out.println(mb_phone);
		System.out.println(mb_region);
		
		memberDAO dao = new memberDAO();
		int cnt = dao.join(dto);
		
		// 1. memberDAO에 해당하는 기능 메소드로 값 보내주기(객체생성, 메소드, 매개변수)
		// 2. cnt값 리턴해주기(메소드, 리턴)
		
		if (cnt > 0) {
			request.setAttribute("dto", dto);
			
			RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
			dis.forward(request, response);
			
			// JoinCon에서 joinSuccess.jsp로 값을 보낼  수 있는 두가지 방법
			// 1. 세션활용
			// 2. QueryString활용  / 보안, 객체 없다.
		} else {
			
		}

	}

}

