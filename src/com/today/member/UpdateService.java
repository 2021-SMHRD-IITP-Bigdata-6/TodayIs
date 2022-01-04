package com.today.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.today.DAO.memberDAO;
import com.today.DTO.memberDTO;

@WebServlet("/UpdateService")
public class UpdateService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		// session: ?>??
		HttpSession session = request.getSession();
		memberDTO dto = (memberDTO)session.getAttribute("dto");

		String mb_id = dto.getMb_id();
		String mb_pw = request.getParameter("mb_pw");
		String mb_nickname = request.getParameter("mb_nickname");
		String mb_phone = request.getParameter("mb_phone");
		String mb_region = request.getParameter("mb_region");
		
		System.out.println("service1= "+mb_id);
		System.out.println("service2= "+mb_pw);
		System.out.println("service3= "+mb_nickname);
		System.out.println("service4= "+mb_region);
		
		memberDAO dao = new memberDAO();
		int cnt = dao.Update(mb_id, mb_pw, mb_nickname, mb_phone, mb_region);

		if(cnt>0) {
			dto.setMb_pw(mb_pw);
			dto.setMb_nickname(mb_nickname);
			dto.setMb_region(mb_region);
			dto.setMb_phone(mb_phone);
			//memberDTO update_dto =  new memberDTO(mb_id, mb_pw, mb_nickname, mb_region);
			//session.setAttribute("update_dto", update_dto);
			session.setAttribute("dto", dto);
			response.sendRedirect("index.jsp");
			
		}else {
			response.sendRedirect("index.jsp");
		}
		
	}

}