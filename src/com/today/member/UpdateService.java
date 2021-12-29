package com.today.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;

import com.inter.Command;
import com.today.DAO.memberDAO;
import com.today.DTO.memberDTO;

public class UpdateService implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		// session: ?>??
		HttpSession session = request.getSession();
		memberDTO dto = (memberDTO)session.getAttribute("dto");
		

		String mb_id = dto.getMb_id();
		String mb_pw = request.getParameter("mb_pw");
		String mb_phone = request.getParameter("mb_mb_phone");
		String mb_region = request.getParameter("mb_region");
		
		memberDAO dao = new memberDAO();
		int cnt = dao.Update(mb_id, mb_pw, mb_phone, mb_region);

		if(cnt>0) {
			memberDTO update_dto =  new memberDTO(mb_id, mb_phone, mb_region);
			session.setAttribute("dto", update_dto);
			response.sendRedirect("MainPage.jsp");
		}else {
			response.sendRedirect("MainPage.jsp");
		}
		
	}

}