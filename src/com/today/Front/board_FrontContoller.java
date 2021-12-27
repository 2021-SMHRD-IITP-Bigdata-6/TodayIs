package com.today.Front;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.inter.Command;
import com.today.DAO.commDAO;
import com.today.DTO.commDTO;


@WebServlet("*.do") // action -> a.do b.do 는 모두 들어옴. (여러개의 요청이 들어올수있다.)(중요)
public class board_FrontContoller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// FrontContoller Pattern
		// 1. 모든 요청을 하나의 Servlet로 정의하는 패턴
		// 2. 중복되는 코드나 추적,보안을 적용할 때 하나의 Servlet에서 정의되기때문에 유지보수에 용이
		
		String uri = request.getRequestURI();
		System.out.println(uri);
		String path = request.getContextPath();  // JAVA웹 프로그램에서의 현재 프로젝트 경로를 ContextPath라고 한다 (절대경로)
		System.out.println(path);
		String command = uri.substring(path.length()+1);
		System.out.println("요청기능 : " + command);
		Command com = null;
		String nextpage = null;
		
		request.setCharacterEncoding("utf-8");
		commDAO dao = new commDAO();
		
		if (command.equals("comm_all.do")) {   // 내가 입력한 email 값에 해당하는 db를 반환
			String article_seq = request.getParameter("article_seq");
			ArrayList<commDTO> list = dao.comm_all(Integer.parseInt(article_seq));
			Gson gson = new Gson();
			String json = gson.toJson(list);
			response.setCharacterEncoding("UTF-8");
			
			PrintWriter out = response.getWriter();
			out.print(json);
			
		}
		
//		if (nextpage != null) {
//			response.sendRedirect(nextpage);
//		}
	}
}
